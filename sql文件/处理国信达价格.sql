-- 还原历下区数据
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, updatetime,
                         updateuser, data_source, zl, jzmj, zcs, hbdcdyid, ywh, bdcdyh, fwbm, zrzid, wqsj, zjh, pch,
                         gxdyt, qxdm, qxmc, state, jzpc, sdjg, jgly)
select *
from T_PRICE_ZRZ_BACK_220620
where QXDM = '370102';
-- 创建历下还原备份表
create table T_PRICE_ZRZ_BAK_lxhy parallel 8 as
select *
from T_PRICE_ZRZ nologging;

-- 将数据来源为空的改为99
update T_PRICE_ZRZ
set DATA_SOURCE = '99'
where DATA_SOURCE is null;

-- 将不动产单元id和房屋用途相同的更新为国信达的价格
UPDATE T_PRICE_ZRZ A -- 使用别名
SET PRICE      =
        (SELECT B.PRICE FROM V_GXD_ZRZ_PRICE B WHERE B.BDCDYID = A.BDCDYID and b.FWYT = a.FWYT),
    DATA_SOURCE='4'
WHERE a.DATA_SOURCE <> '1'
  and a.DATA_SOURCE <> '99'
  and a.PRICE is null
  and EXISTS(SELECT 1 FROM V_GXD_ZRZ_PRICE B WHERE B.BDCDYID = A.BDCDYID and b.FWYT = a.FWYT);

-- 将国信达提供的价格 插入到自然幢表
insert into T_PRICE_ZRZ (id, bdcdyid, fwyt, price, zcs, bz, DATA_SOURCE, QXDM, zl)
select sys_guid(),
       BDCDYID,
       FWYT,
       PRICE,
       ZCS,
       '小区价格脚本导入20220730国信达提供',
       '4',
       QXDM,
       zl
from (select a.*,
             (select b.DATA_SOURCE
              from T_PRICE_ZRZ b
              where a.BDCDYID = b.BDCDYID
                and a.FWYT = b.FWYT
                and rownum = 1) DATA_SOURCE
      from V_GXD_ZRZ_PRICE a)
where DATA_SOURCE is null;


delete
from T_PRICE_ZRZ
where id in (select id
             from T_PRICE_ZRZ
             where BZ = '小区价格脚本导入20220730国信达提供'
               and JGLY is null);


select count(0)
from (select a.*,
             (select b.DATA_SOURCE
              from T_PRICE_ZRZ b
              where a.BDCDYID = b.BDCDYID
                and a.FWYT = b.FWYT
                and rownum = 1) DATA_SOURCE
      from V_GXD_ZRZ_PRICE a) b
where b.DATA_SOURCE is null;



select *
from V_COMMUNITY_GL_ZRZ;


select *
from T_PRICE_COMMTY
where COMMUNITY_ID = 'CB0F6F220E9666B1E053AF5D14ACBB0C';



create table T_H_PRICE_JZ_0813 parallel 8 as
select *
from T_H_PRICE_JZ nologging;

truncate table T_H_PRICE_JZ;

select *
from (select ZRZBDCDYID,
             FWYT4,
             row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
      from T_BASE_H_XZ
      where FWYT4 = '办公')
where r = 1
order by ZRZBDCDYID;;


select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

select a.BDCDYID, b.BDCDYID
from T_BASE_H_XZ a
         left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID
where a.ZRZBDCDYID in (select bdcdyid from T_PRICE_ZRZ where T_PRICE_ZRZ.QXDM = '370103');


delete
from T_H_PRICE_JZ
where ID in (select ID
             from T_H_PRICE_JZ
             where ZRZBDCDYID in (select bdcdyid from T_PRICE_ZRZ where T_PRICE_ZRZ.QXDM = '370112'));

select distinct COMMUNITY_ID
from T_COMMUNITY_YT
where COMMUNITY_ID in (select distinct COMMUNITY_ID
                       from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
                             from v_community_gl_zrz_xq3_gxd v
                                      left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
                             where v.fwyt = '车位/车库'
                               and v.ZRZBDCDYID not in
                                   ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507',
                                    '1538618',
                                    '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664')) a
                       where BZ = '0824新增价格')
  and LPYT = '车位/车库';

select distinct COMMUNITY_ID, PRICE
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库'
        and v.ZRZBDCDYID not in ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507', '1538618',
                                 '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664')) a
where BZ = '0824新增价格';



select *
from T_PRICE_ZRZ
where BZ = '0824新增价格';

