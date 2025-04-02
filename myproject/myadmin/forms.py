from django import forms
from .models import Usuario

class LoginForm(forms.Form):
    email = forms.EmailField(label="Correo electrónico")
    contrasena = forms.CharField(label="Contraseña", widget=forms.PasswordInput)

class RegistroForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Usuario
        fields = ['email', 'nombre', 'rol', 'password']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password'])
        if commit:
            user.save()
        return user
