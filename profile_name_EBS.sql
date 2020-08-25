/* Formatted on 2004/10/27 00:41 (Formatter Plus v4.7.0) */
SELECT   ROWID, application_id, user_profile_option_name, profile_option_name,
         profile_option_id, sql_validation
    FROM apps.fnd_profile_options_vl
   WHERE start_date_active <= SYSDATE
     AND NVL (end_date_active, SYSDATE) >= SYSDATE
     AND (   site_enabled_flag = 'Y'
          OR app_enabled_flag = 'Y'
          OR resp_enabled_flag = 'Y'
          OR user_enabled_flag = 'Y'
          OR server_enabled_flag = 'Y'
          OR org_enabled_flag = 'Y'
         )
     AND (    UPPER (user_profile_option_name) like 'RCV%'
          
         )
ORDER BY user_profile_option_name

