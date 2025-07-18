const CONFIG = { // Configurações do Temporizador Pomodoro
  WORK_TIME: 25*60, // 25 * 60 para 25 minutos
  BREAK_TIME: 5*60, // 5 * 60 para 5 minutos
  SOUND_URL:
    "data:audio/wav;base64,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qJrx4KOQjahZxWbcZgztj2c49nKmkId44S71j0c8eV9yDK6uPRzx5X18eDvjvQ6yKo9ZSS6l//8elePK/Lf//IInrOF/FvDoADYAGBMGb7FtErm5MXMlmPAJQVgWta7Zx2go+8xJ0UiCb8LHHdftWyLJE0QIAIsI+UbXu67dZMjmgDGCGl1H+vpF4NSDckSIkk7Vd+sxEhBQMRU8j/12UIRhzSaUdQ+rQU5kGeFxm+hb1oh6pWWmv3uvmReDl0UnvtapVaIzo1jZbf/pD6ElLqSX+rUmOQNpJFa/r+sa4e/pBlAABoAAAAA3CUgShLdGIxsY7AUABPRrgCABdDuQ5GC7DqPQCgbbJUAoRSUj+NIEig0YfyWUho1VBBBA//uQZB4ABZx5zfMakeAAAAmwAAAAF5F3P0w9GtAAACfAAAAAwLhMDmAYWMgVEG1U0FIGCBgXBXAtfMH10000EEEEEECUBYln03TTTdNBDZopopYvrTTdNa325mImNg3TTPV9q3pmY0xoO6bv3r00y+IDGid/9aaaZTGMuj9mpu9Mpio1dXrr5HERTZSmqU36A3CumzN/9Robv/Xx4v9ijkSRSNLQhAWumap82WRSBUqXStV/YcS+XVLnSS+WLDroqArFkMEsAS+eWmrUzrO0oEmE40RlMZ5+ODIkAyKAGUwZ3mVKmcamcJnMW26MRPgUw6j+LkhyHGVGYjSUUKNpuJUQoOIAyDvEyG8S5yfK6dhZc0Tx1KI/gviKL6qvvFs1+bWtaz58uUNnryq6kt5RzOCkPWlVqVX2a/EEBUdU1KrXLf40GoiiFXK///qpoiDXrOgqDR38JB0bw7SoL+ZB9o1RCkQjQ2CBYZKd/+VJxZRRZlqSkKiws0WFxUyCwsKiMy7hUVFhIaCrNQsKkTIsLivwKKigsj8XYlwt/WKi2N4d//uQRCSAAjURNIHpMZBGYiaQPSYyAAABLAAAAAAAACWAAAAApUF/Mg+0aohSIRobBAsMlO//Kk4soosy1JSFRYWaLC4qZBYWFRGZdwqKiwkNBVmoWFSJkWFxX4FFRQWR+LsS4W/rFRb/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////VEFHAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAU291bmRib3kuZGUAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAMjAwNGh0dHA6Ly93d3cuc291bmRib3kuZGUAAAAAAAAAACU=",
};

const timerState = {
  isRunning: false,
  isBreak: false,
  timeLeft: CONFIG.WORK_TIME,
  totalCiclos: 0,
  inicioAtividade: null,
  timerId: null,
  currentActivityId: null,
};

class PomodoroTimer {
  constructor(
    circle,
    minutesDisplay,
    secondsDisplay,
    startButton,
    timerStatus
  ) {
    this.circle = circle;
    this.minutesDisplay = minutesDisplay;
    this.secondsDisplay = secondsDisplay;
    this.startButton = startButton;
    this.timerStatus = timerStatus;
    this.circumference = circle.r.baseVal.value * 2 * Math.PI;

    this.setupCircle();
    this.updateDisplay();
  }

  setupCircle() {
    this.circle.style.strokeDasharray = `${this.circumference} ${this.circumference}`;
    this.setProgress(100);
  }

  updateDisplay() {
    const m = Math.floor(timerState.timeLeft / 60);
    const s = timerState.timeLeft % 60;
    this.minutesDisplay.textContent = String(m).padStart(2, "0");
    this.secondsDisplay.textContent = String(s).padStart(2, "0");

    const total = timerState.isBreak ? CONFIG.BREAK_TIME : CONFIG.WORK_TIME;
    this.setProgress((timerState.timeLeft / total) * 100);
  }

  setProgress(percent) {
    const offset = this.circumference - (percent / 100) * this.circumference;
    this.circle.style.strokeDashoffset = offset;
  }

