/* BUSCA OS USUARIOS DO APPLICATION */
SELECT SUBSTR (user_name, 1, 30) user_name, description,a.last_logon_date
  FROM apps.fnd_user a
 WHERE user_name LIKE '%01469627%'


