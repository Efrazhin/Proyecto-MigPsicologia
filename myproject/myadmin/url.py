from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('registro/', views.registro_view, name='registro'),
    
    # Dashboards por rol
    path('dashboard', views.dashboard_view, name='dashboard'),
    path('dashboard2',views.dashboard2_view, name='dashboard2'),
    path('admin/dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('secretaria/dashboard/', views.secretaria_dashboard, name='secretaria_dashboard'),

    # Página de acceso denegado
    path('acceso-denegado/', views.acceso_denegado, name='acceso_denegado'),
]
