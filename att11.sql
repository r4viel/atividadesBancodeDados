create database atividade_join;
use atividade_join;



CREATE TABLE tb_cursos (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE tb_alunos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES tb_cursos(id)
);

CREATE TABLE tb_disciplinas (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    curso_id INT,
    FOREIGN KEY (curso_id) REFERENCES tb_cursos(id)
);

CREATE TABLE tb_professores (
    id INT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE tb_disciplinas_professores (
    id INT PRIMARY KEY,
    disciplina_id INT,
    professor_id INT,
    FOREIGN KEY (disciplina_id) REFERENCES tb_disciplinas(id),
    FOREIGN KEY (professor_id) REFERENCES tb_professores(id)
);

-- Inserção de dados

INSERT INTO tb_cursos VALUES
(1, 'informática'),
(2, 'administração'),
(3, 'design gráfico'),
(4, 'sistemas');

INSERT INTO tb_alunos VALUES
(1, 'ana souza', 1),
(2, 'bruno lima', 2),
(3, 'carla silva', NULL),
(4, 'diego rocha', 3);

INSERT INTO tb_disciplinas VALUES
(1, 'lógica de prog.', 1),
(2, 'banco de dados', 1),
(3, 'marketing', 2),
(4, 'design de marca', 3);

INSERT INTO tb_professores VALUES
(1, 'prof. alice'),
(2, 'prof. eduardo'),
(3, 'prof. mariana');

INSERT INTO tb_disciplinas_professores VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3);

select 
    alunos.nome as aluno,
    cursos.nome as curso
from tb_alunos as alunos
inner join tb_cursos as cursos
    on alunos.curso_id = cursos.id;

select 
    disciplinas.nome as disciplina,
    cursos.nome as curso
from tb_disciplinas as disciplinas
inner join tb_cursos as cursos
    on disciplinas.curso_id = cursos.id;

select 
    disciplinas.nome as disciplina,
    professores.nome as professor
from tb_disciplinas as disciplinas
inner join tb_disciplinas_professores as dp
    on disciplinas.id = dp.disciplina_id
inner join tb_professores as professores
    on dp.professor_id = professores.id;

select 
    cursos.nome as curso,
    disciplinas.nome as disciplina
from tb_cursos as cursos
inner join tb_disciplinas as disciplinas
    on cursos.id = disciplinas.curso_id;

select 
    cursos.nome as curso,
    disciplinas.nome as disciplina,
    professores.nome as professor
from tb_cursos as cursos
inner join tb_disciplinas as disciplinas
    on cursos.id = disciplinas.curso_id
inner join tb_disciplinas_professores as dp
on disciplinas.id = dp.disciplina_id
inner join tb_professores as professores
    on dp.professor_id = professores.id;
