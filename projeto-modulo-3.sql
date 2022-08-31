create table "tb_aluno" (
  "id_aluno" int
    primary key,
  "nome" varchar(255),
  "cpf" varchar(14),
  "data_nascimento" date
);


create table "tb_facilitacao" (
  "id_facilitador" int
    primary key,
  "nome" varchar(255),
  "cpf" varchar(14),
  "data_nascimento" date,
  "frente" varchar(255)
);



create table "tb_curso" (
  "id_curso" int
    primary key,
  "nome" varchar(50)
);



create table "tb_pagamento" (
  "id_pagamento" integer
    primary key,
  "forma_de_pagamento" varchar(50),
  "valor" int
);


create table "tb_turma" (
  "id_turma" varchar(10)
    primary key,
  "curso" int,
    foreign key (curso) 
    references tb_curso (id_curso),
  "facilitacao_tech" int,
    foreign key (facilitacao_tech) 
    references "tb_facilitacao" (id_facilitador),
  "facilitacao_soft" int,
    foreign key ("facilitacao_soft") 
    references "tb_facilitacao" (id_facilitador),
  "modulo" int,
  "data_inicio" date,
  "data_final" date
);


create table "tb_matricula" (
  "id_matricula" int
    primary key,
  "id_aluno" int,
    foreign key (id_aluno) 
    references "tb_aluno" (id_aluno),
  "id_turma" varchar(10),
    foreign key ("id_turma") 
    references "tb_turma" ("id_turma"),
  "id_pagamento" int,
    foreign key ("id_pagamento") 
    references "tb_pagamento" ("id_pagamento"),
  "data_matricula" date,
  "data_saida" date
);

create table "tb_alunos_empregados" (
    id_aluno_empregado int primary key,
    id_aluno int,
    foreign  key (id_aluno)
    references tb_aluno (id_aluno),
    vaga varchar (50),
    salario int
);

create table "tb_atividades" (
  "id_matricula" int,
    foreign  key (id_matricula)
    references tb_matricula (id_matricula),
  "modulo" int, 
  "todo1" varchar (50),
   todo2 varchar (50),
  "projeto" varchar (50),
   codewars varchar (50)
);

insert into tb_pagamento (id_pagamento, forma_de_pagamento, valor)
values (1, 'ISA/Provi', 16000),
       (2, 'Parcelado', 14000),
       (3, 'A vista', 11000);

insert into tb_curso (id_curso, nome)
values (1, 'Desenvolvimento Web'),
       (2, 'Data Analytics');

insert into tb_facilitacao (id_facilitador, nome, cpf, data_nascimento, frente)
values (1, 'João Pedro Silveira','144.472.070-10', '2000-07-07', 'Soft'),
       (2,'Paloma Monteiro Tavares','157.967.220-14','1997-09-08','Tech'),
       (3,'Marisa Silva Queiroz','145.253.008-09','1995-02-02','Tech');
       
insert into tb_turma (id_turma, curso, facilitacao_tech, facilitacao_soft, modulo, data_inicio, data_final)
values (19,1,2,1,5,'2021-12-27','2022-05-12'),
       (20,2,3,1,3,'2022-05-16', '2022-11-10');
       
