/* Formatted on 2005/02/23 21:13 (Formatter Plus v4.7.0) */
/* Script que busca usuario do Oracle Applications */
SELECT   user_name, description, created_by, creation_date, last_update_login,email_address
    FROM apps.fnd_user
   WHERE user_name NOT IN
            ('ANONYMOUS',
             'AUTOINSTALL',
             'INITIAL SETUP',
             'FEEDER SYSTEM',
             'CONCURRENT MANAGER',
             'STANDALONE BATCH PROCESS'
            )
--AND DESCRIPTION LIKE upper('%25%')
and user_name like '33%'
and to_char(creation_date, 'YYYY')='2008'
ORDER BY user_name

