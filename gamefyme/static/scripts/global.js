function showLoading() {
    document.getElementById('loading-overlay').style.display = 'flex';
}

function hideLoading() {
    document.getElementById('loading-overlay').style.display = 'none';
}

function toggleUserMenu() {
    var menu = document.getElementById('user-dropdown');
    menu.style.display = (menu.style.display === 'block') ? 'none' : 'block';
}

window.onclick = function(event) {
    if (!event.target.matches('.user-menu-btn') && !event.target.closest('.user-menu-container')) {
        var dropdowns = document.getElementsByClassName("user-dropdown");
        for (var i = 0; i < dropdowns.length; i++) {
            dropdowns[i].style.display = "none";
        }
    }
}

function fecharMsg(elemento) {
    var msg = elemento.closest('.msg-flutuante');
    if (msg) {
        msg.style.animation = 'msg-saida 0.4s forwards';
        setTimeout(function() { msg.style.display = 'none'; }, 400);
    }
}

document.addEventListener('DOMContentLoaded', function() {
    document.addEventListener('click', function(event) {
        const userMenu = document.getElementById('user-dropdown');
        const notificationsDropdown = document.getElementById('notifications-dropdown');
        const notificationsBtn = document.querySelector('.notifications-btn');
        const userMenuBtn = document.querySelector('.user-menu-btn');
        const modal = document.getElementById('notificationModal');

        if (userMenu && userMenuBtn && !userMenu.contains(event.target) && !userMenuBtn.contains(event.target)) {
            userMenu.style.display = 'none';
        }

        if (notificationsDropdown && notificationsBtn && !notificationsDropdown.contains(event.target) && !notificationsBtn.contains(event.target)) {
            notificationsDropdown.style.display = 'none';
        }

        if (modal && event.target === modal) {
            fecharModalNotificacao();
        }
    });

    setTimeout(function() {
        var msgs = document.querySelectorAll('.msg-flutuante');
        msgs.forEach(function(msg) {
            msg.style.animation = 'msg-saida 0.4s forwards';
            setTimeout(function() { msg.style.display = 'none'; }, 400);
        });
    }, 5000);

    window.addEventListener('load', hideLoading);
    window.addEventListener('popstate', hideLoading);
    window.setTimeout(hideLoading, 10000);

    const formRelatorio = document.getElementById('formRelatorio');
    if (formRelatorio) {
        formRelatorio.addEventListener('submit', function(e){
            e.preventDefault();
            const ini = this.data_inicio.value;
            const fim = this.data_fim.value;
            if (!ini || !fim) {
                alert('Por favor, selecione as duas datas.');
                return;
            }
            const url = `/relatorios/atividades/pdf/?data_inicio=${ini}&data_fim=${fim}`;
            document.getElementById('iframeRelatorio').src = url;
        });
    }
    document.querySelectorAll('.with-loading').forEach(function(el) {
        el.addEventListener('click', function () {
            showLoading();
        });
    });
});

function toggleNotifications(event) {
    event.stopPropagation();
    var dropdown = document.getElementById('notifications-dropdown');
    dropdown.style.display = (dropdown.style.display === 'block') ? 'none' : 'block';
}

function abrirModalNotificacao(id, mensagem, data, tipo) {
    const modal = document.getElementById('notificationModal');
    const modalMessage = document.getElementById('modalMessage');
    const modalDate = document.getElementById('modalDate');
    const modalIcon = document.getElementById('modalIcon');

    let icon = '️ℹ️';
    if (tipo === 'sucesso') icon = '🎉';
    else if (tipo === 'aviso') icon = '⚠️';
    else if (tipo === 'erro') icon = '❌';

    modalIcon.textContent = icon;
    modalMessage.textContent = mensagem;
    modalDate.textContent = data;
    modal.style.display = 'block';

    marcarComoLida(id);
}

function fecharModalNotificacao() {
    const modal = document.getElementById('notificationModal');
    modal.style.display = 'none';
}