insert into tb_aluno (id_aluno, nome, cpf, data_nascimento)
values (1,'João Almeida de Carvalho','544.472.070-10','2000-07-07'),
       (2,'Priscilla Passos Cândido','517.967.220-14','1997-09-08'),
       (3,'Ana Carolina Farias Barreto','626.107.560-38','2001-05-10'),
       (4,'Pedro Henrique Cardoso','297.845.200-52','1998-03-12'),
       (5,'Thiago Moreira Silva','677.732.330-98','1996-06-06'),
       (6,'Paulo Lemos Dias','479.599.420-05','1990-07-09'),
       (7,'Lucas Silveira Santos','121.577.140-14','2001-09-07'),
       (8,'Nilton Araujo Martins','211.623.560-06','1998-06-06'),
       (9,'Francielly Nascimento das Dores','993.506.840-47','1997-10-09'),
       (10,'Marcio Freitas Junior','993.006.190-04','1997-01-12'),
       (11,'Antônio Gomes Silva','281.017.888-75','1999-03-10'),
       (12,'Eduardo Gonçalves','802.128.286-06','2001-02-21'),
       (13,'Maria Clara Santos','134.034.645-12','2002-07-15'),
       (14,'Joana dos Anjos','282.725.243-09','1998-07-12'),
       (15,'Pedro vinícius Silveira','727.017.813-53','2001-03-01'),
       (16,'Lucas Oliveira Moreira','100.440.301-18','1992-02-21'),
       (17,'Juliana Moreira Costa','011.433.362-08','1985-07-24'),
       (18,'João Gonçalves Nascimento','922.414.623-90','1993-05-26'),
       (19,'Antonia Souza Costa','313.214.653-35','1998-06-11'),
       (20,'Paulo Barros Moreira','011.341.246-00','1981-11-03'),
       (21,'João Cardozo Medeiros','711.330.663-72','1989-01-26'),
       (22,'Lucas Nunes Nascimento','121.133.529-15','1996-09-23'),
       (23,'Marcos Santos Barboza','401.034.406-40','1996-05-20'),
       (24,'Patricia Souza Andrade','012.044.545-07','1996-03-13'),
       (25,'Adriana Pereira Andrade','001.105.129-01','1990-08-25'),
       (26,'Fernanda Teixeira Dias','312.134.011-35','1992-08-07'),
       (27,'Aline Machado Mello','413.102.068-48','1987,05,19'),
       (28,'Luiz Andrade Castro','501.122.273-50','1990-08-01'),
       (29,'Juliana Castro Alves','112.344.178-12','1987-06-17'),
       (30,'Ana Cardozo Souza','011.144.417-08','1990-03-13'),
       (31,'Luiz Carvalho Barbosa','603.134.127-66','1990-02-11'),
       (32,'Pedro Batista Medeiros','211.024.677-23','1990-06-15'),
       (33,'Ana Teixeira Medeiros','411.122.638-45','1995-04-21'),
       (34,'João Freitas','503.440.446-53','1986-08-06'),
       (35,'Paulo Santana Ramos','001.131.060-09','1986-10-21'),
       (36,'Aline Lopes Campos','611.104.227-68','1990-02-25'),
       (37,'Antonia Dias Andrade','012.121.163-05','1990-05-09'),
       (38,'Carlos Nogueira Camacho','278.636.404-31','1996-02-28'),
       (39,'Rayanne Fernandes Barellos','551.667.261-97','2000-03-18'),
       (40,'Jhonata Brito Rubi','869.644.831-60','1997-08-23');
      
      
insert into tb_matricula (id_matricula, id_aluno, id_turma,id_pagamento,data_matricula, data_saida)
values (012021,1,19,1,'2021-12-27','2022-05-12'),
       (022021,2,19,2,'2021-12-27','2022-05-12'),
       (032021,3,19,1,'2021-12-27','2022-05-12'),
       (042021,4,19,3,'2021-12-27','2022-02-10'),
       (052021,5,19,2,'2021-12-27','2022-01-24'),
       (062021,6,19,3,'2021-12-27','2022-05-12'),
       (072021,7,19,2,'2021-12-27','2022-05-12'),
       (082021,8,19,1,'2021-12-27','2022-05-12'),
       (092021,9,19,2,'2021-12-27','2022-04-04'),
       (102021,10,19,3,'2021-12-27','2022-05-12'),
       (112021,11,19,2,'2021-12-27','2022-05-12'),
       (122021,12,19,1,'2021-12-27','2022-05-12'),
       (132021,13,19,1,'2021-12-27','2022-05-12'),
       (142021,14,19,2,'2021-12-27','2022-02-12'),
       (152021,15,19,1,'2021-12-27','2022-05-12'),
       (162021,16,19,3,'2021-12-27','2022-05-12'),
       (172021,17,19,2,'2021-12-27','2022-03-24'),
       (182021,18,19,3,'2021-12-27','2022-02-25'),
       (192021,19,19,3,'2021-12-27','2022-05-12'),
       (202021,20,19,2,'2021-12-27','2022-05-12'),
       (212022,21,20,1,'2022-05-16',Null),
       (222022,22,20,1,'2022-05-16',Null),
       (232022,23,20,2,'2022-05-16','2022-06-13'),
       (242022,24,20,1,'2022-05-16','2022-07-25'),
       (252022,25,20,3,'2022-05-16',Null),
       (262022,26,20,1,'2022-05-16',Null),
       (272022,27,20,1,'2022-05-16','2022-08-20'),
       (282022,28,20,1,'2022-05-16','2022-07-09'),
       (292022,29,20,1,'2022-05-16',Null),
       (302022,30,20,3,'2022-05-16',Null),
       (312022,31,20,3,'2022-05-16',Null),
       (322022,32,20,3,'2022-05-16','2022-05-28'),
       (332022,33,20,1,'2022-05-16','2022-07-26'),
       (342022,34,20,1,'2022-05-16',Null),
       (352022,35,20,3,'2022-05-16',Null),
       (362022,36,20,1,'2022-05-16','2022-08-06'),
       (372022,37,20,3,'2022-05-16',Null),
       (382022,38,20,1,'2022-05-16',Null),
       (392022,39,20,1,'2022-05-16',Null),
       (402022,40,20,1,'2022-05-16',Null);


