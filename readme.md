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

## 📊 Diagrama Entidade-Relacionamento (ERD)

```mermaid
erDiagram
    ALUNO ||--o{ MATRICULA : realiza
    TURMA ||--o{ MATRICULA : possui
    CURSO ||--o{ TURMA : organiza
    CURSO ||--o{ DISCIPLINA : contem
    PROFESSOR }o--o{ DISCIPLINA : leciona
    TURMA }o--o{ PROFESSOR : vincula
    MATRICULA ||--o{ NOTA : gera
    MATRICULA ||--o{ FALTA : registra

    ALUNO {
        int id
        string nome
        string sobrenome
        string email
    }

    CURSO {
        int id
        string nome
        int carga_horaria_total
    }

    DISCIPLINA {
        int id
        string nome
        int carga_horaria
    }

    TURMA {
        int id
        string identificador
        int ano
        int semestre
    }

    PROFESSOR {
        int id
        string nome
        string sobrenome
        string email
    }

```mermaid
classDiagram
    class Professor {
        +id:int
        +nome:string
        +sobrenome:string
        +email:string
        +status:bool
    }
    
    class Curso {
        +id:int
        +nome:string
        +descricao:text
        +carga_horaria_total:int
    }

    class Disciplina {
        +id:int
        +nome:string
        +ementa:text
        +carga_horaria:int
    }

    class Turma {
        +id:int
        +identificador:string
        +ano:int
        +semestre:int
    }

    class Aluno {
        +id:int
        +nome:string
        +sobrenome:string
        +email:string
        +data_nascimento:date
    }
    
    class Matricula {
        +id:int
        +data:date
    }

    class Nota {
        +id:int
        +avaliacao:string
        +valor:decimal
        +data:date
    }

    class Falta {
        +id:int
        +data:date
        +presente:bool
    }
    
    %% Relacionamentos
    Professor "0..*" -- "0..*" Disciplina : leciona
    Professor "0..*" -- "0..*" Turma : participa
    Curso "1" -- "0..*" Disciplina : contem
    Curso "1" -- "0..*" Turma : organiza
    Aluno "1" -- "0..*" Matricula : realiza
    Turma "1" -- "0..*" Matricula : possui
    Matricula "1" -- "0..*" Nota : gera
    Matricula "1" -- "0..*" Falta : registra
    Disciplina "1" -- "0..*" Nota : avaliada
    Disciplina "1" -- "0..*" Falta : frequencia

