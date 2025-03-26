from django import forms

class LoginForm(forms.Form):
    email = forms.EmailField(label="Correo electrónico")
    contrasena = forms.CharField(label="Contraseña", widget=forms.PasswordInput)
