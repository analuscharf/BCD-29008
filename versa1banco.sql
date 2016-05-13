#use u1220018384;

#Remove todas as tabelas tem esse nome.
drop table if exists horario;
drop table if exists preRequisito;
drop table if exists disciplina;
drop table if exists professor;
drop table if exists curso;
drop table if exists aluno; 


#aluno(*cpf,nome)
create table aluno(
	cpf   bigint unsigned primary key,
    nome  varchar(50),
    senha varchar(50) 
);
desc aluno;

#professor(*siape,nome);
create table professor(
     siape  int unsigned primary key, 
     nome   varchar (50)
);
desc professor;

#curso(*codigo,nome);
create table curso(
    codigo  smallint unsigned  primary key,
    nome    varchar(50)
);
desc curso;

#Disciplina (*cursoCodigo, fase, carga horária, **grade, carga horária mínima, **professorSiape)
#cursoCodigo referência curso(código) 
#professorSiape referência professor(siape) 
create table disciplina(
    codigo         char(4) primary key,
    fase           tinyint unsigned,
	CH             smallint unsigned,
    CHminima       smallint unsigned,
    cursoCodigo    smallint unsigned,
    professorSiape int unsigned,  
    constraint fk_disciplina_cursoCodigo_curso_codigo       foreign key (cursoCodigo) references curso(codigo), 
    constraint fk_disciplina_professorSiape_professor_siape foreign key (professorSiape) references professor(siape) 
);
desc disciplina;

#Pré-requisito (***disciplina,***pré-requisito)
#disciplina referência disciplina(código)
#pré-requisito referência disciplina(código)
create table preRequisito (
	id 		     mediumint unsigned auto_increment primary key,
    disciplina   char(4),
    preRequisito char(4),
    constraint fk_preRequisito_disciplina_disciplina_codigo    foreign key (disciplina)   references disciplina(codigo), 
    constraint fk_preRequisito_preRequisito_disciplina_codigo  foreign key (preRequisito) references disciplina(codigo)
);


#Horário (*turno, *num_aula, *num_dia, *semanaAB, ***disciplina, semestre)
#Obs: não pode ter o chave estrangeira com nome repetido.
create table horario (
   id 					tinyint unsigned auto_increment primary key,
   numAula              tinyint unsigned,  
   numDia				tinyint unsigned, 
   semanaAB				tinyint unsigned,
   codigo				tinyint unsigned,
   codigoDisciplina		char(4),
   semestre             smallint unsigned
   #constraint fk_disc_codigo               foreign key (disciplina)   references disciplina(codigo) 
);
