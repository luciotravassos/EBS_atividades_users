select  s.sid, s.serial#, s.username, s.status,
to_char(logon_time,'dd-mon-yy hh:mi:ss') cnt
from  v$session s
where logon_time <
TO_DATE((TO_CHAR(SYSDATE,'mm-dd-yyyy')|| '00:00:00'),
'mm-dd-yyyy hh24:mi:ss')
order by s.status desc

