select a.username,a.DEFAULT_TABLESPACE,to_char(CREATED,'dd/mm/yyyy" "hh24:mm:ss') Created,
b.PRIVILEGE
from dba_users a,
dba_sys_privs b
where a.username like '%&user%'
/
