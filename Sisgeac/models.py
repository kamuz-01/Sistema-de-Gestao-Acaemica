from django.db import models
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator

class TimestampedModel(models.Model):
    criado_em = models.DateTimeField(auto_now_add=True)
    atualizado_em = models.DateTimeField(auto_now=True)

    class Meta:
        abstract = True

class Professor(TimestampedModel):
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=True, related_name="perfil_professor")
    nome = models.CharField(max_length=120)
    sobrenome = models.CharField("Sobrenome", max_length=60, blank=True)
    email = models.EmailField(unique=True)
    status = models.BooleanField(default=True)
    disciplinas = models.ManyToManyField("Disciplina", related_name="professores", blank=True)
    
    class Meta:
        db_table = "professor"
        ordering = ["nome"]
        verbose_name = "Professor"
        verbose_name_plural = "Professor"

    def __str__(self):
        return self.nome + " " + self.sobrenome

class Curso(TimestampedModel):
    nome = models.CharField(max_length=120, unique=True)
    descricao = models.TextField(blank=True)
    carga_horaria_total = models.PositiveIntegerField(help_text="em horas")
    
    class Meta:
        db_table = "curso"
        ordering = ["nome"]

    def __str__(self):
        return self.nome

class Disciplina(TimestampedModel):
    curso = models.ForeignKey(Curso, on_delete=models.CASCADE, related_name="disciplinas")
    nome = models.CharField(max_length=120)
    ementa = models.TextField(blank=True)
    carga_horaria = models.PositiveIntegerField(help_text="em horas")

    class Meta:
        db_table = "disciplina"
        unique_together = ("curso", "nome")
        ordering = ["nome"]

    def __str__(self):
        return f"{self.nome} ({self.curso.nome})"

class Turma(TimestampedModel):
    curso = models.ForeignKey(Curso, on_delete=models.PROTECT, related_name="turmas")
    identificador = models.CharField(max_length=30, help_text="Ex: 2025-1A")
    ano = models.PositiveIntegerField()
    semestre = models.PositiveSmallIntegerField(validators=[MinValueValidator(1), MaxValueValidator(2)])
    professores = models.ManyToManyField(Professor, blank=True, related_name="turmas")

    class Meta:
        db_table = "turma"
        unique_together = ("curso", "identificador")

    def __str__(self):
        return f"{self.identificador} - {self.curso.nome}"

class Aluno(TimestampedModel):
    user = models.OneToOneField(User, on_delete=models.SET_NULL, null=True, blank=True, related_name="perfil_aluno")
    nome = models.CharField(max_length=120)
    sobrenome = models.CharField("Sobrenome", max_length=60, blank=True)
    email = models.EmailField(unique=True)
    data_nascimento = models.DateField(null=True, blank=True)
    status = models.BooleanField(default=True)
    curso = models.ForeignKey("Curso", on_delete=models.SET_NULL, null=True, blank=True, related_name="aluno")
    
    class Meta:
        db_table = "aluno"
        ordering = ["nome"]
        verbose_name = "Aluno"
        verbose_name_plural = "Aluno"
        
    @property
    def disciplinas(self):
        # todas as disciplinas do(s) curso(s) da(s) turma(s) em que está matriculado
        return Disciplina.objects.filter(
            curso__in=[m.turma.curso for m in self.matriculas.all()]
        ).distinct()

    def __str__(self):
        return self.nome + " " + self.sobrenome

class Matricula(TimestampedModel):
    aluno = models.ForeignKey(Aluno, on_delete=models.CASCADE, related_name="matriculas")
    turma = models.ForeignKey(Turma, on_delete=models.CASCADE, related_name="matriculas")
    data = models.DateField(auto_now_add=True)

    class Meta:
        db_table = "matricula"
        unique_together = ("aluno", "turma")

    def __str__(self):
        return f"{self.aluno} em {self.turma}"

class Nota(TimestampedModel):
    matricula = models.ForeignKey(Matricula, on_delete=models.CASCADE, related_name="notas")
    disciplina = models.ForeignKey(Disciplina, on_delete=models.CASCADE, related_name="notas")
    avaliacao = models.CharField(max_length=60, help_text="Ex: Prova 1, Trabalho, Final")
    valor = models.DecimalField(max_digits=5, decimal_places=2, validators=[MinValueValidator(0), MaxValueValidator(100)])
    data = models.DateField()

    class Meta:
        db_table = "nota"
        unique_together = ("matricula", "disciplina", "avaliacao")

    def __str__(self):
        return f"{self.matricula.aluno} - {self.disciplina.nome}: {self.avaliacao} = {self.valor}"

class Falta(TimestampedModel):
    matricula = models.ForeignKey(Matricula, on_delete=models.CASCADE, related_name="faltas")
    disciplina = models.ForeignKey(Disciplina, on_delete=models.CASCADE, related_name="faltas")
    data = models.DateField()
    presente = models.BooleanField(default=False)

    class Meta:
        db_table = "falta"
        unique_together = ("matricula", "disciplina", "data")

    def __str__(self):
        status = "Presente" if self.presente else "Faltou"
        return f"{self.matricula.aluno} - {self.disciplina.nome} em {self.data}: {status}"