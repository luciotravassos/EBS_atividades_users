/* Profile SYSTEM */
SELECT   application_id, user_profile_option_name, profile_option_name,
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
         and profile_option_name like upper('%web%ag%')
ORDER BY user_profile_option_name

