CREATE DATABASE db_join_livros;
USE db_join_livros;

CREATE TABLE tb_generos (
    gen_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    gen_nome VARCHAR(50) NOT NULL,
    gen_descricao VARCHAR(100)
);

CREATE TABLE tb_autores (
    aut_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    aut_nome VARCHAR(100) NOT NULL,
    aut_nascimento DATE,
    aut_nacionalidade VARCHAR(50)
);

CREATE TABLE tb_editoras (
    edi_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    edi_nome VARCHAR(100) NOT NULL,
    edi_rua VARCHAR(100),
    edi_cidade VARCHAR(50),
    edi_estado VARCHAR(50),
    edi_pais VARCHAR(50)
);

CREATE TABLE tb_livros (
    liv_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    liv_titulo VARCHAR(200) NOT NULL,
    liv_anoPublicacao YEAR(4),
    liv_edi_id INT(11),
    liv_gen_id INT(11),
    FOREIGN KEY (liv_edi_id) REFERENCES tb_editoras(edi_id),
    FOREIGN KEY (liv_gen_id) REFERENCES tb_generos(gen_id)
);

CREATE TABLE tb_livro_autores (
    lva_liv_id INT(11),
    lva_aut_id INT(11),
    PRIMARY KEY (lva_liv_id, lva_aut_id),
    FOREIGN KEY (lva_liv_id) REFERENCES tb_livros(liv_id),
    FOREIGN KEY (lva_aut_id) REFERENCES tb_autores(aut_id)
);

CREATE TABLE tb_clientes (
    cli_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    cli_nome VARCHAR(100) NOT NULL,
    cli_data_registro DATETIME
);

CREATE TABLE tb_cliente_telefones (
    tel_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    tel_cli_id INT(11) NOT NULL,
    tel_numero VARCHAR(20) NOT NULL,
    tel_tipo VARCHAR(20),
    FOREIGN KEY (tel_cli_id) REFERENCES tb_clientes(cli_id)
);

CREATE TABLE tb_cliente_emails (
    eml_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    eml_cli_id INT(11) NOT NULL,
    eml_endereco VARCHAR(100) NOT NULL,
    FOREIGN KEY (eml_cli_id) REFERENCES tb_clientes(cli_id)
);

CREATE TABLE tb_emprestimos (
    emp_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    emp_cli_id INT(11) NOT NULL,
    emp_liv_id INT(11) NOT NULL,
    emp_data_emprestimo DATETIME,
    emp_data_devolucao_prevista DATE NOT NULL,
    emp_data_devolucao_real DATE,
    emp_status ENUM('Ativo', 'Devolvido', 'Atrasado'),
    FOREIGN KEY (emp_cli_id) REFERENCES tb_clientes(cli_id),
    FOREIGN KEY (emp_liv_id) REFERENCES tb_livros(liv_id)
);

INSERT INTO tb_generos (gen_id, gen_nome, gen_descricao) VALUES
(1, 'Ficção Científica', 'Histórias focadas em tecnologia, futuro e viagem espacial'),
(2, 'Romance', 'Narrativas focadas nas relações interpessoais e amorosas'),
(3, 'Fantasia', 'Mundos imaginários, magia e criaturas mitológicas');

INSERT INTO tb_autores (aut_id, aut_nome, aut_nascimento, aut_nacionalidade) VALUES
(1, 'Machado de Assis', '1839-06-21', 'Brasileira'),
(2, 'J.R.R. Tolkien', '1892-01-03', 'Britânica'),
(3, 'George Orwell', '1903-06-25', 'Britânica'),
(4, 'Cristiano Ronaldo', '1985-02-05', 'Portuguesa'),
(5, 'Lionel Messi', '1987-06-24', 'Argentina'),
(6, 'Edson Arantes do Nascimento (Pelé)', '1940-10-23', 'Brasileira'),
(7, 'Zlatan Ibrahimović', '1981-10-03', 'Sueca'),
(8, 'Ronaldinho Gaúcho', '1980-03-21', 'Brasileira'),
(9, 'Whindersson Nunes', '1995-01-05', 'Brasileira'),
(10, 'Felipe Neto', '1988-01-21', 'Brasileira'),
(11, 'Iberê Thenório (Manual do Mundo)', '1981-10-21', 'Brasileira'),
(12, 'Rafael Lange (Cellbit)', '1997-02-11', 'Brasileira'),
(13, 'Nathalia Arcuri (Me Poupe!)', '1985-02-08', 'Brasileira');

INSERT INTO tb_editoras (edi_id, edi_nome, edi_rua, edi_cidade, edi_estado, edi_pais) VALUES
(1, 'Companhia das Letras', 'Rua Bandeira Paulista, 702', 'São Paulo', 'SP', 'Brasil'),
(2, 'HarperCollins', 'Rua da Quitanda, 86', 'Rio de Janeiro', 'RJ', 'Brasil'),
(3, 'Editora Aleph', 'Rua Frei Caneca, 569', 'São Paulo', 'SP', 'Brasil');

