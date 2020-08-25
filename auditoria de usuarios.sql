/* Formatted on 2004/10/21 04:12 (Formatter Plus v4.7.0) */
REM Script Description: This script creates a report showing the number of database connections
REM                     made the previous day.  It also shows those ids having made more than
REM                     20 connections during the day.
REM
REM               NOTE: Connection Auditing must be turn on.
REM
REM Output file:        connections.lis
REM
REM Prepared By:        TheOracleResourceStop Script Archive
REM                     www.orsweb.com
REM
REM Usage Information:  SQLPLUS SYS/pswd
REM                     @connections.sql
REM
/*
set pagesize 0;
set linesize 80;
set echo off;
set feedback off;
set heading off;

column name format a5;
column username format a15;


spool connections.lis;
*/
/*prompt SUBJECT: Database Connections for Last 7 Days and Users Connecting More than 20 Times During the Previous Day
prompt Use courier font in email for best readability of report
prompt
prompt Name                  Date            # of Connections
prompt ----                  ----------      ----------------
*/
SELECT   b.NAME, '               ', TO_CHAR (TIMESTAMP, 'DD-MON-YYYY') date#,
         COUNT (*) connections
    FROM dba_audit_trail a, v$database b
   WHERE action_name LIKE 'LOG%'
     AND TRUNC (TIMESTAMP) >= TRUNC (SYSDATE - 7)
     AND TRUNC (TIMESTAMP) <> TRUNC (SYSDATE)
GROUP BY b.NAME, TO_CHAR (TIMESTAMP, 'DD-MON-YYYY')
  HAVING COUNT (*) > 20;

--spool off;

