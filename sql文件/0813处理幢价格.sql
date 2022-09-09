select QXDM, DATA_SOURCE, count(0)
from T_PRICE_ZRZ
group by QXDM, DATA_SOURCE
order by QXDM;

create table T_PRICE_ZRZ_0813 parallel 8 as
select *
from T_PRICE_ZRZ nologging;



create table T_H_PRICE_JZ_0830 parallel 8 as
select *
from T_H_PRICE_JZ nologging;


update T_H_PRICE_JZ
set OLD_PRICE = PRICE;

select *
from T_PRICE_ZRZ;

select *
from T_PRICE_ZRZ_0813;


update T_PRICE_ZRZ
set DATA_SOURCE = '4'
where JGLY in ('现场',
               '国信达',
               '现场提供',
               '调整价格',
               '3000',
               '评估公司',
               '槐荫现场',
               '国信达提供',
               '国信达价格',
               '评估公司提供',
               '国信达：重新核定',
               '国信达:重新核定');

select count(0)
from T_PRICE_ZRZ
where JGLY in ('槐荫税务',
               '税务调查报告',
               '自取价格被税务征用');

delete
from T_PRICE_ZRZ
where DATA_SOURCE not in ('1', '4');

update T_PRICE_ZRZ
set PRICE = null
where DATA_SOURCE not in ('1', '4');

select distinct DATA_SOURCE
from T_PRICE_ZRZ
where PRICE is not null;


select *
from T_PRICE_ZRZ as of timestamp to_timestamp('2022-08-13 08:00:00', 'yyyy-mm-dd hh24:mi:ss');
alter table T_PRICE_ZRZ
    enable row movement;
flashback table T_PRICE_ZRZ to timestamp to_timestamp('2022-08-13 08:00:00', 'yyyy-mm-dd hh24:mi:ss');


-- 插入车位车库历下价格
insert into T_PRICE_ZRZ (id, bdcdyid, COMMUNITY_ID, fwyt, price, zcs, QXDM, JZMJ, zl, DATA_SOURCE, bz)
select sys_guid(),
       a.BDCDYID,
       a.COMMUNITY_ID,
       '车位/车库',
       b."cwck",
       c.ZCS,
       c.QXDM,
       c.SCJZMJ,
       c.ZL,
       '4',
       '813国信达提供历下楼盘价格'
from V_COMMUNITY_GL_ZRZ a
         left join "comm_ccs_cw" b on a.COMMUNITY_ID = b."communityId"
         left join (select a.BDCDYID, a.ZL, a.QXDM, a.SCJZMJ, a.ZCS, b.FWYT4
                    from T_BASE_ZRZ_XZ a
                             left join (select *
                                        from (select ZRZBDCDYID,
                                                     FWYT4,
                                                     row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                                              from T_BASE_H_XZ
                                              where FWYT4 = '车位/车库')
                                        where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
                    where b.ZRZBDCDYID is not null) c on a.BDCDYID = c.BDCDYID
where b."communityId" is not null
  and c.BDCDYID is not null;

-- 插入车位车库历下价格
insert into T_PRICE_ZRZ (id, bdcdyid, COMMUNITY_ID, fwyt, price, zcs, QXDM, JZMJ, zl, DATA_SOURCE, bz)
select sys_guid(),
       a.BDCDYID,
       a.COMMUNITY_ID,
       '储藏室/阁楼',
       b."ccs",
       c.ZCS,
       c.QXDM,
       c.SCJZMJ,
       c.ZL,
       '4',
       '813国信达提供历下楼盘价格'
from V_COMMUNITY_GL_ZRZ a
         left join "comm_ccs_cw" b on a.COMMUNITY_ID = b."communityId"
         left join (select a.BDCDYID, a.ZL, a.QXDM, a.SCJZMJ, a.ZCS, b.FWYT4
                    from T_BASE_ZRZ_XZ a
                             left join (select *
                                        from (select ZRZBDCDYID,
                                                     FWYT4,
                                                     row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                                              from T_BASE_H_XZ
                                              where FWYT4 = '储藏室/阁楼')
                                        where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
                    where b.ZRZBDCDYID is not null) c on a.BDCDYID = c.BDCDYID
where b."communityId" is not null
  and c.BDCDYID is not null;

-- 插入历下办公价格
insert into T_PRICE_ZRZ (id, bdcdyid, COMMUNITY_ID, fwyt, price, zcs, QXDM, JZMJ, zl, DATA_SOURCE, bz)
select sys_guid(),
       a.BDCDYID,
       a.COMMUNITY_ID,
       '办公',
       b."bg",
       c.ZCS,
       c.QXDM,
       c.SCJZMJ,
       c.ZL,
       '4',
       '813国信达提供历下楼盘价格'
from V_COMMUNITY_GL_ZRZ a
         left join "comm_bg" b on a.COMMUNITY_ID = b."communityid"
         left join (select a.BDCDYID, a.ZL, a.QXDM, a.SCJZMJ, a.ZCS, b.FWYT4
                    from T_BASE_ZRZ_XZ a
                             left join (select *
                                        from (select ZRZBDCDYID,
                                                     FWYT4,
                                                     row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                                              from T_BASE_H_XZ
                                              where FWYT4 = '办公')
                                        where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
                    where b.ZRZBDCDYID is not null) c on a.BDCDYID = c.BDCDYID
where b."communityid" is not null
  and c.BDCDYID is not null;





