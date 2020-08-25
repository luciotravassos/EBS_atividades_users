/* Profile SYSTEM */
SELECT   a.application_id, a.user_profile_option_name, a.profile_option_name,
         a.profile_option_id, a.sql_validation,b.profile_option_value
    FROM apps.fnd_profile_options_vl a,
          applsys.fnd_profile_option_values b
   WHERE a.start_date_active <= SYSDATE
     /*AND NVL (a.end_date_active, SYSDATE) >= SYSDATE
     AND (   site_enabled_flag = 'Y'
          OR app_enabled_flag = 'Y'
          OR resp_enabled_flag = 'Y'
          OR user_enabled_flag = 'Y'
          OR server_enabled_flag = 'Y'
          OR org_enabled_flag = 'Y'
         )*/
         --and a.profile_option_name like upper('%servlet%ag%')
         and a.application_id = b.application_id
         and a.profile_option_id = b.profile_option_id
         and b.profile_option_value is null
ORDER BY user_profile_option_name

