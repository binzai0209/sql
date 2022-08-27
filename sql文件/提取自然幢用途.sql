truncate table T_DATA_TQJG_ZRZ;

-- 插入'住宅', '储藏室/阁楼', '地下室', '商铺', '公寓', '办公'
insert into T_DATA_TQJG_ZRZ(bdcdyid, xmmc, bdcdyh, xmbh, zddm, zdbdcdyid, zrzh, zl, jgrq, zcs, dscs, dxcs, ghyt,
                            fwjg, zts, qxdm, qxmc, bdcdyh_new, bdcdyh_old, zdbdcdyid_new, jzjg, tqzh, fwyt4, fwyt5,
                            id)
select a.BDCDYID,
       a.XMMC,
       a.BDCDYH,
       a.XMBH,
       a.ZDDM,
       a.ZDBDCDYID,
       a.ZRZH,
       a.ZL,
       a.JGRQ,
       a.ZCS,
       a.DSCS,
       a.DXCS,
       a.GHYT,
       a.FWJG,
       a.ZTS,
       a.QXDM,
       a.QXMC,
       a.BDCDYH_NEW,
       a.BDCDYH_OLD,
       a.ZDBDCDYID_NEW,
       a.JZJG,
       a.TQZH,
       b.FWYT4,
       b.FWYT4,
       sys_guid()
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT4,
                                 row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                          from T_BASE_H_XZ where delete_flag is null) a
                    where a.r = 1) b
                   on a.BDCDYID = b.ZRZBDCDYID
where b.FWYT4 is not null;

-- 插入车位
insert into T_DATA_TQJG_ZRZ(bdcdyid, xmmc, bdcdyh, xmbh, zddm, zdbdcdyid, zrzh, zl, jgrq, zcs, dscs, dxcs, ghyt,
                            fwjg, zts, qxdm, qxmc, bdcdyh_new, bdcdyh_old, zdbdcdyid_new, jzjg, tqzh, fwyt4, fwyt5,
                            id)
select a.BDCDYID,
       a.XMMC,
       a.BDCDYH,
       a.XMBH,
       a.ZDDM,
       a.ZDBDCDYID,
       a.ZRZH,
       a.ZL,
       a.JGRQ,
       a.ZCS,
       a.DSCS,
       a.DXCS,
       a.GHYT,
       a.FWJG,
       a.ZTS,
       a.QXDM,
       a.QXMC,
       a.BDCDYH_NEW,
       a.BDCDYH_OLD,
       a.ZDBDCDYID_NEW,
       a.JZJG,
       a.TQZH,
       '车位/车库',
       b.FWYT3,
       sys_guid()
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT3,
                                 row_number() over (partition by ZRZBDCDYID,FWYT3 order by ZRZBDCDYID) r
                          from T_BASE_H_XZ
                          where FWYT4 = '车位/车库' and DELETE_FLAG is null ) a
                    where a.r = 1) b
                   on a.BDCDYID = b.ZRZBDCDYID
where b.FWYT3 is not null;


insert into T_DATA_TQJG_ZRZ(bdcdyid, xmmc, bdcdyh, xmbh, zddm, zdbdcdyid, zrzh, zl, jgrq, zcs, dscs, dxcs, ghyt,
                            fwjg, zts, qxdm, qxmc, bdcdyh_new, bdcdyh_old, zdbdcdyid_new, jzjg, tqzh, fwyt4, fwyt5,
                            id)
select a.BDCDYID,
       a.XMMC,
       a.BDCDYH,
       a.XMBH,
       a.ZDDM,
       a.ZDBDCDYID,
       a.ZRZH,
       a.ZL,
       a.JGRQ,
       a.ZCS,
       a.DSCS,
       a.DXCS,
       a.GHYT,
       a.FWJG,
       a.ZTS,
       a.QXDM,
       a.QXMC,
       a.BDCDYH_NEW,
       a.BDCDYH_OLD,
       a.ZDBDCDYID_NEW,
       a.JZJG,
       a.TQZH,
       b.FWYT4,
       b.FWYT4,
       sys_guid()
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT4,
                                 row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                          from T_BASE_H_XZ) a
                    where a.r = 1
                      and FWYT4 in ('仓储', '商务', '车间', '工业', '商业服务', '商场', '商业', '商业服务')) b
                   on a.BDCDYID = b.ZRZBDCDYID
where b.FWYT4 is not null;

select count(BDCDYID)
from T_DATA_TQJG_ZRZ;

select QXDM,count(0)
from T_DATA_TQJG_ZRZ group by QXDM ;

select ZRZBDCDYID,count(0)
from V_COMMUNITY_GL_ZRZ group by ZRZBDCDYID having count(0)> 1;

select *
from V_COMMUNITY_GL_ZRZ where ZRZBDCDYID = '431027';

select *
from T_DATA_TQJG_ZRZ where FWYT4 is null ;

select BDCDYID, FWYT5,count(0)
from T_DATA_TQJG_ZRZ
group by BDCDYID, FWYT5
having count(0) > 1;

select *
from T_DATA_TQJG_ZRZ_0814
where FWYT4 = '车位/车库'
  and FWYT5 <> '车位/车库';


select a.BDCDYID, a.FWYT5, b.BDCDYID, b.FWYT5
from T_DATA_TQJG_ZRZ a
         left join T_DATA_TQJG_ZRZ_0814 b on a.BDCDYID = b.BDCDYID and a.FWYT5 = b.FWYT5
where b.BDCDYID is null;



select distinct ZRZBDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID in (select a.BDCDYID
                     from T_DATA_TQJG_ZRZ a
                              left join T_DATA_TQJG_ZRZ_0814 b on a.BDCDYID = b.BDCDYID and a.FWYT5 = b.FWYT5
                     where b.BDCDYID is null)
order by ZRZBDCDYID;

update T_DATA_TQJG_ZRZ a
set (CLZT, QSZT, SFWQ, DEL_FLAG, UPDATE_FLAG) =(select CLZT, QSZT, SFWQ, DEL_FLAG, UPDATE_FLAG
                                                from T_DATA_TQJG_ZRZ_0815 b
                                                where a.BDCDYID = b.BDCDYID
                                                  and a.FWYT4 = b.FWYT4)
where exists(select 1 from T_DATA_TQJG_ZRZ_0815 b where a.BDCDYID = b.BDCDYID and a.FWYT4 = b.FWYT4);


select count(0)
from T_BASE_H_XZ t
where t.fwyt3 like '%住%'
  and t.fwyt4 = '公寓'
  and fwyt3 != '居住（单身职工公寓）';

update T_BASE_H_XZ t
set t.fwyt4='住宅'
where t.fwyt3 like '%住%'
  and t.fwyt4 = '公寓'
  and fwyt3 != '居住（单身职工公寓）';



