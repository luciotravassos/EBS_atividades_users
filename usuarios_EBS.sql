/* Script que busca usuario do Oracle Applications */
SELECT  * --user_name, description, created_by, creation_date, last_update_login
    FROM apps.fnd_user
   WHERE user_name NOT IN
            ('ANONYMOUS',
             'AUTOINSTALL',
             'INITIAL SETUP',
             'FEEDER SYSTEM',
             'CONCURRENT MANAGER',
             'STANDALONE BATCH PROCESS'
            )
--AND DESCRIPTION LIKE '%BELTR%'
and user_name like upper('%25554987%')
--and last_update_login = 'guaal'
--and description like upper('%guaal%')
ORDER BY user_name

