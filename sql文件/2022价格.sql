create table ZRZ_PRICE_20221207 as
select *
from ZRZ_PRICE_20221207
where 1 = 2;

create table H_PRICE_20221207 as
select *
from T_H_PRICE_JZ
where 1 = 2;

truncate table ZRZ_PRICE_20221207;



select count(0)
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID in (select COMMUNITY_ID_PG
                       from T_DATA_XQ_ZZ_GXD
                       where VERSION = '2022'
                         and PROPERTY_NAME in ('住宅')
                         and PRICE_CXHD is not null
                         and COMMUNITY_ID_PG is not null);

select count(0)
from T_DATA_XQ_ZZ_GXD
where VERSION = '2022'
  and PROPERTY_NAME in ('住宅', '高层', '多层', '洋房')
  and PRICE_CXHD is not null
  and COMMUNITY_ID_PG is not null;

select PROPERTY_NAME, count(0)
from T_DATA_XQ_ZZ_GXD
where VERSION = '2022'
group by PROPERTY_NAME;



select *
from ZRZ_PRICE_20221207;


-- 住宅
insert into ZRZ_PRICE_20221207 (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source,
                                zl,
                                qxdm, QXMC, ZCS, SCJ, bz)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       a.SCJ,
       '2022住宅价'
from (select a.COMMUNITY_ID_PG COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.PRICE_CXHD      JG_ZZ,
             a.PRICE_CXHD      SCJ
      from T_DATA_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID_PG = b.COMMUNITY_ID
      where b.COMMUNITY_ID is not null
        and a.VERSION = '2022'
        AND a.PROPERTY_NAME = '住宅'
        and a.PRICE_CXHD is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID;


-- 高层
insert into ZRZ_PRICE_20221207 (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source,
                                zl,
                                qxdm, QXMC, ZCS, SCJ, bz, ZZFSYT)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       a.SCJ,
       '2022住宅价',
       '高层'
from (select a.COMMUNITY_ID_PG COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.PRICE_CXHD      JG_ZZ,
             a.PRICE_CXHD      SCJ
      from T_DATA_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID_PG = b.COMMUNITY_ID
      where b.COMMUNITY_ID is not null
        and a.VERSION = '2022'
        AND a.PROPERTY_NAME = '高层'
        and a.PRICE_CXHD is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 7
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) < 33;


-- 多层
insert into ZRZ_PRICE_20221207 (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source,
                                zl,
                                qxdm, QXMC, ZCS, SCJ, bz, ZZFSYT)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       a.SCJ,
       '2022住宅价',
       '多层'
from (select a.COMMUNITY_ID_PG COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.PRICE_CXHD      JG_ZZ,
             a.PRICE_CXHD      SCJ
      from T_DATA_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID_PG = b.COMMUNITY_ID
               left join ZRZ_PRICE_20221207 c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        and a.VERSION = '2022'
        AND a.PROPERTY_NAME = '多层'
        and a.PRICE_CXHD is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;

-- 洋房
insert into ZRZ_PRICE_20221207 (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source,
                                zl,
                                qxdm, QXMC, ZCS, SCJ, bz, ZZFSYT)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       a.SCJ,
       '2022住宅价',
       '洋房'
from (select a.COMMUNITY_ID_PG COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.PRICE_CXHD      JG_ZZ,
             a.PRICE_CXHD      SCJ
      from T_DATA_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID_PG = b.COMMUNITY_ID
               left join ZRZ_PRICE_20221207 c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        and a.VERSION = '2022'
        AND a.PROPERTY_NAME = '洋房'
        and a.PRICE_CXHD is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;



select COMMUNITY_ID_PG, PROPERTY_NAME, count(0)
from T_DATA_XQ_ZZ_GXD
where VERSION = '2022'
  and PROPERTY_NAME like '%别墅%'
group by COMMUNITY_ID_PG, PROPERTY_NAME
having count(0) > 1;

-- 处理别墅的价格数据
insert into ZRZ_PRICE_20221207 (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source,
                                zl,
                                qxdm, QXMC, ZCS, SCJ, bz, ZZFSYT)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       a.SCJ,
       '2022别墅',
       PROPERTY_NAME
from (select a.COMMUNITY_ID_PG COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.PRICE_CXHD      JG_ZZ,
             a.PRICE_CXHD      SCJ,
             a.PROPERTY_NAME,
             d.ZZFSYT
      from T_DATA_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID_PG = b.COMMUNITY_ID
               left join ZRZ_PRICE_20221207 c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
               left join T_PRICE_ZRZ d on b.ZRZBDCDYID = d.BDCDYID and a.PROPERTY_NAME = d.ZZFSYT
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        and a.VERSION = '2022'
        AND a.PROPERTY_NAME like '%别墅%'
        and d.ID is not null
        and a.PRICE_CXHD is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID;

-- 处理别墅的价格数据
insert into ZRZ_PRICE_20221207 (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, CREATE_TIME, createuser, data_source,
                                zl,
                                qxdm, QXMC, ZCS, SCJ, bz, ZZFSYT)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       a.SCJ,
       '2022117别墅',
       PROPERTY_NAME
from (select a.COMMUNITY_ID_PG COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.PRICE_CXHD      JG_ZZ,
             a.PRICE_CXHD      SCJ,
             a.PROPERTY_NAME,
             d.ZZFSYT
      from T_DATA_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID_PG = b.COMMUNITY_ID
               left join ZRZ_PRICE_20221207 c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
               left join T_PRICE_ZRZ d on b.ZRZBDCDYID = d.BDCDYID and a.PROPERTY_NAME = d.ZZFSYT
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        and a.VERSION = '2022'
        AND a.BZ = '23年与18年计税价差值大于1000-1.17'
        and d.ID is not null
        and a.PRICE_CXHD is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID;

select *
from T_DATA_XQ_ZZ_GXD where BZ = '23年与18年计税价差值大于1000-1.17';

select *
from ZRZ_PRICE_20221207
where bz = '23年与18年计税价差值大于1000-1.17';

select distinct ZZFSYT,PRICE
from T_PRICE_ZRZ where BDCDYID  in (
select ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ where COMMUNITY_ID = '356301235516641266');



select a.COMMUNITY_ID_PG COMMUNITY_ID,
       b.ZRZBDCDYID,
       a.PRICE_CXHD      JG_ZZ,
       a.PRICE_CXHD      SCJ,
       a.PROPERTY_NAME,
       d.ZZFSYT
from T_DATA_XQ_ZZ_GXD a
         left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID_PG = b.COMMUNITY_ID
         left join ZRZ_PRICE_20221207 c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
         left join T_PRICE_ZRZ d on b.ZRZBDCDYID = d.BDCDYID and a.PROPERTY_NAME = d.ZZFSYT
where b.COMMUNITY_ID is not null
  and c.PRICE is null
  and a.VERSION = '2022'
  AND a.PROPERTY_NAME like '%别墅%'
  and d.ID is not null
  and a.PRICE_CXHD is not null;


select BDCDYID, FWYT, zzfsyt, count(0)
from ZRZ_PRICE_20221207
group by BDCDYID, FWYT, zzfsyt
having count(0) > 1;

select *
from ZRZ_PRICE_20221207
where bdcdyid = '1302504';


select *
from ZRZ_PRICE_20221207
where zzfsyt like '%别墅%';

delete
from ZRZ_PRICE_20221207
where BDCDYID in (select BDCDYID
                  from ZRZ_PRICE_20221207
                  group by BDCDYID, FWYT
                  having count(0) > 1)
  and ZZFSYT is null;

DELETE
from ZRZ_PRICE_20221207
WHERE BDCDYID IN (SELECT BDCDYID FROM ZRZ_PRICE_20221207 GROUP BY BDCDYID HAVING COUNT(id) > 1)
  AND ROWID NOT IN (SELECT MIN(ROWID) FROM ZRZ_PRICE_20221207 GROUP BY BDCDYID HAVING COUNT(*) > 1);


delete
from ZRZ_PRICE_20221207 a
where (a.BDCDYID, a.ZZFSYT) in
      (select BDCDYID, ZZFSYT from ZRZ_PRICE_20221207 group by BDCDYID, ZZFSYT having count(*) > 1)
  and rowid not in (select min(rowid) from ZRZ_PRICE_20221207 group by BDCDYID, ZZFSYT having count(*) > 1)
  and ZZFSYT is not null;

select BDCDYID, count(0)
from H_PRICE_20221207
group by BDCDYID
having count(0) > 1;


UPDATE ZRZ_PRICE_20221207 t1
SET T1.GXD_COMM_ID = (select T2.COMMUNITY_ID
                      from T_DATA_XQ_ZZ_GXD t2
                      where T2.COMMUNITY_ID_PG = T1.COMMUNITY_ID
                        and ROWNUM = 1)
WHERE EXISTS(SELECT 1 FROM T_DATA_XQ_ZZ_GXD T2 WHERE T2.COMMUNITY_ID_PG = T1.COMMUNITY_ID and ROWNUM = 1);


select ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ
where COMMUNITY like '%银座数码广场%';

select BDCDYID, FWYT4, ZL, SZC
from T_BASE_H_XZ
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY like '%银座数码广场%');

select ZRZBDCDYID, count(0)
from V_COMMUNITY_GL_ZRZ
group by ZRZBDCDYID
having count(0) > 1;

select c.ID,
       a.BDCDYID,
       a.ZDBDCDYID,
       a.QXDM,
       a.QXMC,
       a.SCJZMJ                                                                         jzmj,
       a.ZCS,
       a.ZL,
       decode(c.COMMUNITY_ID, '', d.COMMUNITY_ID, null, d.COMMUNITY_ID, c.COMMUNITY_ID) community_id,
       decode(c.COMMUNITY, '', d.COMMUNITY, null, d.COMMUNITY, c.COMMUNITY)             community,
       decode(c.FWYT, '', b.FWYT5, null, b.FWYT5, c.FWYT)                               fwyt,
       c.PRICE,
       c.DATA_SOURCE,
       c.ZZFSYT,
       c.PRICE,
       c.SCJ,
       c.STATE,
       c.CREATETIME,
       c.CREATEUSER,
       c.UPDATETIME,
       c.UPDATEUSER
from T_BASE_ZRZ_XZ a
         left join T_DATA_TQJG_ZRZ b on a.BDCDYID = b.BDCDYID and b.FWYT5 = '住宅'
         left join ZRZ_PRICE_20221207 c on a.BDCDYID = c.BDCDYID
         left join V_COMMUNITY_GL_ZRZ d on a.BDCDYID = d.ZRZBDCDYID
where b.ID is not null;

select *
from ZRZ_PRICE_20221207
where bz = '测试新增123';
select *
from T_COMMTY_GL_ZRZ
where ZRZBDCDYID = 'e696626c-db5a-4652-8fd9-1fec0512a412';

select ZRZBDCDYID, count(0)
from T_COMMTY_GL_ZRZ
group by ZRZBDCDYID
having count(0) > 1;

select COMMUNITY_ID
from T_COMMTY_GL_ZRZ
where ZRZBDCDYID = '1167496';
select *
from T_BASE_COMMUNITY
where ID = '356304985023090342';
select *
from T_BASE_COMMUNITY
where ID = 'CB0F6F22107D66B1E053AF5D14ACBB0C';

delete
from T_COMMTY_GL_ZRZ a
where (a.ZRZBDCDYID, a.COMMUNITY_ID) in
      (select ZRZBDCDYID, COMMUNITY_ID from T_COMMTY_GL_ZRZ group by ZRZBDCDYID, COMMUNITY_ID having count(*) > 1)
  and rowid not in (select min(rowid) from T_COMMTY_GL_ZRZ group by ZRZBDCDYID, COMMUNITY_ID having count(*) > 1);


select ZDBDCDYID
from T_BASE_ZRZ_XZ
where BDCDYID = 'c6561676-f777-4580-a04a-7813c60af392';

select *
from H_PRICE_20221207;

select distinct JGLY
from T_PRICE_ZRZ;

select *
from T_COMMTY_GL_ZRZ;

create sequence seq_comm_gl_zrz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


select a.BDCDYID, a.COMMUNITY_ID, b.COMMUNITY_ID
from T_PRICE_ZRZ a
         left join T_COMMTY_GL_ZRZ b on a.BDCDYID = b.ZRZBDCDYID
where a.COMMUNITY_ID != b.COMMUNITY_ID
  and a.COMMUNITY_ID is not null;

select *
from T_PRICE_ZRZ
where BDCDYID = '1205128';
-- 450017108382749258
-- 450017108382749258

select *
from T_COMMTY_GL_ZRZ
where ZRZBDCDYID = '1205128';



select PRICE, JZPC
from H_PRICE_20221207
where ZRZBDCDYID = 'c65a7f37-7bfe-4c13-88af-4d9a4184d9e6';

select jzpc
from ZRZ_PRICE_20221207
where bdcdyid = 'e696626c-db5a-4652-8fd9-1fec0512a412';

select bdcdyid, count(0)
from ZRZ_PRICE_20221207
group by bdcdyid
having count(0) > 1;

select *
from ZRZ_PRICE_20221207
where bdcdyid in ('3f045c20-f2c1-4939-bf6c-e1909b5adad0', 'e696626c-db5a-4652-8fd9-1fec0512a412',
                  'c65a7f37-7bfe-4c13-88af-4d9a4184d9e6');

select *
from h_PRICE_20221207
where ZRZBDCDYID in ('3f045c20-f2c1-4939-bf6c-e1909b5adad0', 'e696626c-db5a-4652-8fd9-1fec0512a412',
                  'c65a7f37-7bfe-4c13-88af-4d9a4184d9e6');

select *
from T_PRICE_ZRZ where zl = '章丘区绣源西街3998号湖畔樾山花园10号楼';

select *
from T_COMMTY_GL_ZRZ
where ZRZBDCDYID in ('3f045c20-f2c1-4939-bf6c-e1909b5adad0', 'e696626c-db5a-4652-8fd9-1fec0512a412',
                  'c65a7f37-7bfe-4c13-88af-4d9a4184d9e6');

select *
from ZRZ_PRICE_20221207 where community_id = 'CB0F6F22081066B1E053AF5D14ACBB0C';
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D74FDA58C8E053AF5D14AC254E', '947473', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区19号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314516600562', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D74FC758C8E053AF5D14AC254E', '947482', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区4号楼', null, 3, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314392440462', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7507958C8E053AF5D14AC254E', '959970', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13086, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区22号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142344526970343', null, null, '2022住宅价', null, 13086.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:42:05');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7880758C8E053AF5D14AC254E', '947476', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区12号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314514180856', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D78B1458C8E053AF5D14AC254E', '947475', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区16号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314508300346', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7897158C8E053AF5D14AC254E', '947479', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区9号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314478860733', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7859E58C8E053AF5D14AC254E', '947484', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区2号楼', null, 3, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314423430129', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D785A058C8E053AF5D14AC254E', '947481', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区5号楼', null, 3, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314414240103', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D77DAA58C8E053AF5D14AC254E', '947472', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区21号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314501370560', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7812358C8E053AF5D14AC254E', '959965', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区7号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142343441700216', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7814358C8E053AF5D14AC254E', '959972', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13086, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区32号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142344549060141', null, null, '2022住宅价', null, 13086.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:42:05');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7814D58C8E053AF5D14AC254E', '959971', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13086, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区26号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142344560300015', null, null, '2022住宅价', null, 13086.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:42:05');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7814E58C8E053AF5D14AC254E', '947478', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区10号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314495430443', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7814F58C8E053AF5D14AC254E', '947477', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区11号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314486780321', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7819258C8E053AF5D14AC254E', '959967', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区18号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142343460280767', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D78E2F58C8E053AF5D14AC254E', '959968', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区20号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142343475640361', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D78E3458C8E053AF5D14AC254E', '947480', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区8号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314411600033', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D78C0D58C8E053AF5D14AC254E', '947474', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区17号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314518700531', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D78B8958C8E053AF5D14AC254E', '959966', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13086, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区15号楼', null, 4, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142343464900445', null, null, '2022住宅价', null, 13086.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:42:05');
INSERT INTO JNPG.ZRZ_PRICE_20221207 (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATEUSER, DATA_SOURCE, ZL, JZMJ, ZCS, HBDCDYID, YWH, BDCDYH, FWBM, ZRZID, WQSJ, ZJH, PCH, GXDYT, QXDM, QXMC, STATE, JZPC, SDJG, JGLY, BZ, ZZFSYT, SCJ, GXD_COMM_ID, COMMUNITY, CREATE_TIME, UPDATE_TIME) VALUES ('EFCB60D7859F58C8E053AF5D14AC254E', '947483', '150b555b3bb743348aa6e1043570042e', 'CB0F6F22081066B1E053AF5D14ACBB0C', 13538, '住宅', 'zhangbin', 'caozhonghao', '4', '长清区海棠路6666号中建长清湖小区3号楼', null, 3, null, null, null, null, null, null, null, null, null, '370113', '长清', '1', '202212142314402550144', null, null, '2022住宅价', null, 13538.000000, '438619593', null, TIMESTAMP '2022-12-14 22:52:48', TIMESTAMP '2022-12-16 15:40:54');



select *
from ZRZ_PRICE_20221207 where zl like '%全运村锦兰园%'

select *
from ZRZ_PRICE_20221207 where bdcdyid = '304455000';

select distinct FWYT4
from T_BASE_H_XZ where ZRZBDCDYID = '772441';

select *
from T_DATA_TQJG_ZRZ where BDCDYID = '772441';

select BDCDYId,SCJZMJ
from T_BASE_H_XZ where ZRZBDCDYID = '915982' and FWYT4 = '住宅' and SCJZMJ is null ;


select *
from T_YW_PRICE_FEEDBACK where zl ='市中区紫云府小区二区8号楼1--206';

select *
from T_YW_YWQD ;

select *
from T_CFG_COMMON_URL;

update T_YW_PRICE_FEEDBACK
set ISYPG = 0;

select *
from T_PRICE_H where zl = '历下区经十路9777号鲁商国奥城项目4、5号楼-309';

select *
from T_H_PRICE_JZ where BDCDYID  ='37329515';

select *
from t_yw_pgbdsc;

select *
from T_FILE_PATH where PGYW_ID = '334592971859700680';

select *
from T_BASE_H_XZ where BDCDYID = '37329515';

select *
from T_YW_PRICE_FEEDBACK;
select count(0)
from (
select FWBM,count(0)
from T_BASE_H_XZ where FWBM is not null  group by FWBM having count(0) > 1);

select *
from T_BASE_H_XZ where FWBM = '2009092500010778400074';
INSERT INTO JNPG.T_BASE_H_XZ (ZRZBDCDYID) VALUES ('770107');
INSERT INTO JNPG.T_BASE_H_XZ (ZRZBDCDYID) VALUES ('1539095');
select zl
from T_BASE_ZRZ_XZ where BDCDYID = '1539095';

select *
from JNPG.V_DATA_WSXX;

select *
from ZRZ_PRICE_20221207 where bdcdyid = '415573000';

select ZL
from T_BASE_H_XZ where BDCDYID = '15160891';



select *
from EST_DATAOMP.T_YW_PRICE_FEEDBACK;







