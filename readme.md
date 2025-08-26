# 📚 Sistema de Gestão Acadêmica (Sisgeac)

## 🎯 Tema do Sistema

O sistema tem como objetivo **gerenciar informações acadêmicas** de uma instituição de ensino, facilitando o acompanhamento de **alunos, professores, cursos, disciplinas, turmas, matrículas, notas e faltas**.  
A interface administrativa foi personalizada utilizando o **Django Admin + Jazzmin**, oferecendo uma navegação mais moderna e intuitiva.

---

## 🗂️ Modelos do Sistema

### 👨‍🎓 Aluno
- Representa os estudantes da instituição.
- Possui vínculo com um `Curso`.
- Sua `Matrícula` pode estar vinculada em uma ou várias `Turmas`.

### 👨‍🏫 Professor
- Representa os docentes.
- Associado a um `User` (para login no sistema).
- Pode ministrar várias `Disciplinas`.
- Pode estar vinculado a várias `Turmas`.

### 📖 Curso
- Estrutura maior que agrupa várias `Disciplinas`.
- Cada `Aluno` está vinculado a um único curso.

### 📘 Disciplina
- Unidade de aprendizado pertencente a um `Curso`.
- Pode ser ministrada por um ou mais `Professores`.
- Associada a `Notas` e `Faltas` dos alunos.

### 👥 Turma
- Agrupamento de alunos em um determinado semestre/ano.
- Relacionada a um `Curso`.
- Pode ter vários `Professores` e vários `Alunos` através de `Matrículas`.

### 📝 Matrícula
- Conecta um `Aluno` a uma `Turma`.
- Registro que valida a participação do aluno naquela turma específica.
- Base para lançamento de `Notas` e `Faltas`.

### 🏷️ Nota
- Avaliação atribuída a um aluno em determinada `Disciplina`.
- Associada a uma `Matrícula`.
- Contém informações como tipo da avaliação (Prova, Trabalho, etc.), valor obtido e data.

### 📅 Falta
- Registro de presença/ausência de um aluno em determinada `Disciplina`.
- Associada a uma `Matrícula`.
- Informa a data e se o aluno estava presente ou não.

---

## 🔗 Relacionamentos Principais

- **Aluno ↔ Curso**: cada aluno está vinculado a um curso.  
- **Curso ↔ Disciplina**: um curso possui várias disciplinas.  
- **Professor ↔ Disciplina**: professores podem lecionar várias disciplinas.  
- **Aluno ↔ Turma**: via `Matrícula`, conectando aluno e turma.  
- **Turma ↔ Curso**: cada turma pertence a um curso.  
- **Matrícula ↔ Nota / Falta**: notas e faltas são registradas sempre a partir da matrícula.  

---

## 🚀 Tecnologias Utilizadas

- **Backend**: Django 5.x  
- **Banco de Dados**: MySQL  
- **Frontend Administrativo**: Django Admin com Jazzmin (interface customizada)  
- **Autenticação**: Django `User` integrado a Aluno e Professor  

---
