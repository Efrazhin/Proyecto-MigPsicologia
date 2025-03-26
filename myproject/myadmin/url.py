from django.urls import path
from . import views

urlpatterns = [
    path('login/', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    
    # Dashboards por rol
    path('admin/dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('secretaria/dashboard/', views.secretaria_dashboard, name='secretaria_dashboard'),
    path('psicologa/dashboard/', views.psicologa_dashboard, name='psicologa_dashboard'),

    # Página de acceso denegado
    path('acceso-denegado/', views.acceso_denegado, name='acceso_denegado'),
]
