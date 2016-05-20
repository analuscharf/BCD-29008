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

# Prérequisito 2ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('CAL2','CAL1'),
       ('CEI1','CAL1'),
       ('CEI1','ELI'),
       ('FSC2','FSC1'),
       ('FSC2','CAL1'),
       ('ALG','GAL'),
       ('PRG1','LOG');

# Prérequisito 3ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('QMC2','QMC1'),
       ('CAL3','CAL2'),
       ('CAL3','GAL'),
       ('CIE2','CIE1'),
       ('CIE2','CAL2'),
       ('ELA1','CEI1'),
       ('ELA1','CAL1'),
       ('CIL','LOG'),
       ('PRG1','PRG2');


# Prérequisito 4ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('MEC','FSC1'),
       ('MEC','CAL2'),
       ('CAL4','CAL2'),
       ('RED1','CIL'),
       ('ELA2','CAL2'),
       ('ELA2','ELA1'),
       ('MIC','CIL'),
       ('POO','PRG2');

# Prérequisito 5ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('EST','CAL1'),
       ('RED2','RED1'),
       ('FSC3','FSC1'),
       ('FSC3','CAL3'),
       ('SOP','PRG2'),
       ('SOP','MIC'),
       ('SIS1','CAL4'),
       ('SIS1','ALG'),
       ('SIS1','CIE2');


# Prérequisito 6ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('FEN','FSC2'),
       ('PRE','EST'),
       ('PRE','CAL4'),
       ('ANT','FSC3'),
       ('STD','RED1'),
       ('STD','SOP'),
       ('STD','POO'),
       ('SIS2','SIS1'),
       ('PJI2','PJI1'),
       ('PJI2','RED2'),
       ('PJI2','MIC');


# Prérequisito 7ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('RTX','RED1'),
       ('RTX','SIS2'),
       ('MTG','SIS2'),
       ('MTG','FSC3'),
       ('DLP2','DLP1'),
       ('DLP2','MIC'),
       ('PSD','SIS2'),
       ('PSD','DLP1'),
       ('COM1','SIS2'),
       ('COM1','PRE');

# Prérequisito 8ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('CSF','ANT'),
       ('CSF','PRE'),
       ('BCD','POO'),
       ('STE','SOP'),
       ('PTC','RED2'),
       ('PTC','PRG2'),
       ('COM1','COM2'),
       ('PJI3','PJI2'),
       ('PJI3','PSD'),
       ('PJI3','COM1');



# Prérequisito 9ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('SMU','RED2'),
       ('ADS','PTC'),
       ('ADS','PRE'),
       ('STC','COM1'),
       ('STC','RTX'),
       ('CRF','COM1'),
       ('CRF','DLP1'),
       ('CRF','ANT');

# Prérequisito 10ª fase.
insert into preRequisito(disciplina, preRequisito)
values ('TCC2','TCC1'),
       ('ADS','PJI3');



# Convenção do horário.
# Turno    0-> Matutino    | 1->Vespertino    | 2->Noturno.
# numAula  0-> 7:30 - 9:20 | 1-> 9:40 - 11:30 | 2-> 13:30 - 16:20 | 3-> 13:30 - 16:20 | 4-> 18:30 - 20:20 | 5-> 20:40 - 22:30.
# numDia   0-> Domingo     | 1->Segunda       | 2->Terça          | 3-> Quarta        | 4-> Quinta        | 5-> Sexta          | 6-> Sábado.
# semanaAB 0-> A/B         | 1-> A            | 2->B

# 1ª fase
# Obs: Falta quinta- ferira.
insert into horario(turno, numAula, numDia, semanaAB, codigoDisciplina, semestre)
values ('0','0','1','0','GAL','20161'),
       ('0','1','1','0','CAL1','20161'),

       ('0','0','2','0','ELI','20161'),
       ('0','1','2','1','GAL','20161'),
       ('0','1','2','2','FIS1','20161'),		
       ('1','2','2','0','DES','20161'),
       ('1','3','2','0','DES','20161'),

       ('0','0','3','0','CAL1','20161'),
       ('0','1','3','0','PJI1','20161'),
       
       ('0','0','5','0','FIS1','20161'),
       ('0','1','5','0','LOG','20161');


