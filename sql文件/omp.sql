select *
from T_YW_PRICE_FEEDBACK;

select *
from V_COMMUNITY_GL_ZRZ;


select a.bdcdyid,
       a.bdcdyh,
       a.fwbm,
       a.zrzbdcdyid,
       a.zdbdcdyid,
       a.zl,
       a.qsc,
       a.szc,
       a.zcs,
       a.fwyt3,
       a.fwyt4,
       a.scjzmj,
       a.qxdm,
       a.qxmc,
       THPJ.PRICE as bz
from t_realestate_h_xz a
         left join
     t_price_jz_h THPJ
     on a.BDCDYID = THPJ.BDCDYID
WHERE a.fwbm = '370181001008GB00001F10190041';

select *
from T_H_PRICE_RECORD;
select *
from T_ZRZ_PRICE_RECORD;

select *
from T_PRICE_JZ_ZRZ
where JZMJ is null;

select *
from V_COMMUNITY_GL_ZRZ
where ZRZBDCDYID = '209133000';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '935d4cc2011f411d88ab08fd79a3b988';

select *
from t_zrz_price_record;

update T_PRICE_JZ_ZRZ a
set JZMJ = (select SCJZMJ from T_REALESTATE_ZRZ_XZ b where a.BDCDYID = b.BDCDYID)
where exists(select 1 from T_REALESTATE_ZRZ_XZ b where a.BDCDYID = b.BDCDYID)
  and JZMJ is null;

select *
from T_PRICE_JZ_ZRZ
where QXDM is null;

truncate table T_PRICE_JZ_H_BG;

select id,
       chk_list_id,
       xh,
       field_name,
       field_declare,
       is_not_null,
       field_length,
       digits_length,
       repetition_chk,
       gl_field,
       gl_method,
       gl_rule_ori,
       gl_rule,
       enum_chk,
       constant_value,
       value_range,
       gl_shp,
       column_type,
       java_type,
       java_field,
       label_type,
       field_sort,
       table_name,
       value_type,
       regular_expression
from t_check_rule
WHERE chk_list_id = 'd505c1d946134c41ac2c22dfe39949ef'
order by table_name,
         field_sort desc;

select *
from t_check_rule
where XH is null;

select SMX, SMY, LAT, LNG
from T_REALESTATE_COMMUNITY
where COMMUNITY = '测试楼盘217';

select *
from T_REALESTATE_COMMUNITY
where SMID = '6091';

select SFLD, SFSH, SFGL, ID, SFSH
from T_REALESTATE_COMMUNITY
where COMMUNITY = '测试楼盘217';



select *
from T_COMMUNITY_ZD
where COMMUNITY_ID = '20';

rename T_COMMUNITY_ZRZ to T_COMMUNITY_ZD;

select *
from T_COMMUNITY_ZRZ
where COMMUNITY_ID = '20';

select count(0)
from T_COMMUNITY_ZD;

select count(0)
from T_COMMUNITY_ZRZ;

truncate table T_REALESTATE_COMMUNITY;

INSERT INTO EST_FRAMEWORK.SYS_DICT_TYPE (DICT_ID, DICT_NAME, DICT_TYPE, STATUS, CREATE_BY, CREATE_TIME, UPDATE_BY,
                                         UPDATE_TIME, REMARK)
VALUES (789, '类型正则', 'regular_type', '0', 'admin', TIMESTAMP '2022-11-07 10:43:37', null, null, null);

select *
from T_SCAN_TASK
where TASK_NAME like '%测试%';

delete
from T_REALESTATE_H_XZ
where ZRZBDCDYID = '1134724';

select replace('东、西、南', '、', ',')
from dual;

select *
from T_YW_PRICE_FEEDBACK;

select *
from t_scan_task;

select *
from T_YW_PRICE_FEEDBACK;

select *
from t_check_task;

select QXDM
from T_REALESTATE_ZRZ_XZ
where BDCDYID = '1134724';


select *
from T_YW_PRICE_FEEDBACK;

select *
from T_PRICE_JZ_H
where ZRZBDCDYID = '1512563'
  and FWYT = '办公';

