/*Marcos,

A seguir versões atualizadas das consultas periódicas de usuários ativos. Em caso de dúvidas, estou à disposição.



1) eCOMEX - Aplicação*/

SELECT   b.cd_usuario "Matrícula", b.nm_usuario "Nome", c.nm_usuario "Grupo",
         b.dias_troca_senha "Expiração de senha (dias)",
         b.dt_inativacao "Data de Inativação"
    FROM ecomex.sen_atrib_usuarios a RIGHT OUTER JOIN ecomex.sen_usuarios b
         ON (a.usuario_id = b.ID)
         JOIN ecomex.sen_usuarios c ON (a.grupo_id = c.ID)
   WHERE b.dt_inativacao IS NULL OR b.dt_inativacao > SYSDATE
ORDER BY 2, 3


/*Objetivo: Relatório de usuários de aplicação ECOMEX, com data de inativação indefinida ou futura (ou seja, usuários ativos), e relação dos respectivos grupos a que cada usuário pertence.


2) E-Business Suite - Aplicação
*/
SELECT   b.user_name "Login", b.description "Descrição",
         b.password_lifespan_days "Expiração de senha (dias)",
         b.start_date "Data de Criação", b.end_date "Data de Expiração",
         c.responsibility_name, a.start_date "Data de Concessão",
         a.end_date "Data de Revogação"
    FROM applsys.fnd_user_resp_groups a,
         applsys.fnd_user b,
         applsys.fnd_responsibility_tl c,
         applsys.fnd_application_tl d,
         applsys.fnd_security_groups_tl e
   WHERE a.user_id = b.user_id
     AND a.responsibility_id = c.responsibility_id
     AND a.responsibility_application_id = d.application_id
     AND a.security_group_id = e.security_group_id
     AND a.end_date IS NULL
     AND c.LANGUAGE = 'PTB'
     AND e.LANGUAGE = 'PTB'
     AND d.LANGUAGE = 'PTB'
     AND (b.end_date IS NULL OR b.end_date > SYSDATE) -- Restringe consulta apenas para usuários ativos.
ORDER BY 1, 5

/*Objetivo: Relatório de usuários de aplicação EBS, com data de inativação indefinida ou futura (ou seja, usuários ativos), e relação das respectivas responsabilidades a que cada usuário pertence. 


3) Synchro - Aplicação*/

SELECT   a.usu_codigo "Matrícula", a.nome "Nome",
         a.dh_ultimo_login "Último Login", b.gru_codigo "Grupo",
         c.descricao "Descrição do Grupo"
    FROM syn_usuario a LEFT OUTER JOIN syn_membros_grupo b
         ON (a.usu_codigo = b.usu_codigo)
         LEFT OUTER JOIN syn_grupo c ON (b.gru_codigo = c.gru_codigo)
   WHERE a.ativo_flag = 'S'
ORDER BY 1, 2

/*Objetivo: Relatório de usuários de aplicação SYNCHRO, com flag de ATIVO, e relação dos respectivos perfis (quando não há nenhum, apenas o usuário é retornado).


4) E-Business Suite, Synchro e eComex - Banco de dados
*/
SELECT   a.username "Usuario", a.created "Data de criacao",
         a.PROFILE "Perfil de seguranca", b.granted_role "Role"
    FROM dba_users a, dba_role_privs b
   WHERE account_status = 'OPEN' AND a.username = b.grantee
ORDER BY username


/*
_________________________________________
Adriano Master Penedo
IBM Global Technology Services - Strategic Outsourcing
Oracle Applications DBA
Oracle Certified Professional
Microsoft Certified Database Administrator 
+55 91 3754 6285 / +55 91 8111 5871 
ampenedo@br.ibm.com*/

