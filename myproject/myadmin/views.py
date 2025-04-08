from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from .forms import LoginForm, RegistroForm
from .models import Usuario
from .decoradores import solo_rol

def registro_view(request):
    if request.method == 'POST':
        form = RegistroForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('login')
    else:
        form = RegistroForm()
    return render(request, "account/registro.html", {"form": form})

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

@login_required
def dashboard2_view(request):
    rol = request.user.rol
    return render(request, 'myadmin/index2.html', {'rol': rol})

@login_required
def dashboard3_view(request):
    rol = request.user.rol
    return render(request, 'myadmin/index3.html', {'rol': rol})

@login_required
def theme_view(request):
    rol = request.user.rol
    return render(request, 'myadmin/generate/theme.html', {'rol':rol})