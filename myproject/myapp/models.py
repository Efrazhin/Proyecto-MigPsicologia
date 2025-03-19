from django.db import models

# 1️⃣ Tabla de Clientes
class Clientes(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    fecha_registro = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.nombre

# 2️⃣ Tabla de Psicólogos
class Psicologos(models.Model):
    id_psicologo = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    telefono = models.CharField(max_length=20, blank=True, null=True)
    especialidad = models.CharField(max_length=255, blank=True, null=True)

    def __str__(self):
        return self.nombre

# 3️⃣ Tabla de Disponibilidad de Psicólogos
class DisponibilidadPsicologos(models.Model):
    id_disponibilidad = models.AutoField(primary_key=True)
    id_psicologo = models.ForeignKey(Psicologos, on_delete=models.CASCADE)
    dia_semana = models.CharField(
        max_length=10, 
        choices=[('Lunes', 'Lunes'), ('Martes', 'Martes'), ('Miércoles', 'Miércoles'), ('Jueves', 'Jueves'),
                 ('Viernes', 'Viernes'), ('Sábado', 'Sábado'), ('Domingo', 'Domingo')]
    )
    hora_inicio = models.TimeField()
    hora_fin = models.TimeField()

    def __str__(self):
        return f"{self.id_psicologo.nombre} - {self.dia_semana}"

# 4️⃣ Tabla de Servicios
class Servicios(models.Model):
    id_servicio = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField()
    precio = models.DecimalField(max_digits=10, decimal_places=2)

    def __str__(self):
        return self.nombre

# 5️⃣ Tabla de Pagos
class Pagos(models.Model):
    id_pago = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, on_delete=models.CASCADE)
    monto = models.DecimalField(max_digits=10, decimal_places=2)
    metodo_pago = models.CharField(max_length=50, choices=[('Tarjeta', 'Tarjeta'), ('PayPal', 'PayPal'), ('Transferencia', 'Transferencia')])
    estado = models.CharField(max_length=15, choices=[('pendiente', 'Pendiente'), ('completado', 'Completado'), ('cancelado', 'Cancelado')])
    fecha_pago = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.id_cliente.nombre} - {self.monto} - {self.estado}"

# 6️⃣ Tabla de Sesiones
class Sesiones(models.Model):
    id_sesion = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, on_delete=models.CASCADE)
    id_psicologo = models.ForeignKey(Psicologos, on_delete=models.CASCADE)
    id_servicio = models.ForeignKey(Servicios, on_delete=models.CASCADE)
    id_pago = models.ForeignKey(Pagos, on_delete=models.SET_NULL, null=True, blank=True)
    fecha_hora = models.DateTimeField()
    estado = models.CharField(max_length=15, choices=[('pendiente', 'Pendiente'), ('completada', 'Completada'), ('cancelada', 'Cancelada')])

    def __str__(self):
        return f"Sesión de {self.id_cliente.nombre} con {self.id_psicologo.nombre} - {self.estado}"

# 7️⃣ Tabla de Historial de Cambios en Sesiones
class HistorialSesiones(models.Model):
    id_historial = models.AutoField(primary_key=True)
    id_sesion = models.ForeignKey(Sesiones, on_delete=models.CASCADE)
    campo_modificado = models.CharField(max_length=100)
    valor_anterior = models.TextField()
    valor_nuevo = models.TextField()
    fecha_modificacion = models.DateTimeField(auto_now_add=True)
    modificado_por = models.CharField(max_length=15, choices=[('psicologo', 'Psicólogo'), ('cliente', 'Cliente'), ('admin', 'Administrador')])

    def __str__(self):
        return f"Modificación en sesión {self.id_sesion.id_sesion} - {self.campo_modificado}"

# 8️⃣ Tabla de Eventos de Usuario (Clics en botones, navegación, formularios, etc.)
class EventoUsuario(models.Model):
    id_evento = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, on_delete=models.CASCADE)
    evento = models.CharField(max_length=100)
    id_boton = models.CharField(max_length=100, blank=True, null=True)
    pagina = models.CharField(max_length=255)
    timestamp = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.id_cliente.nombre} - {self.evento} en {self.pagina}"

# 9️⃣ Tabla de Información del Dispositivo del Cliente
class DispositivoUsuario(models.Model):
    id_dispositivo = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, on_delete=models.CASCADE)
    user_agent = models.TextField()
    screen_width = models.IntegerField()
    screen_height = models.IntegerField()
    browser = models.CharField(max_length=100)
    platform = models.CharField(max_length=100)
    fecha_registro = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Dispositivo de {self.id_cliente.nombre} - {self.platform}"

# 🔟 Tabla de Tiempo en Pantalla por Cliente
class TiempoUsuario(models.Model):
    id_tiempo = models.AutoField(primary_key=True)
    id_cliente = models.ForeignKey(Clientes, on_delete=models.CASCADE)
    pagina = models.CharField(max_length=255)
    tiempo = models.IntegerField(help_text="Tiempo en milisegundos")
    fecha_registro = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.id_cliente.nombre} - {self.pagina} - {self.tiempo} ms"
