from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout, get_user_model
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import LoginForm, RegistroForm
from .models import Usuario, CodigoVerificacion
import random
from django.core.mail import send_mail
from .decoradores import solo_rol
import logging

User = get_user_model()
@login_required
def registro_view(request):
    if request.method == "POST":
        print(request.POST)
        form = RegistroForm(request.POST, request.FILES or None)  # Se reciben POST y archivos
       
        if form.is_valid():
            user = form.save(commit=False)  # No guarda todavía en la BD
            user.set_password(form.cleaned_data["password"])  # 🔒 Encripta la contraseña
            user.save()  # Guarda en la BD
            messages.success(request, "Registro exitoso. Ahora puedes iniciar sesión.")
            return redirect("login")  

        messages.error(request, "Hubo un error en el registro.")
    else:
        form = RegistroForm()

    return render(request, "account/registro.html", {"form": form})

# Vista de login
def login_view(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            password = form.cleaned_data['password']
            usuario = authenticate(request, username=email, password=password)

            if usuario is not None:
                # Generar código aleatorio
                codigo = str(random.randint(100000, 999999))
                CodigoVerificacion.objects.create(usuario=usuario, codigo=codigo)

                # Enviar el código al correo
                send_mail(
                    'Tu código de verificación',
                    f'Tu código es: {codigo}',
                    'efrainbasualdo20@gmail.com',
                    [usuario.email],
                    fail_silently=False,
                )

                # Guardamos el ID del usuario en sesión
                request.session['pre_2fa_user_id'] = usuario.id
                messages.info(request, "📧 Se envió un código de verificación a tu email.")
                return redirect('verificar_codigo')

            else:
                messages.error(request, "❌ Email o contraseña incorrectos.")
        else:
            messages.error(request, "⚠️ Datos inválidos. Revisa el formulario.")
    else:
        form = LoginForm()

    return render(request, "account/login.html", {"form": form})

def verificar_codigo_view(request):
    if request.method == "POST":
        codigo = request.POST.get("codigo")
        user_id = request.session.get('pre_2fa_user_id')

        if not user_id:
            messages.error(request, "Sesión inválida.")
            return redirect('login')

        usuario = User.objects.get(id=user_id)

        try:
            verif = CodigoVerificacion.objects.filter(usuario=usuario, codigo=codigo).latest('creado_en')
            if verif.es_valido():
                login(request, usuario)
                request.session.pop('pre_2fa_user_id', None)
                messages.success(request, f"🎉 ¡Bienvenido, {usuario.email}!") 
                return redirect(
                    'admin_dashboard' if usuario.rol == 'admin' else
                    'secretaria_dashboard' if usuario.rol == 'secretaria' else
                    'psico_dashboard'
                )
            else:
                messages.error(request, "⏰ El código ha expirado.")
        except CodigoVerificacion.DoesNotExist:
            messages.error(request, "❌ Código inválido.")

    return render(request, "account/verificar_codigo.html")


# Vista de logout
def logout_view(request):
    logout(request)
    return redirect('login')

# Panel de admin
@login_required
@solo_rol('admin')
def admin_dashboard(request):
    return render(request, "myadmin/index.html")

# Panel de secretaria
@login_required
@solo_rol('secretaria')
def secretaria_dashboard(request):
    return render(request, "myadmin/index_secre.html")

# Panel de psicóloga
@login_required
@solo_rol('psicologa')
def dashboard_psico(request):
    return render(request, 'myadmin/index_psico.html')

# Vista de acceso denegado
def acceso_denegado(request):
    return render(request, "acceso_denegado.html")

@login_required
def dashboard_view(request):
    rol = request.user.rol
    return render(request, 'myadmin/index.html', {'rol': rol})

# Vistas de herramientas
@login_required
def ag_paciente(request):
    return render(request, 'herramientas/ag_paciente.html')

@login_required
def buscar_paciente(request):
    return render(request, 'herramientas/buscar_paciente.html')
