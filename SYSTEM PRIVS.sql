rem Script Description: This script lists of all users having DBA-type System Privileges
rem
rem Output file:        dbasysprivs.lis
rem
rem Prepared By:        TheOracleResourceStop
rem                     www.theoracleresourcestop.com
rem
rem Usage Information:  SQLPLUS SYS/pswd
rem                     dbasysprivs.sql
rem
rem
set pagesize 200;
set linesize 80;
set echo off;
set feedback off;
set heading on;

column database format a8;
column grantee format a20;
column granted_role format a20;
column privilege format a25;

spool dbasysprivs.lis

SELECT NAME DATABASE, GRANTEE, 'NO ROLE' GRANTED_ROLE, PRIVILEGE
FROM DBA_SYS_PRIVS,v$database
WHERE privilege like '%ANY%'
	AND	grantee not in('SYSTEM','SYS')
	AND	GRANTEE Not In(select role from dba_roles)
union all
SELECT DISTINCT NAME DATABASE,
	A.GRANTEE,
	A.GRANTED_ROLE,
	B.PRIVILEGE
FROM
	DBA_ROLE_PRIVS A,
	DBA_SYS_PRIVS B, V$DATABASE
WHERE
		A.GRANTED_ROLE = B.GRANTEE
	AND	A.GRANTED_ROLE IN(SELECT GRANTEE FROM DBA_SYS_PRIVS WHERE PRIVILEGE LIKE '%ANY%')
	AND	A.GRANTEE NOT IN('DBA','SYS','SYSTEM','DBSNMP')
ORDER BY 1,3,2;

spool off;


