from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from .forms import LoginForm, RegistroForm
from .models import Usuario
from .decoradores import solo_rol
import logging


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
                login(request, usuario)
                messages.success(request, f"🎉 ¡Bienvenido, {usuario.email}!") 
                return redirect('admin_dashboard' if usuario.rol == 'admin' else
                                'secretaria_dashboard' if usuario.rol == 'secretaria' else
                                'psicologa_dashboard')
            else:
                messages.error(request, "❌ Email o contraseña incorrectos.")  

        else:
            messages.error(request, "⚠️ Datos inválidos. Revisa el formulario.")

    else:
        form = LoginForm()

    return render(request, "account/login.html", {"form": form})


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
    return render(request, "myadmin/index.html")

# Panel de psicóloga
@login_required
@solo_rol('psicologa')
def dashboard_view(request):
    return render(request, 'myadmin/index.html')

# Vista de acceso denegado
def acceso_denegado(request):
    return render(request, "acceso_denegado.html")

@login_required
def dashboard_view(request):
    rol = request.user.rol
    return render(request, 'myadmin/index.html', {'rol': rol})
