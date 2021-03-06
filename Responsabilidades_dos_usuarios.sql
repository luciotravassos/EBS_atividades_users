SELECT   b.user_id "USERID", b.user_name "USERNAME",
         b.description "DESCRI��O", f.full_name "NOME",
         a.start_date "DATA DE CRIA��O", a.end_date "DATA DE EXPIRA��O",
         c.responsibility_name, g.start_date "DATA DE CONCESS�O",
         g.end_date "DATA DE REVOGA��O", d.application_name "APLICA��O"
    FROM fnd_user_resp_groups a,
         applsys.fnd_user b,
         fnd_responsibility_tl c,
         fnd_application_tl d,
         fnd_security_groups_tl e,
         per_people_f f,
         fnd_responsibility g
   WHERE a.user_id = b.user_id
     AND a.responsibility_id = c.responsibility_id
     AND a.responsibility_application_id = d.application_id
     AND a.security_group_id = e.security_group_id
     --AND g.responsibility_id = c.responsibilit
     AND g.responsibility_id = c.responsibility_id
     AND (a.end_date IS NULL OR a.end_date > SYSDATE)
     AND (g.end_date IS NULL OR g.end_date > SYSDATE)
     AND c.LANGUAGE = 'PTB'
     AND e.LANGUAGE = 'PTB'
     AND d.LANGUAGE = 'PTB'
     AND b.employee_id = f.person_id(+)
     AND b.user_name ='EXE25083'
     --AND c.responsibility_name = 'ALBRAS PO GESTOR DE COMPRAS - MATERIAIS'
ORDER BY b.user_id, c.responsibility_name
