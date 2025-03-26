from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import LoginForm
from .models import Usuario
from .decoradores import solo_rol

# Vista de login
def login_view(request):
    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data['email']
            contrasena = form.cleaned_data['contrasena']
            usuario = authenticate(request, email=email, password=contrasena)
            if usuario is not None:
                login(request, usuario)
                if usuario.rol == 'admin':
                    return redirect('admin_dashboard')
                elif usuario.rol == 'secretaria':
                    return redirect('secretaria_dashboard')
                elif usuario.rol == 'psicologa':
                    return redirect('psicologa_dashboard')
            else:
                form.add_error(None, "Email o contraseña incorrectos")
    else:
        form = LoginForm()
    return render(request, "login.html", {"form": form})

# Vista de logout
def logout_view(request):
    logout(request)
    return redirect('login')

# Panel de admin
@login_required
@solo_rol('admin')
def admin_dashboard(request):
    return render(request, "admin/dashboard.html")

# Panel de secretaria
@login_required
@solo_rol('secretaria')
def secretaria_dashboard(request):
    return render(request, "secretaria/dashboard.html")

# Panel de psicóloga
@login_required
@solo_rol('psicologa')
def psicologa_dashboard(request):
    return render(request, "psicologa/dashboard.html")

# Vista de acceso denegado
def acceso_denegado(request):
    return render(request, "acceso_denegado.html")