select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

select *
from T_COLLECT_COMMUNITY_PRICE_HIS;

select COMMUNITY_ID
from T_COLLECT_COMMUNITY_PRICE_HIS
group by COMMUNITY_ID, LPYT, DATA_SOURCE
having count(0) > 1;

select *
from T_COLLECT_COMMUNITY_PRICE_HIS
where BZ = '824添加';

update T_COLLECT_COMMUNITY_PRICE_HIS
set LPYT = '车位/车库'
where BZ = '824添加';

insert into T_COLLECT_COMMUNITY_PRICE_HIS (ID, COMMUNITY_ID, LPYT, PRICE, VERSION, DATA_SOURCE, CREATE_USER,
                                           CREATE_TIME, BZ)
select sys_guid(),
       COMMUNITY_ID,
       '车位/出入库',
       PRICE,
       '202208',
       '国信达',
       'zhangbin',
       sysdate,
       '824添加'
from (select a.COMMUNITY_ID, a.PRICE, row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
      from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
            where v.fwyt = '车位/车库'
              and v.ZRZBDCDYID not in
                  ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507',
                   '1538618',
                   '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664')) a
               left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '车位/车库'
               left join T_COLLECT_COMMUNITY_PRICE_HIS c
                         on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '车位/车库' and c.DATA_SOURCE = '国信达'
      where a.BZ = '0824新增价格'
        and b.COMMUNITY_ID is not null
        and c.COMMUNITY_ID is null)
where r = 1;

insert into T_COLLECT_COMMUNITY_PRICE_HIS (ID, COMMUNITY_ID, LPYT, PRICE, VERSION, DATA_SOURCE, CREATE_USER,
                                           CREATE_TIME, BZ)
select sys_guid(),
       COMMUNITY_ID,
       '储藏室/阁楼',
       PRICE,
       '202208',
       '国信达',
       'zhangbin',
       sysdate,
       '824添加'
from (select a.COMMUNITY_ID, a.PRICE, row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
      from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
            where v.fwyt = '储藏室/阁楼') a
               left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '储藏室/阁楼'
               left join T_COLLECT_COMMUNITY_PRICE_HIS c
                         on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '储藏室/阁楼' and c.DATA_SOURCE = '国信达'
      where a.BZ = '0824新增价格'
        and b.COMMUNITY_ID is not null
        and c.COMMUNITY_ID is null)
where r = 1;

insert into T_PRICE_ZRZ (ID, BDCDYID, ZDBDCDYID, COMMUNITY_ID, PRICE, FWYT, CREATEUSER, UPDATETIME,
                         DATA_SOURCE, ZL, QXDM,
                         STATE, BZ)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       b.COMMUNITY_ID,
       b.PRICE,
       a.FWYT5,
       'zhangbin',
       sysdate,
       '4',
       b.ZL,
       b.QXDM,
       '1',
       '0824新增其他车位'
from T_DATA_TQJG_ZRZ a
         left join T_PRICE_ZRZ b on a.BDCDYID = b.BDCDYID

where b.BZ = '0824新增价格'
  and b.FWYT = '车位/车库'
  and a.FWYT4 = '车位/车库'
  and a.FWYT5 in ('子母车位', '微型车位', '普通车位');



select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;


-- 车位/车库
insert into T_COLLECT_COMMUNITY_PRICE_HIS (ID, COMMUNITY_ID, LPYT, PRICE, VERSION, DATA_SOURCE, CREATE_USER,
                                           CREATE_TIME, BZ)
select sys_guid(),
       COMMUNITY_ID,
       FWYT,
       PRICE,
       '202208',
       '国信达',
       'zhangbin',
       sysdate,
       '825添加'
from (select a.COMMUNITY_ID, a.PRICE, a.FWYT, row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
      from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
            where v.fwyt = '车位/车库') a
               left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '车位/车库'
               left join T_COLLECT_COMMUNITY_PRICE_HIS c
                         on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '车位/车库' and c.DATA_SOURCE = '国信达'
      where a.BZ = '0825新增价格'
        and b.COMMUNITY_ID is not null
        and c.COMMUNITY_ID is null)
where r = 1;

