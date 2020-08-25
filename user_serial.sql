set long 2000
set pagesize 24 linesize 132
set pause on
column sid format 999 ;
spo vernos
set verify off
set pagesize 24
set pause on 
set linesize 230
--column process  format a6 heading PROCESSO|PAI
column spid     format a6 heading PROCESSO|FILHO
column ora      format a10 heading USUARIO|ORACLE
column unix     format a8 heading USUARIO|UNIX
column maquina  format a10

select sid                      sid, 
       substr(b.serial#,1,8)    serial,      
       substr(a.spid,1,6)       spid,
--     substr(process,1,6)      process,
       substr(machine,1,10)      maquina, 
       substr(b.osuser,1,8)     "USU UNIX",
       substr(b.username,1,11)  "USU ORACLE",
       substr(b.program,1,25)   programa,
       substr(b.status,1,10)    status
--     c.sql_text               texto
      from v$process a,v$session b 
 where addr       = paddr 
 -- and   b.username != 'APPLSYS'
--   and   b.username like  'ATENDI%'
-- and   b.sql_hash_value = c.hash_value
order by 3,4,5  
/
spo off


