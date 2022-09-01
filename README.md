## <center>Projeto de Conclusão do Módulo 3 - Curso Data Analytics</center>

<img src="https://www.resilia.com.br/wp-content/uploads/2021/08/logo.png" width="500" height="150" />

## 🧭 OBJETIVO

Para o projeto final do Módulo 3 da formação em Data Analytics da [Resilia Educação](https://www.resilia.com.br), criamos um projeto de construção de um banco de dados para gerenciar a estrutura de ensino da empresa.

### Detalhes do projeto

➔ A partir desta apresentação do objetivo, a equipe deveria:
◆ Gerar uma representação das entidades e seus respectivos atributos;
◆ Criar a modelagem do banco de dados;
◆ Criar os scripts SQL para criação das tabelas com seus respectivos atributos e com a base de dados criadas;
◆ Inserir alguns dados, executar algumas consultas para gerar informações estratégicas para a área de ensino da Resilia.

➔ Após a criação do banco de dados, a equipe deveria inserir dados para teste do banco de dados. Vocês deverão executar as consultas abaixo e apresentar seus resultados:
◆ Selecionar a quantidade total de estudantes cadastrados no banco;
◆ Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;
◆ Selecionar quais pessoas facilitadoras atuam em mais de uma turma.
➔ Além disso, a equipe deveria pensar em mais três perguntas que deverão ser respondidas através de scripts SQL.

### Requisitos:

● Representação das entidades e os respectivos atributos de cada uma delas;
● Modelagem completa do banco de dados com entidades, atributos e relacionamentos;
● Scripts SQL de criação das tabelas com seus atributos e chaves;
● Resultado de alguns selects que deverão ser executados após a criação do banco de dados.

Para escrever o código utilizamos a [documentação do PostgreSQL](https://pgdocptbr.sourceforge.io/pg80/index.html)

## FERRAMENTAS UTILIZADAS

<img src="https://git-scm.com/images/logos/1color-orange-lightbg@2x.png" width="90" height="50" /> <img src="https://cdn.icon-icons.com/icons2/2368/PNG/512/github_logo_icon_143772.png" width="70" height="50" /> <img src="https://global-uploads.webflow.com/5e157548d6f7910beea4e2d6/62a07b53139aec4c1fd07771_discord-logo.png" width="100" height="50" />


<img src="https://asset.brandfetch.io/idAnDTFapY/idTN_OiBI_.png" width="90" height="50" /><img src="https://upload.wikimedia.org/wikipedia/commons/thumb/2/29/Postgresql_elephant.svg/150px-Postgresql_elephant.svg.png" width="90" height="50" /><img src="https://sousecretaria.com.br/wp-content/uploads/2021/02/logo-trello-a-645x645.jpg" width="90" height="50" />


## 💻FUNCIONAMENTO

Ao iniciar as consultas no banco de dados, é apresentado os resultados das consultas das seguintes perguntas: 

1. Selecionar a quantidade total de estudantes cadastrados no banco;

```python
selecionando a quantidade de estudantes cadastrados no banco.

select count(id_matricula) as "alunos cadastrados" 
from tb_matricula;
```

2. Selecionar todos os estudantes com os respectivos cursos que eles estão cadastrados;

```python
Foram criadas views para armazenar algumas consultas que são utilizadas com frequência no banco de dados

create view estudante_matricula as
select tb_matricula.id_aluno, tb_aluno.nome, tb_curso.nome as "curso"
from tb_matricula
inner join tb_aluno on tb_matricula.id_aluno = tb_aluno.id_aluno 
inner join tb_turma on tb_turma.id_turma = tb_matricula.id_turma 
inner join tb_curso on tb_turma.curso = tb_curso.id_curso 
order by tb_matricula.id_aluno;

Abaixo, a realização da consulta que retorna o nome e o curso dos estudantes da Resilia

select * from estudante_matricula;
```

3. Selecionar quais pessoas facilitadoras atuam em mais de uma turma.

```python
Criação da view com nome facilitadores_turma

create view facilitadores_turma as 
select tb_facilitacao.nome, count(id_turma) as "turmas" from tb_facilitacao
inner join tb_turma on tb_facilitacao.id_facilitador = tb_turma.facilitacao_tech
or tb_facilitacao.id_facilitador = tb_turma.facilitacao_soft
group by tb_facilitacao.nome;

Abaixo, realização da consulta que retorna o nome dos facilitadores que lecionam em mais de uma turma.

select * 
from facilitadores_turma
where turmas > 1;

```


4. Qual a quantidade de alunos que optaram pelo método de pagamento da PROVI?

```python
Criação de uma view com nome alunos_ISA

create view alunos_ISA as 
select tb_matricula.id_aluno,tb_aluno.nome, tb_pagamento.forma_de_pagamento
from tb_matricula
inner join tb_aluno on tb_aluno.id_aluno = tb_matricula.id_aluno
inner join tb_pagamento on tb_matricula.id_pagamento = tb_pagamento.id_pagamento
where tb_pagamento.forma_de_pagamento = 'ISA/Provi';

Abaixo, realização da consulta que retorna a quantidade de alunos que optaram pelo método de pagamento PROVI

select count(id_aluno) as "quantidade de alunos que utilizam o método ISA/Provi" 
from alunos_ISA;
```

5. Quais alunos estão trabalhando e estão passíveis para o pagamento do financiamento PROVI?

```python
Criação de view com nome alunos_empregados

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

Abaixo, realização da consulta que retorna o nome dos alunos que estão empregados e aptos a pagarem o financiamento via PROVI. 

select * from alunos_empregados;

Nota: os alunos empregados nessa condição auferem uma renda salarial superior a R$ 1.500,00
```

6. Quais alunos concluíram o curso da Resilia mas ainda não estão empregados?

```python
Criação de view com nome aluno_desempregado

create view aluno_desempregado as
select tb_aluno.id_aluno, nome, vaga
from tb_aluno
left join tb_alunos_empregados on tb_aluno.id_aluno = tb_alunos_empregados.id_aluno
where salario is Null
order by tb_aluno.id_aluno;

Abaixo, realização da consulta que retorna o nome dos alunos que ainda estão sem emprego após a realização do curso. 

select id_aluno, nome as "alunos desempregados"
from aluno_desempregado;
```

7. Quantos ToDo's 1 e 2 já foram enviados?

```python
Criação de viem com nome todos_enviados

create view todos_enviados as
select count(tba.todo1) as ToDos from tb_atividades tba
where tba.todo1 = true
union all
select count(tba.todo2) from tb_atividades tba
where tba.todo2 = true;

Abaixo, realização da consulta que retorna todos os To Do`s que foram enviados pelos alunos

select * from todos_enviados;
```

8. Selecionar a quantidade de alunos em cada modalidade do projeto;

```python
Criação de viem com nome modalidade

create view modalidade as
select tb_atividades.projeto, count(tb_atividades.projeto) from tb_atividades
group by tb_atividades.projeto having tb_atividades.projeto is not null;


Abaixo, realização da consulta que retorna a quantidade de alunos em cada modalidade do projeto.

select * from modalidade;
```

9. Selecionar os alunos, seus pontos totais no codewars e se ele está com a nota em dia ou não;

```python
Selecionamos os atributos matricula da tabela atividades e a soma de todos os codewars da tabela aluno. Usamos a cláusula CASE.
Se a somatória da pontuação do code wars for superior ou igual a 422 pontos, aparece a mensagem de que o aluno está 'Em dia com o codewars!'.
Caso contrário, aparece a mensagem de que o aluno 'Precisa de mais pontos no codewars.'

Em seguida, na linha 196 inicia-se o script SQL das tabelas envolvidas para que a consulta seja realizada. Na linha 203 é utilizado a cláusula group by

select tb_atividades.id_matricula, tb_aluno.nome, sum(codewars),    
    case
        when sum(codewars) >= 422 then 'Em dia com o codewars!'
        else 'Precisa de mais pontos no codewars.'
    end
    from tb_atividades
    inner join (
        select id_matricula, count(modulo) from tb_atividades
        group by id_matricula having count(modulo) = 5) as Alunos_que_concluiram
        on tb_atividades.id_matricula = Alunos_que_concluiram.id_matricula
    inner join tb_matricula on tb_matricula.id_matricula = tb_atividades.id_matricula
    inner join tb_aluno on tb_matricula.id_aluno = tb_aluno.id_aluno
    group by tb_aluno.nome, tb_atividades.id_matricula having sum(codewars) is not null
    order by sum(codewars);


Abaixo, realização da consulta que retorna a quantidade de pontos dos alunos da Resilia.

select * from pontos_codewars;
```

Para visualizar os dados das consultas foi criado um dashboard com Power BI em que é possível analisar graficamente das consultas e os insights que foram gerados pelo banco de dados:

![Screenshot_3](https://user-images.githubusercontent.com/75100979/187985465-c06fd341-187e-4677-ac32-e8be8eb396a0.png)


## 💡 COMO EXECUTAR O PROJETO?

**1º passo: o usuário deverá fazer o clone do repositório:**

- No GitHub navegue até a página inicial do repositório;
- Copie a URL: https://github.com/luizasampaio-s/projeto-modulo-3.git
- Abra o seu Git Bash;
- Selecione o local onde deseja ter o repositório clonado e digite:

```shell
git clone https://github.com/luizasampaio-s/projeto-modulo-3.git
```

- Pressione enter para criar o seu clone local.

- Em caso de dúvidas, por favor acesse a documentação:

```shell
https://docs.github.com/pt/repositories/creating-and-managing-repositories/cloning-a-repository
```

**2º passo: Fazer download do Postgresql e pgAdmin (no sistema Windows):**

- Baixe o Postgresql através do seguinte link:

https://www.postgresql.org/ftp/pgadmin/pgadmin4/v6.12/windows/

- Baixe o pgAdmin através do seguinte link:

https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

- Faça a instalação do Postgresql e pgAdmin no seu computador

**3º passo: conectar pgAdmin (no sistema Windows):**

- Digite o seguinte comando no menu Iniciar do Windows para abrir o Shell SQL:

```shell
psql
```

- Após abrir o shell SQL, informe o Server, a Database, o Port, o Username, e o Password criado quando instalou o Postgresql.

```shell
Server [localhost]:
Database [postgres]:
Port [nº da porta selecionada]:
Username [postgres]:
Password for user postgres: escreva a senha criada
```

**3º passo: Criar um novo usuário:**

- Para verificar quais base de dados já possuem, ainda no shell SQL digite o seguinte comando:

```shell
\l
```

- Para criar um novo user digite:

```shell
create user nomedouser with encrypted password 'senha';
```

- Para verificar se o user foi criado, digite:

```shell
/du
```

**4º passo: Criar uma nova base de dados:**

- Execute o comando no terminal:

```shell
create database projeto3;
```

- Para verificar se o database foi criado, digite:

```shell
/l
```

**5º Dar permissão de administrador para o novo User**

- Digite o comando:

```shell
grant all on database projeto3 to nomedouser;
```

**6º conectar pgAdmin ao Postegresql**

- Abra o programa pgAdmin.

- Digite a senha master para reconectar com o servidor da base de dados, nesse caso o Postgresql.

- Após, selecione o Dashboard no canto superior

- Clique em Add New Server, no qual irá abrir uma nova janela.

- Preencha o campo Name na aba General. Preencha o campo Hostname/address com localhost, Maintenance database com projeto3, Username com resilia, digite o password do user na aba Connection. Por fim, clique em Save.

- Clique nas setas no canto esquerdo para abrir as instâncias, clique na database projeto3 e, por fim clique em Query Tools, um ícone de vários discos empilhados com uma seta, no canto superior direito.

- Pronto, já pode ser possível criar os comandos de consultas.

## 🤝 DESENVOLVEDORES

![Apresentação de Negócios Plano de Projeto Corporativo Geométrico Amarelo e Branco](https://user-images.githubusercontent.com/75100979/187587320-f03200c7-1d46-4fa1-9e6a-f08d35a964a7.png)

###### Diego Ferreira - Colaborador II

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https:https://www.linkedin.com/in/joao-victor-juliao/)](https://www.linkedin.com/in/diego-sousa-ferreira/)

###### João Santos - Gestor de Gente e engajamento

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https:https://www.linkedin.com/in/joao-victor-juliao/)](https://www.linkedin.com/in/joao-victor-juliao/)

###### Karoline Silva - Colaboradora

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https:https://www.linkedin.com/in/kjcsilva/)](https://www.linkedin.com/in/kjcsilva/)

###### Lucas Canella - Co-facilitador

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https:https://www.linkedin.com/in/lucascanella-dados/)](https://www.linkedin.com/in/lucascanella-dados/)

###### Luiza Sampaio - Gestora do Conhecimento

[![Linkedin Badge](https://img.shields.io/badge/-LinkedIn-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https:https://www.linkedin.com/in/luizasampaiods/)](https://www.linkedin.com/in/luizasampaiods/)

## Resultados do projeto:

trabalhando em equipe conseguimos desenvolver as soft skills e organizar de forma eficiente toda estruturação do projeto:

| Resultados | GIF |      
| ------ | ------ |
| Construção de trabalho juntos: a união faz a força.| <img src="https://media.giphy.com/media/5pPwx2VY4Uf6eqPF8N/giphy.gif" width="500" height="250" /> |
| A humildade é sinal de sabedoria. Não se desesperar diante da dificuldade também é uma grande virtude. | <img src="https://media.giphy.com/media/26u4ohUWw4Lwozxm0/giphy.gif" width="500" height="250" /> |
| As discussões e conflitos fazem parte do processo de aprendizagem. Refletir sobre nossos erros e buscar evoluir como ser humano demonstra empatia e maturidade.| <img src="https://media.giphy.com/media/YSBt5A3MB45EfyH00t/giphy.gif" width="500" height="250" /> |
|A dedicação resulta em satisfação pessoal e coletiva. Não desistir é importante para o processo de aprendizagem.| <img src="https://media.giphy.com/media/11JTxkrmq4bGE0/giphy.gif" width="500" height="250" /> |
|Aprecie e valorize as pequenas vitórias, pois elas não dão gás para continuar na trilha de nossos sonhos e objetivos |<img src="https://media.giphy.com/media/lMameLIF8voLu8HxWV/giphy.gif" width="500" height="250" />|
