select username from dba_users where username not in ('CTXSYS',
'DBSNMP',
'LBACSYS',
'MDSYS',
'MTSSYS',
'ODM',
'ODM_MTR',
'OLAPSYS',
'ORDPLUGINS',
'ORDSYS',
'OUTLN',
'PERFSTAT',
'TRACESVR',
'XDB',
'WMSYS',
'AURORA$JIS$UTILITY$',
'AURORA$ORB$UNAUTHENTICATED',
'OSE$HTTP$ADMIN',
'RDSYS',
'REPADMIN')