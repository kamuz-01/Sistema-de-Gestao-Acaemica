from django.contrib import admin
from .models import Professor, Curso, Disciplina, Turma, Aluno, Matricula, Nota, Falta
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
import csv
from django.http import HttpResponse

# ========== PROFESSOR ==========
@admin.register(Professor)
class ProfessorAdmin(admin.ModelAdmin):
    list_display = ("nome", "sobrenome", "email", "status", "criado_em", "listar_disciplinas")
    list_filter = ("status",)
    search_fields = ("nome", "sobrenome", "email")
    filter_horizontal = ("disciplinas",)
    actions = ["exportar_professores_csv"]

    def listar_disciplinas(self, obj):
        return ", ".join([d.nome for d in obj.disciplinas.all()])
    listar_disciplinas.short_description = "Disciplinas"

    def exportar_professores_csv(self, request, queryset):
        response = HttpResponse(content_type="text/csv; charset=utf-8-sig")
        response["Content-Disposition"] = 'attachment; filename="professores.csv"'

        writer = csv.writer(response)
        writer.writerow(["Nome", "Sobrenome", "Email", "Status", "Disciplinas"])

        for professor in queryset:
            disciplinas = ", ".join([d.nome for d in professor.disciplinas.all()])
            writer.writerow([
                professor.nome,
                professor.sobrenome,
                professor.email,
                "Ativo" if professor.status else "Inativo",
                disciplinas
            ])

        return response

    exportar_professores_csv.short_description = "Exportar professores selecionados para CSV"



# ========== CURSO ==========
@admin.register(Curso)
class CursoAdmin(admin.ModelAdmin):
    list_display = ("nome", "carga_horaria_total", "criado_em")
    search_fields = ("nome",)


# ========== DISCIPLINA ==========
class ProfessorInline(admin.TabularInline):
    """Permite adicionar professores diretamente na tela de disciplina."""
    model = Professor.disciplinas.through 
    extra = 1

@admin.register(Disciplina)
class DisciplinaAdmin(admin.ModelAdmin):
    list_display = ("nome", "curso", "carga_horaria", "listar_professores")
    list_filter = ("curso",)
    search_fields = ("nome", "curso__nome")
    inlines = [ProfessorInline]

    def listar_professores(self, obj):
        return ", ".join([p.nome for p in obj.professores.all()])
    listar_professores.short_description = "Professores"



# ========== TURMA ===========
@admin.register(Turma)
class TurmaAdmin(admin.ModelAdmin):
    list_display = ("identificador", "curso", "ano", "semestre")
    list_filter = ("curso", "ano", "semestre")
    search_fields = ("identificador", "curso__nome")
    filter_horizontal = ("professores",)

    actions = ["exportar_alunos_csv"]

    def exportar_alunos_csv(self, request, queryset):
        response = HttpResponse(content_type="text/csv; charset=utf-8-sig")  # BOM UTF-8
        response["Content-Disposition"] = 'attachment; filename="alunos.csv"'

        writer = csv.writer(response)
        writer.writerow(["Nome", "Sobrenome", "Email", "Curso", "Turma/Semestre"])  # adicionei coluna da turma

        for turma in queryset:
            alunos = Aluno.objects.filter(matriculas__turma=turma).distinct()
            for aluno in alunos:
                writer.writerow([
                    aluno.nome,
                    aluno.sobrenome,
                    aluno.email,
                    aluno.curso.nome if aluno.curso else "",
                    f"{turma.identificador} {turma.ano}/{turma.semestre}"  # info da turma
                ])

        return response

# ========== ALUNO ==========
@admin.register(Aluno)
class AlunoAdmin(admin.ModelAdmin):
    list_display = ("nome", "sobrenome", "email", "status", "curso", "listar_disciplinas")
    list_filter = ("status", "curso")
    search_fields = ("nome", "sobrenome", "email")
    fields = ("user", "nome", "sobrenome", "email", "data_nascimento", "status", "curso")
    
    def listar_disciplinas(self, obj):
        return ", ".join(d.nome for d in obj.disciplinas)
    listar_disciplinas.short_description = "Disciplinas"


# ========== MATRICULA ==========
@admin.register(Matricula)
class MatriculaAdmin(admin.ModelAdmin):
    list_display = ("aluno", "turma", "data")
    list_filter = ("turma", "data")
    search_fields = ("aluno__nome", "turma__identificador")


# ========== PERFIS (Aluno/Professor no User) ==========
class AlunoInline(admin.StackedInline):
    model = Aluno
    can_delete = False

class ProfessorInlineUser(admin.StackedInline):
    model = Professor
    can_delete = False

class CustomUserAdmin(UserAdmin):
    inlines = [AlunoInline, ProfessorInlineUser]

    # removendo o fieldset "Informações pessoais"
    fieldsets = (
        (None, {"fields": ("username", "password")}),
        ("Permissões", {"fields": ("is_active", "is_staff", "is_superuser", "groups", "user_permissions")}),
        ("Datas importantes", {"fields": ("last_login", "date_joined")}),
    )

admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)


# ========== NOTA ==========
@admin.register(Nota)
class NotaAdmin(admin.ModelAdmin):
    list_display = ("matricula", "disciplina", "avaliacao", "valor", "data")
    list_filter = ("disciplina", "data")
    search_fields = ("matricula__aluno__nome", "disciplina__nome", "avaliacao")


# ========== FALTA ==========
@admin.register(Falta)
class FaltaAdmin(admin.ModelAdmin):
    list_display = ("matricula", "disciplina", "data", "presente")
    list_filter = ("disciplina", "data", "presente")
    search_fields = ("matricula__aluno__nome", "disciplina__nome")
