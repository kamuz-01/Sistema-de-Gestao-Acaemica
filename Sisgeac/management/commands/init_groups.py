from django.core.management.base import BaseCommand
from django.contrib.auth.models import Group, Permission


class Command(BaseCommand):
    help = "Inicializa os grupos e permissões padrões"

    def handle(self, *args, **kwargs):
        # ===== Grupo Alunos =====
        alunos_group, _ = Group.objects.get_or_create(name="Alunos")
        alunos_perms = [
            "view_aluno",
            "view_nota",
            "view_falta",
        ]
        for perm in Permission.objects.filter(codename__in=alunos_perms):
            alunos_group.permissions.add(perm)
        self.stdout.write(self.style.SUCCESS("Grupo 'Alunos' pronto."))

        # ===== Grupo Professores =====
        prof_group, _ = Group.objects.get_or_create(name="Professores")
        prof_perms = [
            "view_aluno",
            "add_nota", "change_nota", "delete_nota", "view_nota",
            "add_falta", "change_falta", "delete_falta", "view_falta",
            "view_turma",
            "view_disciplina",
        ]
        for perm in Permission.objects.filter(codename__in=prof_perms):
            prof_group.permissions.add(perm)
        self.stdout.write(self.style.SUCCESS("Grupo 'Professores' pronto."))

        # ===== Grupo Administradores =====
        admin_group, _ = Group.objects.get_or_create(name="Administradores")
        admin_perms = [
            "add_aluno", "change_aluno", "delete_aluno", "view_aluno",
            "add_professor", "change_professor", "delete_professor", "view_professor",
            "add_curso", "change_curso", "delete_curso", "view_curso",
            "add_disciplina", "change_disciplina", "delete_disciplina", "view_disciplina",
            "add_turma", "change_turma", "delete_turma", "view_turma",
            "add_matricula", "change_matricula", "delete_matricula", "view_matricula",
            "add_nota", "change_nota", "delete_nota", "view_nota",
            "add_falta", "change_falta", "delete_falta", "view_falta",
        ]
        for perm in Permission.objects.filter(codename__in=admin_perms):
            admin_group.permissions.add(perm)
        self.stdout.write(self.style.SUCCESS("Grupo 'Administradores' pronto."))
