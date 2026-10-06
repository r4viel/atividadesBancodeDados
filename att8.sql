create database loja;
use loja;

create table produtos (
    pro_id int primary key,
    pro_nome varchar(100) not null,
    pro_valor decimal(10,2) not null,
    pro_qnt int not null,
    pro_fornecedor varchar(100),
    pro_categoria varchar(100)
);

insert into produtos
    (pro_id, pro_nome, pro_valor, pro_qnt, pro_fornecedor, pro_categoria)
values
    (101, 'smartphone galaxy a55', 1899.90, 15, 'samsung', 'celular'),
    (102, 'tablet galaxy tab', 1299.90, 8, 'samsung', 'tablet'),
    (103, 'notebook dell inspiron', 3499.90, 5, 'dell', 'informática'),
    (104, 'mouse gamer', 129.90, 25, 'logitech', 'acessórios'),
    (105, 'monitor 24 polegadas', 899.90, 10, 'lg', 'informática'),
    (106, 'teclado mecânico', 249.90, 15, 'redragon', 'acessórios'),
    (107, 'fone bluetooth', 199.90, 30, 'jbl', 'eletrônicos'),
    (108, 'smart tv 50 polegadas', 2799.90, 4, 'lg', 'eletrônicos'),
    (109, 'pen drive 64gb', 49.90, 40, 'sandisk', 'acessórios'),
    (110, 'câmera digital', 1599.90, 0, 'canon', 'eletrônicos'),
    (111, 'impressora multifuncional', 799.90, 7, 'hp', 'informática'),
    (112, 'ssd 1tb', 459.90, 18, 'kingston', 'informática'),
    (113, 'cadeira gamer', 1099.90, 6, 'thunderx3', 'móveis'),
    (114, 'webcam full hd', 179.90, 12, 'logitech', 'acessórios'),
    (115, 'console de videogame', 2499.90, 2, 'sony', 'eletrônicos'),
    (116, 'cabo usb', 29.90, 0, 'ugreen', 'acessórios'),
    (117, 'notebook gamer', 5999.90, 3, 'acer', 'informática'),
    (118, 'celular básico', 399.90, 20, 'motorola', 'celular'),
    (119, 'tablet infantil', 699.90, 22, 'multilaser', 'tablet'),
    (120, 'mesa para computador', 899.90, 110, 'mobly', 'móveis');


create table funcionarios (
    id int auto_increment primary key,
    nome varchar(100) not null,
    salario decimal(10,2) not null,
    idade int not null,
    setor varchar(100) not null
);

insert into funcionarios
    (nome, salario, idade, setor)
values
    ('joão silva', 3500.00, 25, 'ti'),
    ('maria santos', 5200.00, 32, 'financeiro'),
    ('pedro oliveira', 2800.00, 19, 'rh'),
    ('ana costa', 4500.00, 35, 'desenvolvimento'),
    ('carlos souza', 6000.00, 41, 'ti'),
    ('juliana lima', 2200.00, 28, 'rh'),
    ('rafael alves', 3100.00, 31, 'financeiro'),
    ('fernanda rocha', 7000.00, 38, 'desenvolvimento'),
    ('lucas martins', 1900.00, 17, 'rh'),
    ('beatriz gomes', 4000.00, 29, 'ti');


create table clientes (
    id int auto_increment primary key,
    nome varchar(100) not null,
    cidade varchar(100) not null
);

insert into clientes
    (nome, cidade)
values
    ('carlos mendes', 'natal'),
    ('mariana souza', 'recife'),
    ('joão ferreira', 'joão pessoa'),
    ('ana paula', 'fortaleza'),
    ('pedro henrique', 'natal'),
    ('juliana alves', 'recife'),
    ('lucas santos', 'maceió'),
    ('fernanda lima', 'joão pessoa');


create table pedidos (
    id int auto_increment primary key,
    cliente_id int,
    status varchar(30) not null,
    valor decimal(10,2) not null,
    foreign key (cliente_id) references clientes(id)
);

insert into pedidos
    (cliente_id, status, valor)
