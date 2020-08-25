select  /*+ ORDERED */
           chr(39)||s.sid||','||s.serial#||chr(39)                       sid_serial
,          to_char(s.logon_time,'DDth - HH24:MI:SS')                     logon
,          floor(last_call_et/3600)||':'||
              floor(mod(last_call_et,3600)/60)||':'||
              mod(mod(last_call_et,3600),60)                             IDLE
,          s.username                                                    o_user
,          s.osuser                                                      os_user
,          s.status                                                      status
,          u.user_name                                                   apps_user
--,          n.TERMINAL_ID						 terminal
,	   DECODE(lockwait,'','','Y') lockwait
from      v$session  s
,         v$process  p
,         apps.fnd_logins n
,         apps.fnd_user   u
where  s.paddr      = p.addr
and    n.pid        IS NOT NULL
and    n.serial#    IS NOT NULL
and    n.serial#    = p.serial#
and    n.end_time   IS NULL
and    s.process    = n.spid -- so we don't get hung sessions with old SID and SERIAL
and    p.pid        = n.pid
and    n.user_id    = u.user_id
order by  u.user_name
,         to_char(s.logon_time,'DDth - HH24:MI:SS')


