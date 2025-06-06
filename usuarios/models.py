from django.db import models
from django.contrib.auth.models import AbstractBaseUser, PermissionsMixin, BaseUserManager
from django.utils import timezone

class TipoUsuario(models.TextChoices):
    ADMIN = 'admin', 'Administrador'
    COMUM = 'comum', 'Comum'

class UsuarioManager(BaseUserManager):
    def create_user(self, emailusuario, senha=None, **extra_fields):
        if not emailusuario:
            raise ValueError('O e-mail é obrigatório')
        emailusuario = self.normalize_email(emailusuario)
        user = self.model(emailusuario=emailusuario, **extra_fields)
        user.set_password(senha)
        user.save(using=self._db)
        return user

    def create_superuser(self, emailusuario, senha=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(emailusuario, senha, **extra_fields)

class Usuario(AbstractBaseUser, PermissionsMixin):
    idusuario = models.AutoField(primary_key=True)
    nmusuario = models.CharField(max_length=50)
    password = models.CharField(max_length=128, null=False, blank=True)
    emailusuario = models.EmailField(max_length=254, unique=True)
    dtnascimento = models.DateField()
    flsituacao = models.BooleanField(default=True)
    nivelusuario = models.IntegerField(default=1)
    expusuario = models.SmallIntegerField(default=0)
    tipousuario = models.CharField(
        max_length=10,
        choices=TipoUsuario.choices,
        default=TipoUsuario.COMUM
    )
    ultima_atividade = models.DateField(null=True, blank=True)

    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)
    imagem_perfil = models.CharField(
    max_length=100,
    choices=[
        ('avatar1.png', 'Avatar 1'),
        ('avatar2.png', 'Avatar 2'),
        ('avatar3.png', 'Avatar 3'),
    ],
    default='avatar1.png'
)


    objects = UsuarioManager()

    USERNAME_FIELD = 'emailusuario'
    REQUIRED_FIELDS = ['nmusuario']

    class Meta:
        db_table = 'usuarios'

    def __str__(self):
        return self.emailusuario
    

class Notificacao(models.Model):
    class Tipo(models.TextChoices):
        INFO = 'info', 'Informação'
        SUCESSO = 'sucesso', 'Sucesso'
        AVISO = 'aviso', 'Aviso'
        ERRO = 'erro', 'Erro'

    idnotificacao = models.AutoField(primary_key=True)
    idusuario = models.ForeignKey(
        Usuario,
        on_delete=models.CASCADE,
        db_column='idusuario'
    )
    dsmensagem = models.TextField()
    fltipo = models.CharField(max_length=50, choices=Tipo.choices, default=Tipo.INFO)
    dtcriacao = models.DateTimeField(auto_now_add=True)
    flstatus = models.BooleanField(default=False)  # False = não lida, True = lida

    class Meta:
        db_table = 'notificacoes'

    def __str__(self):
        return f"{self.usuario} - {self.mensagem[:30]}"