values
    (1, 'pendente', 350.00),
    (2, 'enviado', 750.00),
    (3, 'entregue', 1200.00),
    (4, 'cancelado', 450.00),
    (5, 'pendente', 1500.00),
    (6, 'enviado', 300.00),
    (7, 'entregue', 850.00),
    (8, 'cancelado', 2000.00),
    (1, 'entregue', 2500.00),
    (2, 'enviado', 650.00);


create table alunos (
    id int auto_increment primary key,
    nome varchar(100) not null,
    curso varchar(100) not null,
    idade int not null
);

insert into alunos
    (nome, curso, idade)
values
    ('lucas silva', 'informática', 20),
    ('mariana costa', 'administração', 22),
    ('pedro santos', 'informática', 17),
    ('ana oliveira', 'administração', 19),
    ('carlos lima', 'direito', 25),
    ('juliana souza', 'informática', 30),
    ('rafael gomes', 'engenharia', 21),
    ('fernanda alves', 'administração', 17);

select * from produtos
where pro_valor > 100;

select * from produtos
where pro_valor < 50;

select * from produtos
where pro_qnt = 10;

select * from produtos
where pro_valor >= 200;

select * from produtos
where pro_qnt <> 0;

select * from produtos
where pro_categoria = 'eletrônicos';

select * from produtos
where pro_categoria <> 'eletrônicos';

select * from produtos
where pro_valor > 100
and pro_qnt > 5;

select * from produtos
where pro_categoria = 'informática'
and pro_valor < 500;

select * from produtos
where pro_valor >= 100
and pro_valor <= 300;

select * from produtos
where pro_qnt > 0
and pro_qnt < 20;

select * from produtos
where pro_categoria = 'eletrônicos'
and pro_valor > 500
and pro_qnt > 2;

select * from produtos
where pro_categoria = 'informática'
or pro_categoria = 'eletrônicos';

select * from produtos
where pro_valor < 50
or pro_valor > 500;

select * from produtos
where pro_qnt = 0
or pro_qnt > 100;

select * from produtos
where pro_categoria = 'celular'
or pro_categoria = 'tablet';

select * from produtos
where (pro_categoria = 'informática'
or pro_categoria = 'eletrônicos')
and pro_valor < 500;

select * from produtos
where (pro_qnt > 20 and pro_valor < 100)
or pro_valor > 1000;

select * from produtos
where (pro_categoria = 'celular'
or pro_categoria = 'tablet')
and pro_valor < 2000;

select * from produtos
where (pro_valor < 100 and pro_qnt > 10)
or pro_valor > 1000;

select * from funcionarios
where salario > 3000;

select * from funcionarios
where idade >= 18
and salario > 2000;

select * from funcionarios
where salario * 1.10 > 5000;

select * from funcionarios
where salario * 0.95 < 3000;

select * from funcionarios
where salario * 12 > 60000;

select * from funcionarios
where idade > 30
and salario * 12 > 50000;

select * from produtos
where pro_categoria in ('eletrônicos', 'informática', 'acessórios');

select * from produtos
where pro_categoria not in ('eletrônicos', 'informática', 'acessórios');

select * from funcionarios
where setor in ('ti', 'financeiro', 'rh');

select * from clientes
where cidade in ('natal', 'recife', 'joão pessoa');

select * from produtos
where pro_id not in (101, 105, 110, 115);

select * from produtos
where pro_id in (101, 105, 110, 115);

select * from pedidos
where status in ('pendente', 'enviado', 'entregue');

select * from produtos
where pro_categoria not in ('eletrônicos', 'informática');

select * from clientes
where cidade not in ('natal', 'recife', 'fortaleza');

select * from funcionarios
where setor not in ('rh', 'financeiro');

select * from pedidos
where status not in ('cancelado', 'pendente');

select * from produtos
where pro_id not in (101, 105, 110);

select * from produtos
where pro_categoria in ('informática', 'eletrônicos')
and pro_valor > 500;

select * from alunos
where curso in ('informática', 'administração')
and idade >= 18;

select * from produtos
where pro_categoria in ('informática', 'eletrônicos', 'móveis')
and pro_qnt > 10;

select * from funcionarios
where setor in ('ti', 'desenvolvimento')
and salario > 3000;

select * from pedidos
where status in ('enviado', 'entregue')
and valor > 500;
