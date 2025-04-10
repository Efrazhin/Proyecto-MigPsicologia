from django import forms
from .models import Usuario

class LoginForm(forms.Form):
    email = forms.EmailField(label="Correo electrónico")
    password = forms.CharField(label="Contraseña", widget=forms.PasswordInput)

class RegistroForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput, required=True, label="Contraseña")
    confirm_password = forms.CharField(widget=forms.PasswordInput, required=True, label="Confirmar Contraseña")
    profile_picture = forms.ImageField(required=False)

    class Meta:
        model = Usuario
        fields = ['email', 'nombre', 'rol', 'password', 'profile_picture']

    def clean(self):
        cleaned_data = super().clean()
        password = cleaned_data.get("password")
        confirm_password = cleaned_data.get("confirm_password")

        if password and confirm_password and password != confirm_password:
            raise forms.ValidationError("Las contraseñas no coinciden.")

        return cleaned_data

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data['password'])  # 🔒 Encripta la contraseña
        if commit:
            user.save()
        return user