INSERT INTO tb_clientes (cli_id, cli_nome, cli_data_registro) VALUES
(1, 'Carlos Silva', '2024-01-10 10:30:00'),
(2, 'Ana Souza', '2024-02-15 14:20:00'),
(3, 'Mariana Costa', '2024-03-01 09:15:00'),
(4, 'Anitta', '2024-04-01 10:00:00'),
(5, 'Ivete Sangalo', '2024-04-05 11:30:00'),
(6, 'Rodrigo Hilbert', '2024-04-10 14:15:00'),
(7, 'Luan Santana', '2024-04-12 09:45:00'),
(8, 'Sabrina Sato', '2024-04-15 16:20:00');

INSERT INTO tb_livros (liv_id, liv_titulo, liv_anoPublicacao, liv_edi_id, liv_gen_id) VALUES
(1, '1984', 1949, 1, 1),
(2, 'Dom Casmurro', 1999, 1, 2),
(3, 'O Senhor dos Anéis', 1954, 2, 3),
(4, 'Obcecado pela Perfeição: Mente e Disciplina', 2021, 1, 1),
(5, 'A Arte do Drible e Visão de Jogo', 2019, 2, 2),
(6, 'Pelé: A Minha Autobiografia', 2006, 3, 3),
(7, 'Eu Sou Zlatan Ibrahimović', 2011, 2, 1),
(8, 'A Magia do Futebol e a Alegria de Jogar', 2018, 1, 2),
(9, 'Vivendo como um Guerreiro', 2021, 1, 2),
(10, 'Não Faz Sentido! - Por Trás da Câmera', 2013, 2, 2),
(11, 'Manual do Mundo: Experiências Incríveis', 2017, 3, 1),
(12, 'Enigmas e Mistérios do Universo do RPG', 2020, 1, 3),
(13, 'Me Poupe!: 10 Passos para Nunca Mais Faltar Dinheiro', 2018, 2, 2);

INSERT INTO tb_cliente_telefones (tel_id, tel_cli_id, tel_numero, tel_tipo) VALUES
(1, 1, '(11) 98765-4321', 'Telemóvel'),
(2, 1, '(11) 3333-4444', 'Fixo'),
(3, 2, '(21) 99999-8888', 'Telemóvel'),
(4, 4, '(21) 99888-1111', 'Telemóvel'),
(5, 5, '(71) 99777-2222', 'Telemóvel'),
(6, 6, '(11) 99666-3333', 'Telemóvel'),
(7, 6, '(11) 3222-1111', 'Fixo'),
(8, 7, '(11) 99555-4444', 'Telemóvel'),
(9, 8, '(11) 99444-5555', 'Telemóvel');

INSERT INTO tb_cliente_emails (eml_id, eml_cli_id, eml_endereco) VALUES
(1, 1, 'carlos.silva@email.com'),
(2, 1, 'carlos.trabalho@email.com'),
(3, 2, 'ana.souza@email.com'),
(4, 4, 'anitta@email.com'),
(5, 5, 'ivete.sangalo@email.com'),
(6, 6, 'rodrigo.hilbert@email.com'),
(7, 7, 'luan.santana@email.com'),
(8, 8, 'sabrina.sato@email.com');

INSERT INTO tb_livro_autores (lva_liv_id, lva_aut_id) VALUES
(1, 3),
(2, 1),
(3, 2),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),  
(10, 10),
(11, 11),
(12, 12),
(13, 13);

INSERT INTO tb_emprestimos (emp_id, emp_cli_id, emp_liv_id, emp_data_emprestimo, emp_data_devolucao_prevista, emp_data_devolucao_real, emp_status) VALUES
(1, 1, 1, '2024-04-01 10:00:00', '2024-04-15', '2024-04-14', 'Devolvido'),
(2, 2, 3, '2024-04-10 15:30:00', '2024-04-24', NULL, 'Ativo'),
(3, 3, 2, '2024-03-01 11:00:00', '2024-03-15', NULL, 'Atrasado'),
(4, 1, 4, '2024-05-01 09:00:00', '2024-05-15', NULL, 'Ativo'),
(5, 2, 7, '2024-05-02 14:20:00', '2024-05-16', NULL, 'Ativo'),
(6, 3, 6, '2024-04-10 11:00:00', '2024-04-24', '2024-04-22', 'Devolvido'),
(7, 1, 9, '2024-05-10 10:00:00', '2024-05-24', NULL, 'Ativo'),
(8, 2, 11, '2024-05-12 14:00:00', '2024-05-26', NULL, 'Ativo'),
(9, 3, 13, '2024-05-15 16:30:00', '2024-05-29', '2024-05-28', 'Devolvido'),
(10, 4, 4, '2024-06-01 10:00:00', '2024-06-15', NULL, 'Ativo'),        
(11, 5, 8, '2024-06-02 11:30:00', '2024-06-16', '2024-06-14', 'Devolvido'),
(12, 6, 11, '2024-06-05 14:00:00', '2024-06-19', NULL, 'Ativo'),      
(13, 7, 2, '2024-05-20 09:15:00', '2024-06-03', NULL, 'Atrasado'),    
(14, 8, 13, '2024-06-10 16:00:00', '2024-06-24', NULL, 'Ativo'),      
(15, 4, 9, '2024-06-12 18:20:00', '2024-06-26', NULL, 'Ativo');

