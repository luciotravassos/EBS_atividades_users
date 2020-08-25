SELECT d.user_name,
       d.description,
       s.process,
       s.action,
       s.module,
       s.status,
       s.sid,
       s.serial#,
       c.spid,
       s.program,
       s.machine,
       s.LAST_CALL_ET
  FROM apps.fnd_logins a, gv$session s, gv$process c, apps.fnd_user d
 WHERE s.paddr = c.addr
   AND a.pid = c.pid
   AND a.spid = s.process
   AND d.user_id = a.user_id
   AND (d.user_name = 'USER_NAME' OR 1 = 1)
   and c.inst_id = s.inst_id
      --AND a.spid in ( &spid)
   --and s.sid = &sid
    and d.user_name like '%&user%';