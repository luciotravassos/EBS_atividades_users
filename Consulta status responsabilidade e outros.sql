/*Marcos,

A seguir vers�es atualizadas das consultas peri�dicas de usu�rios ativos. Em caso de d�vidas, estou � disposi��o.



1) eCOMEX - Aplica��o*/

SELECT   b.cd_usuario "Matr�cula", b.nm_usuario "Nome", c.nm_usuario "Grupo",
         b.dias_troca_senha "Expira��o de senha (dias)",
         b.dt_inativacao "Data de Inativa��o"
    FROM ecomex.sen_atrib_usuarios a RIGHT OUTER JOIN ecomex.sen_usuarios b
         ON (a.usuario_id = b.ID)
         JOIN ecomex.sen_usuarios c ON (a.grupo_id = c.ID)
   WHERE b.dt_inativacao IS NULL OR b.dt_inativacao > SYSDATE
ORDER BY 2, 3


/*Objetivo: Relat�rio de usu�rios de aplica��o ECOMEX, com data de inativa��o indefinida ou futura (ou seja, usu�rios ativos), e rela��o dos respectivos grupos a que cada usu�rio pertence.


2) E-Business Suite - Aplica��o
*/
SELECT   b.user_name "Login", b.description "Descri��o",
         b.password_lifespan_days "Expira��o de senha (dias)",
         b.start_date "Data de Cria��o", b.end_date "Data de Expira��o",
         c.responsibility_name, a.start_date "Data de Concess�o",
         a.end_date "Data de Revoga��o"
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
     AND (b.end_date IS NULL OR b.end_date > SYSDATE) -- Restringe consulta apenas para usu�rios ativos.
ORDER BY 1, 5

/*Objetivo: Relat�rio de usu�rios de aplica��o EBS, com data de inativa��o indefinida ou futura (ou seja, usu�rios ativos), e rela��o das respectivas responsabilidades a que cada usu�rio pertence. 


3) Synchro - Aplica��o*/

SELECT   a.usu_codigo "Matr�cula", a.nome "Nome",
         a.dh_ultimo_login "�ltimo Login", b.gru_codigo "Grupo",
         c.descricao "Descri��o do Grupo"
    FROM syn_usuario a LEFT OUTER JOIN syn_membros_grupo b
         ON (a.usu_codigo = b.usu_codigo)
         LEFT OUTER JOIN syn_grupo c ON (b.gru_codigo = c.gru_codigo)
   WHERE a.ativo_flag = 'S'
ORDER BY 1, 2

/*Objetivo: Relat�rio de usu�rios de aplica��o SYNCHRO, com flag de ATIVO, e rela��o dos respectivos perfis (quando n�o h� nenhum, apenas o usu�rio � retornado).


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

