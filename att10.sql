create database db_loja;
use db_loja;

create table tb_produtos (
    pro_id int primary key auto_increment,
    pro_nome varchar(100),
    pro_categoria varchar(50),
    pro_preco decimal(10,2),
    pro_estoque int
);

create table tb_alunos (
    alu_id int primary key auto_increment,
    alu_nome varchar(100),
    alu_idade int,
    alu_nota decimal(4,2),
    alu_data_nascimento date
);

insert into tb_produtos
(pro_nome, pro_categoria, pro_preco, pro_estoque)
values
('Mouse USB', 'Eletrônicos', 25.00, 50),
('Teclado Mecânico', 'Eletrônicos', 150.00, 30),
('Monitor 24 Polegadas', 'Eletrônicos', 750.00, 15),
('Fone de Ouvido', 'Eletrônicos', 80.00, 20),
('Webcam HD', 'Eletrônicos', 120.00, 10),
('Cabo HDMI', 'Eletrônicos', 35.00, 100),
('Pendrive 64GB', 'Eletrônicos', 45.00, 40),
('Caixa de Som Bluetooth', 'Eletrônicos', 200.00, 8),
('Notebook', 'Eletrônicos', 3500.00, 5),
('Impressora', 'Eletrônicos', 450.00, 25),
('Cadeira de Escritório', 'Móveis', 500.00, 12),
('Mesa para Computador', 'Móveis', 300.00, 20),
('Estante', 'Móveis', 180.00, 35),
('Luminária de Mesa', 'Móveis', 70.00, 50),
('Armário', 'Móveis', 800.00, 10),
('Caderno', 'Papelaria', 20.00, 100),
('Caneta Azul', 'Papelaria', 5.00, 200),
('Mochila', 'Acessórios', 120.00, 30),
('Estojo', 'Acessórios', 30.00, 60),
('Calculadora', 'Eletrônicos', 55.00, 15);

insert into tb_alunos
(alu_nome, alu_idade, alu_nota, alu_data_nascimento)
values
('Ana Silva', 15, 8.5, '2010-05-10'),
('Bruno Santos', 16, 7.0, '2009-03-15'),
('Carlos Oliveira', 17, 9.0, '2008-08-20'),
('Daniel Souza', 18, 6.5, '2007-12-05'),
('Eduarda Lima', 19, 8.0, '2006-06-18'),
('Fernanda Costa', 20, 5.5, '2005-11-25'),
('Gabriel Alves', 14, 9.5, '2011-02-14'),
('Helena Rocha', 15, 6.0, '2010-09-30'),
('Igor Martins', 16, 7.5, '2009-07-12'),
('Julia Ferreira', 17, 10.0, '2008-01-22'),
('Lucas Pereira', 18, 5.0, '2007-04-08'),
('Mariana Gomes', 15, 8.0, '2010-12-10'),
('Nicolas Ribeiro', 16, 6.8, '2009-10-17'),
('Olivia Mendes', 17, 9.2, '2008-06-03'),
('Pedro Carvalho', 18, 7.8, '2007-09-21'),
('Rafaela Barbosa', 13, 9.0, '2012-03-11'),
('Samuel Teixeira', 21, 4.5, '2004-05-19'),
('Tatiane Nunes', 22, 8.7, '2003-08-27'),
('Vinicius Correia', 15, 7.2, '2010-04-16'),
('Yasmin Cardoso', 16, 9.8, '2009-12-02');

select *
from tb_produtos
where pro_preco between 10 and 50;

select *
from tb_produtos
where pro_preco between 50 and 100;

select *
from tb_produtos
where pro_estoque between 10 and 50;

select *
from tb_produtos
where pro_estoque between 20 and 100;

select pro_nome, pro_preco
from tb_produtos
where pro_preco between 30 and 80;

select pro_nome, pro_preco
from tb_produtos
where pro_preco between 100 and 500;

select *
from tb_produtos
where pro_estoque between 5 and 20
and pro_categoria = 'Eletrônicos';

select *
from tb_produtos
where pro_preco between 20 and 100
order by pro_preco;

select *
from tb_produtos
where pro_preco not between 50 and 200;

select *
from tb_produtos
where pro_estoque between 10 and 30
or pro_preco between 200 and 500;

select *
from tb_alunos
where alu_idade between 15 and 18;

select *
from tb_alunos
where alu_nota between 6 and 8;

select alu_nome, alu_idade
from tb_alunos
where alu_idade between 16 and 20;

select *
from tb_alunos
where alu_nota between 5 and 7;

select *
from tb_alunos
where alu_nota between 8 and 10
order by alu_nota;

select *
from tb_alunos
where alu_idade between 14 and 17
and alu_nota between 6 and 10;

select *
from tb_alunos
where alu_idade not between 15 and 18;

select *
from tb_alunos
where alu_data_nascimento
between '2008-01-01' and '2009-12-31';

select *
from tb_alunos
where alu_data_nascimento
between '2010-01-01' and '2010-12-31';

select alu_nome, alu_data_nascimento
from tb_alunos
where alu_data_nascimento
between '2007-01-01' and '2009-12-31';

select *
from tb_alunos
where alu_data_nascimento
between '2008-01-01' and '2008-12-31'
and alu_nota between 7 and 10;

select *
from tb_alunos
where alu_data_nascimento
not between '2008-01-01' and '2010-12-31';

select *
from tb_produtos
where pro_preco between 50 and 300
and pro_estoque between 10 and 50;

select *
from tb_alunos
where alu_idade between 15 and 18
or alu_nota between 8 and 10;

select *
from tb_produtos
where pro_preco between 100 and 500
and pro_estoque not between 20 and 50;

select *
from tb_alunos
where alu_data_nascimento
between '2007-01-01' and '2010-12-31'
and alu_idade between 15 and 18
and alu_nota between 6 and 10;

select *
from tb_produtos
where pro_preco between 50 and 200
or pro_estoque between 5 and 15
order by pro_preco;

select pro_nome, pro_preco, pro_estoque
from tb_produtos
where pro_preco between 100 and 300
and pro_estoque between 10 and 100;