# Convenção do horário.
# Turno    0-> Matutino    | 1->Vespertino    | 2->Noturno.
# numAula  0-> 7:30 - 9:20 | 1-> 9:40 - 11:30 | 2-> 13:30 - 16:20 | 3-> 16:40 - 15:30 | 4-> 18:30 - 20:20 | 5-> 20:40 - 22:30.
# numDia   0-> Domingo     | 1->Segunda       | 2->Terça          | 3-> Quarta        | 4-> Quinta        | 5-> Sexta          | 6-> Sábado.
# semanaAB 0-> A/B         | 1-> A            | 2->B

# 1ª fase- Parte 2
# Obs: Falta quinta-ferira e  terça-feira de manhã.
insert into horario(turno, numAula, numDia, semanaAB, codigoDisciplina, semestre)
values ('1','2','1','0','CAL1','20161'),
       ('1','3','1','0','FIS1','20161'),

       ('0','1','2','2','ELI','20161'),
       ('1','2','2','0','CAL1','20161'),

       ('1','3','3','0','GAL','20161');



# Convenção do horário.
# Turno    0-> Matutino    | 1->Vespertino    | 2->Noturno.
# numAula  0-> 7:30 - 9:20 | 1-> 9:40 - 11:30 | 2-> 13:30 - 16:20 | 3-> 16:40 - 15:30 | 4-> 18:30 - 20:20 | 5-> 20:40 - 22:30.
# numDia   0-> Domingo     | 1->Segunda       | 2->Terça          | 3-> Quarta        | 4-> Quinta        | 5-> Sexta          | 6-> Sábado.
# semanaAB 0-> A/B         | 1-> A            | 2->B

# 2ª fase
# Obs: Falta quarta-ferira e  dúvida de sexta-feira de manhã.
insert into horario(turno, numAula, numDia, semanaAB, codigoDisciplina, semestre)
values ('1','2','1','0','CAL2','20161'),
       ('1','3','1','0','FIS2','20161'),

       ('1','2','2','0','CIE1','20161'),
       ('1','3','2','0','FIS2','20161'),

       ('1','2','4','1','ALG','20161'),
       ('1','2','4','2','FIS2','20161'),
       ('1','3','4','0','FIS2','20161'),

       ('0','0','5','0','QMC1','20161'),
       ('0','1','5','0','QMC1','20161'),
       ('1','2','5','0','CAL2','20161'),
       ('1','3','5','0','ALG','20161');





# Convenção do horário.
# Turno    0-> Matutino    | 1->Vespertino    | 2->Noturno.
# numAula  0-> 7:30 - 9:20 | 1-> 9:40 - 11:30 | 2-> 13:30 - 16:20 | 3-> 16:40 - 15:30 | 4-> 18:30 - 20:20 | 5-> 20:40 - 22:30.
# numDia   0-> Domingo     | 1->Segunda       | 2->Terça          | 3-> Quarta        | 4-> Quinta        | 5-> Sexta          | 6-> Sábado.
# semanaAB 0-> A/B         | 1-> A            | 2->B

# 3ª fase
# Obs: Falta quarta-ferira e  dúvida de sexta-feira de manhã.
insert into horario(turno, numAula, numDia, semanaAB, codigoDisciplina, semestre)
values ('0','0','1','0','ELA1','20161'),
       ('0','1','1','0','CAL3','20161'),

       ('0','0','2','0','CIL','20161'),
       ('0','1','2','0','PRG2','20161'),

       ('0','0','3','1','CIL','20161'),
       ('0','1','3','2','ELA1','20161'),
       ('1','2','3','0','QMC2','20161'),

       ('0','0','4','0','CIE2','20161'),
       ('1','1','4','0','CAL3','20161'),
       
       ('0','0','5','0','CIE2','20161'),
       ('1','1','5','0','PRG2','20161');

# 4ª fase
# Obs: Falta quarta-ferira e  dúvida de sexta-feira de manhã.
insert into horario(turno, numAula, numDia, semanaAB, codigoDisciplina, semestre)
values ('0','2','1','0','MIC','20161'),
       ('0','3','1','0','CAL3','20161'),

       ('0','0','2','0','CIL','20161'),
       ('0','1','2','0','PRG2','20161'),

       ('0','0','3','1','CIL','20161'),
       ('0','1','3','2','ELA1','20161'),
       ('1','2','3','0','QMC2','20161'),

       ('0','0','4','0','CIE2','20161'),
       ('1','1','4','0','CAL3','20161'),
       
       ('0','0','5','0','CIE2','20161'),
       ('1','1','5','0','PRG2','20161');
