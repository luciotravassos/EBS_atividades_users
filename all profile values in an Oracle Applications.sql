/* Description: This script will generate a list of all profile values in an Oracle Applications 11i environment.
                       It lists the profiles by Level (Site,Application,Responsibility,User) 
                       and provides the ability to search on any of the listed fields.
   Prepared/
   Authored By:        Brian T Smith
                       briantsmith@cox.net

   Usage Information:  SQLPLUS apps/pswd
                       @profiles.sql
*/

/*set lines 180
column "Non-Site Description" format a30
column "User Name" format a15
column "User Profile Option Name" format a30
column "Profile Option Name"  format a30
column "Value" format a20*/


SELECT   DECODE (level_id,
                 10001, 'Site',
                 10002, 'Application',
                 10003, 'Responsibility',
                 10004, 'USER'
                ) "Profile Level",
         DECODE (level_id,
                 10001, NULL,
                 10002, fa.application_name,
                 10003, fr.responsibility_name,
                 10004, fu.user_name
                ) "Non-Site Description",
         fu.user_name "User Name",
         fpov.user_profile_option_name "User Profile Option Name",
         fpov.profile_option_name "Profile Option Name",
         fpova.profile_option_value "Value"
    FROM apps.fnd_profile_options_vl fpov,
         apps.fnd_profile_option_values fpova,
         apps.fnd_application_tl fa -- table inclusion when looking at application joins
                                    ,
         apps.fnd_responsibility_tl fr -- table inclusion when looking at responsibility joins
                                       ,
         apps.fnd_user fu -- table inclusion when looking at user joins
                          ,
         apps.fnd_user fu2
   WHERE fpov.application_id = fpova.application_id
     AND fpov.profile_option_id = fpova.profile_option_id
     AND start_date_active <= SYSDATE
     AND NVL (end_date_active, SYSDATE) >= SYSDATE
     AND (   site_enabled_flag = 'Y'
          OR app_enabled_flag = 'Y'
          OR resp_enabled_flag = 'Y'
          OR user_enabled_flag = 'Y'
         )
     AND fpova.level_value = fa.application_id(+) -- join for application values
     AND fpova.level_value = fr.responsibility_id(+) -- join for responsibility values
     AND fpova.level_value = fu.user_id(+) -- join for user values
     AND fpova.last_updated_by =
                                fu2.user_id(+)
                                             -- join for update by user values
--AND fpova.profile_option_value LIKE :1
--AND fpov.user_profile_option_name LIKE :1
ORDER BY "User Profile Option Name", "Profile Level";

