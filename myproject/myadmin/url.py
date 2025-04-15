from django.urls import path
from . import views

urlpatterns = [
    path('', views.login_view, name='login'),
    path('logout/', views.logout_view, name='logout'),
    path('registro/', views.registro_view, name='registro'),
    
    # Dashboards por rol
    path('dashboard', views.dashboard_view, name='dashboard'),
    path('admin/dashboard/',views.admin_dashboard, name='admin_dashboard'),
    path('admin/dashboard-psico/',views.dashboard_psico, name='psico_dashboard'),
    path('admin/dashboard-secre/', views.secretaria_dashboard, name='secretaria_dashboard'),

    # Herramientas
    path('admin/ag-paciente', views.ag_paciente, name="ag_paciente"),
    path('admin/buscar-paciente', views.buscar_paciente, name="buscar_paciente"),

    path('verificar-codigo/', views.verificar_codigo_view, name='verificar_codigo'),

    # Página de acceso denegado
    path('acceso-denegado/', views.acceso_denegado, name='acceso_denegado'),
]
