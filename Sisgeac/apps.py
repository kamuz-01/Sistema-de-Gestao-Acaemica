from django.apps import AppConfig

class SisgeacConfig(AppConfig):
    default_auto_field = "django.db.models.BigAutoField"
    name = "Sisgeac"

    def ready(self):
        # Apenas garante que os signals são carregados
        import Sisgeac.signals