insert into tb_alunos_empregados (id_aluno_empregado, id_aluno, vaga, salario)
values (1,2,'Dev Java',1900),
       (2,5,'Dev Javascript',2300),
       (3,14,'Dev C#',3400),
       (4,12,'Desenvolvedor de softwares',2400),
       (5,1,'Desenvolvedor React',1400),
       (6,13,'Dev Oracle',1900),
       (7,8,'Desenvolvedor Fullstack',2100),
       (8,18,'Desenvolvedor .net',1700),
       (9,11,'Dev mobile',2000),
       (10,3,'Dev PHP',1300),
       (11,17,'Desenvolvedor Fullstack',2600),
       (12,10,'Desenvolvedor python',1400) ,
       (13,25,'Analista de BI',2300),
       (14,32,'Estagiário de dados',1200),
       (15,40,'Cientista de dados',2500),
       (16,24,'Analista de banco de dados',1300),
       (17,39,'Analista de dados',1700);

insert into tb_atividades(id_matricula, modulo, todo1, todo2, projeto, codewars)
values
	(012021, 1, True, True, 'está quase lá', 22),
	(012021, 2, True, True, 'mostrou seu diferencial', 88),
	(012021, 3, True, True, 'colocou tudo em prática', 92),
	(012021, 4, True, True, 'colocou tudo em prática', 135),
	(012021, 5, True, True, 'mostrou seu diferencial', 85),
	(022021, 1, True, True, 'colocou tudo em prática', 28),
	(022021, 2, True, True, 'está quase lá', 96),
	(022021, 3, True, True, 'colocou tudo em prática', 130),
	(022021, 4, True, True, 'está quase lá', 148),
	(022021, 5, True, True, 'mostrou seu diferencial', 102),
	(032021, 1, True, True, 'mostrou seu diferencial', 24),
	(032021, 2, True, True, 'colocou tudo em prática', 90),
	(032021, 3, True, True, 'colocou tudo em prática', 92),
	(032021, 4, True, True, 'está quase lá', 140),
	(032021, 5, True, True, 'mostrou seu diferencial', 90),
	(042021, 1, True, True, 'está quase lá', 20),
	(042021, 2, True, False, Null, Null),
	(052021, 1, True, True, 'colocou tudo em prática', 35),
	(052021, 2, True, True, Null,Null),
	(062021, 1, True, True, 'colocou tudo em prática', 80),
	(062021, 2, False, True, 'colocou tudo em prática', 220),
	(062021, 3, True, True, 'colocou tudo em prática', 200),
	(062021, 4, True, True, 'mostrou seu diferencial', 210),
	(062021, 5, True, True, 'está quase lá', 250),
	(072021, 1, True, True, 'colocou tudo em prática', 30),
	(072021, 2, True, True, 'colocou tudo em prática', 89),
	(072021, 3, True, True, 'colocou tudo em prática', 93),
	(072021, 4, True, True, 'mostrou seu diferencial', 140),
	(072021, 5, True, False, 'mostrou seu diferencial', 87),
	(082021, 1, True, True, 'colocou tudo em prática', 27),
	(082021, 2, True, True, 'colocou tudo em prática', 89),
	(082021, 3, True, True, 'está quase lá', 97),
	(082021, 4, True, True, 'mostrou seu diferencial', 137),
	(082021, 5, True, True, 'mostrou seu diferencial', 90),
	(092021, 1, True, True, 'colocou tudo em prática', 28),
	(092021, 2, True, True, 'colocou tudo em prática', 96),
	(092021, 3, True, True, 'colocou tudo em prática', 102),
	(092021, 4, True, True, 'está quase lá', 142),
	(092021, 5, False, False, Null, Null),
	(102021, 1, True, True, 'colocou tudo em prática', 28),
	(102021, 2, True, True, 'colocou tudo em prática', 96),
	(102021, 3, True, True, 'colocou tudo em prática', 106),
	(102021, 4, True, True, 'está quase lá', 152),
	(102021, 5, True, True, 'mostrou seu diferencial', 90),
	(112021, 1, True, True, 'colocou tudo em prática', 27),
	(112021, 2, True, True, 'mostrou seu diferencial', 92),
	(112021, 3, True, True, 'está quase lá', 98),
	(112021, 4, True, True, 'mostrou seu diferencial', 130),
	(112021, 5, True, True, 'mostrou seu diferencial', 97),
	(122021, 1, True, True, 'mostrou seu diferencial', 29),
	(122021, 2, True, True, 'colocou tudo em prática', 80),
	(122021, 3, True, True, 'colocou tudo em prática', 120),
	(122021, 4, True, True, 'mostrou seu diferencial', 152),
	(122021, 5, True, True, 'está quase lá', 50),
	(132021, 1, True, True, 'colocou tudo em prática', 30),
	(132021, 2, True, True, 'mostrou seu diferencial', 50),
	(132021, 3, True, True, 'mostrou seu diferencial', 210),
	(132021, 4, True, True, 'mostrou seu diferencial', 140),
	(132021, 5, True, True, 'mostrou seu diferencial', 90),
	(142021, 1, True, True, 'colocou tudo em prática', 29),
	(142021, 2, True, False, Null, Null),
	(152021, 1, True, True, 'colocou tudo em prática', 15),
	(152021, 2, True, True, 'mostrou seu diferencial', 95),
	(152021, 3, True, True, 'colocou tudo em prática', 99),
	(152021, 4, True, True, 'está quase lá', 142),
	(152021, 5, True, True, 'mostrou seu diferencial', 95),
	(162021, 1, True, True, 'mostrou seu diferencial', 30),
	(162021, 2, True, True, 'está quase lá', 98),
	(162021, 3, True, True, 'mostrou seu diferencial', 95),
	(162021, 4, True, True, 'mostrou seu diferencial', 136),
	(162021, 5, True, True, 'está quase lá', 88),
	(172021, 1, True, True, 'mostrou seu diferencial', 20),
	(172021, 2, True, True, 'colocou tudo em prática', 100),
	(172021, 3, True, True, 'mostrou seu diferencial', 50),
	(172021, 4, True, False, Null, Null),
	(182021, 1, True, False, 'colocou tudo em prática', 0),
	(182021, 2, True, True, 'está quase lá', 110),
	(182021, 3, True, True, Null, Null),
	(192021, 1, True, True, 'está quase lá', 40),
	(192021, 2, True, True, 'mostrou seu diferencial', 125),
	(192021, 3, True, True, 'colocou tudo em prática', 115),
	(192021, 4, True, True, 'está quase lá', 152),
	(192021, 5, True, True, 'mostrou seu diferencial', 92),
	(202021, 1, True, True, 'mostrou seu diferencial', 25),
	(202021, 2, True, True, 'está quase lá', 89),
	(202021, 3, True, True, 'colocou tudo em prática', 93),
	(202021, 4, True, True, 'mostrou seu diferencial', 136),
	(202021, 5, True, True, 'está quase lá', 86),
	(212022, 1, True, True, 'colocou tudo em prática', 23),
	(212022, 2, True, True, 'colocou tudo em prática', 89),
	(212022, 3, True, True, 'está quase lá', 102), 
	(222022, 1, True, True, 'mostrou seu diferencial', 23),
	(222022, 2, True, True, 'colocou tudo em prática', 91),
	(222022, 3, True, True, 'colocou tudo em prática', 57),
	(232022, 1, False, True, 'colocou tudo em prática', 23),
	(232022, 2, True, True, Null, Null),
	(242022, 1, True, True, 'colocou tudo em prática', 23),
	(242022, 2, True, True, 'mostrou seu diferencial', 92),
	(242022, 3, True, True, Null, Null),
	(252022, 1, True, True, 'mostrou seu diferencial', 30),
	(252022, 2, True, True, 'colocou tudo em prática', 120),
	(252022, 3, True, True, 'mostrou seu diferencial', 150),
	(262022, 1, True, True, 'colocou tudo em prática', 22),
	(262022, 2, True, True, 'está quase lá', 88),
	(262022, 3, True, True,'colocou tudo em prática', 54),
    (262022, 4, True, True, 'mostrou seu diferencial', 65),
	(262022, 5, True, True, 'colocou tudo em prática', 22),
	(272022, 1, True, True, 'colocou tudo em prática', 27),
	(272022, 2, True, True, 'mostrou seu diferencial', 93),
	(272022, 3, True, True,Null,Null),
	(282022, 1, True, True, 'colocou tudo em prática', 24),
	(282022, 2, True, True, 'colocou tudo em prática', 89),
	(282022, 3, False, True,Null,Null),
	(292022, 1, True, True, 'mostrou seu diferencial', 30),
	(292022, 2, True, True, 'está quase lá', 90),
	(292022, 3, True, True,'está quase lá', 75),
    (292022, 4, True, True, 'colocou tudo em prática', 75),
	(292022, 5, True, True, 'colocou tudo em prática', 43),
	(302022, 1, True, True, 'colocou tudo em prática', 25),
	(302022, 2, True, True, 'colocou tudo em prática', 95),
	(302022, 3, True, True,'mostrou seu diferencial', 53),
    (302022, 4, True, True, 'colocou tudo em prática', 63),
	(302022, 5, True, True, 'colocou tudo em prática', 32),
	(312022, 1, True, True, 'mostrou seu diferencial', 32),
	(312022, 2, True, True, 'mostrou seu diferencial', 89),
	(312022, 3, True, True,'colocou tudo em prática',62),
    (312022, 4, True, True, 'colocou tudo em prática', 89),
	(312022, 5, True, True, 'mostrou seu diferencial', 89),
	(322022, 1, True, True, Null, Null),
	(332022, 1, True, True, 'colocou tudo em prática', 27),
	(332022, 2, True, True, 'colocou tudo em prática', 89),
	(332022, 3, True, True,Null,Null),
	(342022, 1, True, True, 'mostrou seu diferencial', 30),
	(342022, 2, True, True, 'colocou tudo em prática', 92),
	(342022, 3, True, True,'mostrou seu diferencial', 43),
	(342022, 4, True, True, 'colocou tudo em prática', 23),
	(342022, 5, True, True, 'colocou tudo em prática', 61),
	(352022, 1, True, True, 'colocou tudo em prática', 32),
	(352022, 2, True, True, 'está quase lá', 80),
	(352022, 3, True, False,'está quase lá',25), 
    (352022, 4, True, True, 'colocou tudo em prática', 32),
    (352022, 5, True, True, 'colocou tudo em prática', 53),
	(362022, 1, True, True, 'mostrou seu diferencial', 26),
	(362022, 2, True, True, 'colocou tudo em prática', 100),
	(362022, 3, True, True,Null,Null),
	(372022, 1, True, True, 'mostrou seu diferencial', 45),
	(372022, 2, True, True, 'colocou tudo em prática', 50),
	(372022, 3, True, True,'mostrou seu diferencial', 45),
    (372022, 4, True, True,'mostrou seu diferencial', 45),
    (372022, 5, True, True,'está quase lá', 45),
	(382022, 1, True, True, 'colocou tudo em prática', 32),
	(382022, 2, True, True, 'colocou tudo em prática', 90),
	(382022, 3, True, True,'mostrou seu diferencial', 90),
    (382022, 4, True, True,'colocou tudo em prática', 90),
    (382022, 5, True, True,'mostrou seu diferencial', 90),
	(392022, 1, True, True, 'mostrou seu diferencial', 20),
	(392022, 2, True, True, 'mostrou seu diferencial', 105),
	(392022, 3, True, True,'está quase lá',36),
    (392022, 4, True, True, 'mostrou seu diferencial', 105),
    (392022, 5, True, True, 'colocou tudo em prática', 105),
	(402022, 1, True, True, 'mostrou seu diferencial', 40),
	(402022, 2, True, True, 'está quase lá', 30),
	(402022, 3, True, False,'colocou tudo em prática', 90),
    (402022, 4, True, True, 'mostrou seu diferencial', 110),
    (402022, 5, True, True, 'está quase lá', 140);


