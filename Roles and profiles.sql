select username, default_tablespace ,   
         temporary_tablespace , 
         profile,   
         granted_role ||'-'||decode(admin_option,'YES','Y','N')||decode(granted_role,'YES','Y','N') role 
from dba_users,   dba_role_privs 
where username = grantee 
  and username not in ('PUBLIC','SYS','SYSTEM') 
  --and granted_role = 'R_CALCULOS'
  AND USERNAME = 'RHEVGP'
order by 1,2,3,4,5

