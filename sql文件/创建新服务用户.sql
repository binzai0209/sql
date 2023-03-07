
--删除表空间
drop tablespace EST_DATAOMP including contents cascade constraints;

--创建表空间及用户
create temporary tablespace EST_DATAOMP_TEMP tempfile 'EST_DATAOMP_TEMP.dbf' size 128 m autoextend on next 128 m maxsize 31G extent management local;
create tablespace EST_DATAOMP logging datafile 'EST_DATAOMP.dbf' size 128m autoextend on next 128m maxsize 31G extent management local;
create user EST_DATAOMP identified by EST_DATAOMP default tablespace EST_DATAOMP temporary tablespace EST_DATAOMP_TEMP;
grant connect to EST_DATAOMP;
grant resource to EST_DATAOMP;
grant create any procedure to EST_DATAOMP;
grant create any view to EST_DATAOMP;
grant debug connect session to EST_DATAOMP;
grant unlimited tablespace to EST_DATAOMP;
grant read,write on directory DMPDIR to EST_DATAOMP;