-- PERGUNTA 1: Selecionar a quantidade total de estudantes cadastrados no banco;

select count (id_matricula) as "alunos cadastrados" 
from tb_matricula;

-- PERGUNTA 2: Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;

create view estudante_matricula as
select tb_matricula.id_aluno, tb_aluno.nome, tb_curso.nome as "curso"
from tb_matricula
inner join tb_aluno on tb_matricula.id_aluno = tb_aluno.id_aluno 
inner join tb_turma on tb_turma.id_turma = tb_matricula.id_turma 
inner join tb_curso on tb_turma.curso = tb_curso.id_curso 
order by tb_matricula.id_aluno;

select *
from estudante_matricula;

-- PERGUNTA 3: Selecionar quais pessoas facilitadoras atuam em mais de uma turma;

create view facilitadores_turma as 
select tb_facilitacao.nome, count(id_turma) as "turmas" from tb_facilitacao
inner join tb_turma on tb_facilitacao.id_facilitador = tb_turma.facilitacao_tech
or tb_facilitacao.id_facilitador = tb_turma.facilitacao_soft
group by tb_facilitacao.nome;


select * 
from facilitadores_turma
where turmas > 1;

-- PERGUNTA 4: Qual a quantidade de alunos que optaram pelo método de pagamento da PROVI;

