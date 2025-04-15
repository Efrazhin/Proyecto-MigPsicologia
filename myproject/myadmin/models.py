from django.db import models

# Create your models here.

from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.utils import timezone
import datetime
from encrypted_model_fields.fields import EncryptedCharField


# ---------------------------
# Usuario personalizado
# ---------------------------
class UsuarioManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError("El email es obligatorio")
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)

class Usuario(AbstractBaseUser):
    ROLES = [
        ('admin', 'Administrador'),
        ('secretaria', 'Secretaria'),
        ('psicologa', 'Psicóloga'),
    ]

    email = models.EmailField(unique=True)
    nombre = models.CharField(max_length=100)
    rol = models.CharField(max_length=20, choices=ROLES)
    profile_picture = models.ImageField(upload_to='profile_pics/', blank=True, null=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['nombre', 'rol']

    objects = UsuarioManager()

    def __str__(self):
        return f"{self.nombre} ({self.rol})"


# ---------------------------
# Cliente
# ---------------------------
class Cliente(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    email = models.EmailField()
    telefono = models.CharField(max_length=20)
    fecha_registro = models.DateTimeField(auto_now_add=True)
    estado = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.nombre} {self.apellido}"


# ---------------------------
# Psicólogo
# ---------------------------
class Psicologo(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    especialidad = models.CharField(max_length=150)
    email = models.EmailField()
    telefono = models.CharField(max_length=20)
    estado = models.BooleanField(default=True)
    usuario_admin = models.ForeignKey(Usuario, null=True, blank=True, on_delete=models.SET_NULL)

    def __str__(self):
        return f"{self.nombre} {self.apellido}"


# ---------------------------
# Servicio
# ---------------------------
class Servicio(models.Model):
    nombre = models.CharField(max_length=150)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)
    estado = models.BooleanField(default=True)

    def __str__(self):
        return self.nombre


# ---------------------------
# Sesión
# ---------------------------
class Sesion(models.Model):
    ESTADOS = [
        ('Programada', 'Programada'),
        ('Realizada', 'Realizada'),
        ('Cancelada', 'Cancelada'),
    ]

    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    psicologo = models.ForeignKey(Psicologo, on_delete=models.CASCADE)
    servicio = models.ForeignKey(Servicio, on_delete=models.CASCADE)
    fecha_hora = models.DateTimeField()
    estado = models.CharField(max_length=50, choices=ESTADOS, default='Programada')
    observaciones = models.TextField(blank=True, null=True)

    def __str__(self):
        return f"{self.cliente} - {self.fecha_hora}"


# ---------------------------
# Pago
# ---------------------------
class Pago(models.Model):
    ESTADOS = [
        ('Pagado', 'Pagado'),
        ('Pendiente', 'Pendiente'),
    ]

    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    sesion = models.ForeignKey(Sesion, on_delete=models.CASCADE)
    monto = models.DecimalField(max_digits=10, decimal_places=2)
    metodo_pago = models.CharField(max_length=50)
    fecha_pago = models.DateTimeField(auto_now_add=True)
    estado = models.CharField(max_length=50, choices=ESTADOS)

    def __str__(self):
        return f"{self.cliente} - {self.monto}"


# ---------------------------
# Blog
# ---------------------------
class Blog(models.Model):
    ESTADOS = [
        ('borrador', 'Borrador'),
        ('publicado', 'Publicado'),
    ]

    titulo = models.CharField(max_length=200)
    contenido = models.TextField()
    autor = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True)
    fecha_publicacion = models.DateTimeField(auto_now_add=True)
    estado = models.CharField(max_length=10, choices=ESTADOS, default='borrador')

    def __str__(self):
        return self.titulo


# ---------------------------
# Curso
# ---------------------------
class Curso(models.Model):
    ESTADOS = [
        ('activo', 'Activo'),
        ('inactivo', 'Inactivo'),
    ]

    titulo = models.CharField(max_length=200)
    descripcion = models.TextField()
    temario = models.TextField(blank=True, null=True)
    precio = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    fecha_inicio = models.DateField(blank=True, null=True)
    estado = models.CharField(max_length=10, choices=ESTADOS, default='activo')

    def __str__(self):
        return self.titulo


# ---------------------------
# Inscripción a Curso
# ---------------------------
class InscripcionCurso(models.Model):
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE)
    fecha_inscripcion = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.cliente} inscrito en {self.curso}"

#------------------------------
# Verificacion de 2 pasos
#------------------------------

class CodigoVerificacion(models.Model):
    usuario = models.ForeignKey(Usuario, on_delete=models.CASCADE)
    codigo = models.CharField(max_length=6)
    creado_en = models.DateTimeField(auto_now_add=True)

    def es_valido(self):
        return timezone.now() < self.creado_en + datetime.timedelta(minutes=5)