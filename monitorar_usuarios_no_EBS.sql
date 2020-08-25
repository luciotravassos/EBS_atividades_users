/* Formatted on 2004/12/02 00:40 (Formatter Plus v4.7.0) */
SELECT   user_name, responsibility_name, user_form_name, login_name, TIME,
         pid, terminal_id, user_id, resp_appl_id, responsibility_id, form_id,
         form_appl_id
    FROM apps.fnd_signon_audit_view
   WHERE (terminal_id = '?')
   AND USER_NAME = 'CARGAMIGRACAO'
ORDER BY   TO_NUMBER (SUBSTR (TIME, 1, INSTR (TIME, ':') - 1)) * 60
         + TO_NUMBER (SUBSTR (TIME, INSTR (TIME, ':') + 1))

