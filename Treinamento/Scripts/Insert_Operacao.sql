insert into operacao (codoperacao,descricao) values ( 'MENU-CAD','Visualização Menu Cadastros');
insert into operacao (codoperacao,descricao) values ( 'MENU-UTIL','Visualização Menu Utilitários');
insert into operacao (codoperacao,descricao) values ( 'MENU-CONS','Visualização Menu Utilitários');
insert into operacao (codoperacao,descricao) values ( 'MENU_IMP','Visualização Menu Importar');
insert into operacao (codoperacao,descricao) values ( 'PER-OPE','Cadastro de Perfil de Usuários');
insert into operacao (codoperacao,descricao) values ( 'SIS_OPERACAO','Cadastro de Operações do Sistema (Interno do Sistema)');
insert into operacao (codoperacao,descricao) values ( 'CAD_USUARIO','Cadastro de Usuario');
insert into operacao (codoperacao,descricao) values ( 'SIS_PERFIL_OPER','Sistema Perfil Operacao');
insert into operacao (codoperacao,descricao) values ( 'IMPORTAR_PAR','Importar Participante');
insert into operacao (codoperacao,descricao) values ( 'CAD_CURSO','Cadastro de Cursos');
insert into operacao (codoperacao,descricao) values ( 'CAD_TREINAMENTO','Cadastro de Treinamento');


select * from perfil

select * from operacao


insert into perfil (CODPERFIL, DESCRICAO) VALUES (1, 'PERFIL MASTER')
insert into perfil (CODPERFIL, DESCRICAO) VALUES (2, 'CONSULTA E RELATORIOS')


select * from perfil_operacao

insert into perfil_operacao (codperfil, codoperacao, manut) values (1,'MENU-CAD', 'T');
insert into perfil_operacao (codperfil, codoperacao, manut) values (1,'MENU_IMP', 'T');
insert into perfil_operacao (codperfil, codoperacao, manut) values (1,'IMPORTAR_PAR', 'T');
insert into perfil_operacao (codperfil, codoperacao, manut) values (1,'CAD_TREINAMENTO', 'T'); 
insert into perfil_operacao (codperfil, codoperacao, manut) values (1,'CAD_CURSO', 'T'); 
insert into perfil_operacao (codperfil, codoperacao, manut) values (1,'MENU-UTIL', 'T'); 


select * from usuario

update usuario
set codperfil = 1