/* Script que identifica o processo no banco e no SO pelo SID*/
SELECT   SUBSTR (a.spid, 1, 10) "PID UNIX", SUBSTR (b.SID, 1, 5) SID,
         SUBSTR (b.serial#, 1, 5) ser#, SUBSTR (b.username, 1, 15) username,
         SUBSTR (TO_CHAR (b.logon_time, 'DD/MM/YYYY HH24:MI'),
                 1,
                 16
                ) data_hora,
         b.server, b.status, b.lockwait, SUBSTR (b.osuser, 1, 10) os_user,
         SUBSTR (b.machine, 1, 20) box, b.process "Processo", b.module,b.last_call_et,
         b.program program
    FROM v$session b, v$process a
   WHERE  b.status = 'INACTIVE'
     AND b.paddr = a.addr
     and b.last_call_et >100000
   ORDER BY SUBSTR (TO_CHAR (b.logon_time, 'DD/MM/YYYY HH24:MI'),
                 1,
                 16
                ),b.status, b.username asc

