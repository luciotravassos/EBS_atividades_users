*  Script Description: This script will calculate the percentage of work completed during 
                        the backup process. Repeated execution of this query can assist in 
                        this determiniation.
   
    Output file:        bkupprog.lis
   
    Prepared By:        TheOracleResourceStop Script Archive
                        www.orsweb.com
   
    Usage Information:  SQLPLUS SYS/pswd
                        @backupprogress.sql
*/   

spool bkupprog.lis


SELECT * FROM v$session_longops



select round(sofar/totalwork*100,2) pct_complete
from v$session_longops
--where compnam = 'dbms_backup_restore';

spool off;