select *
from T_PRICE_JZ_ZRZ
where BDCDYID in (select ZRZBDCDYID
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY_ID = 'dac5d9af621143ee91a4446556d4b097');
select ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = 'dac5d9af621143ee91a4446556d4b097';

select *
from t_chk_record
where CHK_ID = '14';

truncate table T_REALESTATE_ENTERPRISE;

select id,
       chk_id,
       chk_target,
       chk_type,
       chk_recorde,
       field_name,
       field_value,
       bdcdyh,
       bdcdyid,
       label_type,
       enum_name,
       field_name_desc,
       create_by,
       create_time
from t_chk_record
where chk_id = '14';

select id,
       chk_id,
       chk_target,
       chk_type,
       chk_recorde,
       field_name,
       field_value,
       bdcdyh,
       bdcdyid,
       label_type,
       enum_name,
       field_name_desc,
       create_by,
       create_time
from t_chk_record
WHERE chk_id = '14'
  and BDCDYID = '51778327';

delete
from t_realestate_enterprise
where GSMC in (select GSMC
               from t_realestate_enterprise
               where TYPE = '2'
               group by GSMC
               having count
                          (GSMC) > 1)
  and rowid not in (select min(rowid)
                    from t_realestate_enterprise
                    where TYPE = '2'
                    group by GSMC
                    having count(GSMC
                               ) > 1);

select *
from T_DATA_WQJG_230306;

select replace(replace('"12,34.00"', '"', ''), ',', '')
from dual;

-- create table T_DATA_WQJG_1 as
-- select YWH,
--        HTH,
--        YWLX,
--        BDCDYH,
--        FWBM,
--        ZL,
--        JZMJ,
--        SQRLX,
--        ZJLX,
--        to_number(replace(replace(WQJG, '"', ''), ',', '')) as WQJG,
--        to_date(WQRQ, 'yyyy-MM-dd hh24:mi:ss')              AS WQRY,
--        STATUS,
--        SSQX,
--        XZQ,
--        to_date(BARQ, 'yyyy-MM-dd hh24:mi:ss')              AS BARQ,
--        LXDH,
--        QLRMC,
--        ZJH
-- from T_DATA_WQJG_230306
-- where WQRQ is not null
--   and BARQ is not null
--   and wqjg is not null;


select BARQ
from T_DATA_WQJG_230306
where BARQ like '%A%';
select *
from T_DATA_WQJG_230306
where WQRQ = '272000';

truncate table T_DATA_WQJG_230306;

select count(0)
from T_DATA_WQJG_230306_TEST;

select *
from T_DATA_WQJG_230306;
update T_DATA_WQJG_230306
set WQJG1 = replace(replace(WQJG, '"', ''), ',', '')
where WQJG is not null
  and WQJG != '0.00';

select *
from T_DATA_WQJG_230306
where WQJG = '0.00';

select *
from T_DATA_WQJG_230306;

truncate table T_DATA_WQJG_230306;

create table T_DATA_WQJG_230306_test parallel 8 as
select *
from T_DATA_WQJG_230306 nologging;

select *
from T_DATA_WQJG_230306;

select *
from T_DATA_WQJG_230306;

-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

-- 22817
ALTER system kill session '47, 43465';

alter system kill session '273,22717' immediate;

update T_DATA_WQJG_230306
set ID ='1'
where ID is null;

truncate table T_DATA_ERFJG_020306;

select name, value$
from sys.props$
where name like 'NLS%';

select count(0)
from T_DATA_ERFJG_020306;

select replace('2012.00', '.00', '')
from dual;

update T_DATA_ERFJG_020306
set YWH  =replace(YWH, '.00', ''),
    FWBH =replace(FWBH, '.00', ''),
    ZJH  =replace(ZJH, '.00', ''),
    LXDH =replace(LXDH, '.00', '');

truncate table T_DATA_ERFJG_020306;

