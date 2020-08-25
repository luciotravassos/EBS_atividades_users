
rem  Script Description: This script will list all system privileges granted to a user.
rem
rem  Output file:        sysprivs.lis
rem  
rem  Prepared By:        TheOracleResourceStop Script Archive
rem                      www.orsweb.com
rem
rem  Usage Information:  SQLPLUS SYS/pswd
rem                      @sysprivs.sql
rem

set linesize 160 verify off feedback off;

column grantee format a25 heading "Grantee";
column admin_option heading "Admin?";
column privilege format a25 heading "Privilege";

ttitle center "System Privileges (ordered by Grantee/Privilege)" skip 3;

break on grantee;

spool sysprivs.lis

select grantee,privilege,admin_option
from dba_sys_privs
order by grantee, privilege;

spool off;
clear columns;
clear breaks;