create view alunos_ISA as 
select tb_matricula.id_aluno,tb_aluno.nome, tb_pagamento.forma_de_pagamento
from tb_matricula
inner join tb_aluno on tb_aluno.id_aluno = tb_matricula.id_aluno
inner join tb_pagamento on tb_matricula.id_pagamento = tb_pagamento.id_pagamento
where tb_pagamento.forma_de_pagamento = 'ISA/Provi';

select count(id_aluno) as "Quantidade de alunos que utilizam o método ISA/Provi" 
from alunos_ISA;


-- Pergunta 5: Quais alunos estão trabalhando e estão passíveis para o pagamento do financiamento PROVI;

create view alunos_empregados as
select tb_aluno.id_aluno,tb_aluno.nome, tb_alunos_empregados.salario, tb_pagamento.forma_de_pagamento
from tb_alunos_empregados
inner join tb_aluno
on tb_alunos_empregados.id_aluno = tb_aluno.id_aluno
inner join tb_matricula
on tb_aluno.id_aluno = tb_matricula.id_aluno
inner join tb_pagamento
on tb_pagamento.id_pagamento = tb_matricula.id_pagamento
where forma_de_pagamento like '%ISA/Provi%' and salario > 1500;
select * from alunos_empregados;


-- PERGUNTA 6: Selecionar quais estudantes ainda não estão empregados;

create view estudantes_desempregados as
select tba.id_aluno, tba.nome, tbae.vaga from tb_aluno tba
left join tb_alunos_empregados tbae on tba.id_aluno = tbae.id_aluno
where salario is Null order by id_aluno;

select * from estudantes_desempregados;

-- PERGUNTA 7: Quantos ToDo's 1 e 2 já foram enviados?
create view todos_enviados as
select count(tba.todo1) as ToDos from tb_atividades tba
where tba.todo1 = 'true'
union all
select count(tba.todo2) from tb_atividades tba
where tba.todo2 = 'true';

select * from todos_enviados;

-- Selecionar a quantidade de alunos em cada modalidade do projeto
create view modalidade as
select tb_atividades.projeto, count(tb_atividades.projeto) from tb_atividades
group by tb_atividades.projeto;

select * from modalidade;

