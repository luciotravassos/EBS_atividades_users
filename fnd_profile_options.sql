/* Com esse script conseguimos ver como est�o setadas algumas profiles */
SELECT   *
    FROM applsys.fnd_profile_option_values
ORDER BY last_update_date DESC
--where PROFILE_OPTION_VALUE like