select aut_nome, aut_nacionalidade from tb_autores;

select liv_titulo, liv_anoPublicacao from tb_livros where liv_anoPublicacao >= 2010;

select cli_nome, cli_data_registro from tb_clientes;

select l.liv_titulo, e.edi_nome
from tb_livros l
join tb_editoras e on l.liv_edi_id = e.edi_id;

select c.cli_nome, t.tel_numero, t.tel_tipo
from tb_clientes c
join tb_cliente_telefones t on c.cli_id = t.tel_cli_id;

select c.cli_nome, e.eml_endereco
from tb_clientes c
join tb_cliente_emails e on c.cli_id = e.eml_cli_id;

select l.liv_titulo, g.gen_nome
from tb_livros l
join tb_generos g on l.liv_gen_id = g.gen_id;

select *
from tb_emprestimos where emp_status = 'atrasado';

select c.cli_nome, e.eml_endereco
from tb_clientes c
left join tb_cliente_emails e on c.cli_id = e.eml_cli_id;

select a.aut_nome, l.liv_titulo
from tb_autores a
left join tb_livro_autores la on a.aut_id = la.lva_aut_id
left join tb_livros l on la.lva_liv_id = l.liv_id;

select l.liv_titulo
from tb_livros l
left join tb_emprestimos e on l.liv_id = e.emp_liv_id where e.emp_id is null;

select c.cli_nome
from tb_clientes c
left join tb_cliente_telefones t on c.cli_id = t.tel_cli_id where t.tel_id is null;

select l.liv_titulo, e.edi_nome, g.gen_nome, a.aut_nome
from tb_livros l
join tb_editoras e on l.liv_edi_id = e.edi_id
join tb_generos g on l.liv_gen_id = g.gen_id
join tb_livro_autores la on l.liv_id = la.lva_liv_id
join tb_autores a on la.lva_aut_id = a.aut_id;

select c.cli_nome, ce.eml_endereco, l.liv_titulo, e.edi_nome, a.aut_nome
from tb_emprestimos em
join tb_clientes c on em.emp_cli_id = c.cli_id
left join tb_cliente_emails ce on c.cli_id = ce.eml_cli_id
join tb_livros l on em.emp_liv_id = l.liv_id
join tb_editoras e on l.liv_edi_id = e.edi_id
join tb_livro_autores la on l.liv_id = la.lva_liv_id
join tb_autores a on la.lva_aut_id = a.aut_id where em.emp_status = 'ativo';

select distinct c.cli_nome
from tb_clientes c
join tb_emprestimos em on c.cli_id = em.emp_cli_id
join tb_livros l on em.emp_liv_id = l.liv_id
join tb_generos g on l.liv_gen_id = g.gen_id where g.gen_nome = 'ficção científica';

select distinct a.aut_nome
from tb_autores a
join tb_livro_autores la on a.aut_id = la.lva_aut_id
join tb_livros l on la.lva_liv_id = l.liv_id
join tb_emprestimos em on l.liv_id = em.emp_liv_id where em.emp_status = 'atrasado';

select c.cli_nome,
       (select t.tel_numero from tb_cliente_telefones t where t.tel_cli_id = c.cli_id order by t.tel_id limit 1) as telefone_principal,
       (select e.eml_endereco from tb_cliente_emails e where e.eml_cli_id = c.cli_id order by e.eml_id limit 1) as email_principal,
       l.liv_titulo,
       em.emp_data_emprestimo,
       em.emp_status
from tb_emprestimos em
join tb_clientes c on em.emp_cli_id = c.cli_id
join tb_livros l on em.emp_liv_id = l.liv_id;

select distinct a.aut_nome, l.liv_titulo
from tb_autores a
join tb_livro_autores la on a.aut_id = la.lva_aut_id
join tb_livros l on la.lva_liv_id = l.liv_id
join tb_emprestimos em on l.liv_id = em.emp_liv_id where a.aut_nacionalidade = 'brasileira';
