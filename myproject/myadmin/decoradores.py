from django.shortcuts import redirect
from functools import wraps

def solo_rol(rol_requerido):
    def decorador(view_func):
        @wraps(view_func)
        def wrapper(request, *args, **kwargs):
            if request.user.is_authenticated and request.user.rol == rol_requerido:
                return view_func(request, *args, **kwargs)
            return redirect('acceso_denegado')
        return wrapper
    return decorador
