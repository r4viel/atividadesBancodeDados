create database db_escola;
use db_escola;
create table tb_alunos (
alu_id int primary key auto_increment,
alu_nome varchar(100),
alu_email varchar(100),
alu_cidade varchar(100)
);

insert into tb_alunos (alu_nome, alu_email, alu_cidade) values
('Ana Silva', 'ana.silva@gmail.com', 'Natal'),
('Amanda Santos', 'amanda@gmail.com', 'São Paulo'),
('João Silva', 'joao.silva@gmail.com', 'Natal'),
('Joana Souza', 'joana@gmail.com', 'São Luís'),
('Maria Silva', 'maria.silva@gmail.com', 'Natal'),
('Mariana Santos', 'mariana@gmail.com', 'São Paulo'),
('Pedro Silva', 'pedro.silva@gmail.com', 'Recife'),
('Paulo Santos', 'paulo.santos@hotmail.com', 'Fortaleza'),
('José Souza', 'jose@gmail.com', 'Natal'),
('Julia Silva', 'julia.silva@gmail.com', 'São Paulo'),
('Lucas Santos', 'lucas@gmail.com', 'Natal'),
('Carlos Souza', 'carlos@hotmail.com', 'Recife'),
('Beatriz Silva', 'beatriz@gmail.com', 'São Luís'),
('Gabriela Santos', 'gabriela@gmail.com', 'Natal'),
('Marcos Silva', 'marcos@gmail.com', 'São Paulo'),
('Marta Souza', 'marta@hotmail.com', 'Natal'),
('Joana Silva', 'joana.silva@gmail.com', 'São Paulo'),
('Joana Costa', 'joana.costa@gmail.com', 'Natal'),
('Pedro Souza', 'pedro@hotmail.com', 'Recife'),
('Paulo Silva', 'paulo.silva@gmail.com', 'São Luís'),
('Alana Santos', 'alana@gmail.com', 'Natal'),
('Amanda Silva', 'amanda.silva@gmail.com', 'São Paulo'),
('Renato Souza', 'renato@hotmail.com', 'Natal'),
('Eduardo Santos', 'eduardo@gmail.com', 'Recife'),
('Maria Souza', 'maria.souza@gmail.com', 'São Paulo'),
('Ana Clara', 'ana.clara@gmail.com', 'Natal'),
('Marcio Santos', 'marcio@gmail.com', 'São Luís'),
('Alberto Silva', 'alberto@gmail.com', 'Natal'),
('Juliana Souza', 'juliana@gmail.com', 'São Paulo'),
('Helena Costa', 'helena@hotmail.com', 'Recife'),
('Amanda', 'admin@escola.com', 'Natal'),
('Joaoa', 'joaoa@gmail.com', 'Natal'),
('Marco', 'marco@gmail.com', 'São Paulo');

select * from tb_alunos
where alu_nome like 'a%';

select * from tb_alunos
where alu_nome like '%a';

select * from tb_alunos
where alu_nome like '%silva%';

select * from tb_alunos
where alu_nome like '%e%';

select * from tb_alunos
where alu_email like '%@gmail.com';

select * from tb_alunos
where alu_email like 'j%';

select * from tb_alunos
where alu_cidade like 'são%';

select * from tb_alunos
where alu_nome like '%ana%';

select * from tb_alunos
where alu_nome like 'jo___';

select * from tb_alunos
where alu_nome like '_____';

select * from tb_alunos
where alu_nome like 'm___';

select * from tb_alunos
where alu_email like '_____@%';

select * from tb_alunos
where alu_nome not like 'a%';

select * from tb_alunos
where alu_email not like '%@gmail.com';

select * from tb_alunos
where alu_nome not like '%silva%';

select * from tb_alunos
where alu_cidade not like 'são%';

select * from tb_alunos
where alu_nome like 'a%'
and alu_cidade like 'natal%';

select * from tb_alunos
where alu_nome like 'j%'
or alu_nome like '%a';

select * from tb_alunos
where alu_nome like '%maria%'
and alu_email like '%@gmail.com';

select * from tb_alunos
where alu_nome like 'a%'
and alu_nome not like '%silva%';

select * from tb_alunos
where alu_nome like 'jo%'
or alu_nome like 'ma%';

select * from tb_alunos
where alu_email like '%.br';

select * from tb_alunos
where alu_nome like '%ana%';

select * from tb_alunos
where alu_nome not like '%e%';

select * from tb_alunos
where alu_nome between 'a' and 'm%';

select * from tb_alunos
where alu_email like '%admin%';

select * from tb_alunos
where alu_nome like '_a%';

select * from tb_alunos
where alu_nome like '_____o';

select * from tb_alunos
where alu_nome like 'pedro%'
or alu_nome like 'paulo%';

select * from tb_alunos
where (alu_nome like '%silva%'
or alu_nome like '%santos%')
and alu_nome not like '%souza%';
