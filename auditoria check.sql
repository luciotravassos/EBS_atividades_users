/* Formatted on 2005/01/08 03:33 (Formatter Plus v4.7.0) */
SELECT 'Users' descrip, COUNT (*) num
  FROM sys.user$
 WHERE audit$ IS NOT NULL
UNION ALL
SELECT 'Tables' descrip, COUNT (*) num
  FROM sys.tab$
 WHERE LTRIM (audit$, '-') IS NOT NULL
UNION ALL
SELECT 'Views' descrip, COUNT (*) num
  FROM sys.view$
 WHERE LTRIM (audit$, '-') IS NOT NULL
UNION ALL
SELECT 'Sequences' descrip, COUNT (*) num
  FROM sys.seq$
 WHERE LTRIM (audit$, '-') IS NOT NULL
UNION ALL
SELECT 'Procedures' descrip, COUNT (*) num
  FROM sys.procedure$
 WHERE LTRIM (audit$, '-') IS NOT NULL
UNION ALL
SELECT 'Types' descrip, COUNT (*) num
  FROM sys.type_misc$
 WHERE LTRIM (audit$, '-') IS NOT NULL
UNION ALL
SELECT 'Libraries' descrip, COUNT (*) num
  FROM sys.library$
 WHERE LTRIM (audit$, '-') IS NOT NULL
UNION ALL
SELECT 'Directories' descrip, COUNT (*) num
  FROM sys.dir$
 WHERE LTRIM (audit$, '-') IS NOT NULL
UNION ALL
SELECT 'System' descrip, COUNT (*) num
  FROM sys.audit$;