function marcarComoLida(notificacaoId) {
    showLoading();
    fetch(`/usuarios/marcar_notificacao_lida/${notificacaoId}/`, {
        method: 'POST',
        headers: {
            'X-CSRFToken': getCookie('csrftoken'),
        },
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            const notificacao = document.querySelector(`.notification-item[data-id="${notificacaoId}"]`);
            if (notificacao) {
                notificacao.remove();
            }
            atualizarContadorNotificacoes();
        }
    })
    .finally(() => {
        hideLoading();
    });
}


function marcarTodasComoLidas() {
    showLoading();
    fetch('/usuarios/marcar_todas_lidas/', {
        method: 'POST',
        headers: {
            'X-CSRFToken': getCookie('csrftoken'),
        },
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            document.querySelectorAll('.notification-item.unread').forEach(item => {
                item.remove();
            });
            const badge = document.querySelector('.notification-badge');
            if (badge) badge.remove();
            atualizarContadorNotificacoes();            
        }
    })
    .finally(() => {
        hideLoading();
    });
}

function atualizarContadorNotificacoes() {
    const badge = document.querySelector('.notification-badge');
    const unreadCount = document.querySelectorAll('.notification-item.unread').length;

    if (badge) {
        if (unreadCount === 0) {
            badge.remove();
        } else {
            badge.textContent = unreadCount;
        }
    }
}

function getCookie(name) {
    let cookieValue = null;
    if (document.cookie && document.cookie !== '') {
        const cookies = document.cookie.split(';');
        for (let i = 0; i < cookies.length; i++) {
            const cookie = cookies[i].trim();
            if (cookie.substring(0, name.length + 1) === (name + '=')) {
                cookieValue = decodeURIComponent(cookie.substring(name.length + 1));
                break;
            }
        }
    }
    return cookieValue;
}

function openRelatorioModal(){
    document.getElementById('relatorioModal').style.display = 'block';
}
function closeRelatorioModal(){
    document.getElementById('relatorioModal').style.display = 'none';
}

document.addEventListener('DOMContentLoaded', function () {
    const formRelatorio = document.getElementById('formRelatorio');
    const btnGerarPDF = document.getElementById('btnGerarPDF');

    if (formRelatorio) {
        formRelatorio.addEventListener('submit', function (e) {
            e.preventDefault();
            const ini = this.data_inicio.value;
            const fim = this.data_fim.value;
            if (!ini || !fim) {
                alert('Por favor, selecione as duas datas.');
                return;
            }

            btnGerarPDF.classList.add('loading');
            btnGerarPDF.querySelector('.btn-text').style.display = 'none';
            btnGerarPDF.querySelector('.btn-spinner').style.display = 'inline-block';

            const url = `/relatorios/atividades/pdf/?data_inicio=${ini}&data_fim=${fim}`;
            document.getElementById('iframeRelatorio').src = url;

            const iframe = document.getElementById('iframeRelatorio');
            iframe.onload = function () {
                btnGerarPDF.classList.remove('loading');
                btnGerarPDF.querySelector('.btn-text').style.display = 'inline-block';
                btnGerarPDF.querySelector('.btn-spinner').style.display = 'none';
            }
        });
    }
});

function alternarTema() {
    const overlay = document.getElementById('theme-transition-overlay');
    const themeBtn = document.querySelector('.theme-btn');

    // Inicia a transição
    overlay.classList.add('active');

    // Depois da animação (~300ms), troca o tema e recolhe
    setTimeout(() => {
        document.body.classList.toggle('theme-dark');

        // Fecha a cortina
        overlay.classList.remove('active');

        // Foca no botão (animação de foco visual rápida)
        themeBtn.style.transition = 'transform 0.2s ease';
        themeBtn.style.transform = 'scale(1.1)';

        setTimeout(() => {
            themeBtn.style.transform = 'scale(1)';
        }, 200);
    }, 300);
}

document.addEventListener('DOMContentLoaded', function () {
    if (localStorage.getItem('tema') === 'dark') {
        document.body.classList.add('theme-dark');
    }
});

