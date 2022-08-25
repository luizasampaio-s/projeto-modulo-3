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