select *
from T_COLLECT_COMMUNITY_PRICE_HIS
where COMMUNITY_ID in (select COMMUNITY_ID
                       from (select a.COMMUNITY_ID,
                                    a.PRICE,
                                    a.FWYT,
                                    row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
                             from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
                                   from v_community_gl_zrz_xq3_gxd v
                                            left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
                                   where v.fwyt = '车位/车库') a
                                      left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '车位/车库'
                                      left join T_COLLECT_COMMUNITY_PRICE_HIS c
                                                on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '车位/车库' and
                                                   c.DATA_SOURCE = '国信达'
                             where a.BZ = '0825新增价格'
                               and b.COMMUNITY_ID is not null
                               and c.COMMUNITY_ID is null)
                       where r = 1)
  and LPYT = '车位/车库'
  and DATA_SOURCE = '国信达';


insert into T_COLLECT_COMMUNITY_PRICE_HIS (ID, COMMUNITY_ID, LPYT, PRICE, VERSION, DATA_SOURCE, CREATE_USER,
                                           CREATE_TIME, BZ)
select sys_guid(),
       COMMUNITY_ID,
       FWYT,
       PRICE,
       '202208',
       '国信达',
       'zhangbin',
       sysdate,
       '825添加'
from (select a.COMMUNITY_ID, a.PRICE, a.FWYT, row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
      from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
            where v.fwyt = '储藏室/阁楼') a
               left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '储藏室/阁楼'
               left join T_COLLECT_COMMUNITY_PRICE_HIS c
                         on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '储藏室/阁楼' and c.DATA_SOURCE = '国信达'
      where a.BZ = '0825新增价格'
        and b.COMMUNITY_ID is not null
        and c.COMMUNITY_ID is null)
where r = 1;



select *
from T_COLLECT_COMMUNITY_PRICE_HIS
where COMMUNITY_ID in (select COMMUNITY_ID
                       from (select a.COMMUNITY_ID,
                                    a.PRICE,
                                    a.FWYT,
                                    row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
                             from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
                                   from v_community_gl_zrz_xq3_gxd v
                                            left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
                                   where v.fwyt = '储藏室/阁楼') a
                                      left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '储藏室/阁楼'
                                      left join T_COLLECT_COMMUNITY_PRICE_HIS c
                                                on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '储藏室/阁楼' and
                                                   c.DATA_SOURCE = '国信达'
                             where a.BZ = '0825新增价格'
                               and b.COMMUNITY_ID is not null
                               and c.COMMUNITY_ID is null)
                       where r = 1)
  and LPYT = '储藏室/阁楼'
  and DATA_SOURCE = '国信达';

select *
from T_COMMUNITY_YT
where COMMUNITY_ID in (select COMMUNITY_ID
                       from (select a.COMMUNITY_ID,
                                    a.PRICE,
                                    a.FWYT,
                                    row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
                             from (select v.*,
                                          pz.price price_jz,
                                          pz.fwyt  fwyt_jz,
                                          pz.data_source,
                                          pz.BZ
                                   from v_community_gl_zrz_xq3_gxd v
                                            left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
                                   where v.fwyt = '储藏室/阁楼') a
                                      left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '储藏室/阁楼'
                                      left join T_COLLECT_COMMUNITY_PRICE_HIS c
                                                on a.COMMUNITY_ID = c.COMMUNITY_ID and
                                                   c.LPYT = '储藏室/阁楼' and
                                                   c.DATA_SOURCE = '国信达'
                             where a.BZ = '0825新增价格'
                               and b.COMMUNITY_ID is not null
                               and c.COMMUNITY_ID is null)
                       where r = 1)
  and LPYT = '储藏室/阁楼';


--办公
insert into T_COLLECT_COMMUNITY_PRICE_HIS (ID, COMMUNITY_ID, LPYT, PRICE, VERSION, DATA_SOURCE, CREATE_USER,
                                           CREATE_TIME, BZ)
select sys_guid(),
       COMMUNITY_ID,
       FWYT,
       PRICE,
       '202208',
       '国信达',
       'zhangbin',
       sysdate,
       '825添加'
from (select a.COMMUNITY_ID, a.PRICE, a.FWYT, row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
      from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
            where v.fwyt = '办公') a
               left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '办公'
               left join T_COLLECT_COMMUNITY_PRICE_HIS c
                         on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '办公' and c.DATA_SOURCE = '国信达'
      where a.BZ = '0825新增价格'
        and b.COMMUNITY_ID is not null
        and c.COMMUNITY_ID is null)
where r = 1;



