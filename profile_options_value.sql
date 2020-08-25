select * from applsys.fnd_profile_option_values
where PROFILE_OPTION_VALUE like 'MCVRDI - Clonado em 23-11-2004'

update applsys.fnd_profile_option_values
set PROFILE_OPTION_VALUE ='MCVRDI - Clonado em 23-11-2004'
where PROFILE_OPTION_VALUE like '%Stage%'
