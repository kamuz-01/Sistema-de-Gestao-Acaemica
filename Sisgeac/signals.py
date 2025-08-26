from django.contrib.auth.models import Group
from django.db.models.signals import post_save
from django.dispatch import receiver
from .models import Aluno, Professor


@receiver(post_save, sender=Aluno)
def add_aluno_to_group(sender, instance, created, **kwargs):
    if instance.user:
        grupo, _ = Group.objects.get_or_create(name="Alunos")
        instance.user.groups.add(grupo)
        instance.user.is_staff = True

        # sincroniza campos para auth_user
        instance.user.first_name = instance.nome
        instance.user.last_name = instance.sobrenome
        instance.user.email = instance.email
        instance.user.save()


@receiver(post_save, sender=Professor)
def add_professor_to_group(sender, instance, created, **kwargs):
    if instance.user:
        grupo, _ = Group.objects.get_or_create(name="Professores")
        instance.user.groups.add(grupo)
        instance.user.is_staff = True

        # sincroniza campos para auth_user
        instance.user.first_name = instance.nome
        instance.user.last_name = instance.sobrenome
        instance.user.email = instance.email
        instance.user.save()