-- 查看利用率
select *
from (Select a.tablespace_name,
             to_char(a.bytes / 1024 / 1024, '99,999.999')                         total_bytes,
             to_char(b.bytes / 1024 / 1024, '99,999.999')                         free_bytes,
             to_char(a.bytes / 1024 / 1024 - b.bytes / 1024 / 1024, '99,999.999') use_bytes,
             to_char((1 - b.bytes / a.bytes) * 100, '99.99') || '%'               use
      from (select tablespace_name,
                   sum(bytes) bytes
            from dba_data_files
            group by tablespace_name) a,
           (select tablespace_name,
                   sum(bytes) bytes
            from dba_free_space
            group by tablespace_name) b
      where a.tablespace_name = b.tablespace_name
      union all
      select c.tablespace_name,
             to_char(c.bytes / 1024 / 1024, '99,999.999')                  total_bytes,
             to_char((c.bytes - d.bytes_used) / 1024 / 1024, '99,999.999') free_bytes,
             to_char(d.bytes_used / 1024 / 1024, '99,999.999')             use_bytes,
             to_char(d.bytes_used * 100 / c.bytes, '99.99') || '%'         use
      from (select tablespace_name, sum(bytes) bytes
            from dba_temp_files
            group by tablespace_name) c,
           (select tablespace_name, sum(bytes_cached) bytes_used
            from v$temp_extent_pool
            group by tablespace_name) d
      where c.tablespace_name = d.tablespace_name)
order by tablespace_name;

-- 查看路径
SELECT T.TABLESPACE_NAME,
       D.FILE_NAME,
       D.AUTOEXTENSIBLE,
       D.BYTES,
       D.MAXBYTES,
       D.STATUS
FROM DBA_TABLESPACES T,
     DBA_DATA_FILES D
WHERE T.TABLESPACE_NAME = D.TABLESPACE_NAME
ORDER BY TABLESPACE_NAME, FILE_NAME;


-- 拓展表空间
ALTER TABLESPACE JNPG ADD DATAFILE
    '/oracle/app/oracle/product/11.2.0/db/dbs/JNPG3.dbf' SIZE 4 G
    AUTOEXTEND ON
    NEXT 4 G
    MAXSIZE UNLIMITED;

