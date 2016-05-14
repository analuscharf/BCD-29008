#Teste.1 das tabelas do banco de dados.
use db1220018384;

desc aluno;
insert  into aluno(cpf,nome)
values
          ('1','Ana'),
	  ('2','Leonan'),
	  ('3','karoline'),
	  ('4','Beatriz'),
	  ('5','Murilo');
select * from aluno;
select * from aluno where cpf='1'; #Retorna as linhas, que possui esse valor. 
select nome from aluno where cpf='1'; #Retorna só o nome.


desc professor;
insert into professor(siape,nome)
values
	  ('1','Ederson'),
	  ('2','Volnei'),
	  ('3','Arliones'),
	  ('4','Bruno'),
	  ('5','Noronha');
select *  from professor where nome regexp 'E'; #Retorna todos os nomes com a letra 'e'. Não é sensitive case. Se o argumento  for [EA], retorna   quem possui 'e' ou 'a'
select *  from professor where nome like 'e%';  #Retorna  que começa com a letra 'e'. Se for '%e', retorrna quem termina com o 'e';E "%a%" retorna quem começa e termina com com o caracter.


desc  curso;

insert into curso(codigo,nome) 
values 
	  ('299','Engenharia de Telecomunicaçções'); # Inserir nome errado.

update curso set nome = 'Engenharia de Telecomunicações'  where codigo = '299'; #Arrumando o nome da disciplina.
update curso set codigo= '290'  where codigo = '299'; #Arrumando o nome da disciplina.

select * from curso;


desc disciplina;
insert into disciplina(codigo, fase, CH, CHminima, cursoCodigo,professorSiape)
	values ('BCD','8','54',NULL,'290','1');
select * from disciplina;

insert into disciplina(codigo, fase, CH, CHminima, cursoCodigo,professorSiape)
	values ('BCD2','8','54',NULL,'290','1');
select * from disciplina;


select siape from  professor where nome='Arliones'; 
#Procurando e adicionamos ao mesmo tempo.
insert into disciplina(codigo, fase, CH, CHminima, cursoCodigo,professorSiape)
	values ('STE','8','72',NULL,'290',(select siape from  professor where nome='Arliones')
   );
select * from disciplina;

#Procurando em quais disciplina que o professro fulano ministra.
select *
from disciplina
where professorSiape =(select siape from professor where nome ='Ederson')

select * from professor;
select siape from professor where nome ='Ederson';
insert into disciplina(codigo, fase, CH, CHminima, cursoCodigo,professorSiape)
	values ('PJI3','8','36',NULL,
           (select codigo from curso where nome ='Engenharia de Telecomunicações'),
		   (select siape from professor where  nome = 'Noronha')
);
select * from disciplina;


# Tarefa
# Realiza todo processo de matricula.

#Passo 1: update dos meus dados.
update aluno set nome = 'Ana Luiza Scharf' where cpf = '1';
update aluno set cpf = '0676617705' where cpf = '1';
select * from aluno order by  cpf desc;

#Passo2: adicinar os professor da 8 fase.

