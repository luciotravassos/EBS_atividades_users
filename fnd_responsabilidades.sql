/* Formatted on 2004/10/21 04:53 (Formatter Plus v4.7.0) */
SELECT   b.user_name, a.responsibility_name, a.application_id,
         a.responsibility_id
    FROM apps.fnd_responsibility_tl a, apps.fnd_user b
   WHERE a.responsibility_name LIKE '%SYSADM%'
ORDER BY b.user_name