  start() {
  if (!timerState.inicioAtividade) {
    timerState.inicioAtividade = new Date();
  }

  this.startTime = Date.now();
  const totalDuration = timerState.isBreak ? CONFIG.BREAK_TIME : CONFIG.WORK_TIME;

  timerState.timerId = setInterval(() => {
    const elapsed = Math.floor((Date.now() - this.startTime) / 1000);
    timerState.timeLeft = Math.max(totalDuration - elapsed, 0);

    this.updateDisplay();

    if (timerState.timeLeft <= 0) {
      clearInterval(timerState.timerId);
      this.handleTimerComplete();
    }
  }, 1000);
}

  handleTimerComplete() {
    clearInterval(timerState.timerId);
    const sound = new Audio(CONFIG.SOUND_URL);
    sound.play();

    if (!timerState.isBreak) {
      this.startBreak();
    } else {
      this.startNewCycle();
    }
  }

  startBreak() {
    timerState.isBreak = true;
    timerState.timeLeft = CONFIG.BREAK_TIME;
    this.timerStatus.textContent = "Descanso";
    this.updateDisplay();
    this.start();
  
    if ("Notification" in window && Notification.permission === "granted") {
      new Notification("Pomodoro", {
        body: "Hora do descanso! Aproveite os 5 minutos.",
        icon: "/static/img/favicon.ico"
      });
    }
  }

  startNewCycle() {
    timerState.totalCiclos++;
    timerState.isBreak = false;
    timerState.timeLeft = CONFIG.WORK_TIME;
    this.timerStatus.textContent = "Foco";
    this.updateDisplay();
    if (window.ciclosCount) {
        window.ciclosCount.textContent = timerState.totalCiclos;
    }
    this.start();
  
    if ("Notification" in window && Notification.permission === "granted") {
      new Notification("Pomodoro", {
        body: `Você completou ${timerState.totalCiclos} ciclo(s)! Hora de focar!`,
        icon: "/static/img/favicon.ico"
      });
    }
  }

  toggle() {
    if (timerState.isRunning) {
      clearInterval(timerState.timerId);
      this.startButton.textContent = "Continuar";
    } else {
      this.startButton.textContent = "Pausar";
      this.start();
    }
    timerState.isRunning = !timerState.isRunning;
  }

  reset() {
    clearInterval(timerState.timerId);
    timerState.isBreak = false;
    timerState.timeLeft = CONFIG.WORK_TIME;
    timerState.isRunning = false;
    timerState.totalCiclos = 0;
    timerState.inicioAtividade = null;

    this.startButton.textContent = "Iniciar";
    this.timerStatus.textContent = "Foco";
    this.updateDisplay();
    if (window.ciclosCount) {
      window.ciclosCount.textContent = "0";
    }
  }
}

function finalizarAtividade(e) {
  e.preventDefault();
  showLoading();

  document.getElementById("inicio").value = timerState.inicioAtividade
    ? timerState.inicioAtividade.toISOString()
    : "";
  document.getElementById("fim").value = new Date().toISOString();
  document.getElementById("nrciclo").value = timerState.totalCiclos;

  const form = document.querySelector(".form-container");
  if (form) {
    form.submit();
  } else {
    hideLoading();
    alert("Erro: Formulário não encontrado");
  }
}

document.addEventListener("DOMContentLoaded", function () {
    if ("Notification" in window) {
        if (Notification.permission === "default") {
          Notification.requestPermission().then(function (permission) {
            console.log("Permissão para notificações:", permission);
          });
        }
      }
  const circle = document.querySelector(".progress-ring-circle");
  const minutesDisplay = document.getElementById("minutes");
  const secondsDisplay = document.getElementById("seconds");
  const startButton = document.getElementById("start-timer");
  const resetButton = document.getElementById("reset-timer");
  const timerStatus = document.getElementById("timer-status");
  const btnFinalizar = document.getElementById("btn-finalizar");
  const btnVoltar = document.getElementById("btn-voltar");
  window.ciclosCount = document.getElementById("ciclos-count");

  const pomodoro = new PomodoroTimer(
    circle,
    minutesDisplay,
    secondsDisplay,
    startButton,
    timerStatus
  );

  startButton.addEventListener("click", () => pomodoro.toggle());
  resetButton.addEventListener("click", () => pomodoro.reset());

  if (btnFinalizar) {
    btnFinalizar.addEventListener("click", finalizarAtividade);
  }

  window.addEventListener("load", hideLoading);
});


document.addEventListener('DOMContentLoaded', function () {
  const togglePomodoro = document.getElementById('toggle-pomodoro');
  const pomodoroBloco = document.querySelector('.pomodoro-bloco');

  togglePomodoro.addEventListener('change', function () {
      if (this.checked) {
          pomodoroBloco.style.display = 'block';
      } else {
          pomodoroBloco.style.display = 'none';
      }
  });
});
