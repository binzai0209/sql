-- 多层
insert into T_PRICE_ZRZ_TEMP (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2020更新',
       '多层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ_TEMP c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2020更新多层12.05入库'
        AND a.LPYT = '多层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;


insert into T_PRICE_ZRZ_TEMP (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2020更新',
       '多层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ_TEMP c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2020更新多层12.05入库'
        AND a.LPYT = '高层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 7
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) < 33;

-- 别墅
insert into T_PRICE_ZRZ_TEMP (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2020更新',
       a.LPYT
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             a.LPYT,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ_TEMP c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2020更新别墅1205入库'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 4;

-- 住宅
insert into T_PRICE_ZRZ_TEMP (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2020更新'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ_TEMP c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2020更新住宅1205入库'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null
        and a.COMMUNITY_ID not in (select COMMUNITY_ID
                                   from T_DATA_PGCG_XQ_ZZ_GXD
                                   where BZ = '2020更新住宅1205入库'
                                   group by COMMUNITY_ID, LPYT
                                   having count(0) > 1)) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

select BDCDYID,count(0)
from T_PRICE_ZRZ_TEMP group by BDCDYID having count(0) >1;

select *
from T_PRICE_ZRZ_TEMP where BDCDYID = '1496300';

select count(0)
from T_PRICE_ZRZ_TEMP;

select count(0)
from T_H_PRICE_JZ_2020ZJ ;

select count(0)
from T_H_PRICE_JZ_2020ZJ where FWYT = '住宅' and PRICE is not null ;


delete
from T_H_PRICE_JZ_2020ZJ
where FWYT is null ;

select *
from T_H_PRICE_JZ_2020ZJ where ZRZBDCDYID in (select T_PRICE_ZRZ_TEMP.BDCDYID from T_PRICE_ZRZ_TEMP) and FWYT = '住宅' and PRICE is not null ;