select *
from T_COLLECT_COMMUNITY_PRICE_HIS
where COMMUNITY_ID in (select COMMUNITY_ID
                       from (select a.COMMUNITY_ID,
                                    a.PRICE,
                                    a.FWYT,
                                    row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
                             from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
                                   from v_community_gl_zrz_xq3_gxd v
                                            left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
                                   where v.fwyt = '办公') a
                                      left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '办公'
                                      left join T_COLLECT_COMMUNITY_PRICE_HIS c
                                                on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '办公' and
                                                   c.DATA_SOURCE = '国信达'
                             where a.BZ = '0825新增价格'
                               and b.COMMUNITY_ID is not null
                               and c.COMMUNITY_ID is null)
                       where r = 1)
  and LPYT = '办公'
  and DATA_SOURCE = '国信达';

select *
from T_COMMUNITY_YT
where COMMUNITY_ID in (select COMMUNITY_ID
                       from (select a.COMMUNITY_ID,
                                    a.PRICE,
                                    a.FWYT,
                                    row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
                             from (select v.*,
                                          pz.price price_jz,
                                          pz.fwyt  fwyt_jz,
                                          pz.data_source,
                                          pz.BZ
                                   from v_community_gl_zrz_xq3_gxd v
                                            left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
                                   where v.fwyt = '办公') a
                                      left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '办公'
                                      left join T_COLLECT_COMMUNITY_PRICE_HIS c
                                                on a.COMMUNITY_ID = c.COMMUNITY_ID and
                                                   c.LPYT = '办公' and
                                                   c.DATA_SOURCE = '国信达'
                             where a.BZ = '0825新增价格'
                               and b.COMMUNITY_ID is not null
                               and c.COMMUNITY_ID is null)
                       where r = 1)
  and LPYT = '办公';
--公寓
insert into T_COLLECT_COMMUNITY_PRICE_HIS (ID, COMMUNITY_ID, LPYT, PRICE, VERSION, DATA_SOURCE, CREATE_USER,
                                           CREATE_TIME, BZ)
select sys_guid(),
       COMMUNITY_ID,
       FWYT,
       PRICE,
       '202208',
       '国信达',
       'zhangbin',
       sysdate,
       '825添加'
from (select a.COMMUNITY_ID, a.PRICE, a.FWYT, row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
      from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
            where v.fwyt = '公寓') a
               left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '公寓'
               left join T_COLLECT_COMMUNITY_PRICE_HIS c
                         on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '公寓' and c.DATA_SOURCE = '国信达'
      where a.BZ = '0825新增价格'
        and b.COMMUNITY_ID is not null
        and c.COMMUNITY_ID is null)
where r = 1;



select *
from T_COLLECT_COMMUNITY_PRICE_HIS
where COMMUNITY_ID in (select COMMUNITY_ID
                       from (select a.COMMUNITY_ID,
                                    a.PRICE,
                                    a.FWYT,
                                    row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
                             from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source, pz.BZ
                                   from v_community_gl_zrz_xq3_gxd v
                                            left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
                                   where v.fwyt = '公寓') a
                                      left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '公寓'
                                      left join T_COLLECT_COMMUNITY_PRICE_HIS c
                                                on a.COMMUNITY_ID = c.COMMUNITY_ID and c.LPYT = '公寓' and
                                                   c.DATA_SOURCE = '国信达'
                             where a.BZ = '0825新增价格'
                               and b.COMMUNITY_ID is not null
                               and c.COMMUNITY_ID is null)
                       where r = 1)
  and LPYT = '公寓'
  and DATA_SOURCE = '国信达';

select *
from T_COMMUNITY_YT
where COMMUNITY_ID in (select COMMUNITY_ID
                       from (select a.COMMUNITY_ID,
                                    a.PRICE,
                                    a.FWYT,
                                    row_number() over (partition by a.COMMUNITY_ID order by a.PRICE) r
                             from (select v.*,
                                          pz.price price_jz,
                                          pz.fwyt  fwyt_jz,
                                          pz.data_source,
                                          pz.BZ
                                   from v_community_gl_zrz_xq3_gxd v
                                            left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
                                   where v.fwyt = '公寓') a
                                      left join T_COMMUNITY_YT b on a.COMMUNITY_ID = b.COMMUNITY_ID and b.LPYT = '公寓'
                                      left join T_COLLECT_COMMUNITY_PRICE_HIS c
                                                on a.COMMUNITY_ID = c.COMMUNITY_ID and
                                                   c.LPYT = '公寓' and
                                                   c.DATA_SOURCE = '国信达'
                             where a.BZ = '0825新增价格'
                               and b.COMMUNITY_ID is not null
                               and c.COMMUNITY_ID is null)
                       where r = 1)
  and LPYT = '公寓';
