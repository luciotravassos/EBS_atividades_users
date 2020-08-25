/* Com esse script é possivel ver alguns profiles e a data de alteração
buscando por data */
SELECT responsibility_key, profile_option_value, p.last_update_date
  FROM applsys.fnd_profile_option_values p, applsys.fnd_responsibility
 WHERE p.profile_option_value = 'Y' AND p.last_update_date > '01-Nov-2004'
order by responsibility_key
--   p.last_update_date desc