create table T_DATA_ERFJG_1 as
select ywh,
       djlb,
       ssqx,
       xzq,
       bdcdyh,
       fwbh,
       zl,
       to_number(replace(replace(jzmj, '"', ''), ',', ''))                          as jzmj,
       qlrlx,
       qlrmc,
       zjh,
       lxdh,
       to_date(replace(replace(djsj, 'AM', ''), 'PM', ''), 'yyyy/MM/dd hh24:mi:ss') as djsj,
       status,
       to_number(replace(replace(zzhtqj, '"', ''), ',', ''))                        as zzhtqj,
       to_number(replace(replace(fzzhtqj, '"', ''), ',', ''))                       as fzzhtqj,
       to_number(replace(replace(zzjsbz, '"', ''), ',', ''))                        as zzjsbz,
       to_number(replace(replace(fzzjsbz, '"', ''), ',', ''))                       as fzzjsbz
from T_DATA_ERFJG_020306;

select *
from T_DATA_ERFJG_020306
where JZMJ = '有效';

select *
from T_REALESTATE_COMMUNITY
where LPYT is not null;

select *
from T_DATA_ERFJG_020306_test;

insert into T_DATA_ERFJG_1
select ywh,
       djlb,
       ssqx,
       xzq,
       bdcdyh,
       fwbh,
       zl,
       to_number(replace(replace(jzmj, '"', ''), ',', ''))                          as jzmj,
       qlrlx,
       qlrmc,
       zjh,
       lxdh,
       to_date(replace(replace(djsj, 'AM', ''), 'PM', ''), 'yyyy/MM/dd hh24:mi:ss') as djsj,
       status,
       to_number(replace(replace(zzhtqj, '"', ''), ',', ''))                        as zzhtqj,
       to_number(replace(replace(fzzhtqj, '"', ''), ',', ''))                       as fzzhtqj,
       to_number(replace(replace(zzjsbz, '"', ''), ',', ''))                        as zzjsbz,
       to_number(replace(replace(fzzjsbz, '"', ''), ',', ''))                       as fzzjsbz
from T_DATA_ERFJG_020306_test;



select *
from T_DATA_ERFJG_020306
where JZMJ = '"1,447.93"';



-- create table T_DATA_WQJG_1 as
-- select YWH,
--        HTH,
--        YWLX,
--        BDCDYH,
--        FWBM,
--        ZL,
--        JZMJ,
--        SQRLX,
--        ZJLX,
--        to_number(replace(replace(WQJG, '"', ''), ',', ''))                                                 as WQJG,
--        to_date(replace(replace(t.wqrq, 'AM', ''), 'PM', ''), 'yyyy/MM/dd hh24:mi:ss')                      AS WQRY,
--        STATUS,
--        SSQX,
--        XZQ,
--        to_date(replace(replace(barq, 'AM', ''), 'PM', ''), 'yyyy/MM/dd hh24:mi:ss')                        AS BARQ,
--        LXDH,
--        QLRMC,
--        ZJH,
--        to_char(to_date(replace(replace(t.wqrq, 'AM', ''), 'PM', ''), 'yyyy/MM/dd hh24:mi:ss'), 'yyyyMMdd') AS ymd
-- from EST_DATAOMP.T_DATA_WQJG_230306_TEST t;

insert into T_DATA_WQJG_1 (ywh, hth, ywlx, bdcdyh, fwbm, zl, jzmj, sqrlx, zjlx, wqjg, wqry, status, ssqx, xzq, barq,
                           lxdh, qlrmc, zjh,)
select ywh,
       hth,
       ywlx,
       bdcdyh,
       fwbm,
       zl,
       jzmj,
       sqrlx,
       zjlx,
       wqjg,
       wqry,
       status,
       ssqx,
       xzq,
       barq,
       lxdh,
       qlrmc,
       zjh
from T_DATA_WQJG_2;
select *
from T_DATA_WQJG_1;

select *
from T_DATA_WQJG_2;

select sum(JZMJ)
from T_DATA_WQJG_1
where ZL like '%槐荫区保利中心C地块1%'
  and WQJG > 1000000;

update T_DATA_WQJG_1
set JZMJ1 = to_number(replace(replace(JZMJ, '"', ''), ',', ''));


select *
from T_DATA_ERFJG_020306;

select *
from T_DATA_WQJG_230306_TEST
where regexp_like(trim(WQJG), '^([\-]?[0-9]+\.[0-9]+)$|^([\-]?[0-9])+$|^([\-]?[0-9]{1}\.[0-9]+E[\-]?[0-9])+$')

select distinct WQJG
from T_DATA_WQJG_230306_TEST
where WQJG is not null;
