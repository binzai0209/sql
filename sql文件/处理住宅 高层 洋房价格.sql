-- 高层
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库 高层',
       '高层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库'
        AND a.LPYT = '高层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 7
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) < 33;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库1026 高层',
       '高层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ like '2018年市税务局招标数据入库，%'
        AND a.LPYT = '高层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 7
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) < 33;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库，莱芜',
       '高层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库，莱芜高层'
        AND a.LPYT = '高层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 7
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) < 33;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库,12.06整理',
       '高层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库,12.06整理'
        AND a.LPYT = '高层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 7
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) < 33;

-- 洋房
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库 洋房',
       '洋房'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库'
        AND a.LPYT = '洋房'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库，莱芜',
       '洋房'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库，莱芜洋房'
        AND a.LPYT = '洋房'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;

-- 多层
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库 多层',
       '多层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库'
        AND a.LPYT = '多层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库',
       '多层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库，莱芜多层'
        AND a.LPYT = '多层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库1026 多层',
       '多层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ like '2018年市税务局招标数据入库，%'
        AND a.LPYT = '多层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库,12.02整理',
       '多层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库,12.02整理'
        AND a.LPYT = '多层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 4
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 7;


-- 超高层
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库 多层',
       '超高层'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库'
        AND a.LPYT = '超高层'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) > 33;

-- 别墅
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库 别墅',
       a.LPYT
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             a.LPYT,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库,单一小区别墅'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_TJ_ZRZ_FWYT c on a.ZRZBDCDYID = c.ZRZBDCDYID
where a.r = 1
  and decode(b.DSCS, null, c.DSCS, 0, c.dscs, b.DSCS) <= 4;

-- 住宅
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库 住宅'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null
        and a.COMMUNITY_ID not in (select COMMUNITY_ID
                                   from T_DATA_PGCG_XQ_ZZ_GXD
                                   where BZ = '2018年市税务局招标数据入库'
                                   group by COMMUNITY_ID, LPYT
                                   having count(0) > 1)) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库1026 住宅'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ like '2018年市税务局招标数据入库，%'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库1026 住宅'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ like '2018年市税务局招标数据入库，%'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库，1103有坐标住宅-小产权'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库，1103有坐标住宅-小产权'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库，莱芜'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库，莱芜住宅'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
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
       '2018年市税务局招标数据入库,12.06整理'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库,12.06整理'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;

select *
from T_PRICE_ZRZ
where BDCDYID = '幢未落地-100237';

select *
from T_DATA_TQJG_ZRZ
where BDCDYID = '幢未落地-100237';

select *
from T_BASE_H_XZ
where ZRZBDCDYID = '幢未落地-100237';


select count(0)
from T_BASE_H_XZ
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '2018年市税务局招标数据入库，莱芜')
  and FWYT4 = '住宅';

select *
from T_PRICE_ZRZ
where BZ = '2018年市税务局招标数据入库,12.06整理';

select *
from T_YW_PGCG
where PGRWID = '474914780395229238';

select *
from T_YW_PGRW
where id = ' ';

select PGBG_PATH,
       PGBG_PATH2,
       PGCG_ID,
       BGBH,
       CREATE_USER,
       PGBG_PATH_PDF,
       PGRW_ID,
       SFQZ,
       ID,
       CREATE_TIME,
       SIGNRECORD_ID
from t_yw_pgbg
where 1 = 1
  and pgrw_id = '474914780395229238';

select *
from t_yw_pgbg;

select *
from t_yw_signrecord;

select *
from T_YW_PGCG
where PGRWID = '';

select *
from T_YW_PRICE_FEEDBACK;

select *
from T_YW_PGRW
where zl = '历城区北园路16号金色港湾7号楼3-120';

select *
from T_YW_YWQD
where STATUS = '待办';

select *
from T_YW_PRICE_FEEDBACK
where zl = '历城区君授路66号中海华山珑城一区17号楼-201';

select *
from T_YW_PGRW;

select *
from T_CFG_COMMON_URL;

select *
from T_YW_PGRW where zl = '历城区君授路66号中海华山珑城一区17号楼-201';
select *
from T_YW_PGCG;

select *
from T_YW_PGRW;

select *
from T_YW_PRICE_FEEDBACK where zl = '历城区君授路66号中海华山珑城一区17号楼-201';

select *
from T_YW_PGBG;

select FWBM
from T_H_PRICE_JZ where BDCDYID = '46097936';

select *
from T_YW_PRICE_FEEDBACK where BDCDYID = '';

select *
from T_YW_PGRW where ZL = '历城区君授路66号中海华山珑城一区17号楼-201';

select * from T_YW_PGBG;

select *
from T_YW_PGRW where ZL = '历城区君授路66号中海华山珑城一区17号楼-201';

select *
from T_YW_PRICE_FEEDBACK where ZL = '历下区解放东路3号齐鲁百老会花苑B楼1301';

select *
from T_YW_PGRW where zl = '历下区解放东路3号齐鲁百老会花苑B楼1301';

select FWBM
from T_BASE_H_XZ where zl = '历下区解放东路3号齐鲁百老会花苑B楼1301';
select *
from T_YW_YWQD where zl = '历下区解放东路3号齐鲁百老会花苑B楼1301';



select *
from T_YW_YWQD where ZL = '历下区解放东路3号齐鲁百老会花苑B楼1301';
select *
from T_YW_PRICE_FEEDBACK where ZL = '历下区解放东路3号齐鲁百老会花苑B楼1301';;

select *
from T_YW_PGBG where PGRW_ID = '474944226691010873';

select *
from T_YW_PGBG_EDITRECORD;

select *
from T_WORKFLOW_BASE_PROCACT;

select * from T_WORKFLOW_BASE_PROCDEF where 1=1;

select *

from T_WORKFLOW_ACTINST where PROCNUMB = 'PG-1002';

select *
from T_YW_PGRW where zl = '历下区解放东路3号齐鲁百老会花苑B楼1301';

select *
from T_YW_YWQD where ZL = '历下区解放东路3号齐鲁百老会花苑B楼1301';

select *
from T_YW_PGRW;

select *
from T_YW_PRICE_FEEDBACK where zl ='历下区解放东路3号齐鲁百老会花苑B楼1301';

select *
from t_yw_pgcg;

select *
from T_YW_PRICE_FEEDBACK;

select *
from T_YW_PGRW;

select *
from T_H_PRICE_JZ;

select *
from T_YW_PGBG where PGRW_ID = '474941190149132661';

select *
from T_YW_PRICE_FEEDBACK where ZL like '历城区君授路66号中海华山珑城一区17号楼%';

select *
from T_YW_YWQD;

select *
from T_YW_PGRW
where RWLY = '4';

update T_YW_PRICE_FEEDBACK
set ISWJ = '0';

select *
from T_YW_YWQD;

select FWYT, count(0)
from T_H_PRICE_JZ
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '2018年市税务局招标数据入库，莱芜')
group by FWYT;

delete
from T_H_PRICE_JZ
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '2018年市税务局招标数据入库，莱芜住宅')
  and FWYT = '住宅';

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, QXMC, ZCS, SCJ, bz)
select sys_guid(),
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       b.BDCDYID,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       a.SCJ,
       '2018年市税务局招标数据入库,12.02整理遗漏'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             a.SCJ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null
        AND a.BZ = '2018年市税务局招标数据入库,12.02整理'
        AND a.LPYT = '住宅'
        and a.JG_ZZ is not null) a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

delete
from T_PRICE_ZRZ
where BZ = '2018年市税务局招标数据入库，莱芜住宅';

select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;

select *
from T_PRICE_ZRZ
where BDCDYID = '-1383637';

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '1327913'
  and FWYT = '储藏室/阁楼';


select *
from T_PRICE_ZRZ
where BDCDYID = '632260';
select *
from T_PRICE_ZRZ
where BZ = '2018年市税务局招标数据入库，莱芜住宅';

select *
from T_PRICE_ZRZ
where BDCDYID = 'aaad4abd39dc41ff9aec573b1a85fa96';

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '1521543'
  and FWYT = '办公';



select count(0)
from T_BASE_H_XZ
where ZRZBDCDYID in (select BDCDYID
                     from T_PRICE_ZRZ
                     where FWYT = '住宅')
  and FWYT4 = '住宅';

select count(0)
from T_H_PRICE_JZ
where FWYT = '住宅';

select *
from T_PRICE_ZRZ
where BZ = '2018年市税务局招标数据入库 多层';

create table T_H_PRICE_JZ_item1 as
select *
from T_H_PRICE_JZ
where FWYT <> '住宅'
   or FWYT is null;

select *
from T_PRICE_ZRZ;

create table T_PRICE_ZRZ_1027 parallel 8 as
select *
from T_PRICE_ZRZ nologging;


select count(0)
from T_H_PRICE_JZ;

delete
from T_H_PRICE_JZ
where FWYT = '住宅';

select ZRZBDCDYID, DSCS
from V_TJ_ZRZ_FWYT;

select COMMUNITY_ID
from T_DATA_PGCG_XQ_ZZ_GXD
where bz = '2018年市税务局招标数据入库，1028有坐标住宅';

select a.LPYT, count(0)
from T_DATA_PGCG_XQ_ZZ_GXD a
         left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
where a.BZ = '2018年市税务局招标数据入库，1103有坐标住宅-小产权'
group by a.LPYT;


select COMMUNITY_ID
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ = '2018年市税务局招标数据入库'
group by COMMUNITY_ID, LPYT
having count(0) > 1;

select COMMUNITY_ID, LPYT, count(0)
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ = '2018年市税务局招标数据入库，莱芜高层'
group by COMMUNITY_ID, LPYT;


select LPYT, count(0)
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ like '2018年市税务局招标数据入库，%'
group by LPYT;

select *
from T_BEV_TASK_SCOPE;


select count(0)
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ like '2018年市税务局招标数据入库，%';

select distinct BDCDYID
from T_YW_PRICE_FEEDBACK;

select distinct FWYT
from T_H_PRICE_JZ;

select a.BDCDYID, a.NEW_PRICE, b.PRICE, a.NEW_PRICE - b.PRICE, a.FWBM
from T_YW_PRICE_FEEDBACK a
         left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID
where a.NEW_PRICE - b.PRICE <> 0;

select *
from T_YW_PRICE_FEEDBACK
where BDCDYID = '38940087';

select PRICE

from T_H_PRICE_JZ
where BDCDYID = '38940087';

select count(0)
from T_H_PRICE_JZ
where BZ = '20221026 重新处理价格';

update T_H_PRICE_JZ
set PRICE       = SCJ / 1.05,
    PRICE_TOTAL = (SCJ / 1.05) * JZMJ
where BZ = '20221026 重新处理价格';



update T_H_PRICE_JZ
set SCJ = PRICE,
    BZ='20221026 重新处理价格'
where id in (select id
             from T_H_PRICE_JZ
             where PRICE is not null
               and FWYT not in ('住宅', '商务', '商业服务', '商铺', '工业', '商场', '商业', '商业商务', '工业厂房')
               and ISONE is null
               and id not in (select ID
                              from T_H_PRICE_JZ
                              where ZRZBDCDYID in (select ZRZBDCDYID
                                                   from V_COMMUNITY_GL_ZRZ
                                                   where COMMUNITY = '西江华府二区'
                                                     and ZRZ_ZL like '%西江华府一区%')
                                and FWYT = '车位/车库'));

select *
from T_H_PRICE_JZ
where id in (select ID
             from T_H_PRICE_JZ
             where ZRZBDCDYID in (select ZRZBDCDYID
                                  from V_COMMUNITY_GL_ZRZ
                                  where COMMUNITY = '西江华府二区'
                                    and ZRZ_ZL like '%西江华府一区%')
               and FWYT = '车位/车库');

select id
from T_H_PRICE_JZ
where PRICE is not null
  and FWYT not in ('住宅', '商务', '商业服务', '商铺', '工业', '商场', '商业', '商业商务', '工业厂房')
  and ISONE is null
  and id not in (select ID
                 from T_H_PRICE_JZ
                 where ZRZBDCDYID in (select ZRZBDCDYID
                                      from V_COMMUNITY_GL_ZRZ
                                      where COMMUNITY = '西江华府二区'
                                        and ZRZ_ZL like '%西江华府一区%')
                   and FWYT = '车位/车库');

select count(0)
from T_H_PRICE_JZ
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY = '西江华府二区'
                       and ZRZ_ZL like '%西江华府一区%')
  and FWYT = '车位/车库';

update T_H_PRICE_JZ
set PRICE       = 5333.33,
    PRICE_TOTAL = JZMJ * 5333.33,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ          = '西江华府一区：车位面积32-34       按5600市场价  5333.33（不含税）        面积40-47     按5040 市场价       4800（不含税）'
where FWYT = '车位/车库'
  and ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY = '西江华府二区'
                       and ZRZ_ZL like '%西江华府一区%')
  and JZMJ >= 31
  and jzmj <= 34;

update T_H_PRICE_JZ
set PRICE       = 4800,
    PRICE_TOTAL = JZMJ * 4800,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ          = '西江华府一区：车位面积32-34       按5600市场价  5333.33（不含税）        面积40-47     按5040 市场价       4800（不含税）'
where FWYT = '车位/车库'
  and ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY = '西江华府二区'
                       and ZRZ_ZL like '%西江华府一区%')
  and JZMJ >= 40
  and jzmj <= 47;

select ZL
from T_H_PRICE_JZ
where ZL like '%西江华府%'
  and FWYT = '车位/车库'
order by ZL;

select a.BDCDYID 户id, a.ZRZBDCDYID 自然幢id, b.COMMUNITY_ID 楼盘id, a.ZL 户坐落, b.ZRZ_ZL 自然幢坐落, b.COMMUNITY 楼盘名称
from (select BDCDYID, ZRZBDCDYID, zl, FWYT, row_number() over (partition by BDCDYID order by BDCDYID) r
      from T_YW_PRICE_FEEDBACK) a
         left join V_COMMUNITY_GL_ZRZ b on a.ZRZBDCDYID = b.ZRZBDCDYID
where r = 1;

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY like '%鼎秀家园%';

select count(0)
from T_H_PRICE_JZ
where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY like '%鼎秀家园%')
  and FWYT in ('储藏室/阁楼', '车位/车库');

select *
from T_H_PRICE_JZ
where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY like '%鼎秀家园%')
  and FWYT = '车位/车库';

update T_H_PRICE_JZ
set PRICE       = SCJ,
    PRICE_TOTAL = SCJ * JZMJ,
    BZ          = '西江华府'
where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY like '%西江华府%')
  and FWYT = '车位/车库';

update T_H_PRICE_JZ
set PRICE       = SCJ,
    PRICE_TOTAL = SCJ * JZMJ,
    BZ          = null
where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY like '%鼎秀家园%')
  and FWYT in ('储藏室/阁楼', '车位/车库');

select *
from T_PRICE_ZRZ
where BDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY like '%鼎秀家园%');


update T_PRICE_ZRZ
set SCJ = PRICE
where SCJ is null;

select a.BDCDYID, a.FWYT, b.FWYT, a.PRICE, b.PRICE, round(a.PRICE / 1.05, 6)
from T_PRICE_ZRZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT,
                                 PRICE,
                                 row_number() over ( partition by ZRZBDCDYID order by ZRZBDCDYID) r
                          from T_H_PRICE_JZ
                          where FWYT <> '住宅'
                            and PRICE is not null)
                    where r = 1) b on a.BDCDYID = b.ZRZBDCDYID and a.FWYT = b.FWYt
where b.PRICE - round(a.PRICE / 1.05, 6) <> 0;

select *
from (select ZRZBDCDYID, FWYT, NEW_PRICE, row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
      from T_YW_PRICE_FEEDBACK
      where FWYT <> '车位/车库')
where r = 1;

update T_PRICE_ZRZ a
set PRICE = (select NEW_PRICE
             from (select ZRZBDCDYID,
                          FWYT3,
                          NEW_PRICE,
                          row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                   from T_YW_PRICE_FEEDBACK
                   where FWYT = '车位/车库') b
             where r = 1
               and a.BDCDYID = b.ZRZBDCDYID
               and a.FWYT = b.FWYT3)
where EXISTS(select 1
             from (select ZRZBDCDYID,
                          FWYT3,
                          NEW_PRICE,
                          row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                   from T_YW_PRICE_FEEDBACK
                   where FWYT = '车位/车库') b
             where r = 1
               and a.BDCDYID = b.ZRZBDCDYID
               and a.FWYT = b.FWYT3);

update T_PRICE_ZRZ a
set PRICE = (select b.PRICE
             from (select ZRZBDCDYID,
                          FWYT,
                          PRICE,
                          row_number() over ( partition by ZRZBDCDYID order by ZRZBDCDYID) r
                   from T_H_PRICE_JZ
                   where FWYT <> '住宅'
                     and PRICE is not null) b
             where b.r = 1
               and a.BDCDYID = b.ZRZBDCDYID
               and a.FWYT = b.FWYT),
    BZ='20221027更新'
where EXISTS(select 1
             from (select ZRZBDCDYID,
                          FWYT,
                          PRICE,
                          row_number() over ( partition by ZRZBDCDYID order by ZRZBDCDYID) r
                   from T_H_PRICE_JZ
                   where FWYT <> '住宅'
                     and PRICE is not null) b
             where b.r = 1
               and a.BDCDYID = b.ZRZBDCDYID
               and a.FWYT = b.FWYT);

select *
from T_YW_PRICE_FEEDBACK
where zl = '历下区新泺大街1666号齐盛广场6号楼107';

select distinct BDCDYID
from T_H_PRICE_RECORD a
where a.RECORD_ID = '450018169239671392';

select BDCDYID
from T_zrz_PRICE_RECORD a
where a.RECORD_ID = '450018169239671392';

select *
from T_COMMUNITY_PRICE_RECORD a
where a.RECORD_ID = '450018169239671392';

update T_H_PRICE_JZ
set PRICE       = null,
    PRICE_TOTAL = null,
    SCJ         = null,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ='清除误同步价格'
where id in (select id
             from T_H_PRICE_JZ
             where ZRZBDCDYID in (select BDCDYID
                                  from T_zrz_PRICE_RECORD a
                                  where a.RECORD_ID = '450018169239671392')
               and FWYT = '商铺'
               and BDCDYID <> '39464790');

select id
from T_H_PRICE_JZ
where ZRZBDCDYID in (select BDCDYID
                     from T_zrz_PRICE_RECORD a
                     where a.RECORD_ID = '450018169239671392')
  and FWYT = '商铺'
  and BDCDYID <> '39464790';

select count(0)
from (select ZRZBDCDYID, FWYT3, PRICE, row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
      from T_H_PRICE_JZ
      where FWYT = '车位/车库'
        and PRICE is not null)
where r = 1;

update T_PRICE_ZRZ a
set PRICE = (select c.PRICE
             from (select b.ZRZBDCDYID, b.FWYT3, b.PRICE
                   from (select ZRZBDCDYID,
                                FWYT3,
                                PRICE,
                                row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                         from T_H_PRICE_JZ
                         where FWYT = '车位/车库'
                           and PRICE is not null) b
                   where r = 1) c
             where a.BDCDYID = c.ZRZBDCDYID
               and a.FWYT = c.FWYT3)
where EXISTS(select 1
             from (select b.ZRZBDCDYID, b.FWYT3, b.PRICE
                   from (select ZRZBDCDYID,
                                FWYT3,
                                PRICE,
                                row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                         from T_H_PRICE_JZ
                         where FWYT = '车位/车库'
                           and PRICE is not null) b
                   where r = 1) c
             where a.BDCDYID = c.ZRZBDCDYID
               and a.FWYT = c.FWYT3)
  and FWYT like '%车%';

update T_PRICE_ZRZ a
set PRICE = (select PRICE
             from (select ZRZBDCDYID, FWYT3, PRICE, row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                   from T_H_PRICE_JZ
                   where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                                        from V_COMMUNITY_GL_ZRZ
                                        where COMMUNITY like '%鼎秀家园%')
                     and FWYT = '车位/车库') b
             where r = 1
               and a.BDCDYID = b.ZRZBDCDYID
               and a.FWYT = b.FWYT3)
where EXISTS(select 1
             from (select ZRZBDCDYID, FWYT3, PRICE, row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                   from T_H_PRICE_JZ
                   where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                                        from V_COMMUNITY_GL_ZRZ
                                        where COMMUNITY like '%鼎秀家园%')
                     and FWYT = '车位/车库') b
             where r = 1
               and a.BDCDYID = b.ZRZBDCDYID
               and a.FWYT = b.FWYT3)
  and FWYT like '%车%';

select *
from (select ZRZBDCDYID, FWYT, PRICE, row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
      from T_H_PRICE_JZ
      where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                           from V_COMMUNITY_GL_ZRZ
                           where COMMUNITY like '%鼎秀家园%')
        and FWYT = '储藏室/阁楼')
where r = 1;

select *
from T_PRICE_ZRZ
where BDCDYID = '1302042'
  and FWYT = '车位/车库';

select id
from T_PRICE_ZRZ
where BDCDYID in (select ZRZBDCDYID
                  from (select ZRZBDCDYID,
                               FWYT,
                               PRICE,
                               row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                        from T_H_PRICE_JZ
                        where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                                             from V_COMMUNITY_GL_ZRZ
                                             where COMMUNITY like '%鼎秀家园%')
                          and FWYT = '储藏室/阁楼')
                  where r = 1)
  and FWYT = '储藏室/阁楼';

update T_PRICE_ZRZ
set PRICE = 7633.000000
where id in (select id
             from T_PRICE_ZRZ
             where BDCDYID in (select ZRZBDCDYID
                               from (select ZRZBDCDYID,
                                            FWYT,
                                            PRICE,
                                            row_number() over (partition by ZRZBDCDYID order by ZRZBDCDYID) r
                                     from T_H_PRICE_JZ
                                     where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                                                          from V_COMMUNITY_GL_ZRZ
                                                          where COMMUNITY like '%鼎秀家园%')
                                       and FWYT = '储藏室/阁楼')
                               where r = 1)
               and FWYT = '储藏室/阁楼');

select distinct SZC
from T_BASE_H_XZ;

select *
from T_DATA_PGCG_XQ_ZZ_GXD
where bz = '2018年市税务局招标数据入库,单一小区别墅';

select zl, FH, HH
from T_BASE_H_XZ;

select distinct SZC
from T_BASE_H_XZ
where SZC like '%楼%';

select BDCDYID, ZZFSYT, count(0)
from T_PRICE_ZRZ
where ZZFSYT is not null
group by BDCDYID, ZZFSYT
having count(0) > 1;

select *
from T_PRICE_ZRZ
where BDCDYID = '460098';

select *
from T_BASE_ZRZ_XZ
where zl like '%荣盛华府%';

select *
from T_PRICE_ZRZ
where zl like '%荣盛华府%';



insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, QXMC, ZCS, bz, ZZFSYT)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       9600,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       '20221104 入库双拼别墅',
       '双拼别墅'
from V_COMMUNITY_GL_ZRZ a
         left join T_PRICE_ZRZ c on a.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
         left join T_DATA_TQJG_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and b.FWYT4 = '住宅'
         left join T_BASE_ZRZ_XZ d on a.ZRZBDCDYID = d.BDCDYID
where a.COMMUNITY_ID = '356301244106575505'
  and b.ID is not null;


select *
from T_H_PRICE_JZ
where BDCDYID = '00fc412ca718417b9c1b058279597be4';

--2020更新别墅1205入库
--2020更新多层12.05入库
--2020更新住宅1205入库
select distinct a.BZ, a.LPYT
frOm JNPG.T_DATA_PGCG_XQ_ZZ_GXD a
where bz like
      '2020%';



select *
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ in ('2018年市税务局招标数据入库,12.02整理');
select ZRZBDCDYID, DSCS
from V_TJ_ZRZ_FWYT
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY_ID = '356301407315333031');

select *
from T_PRICE_ZRZ
where BZ = '2018年市税务局招标数据入库,12.02整理';

select *
from T_PRICE_ZRZ_TEMP
where bz = ?
order by PRICE desc

select *
from T_YW_PRICE_FEEDBACK;

select *
from T_DATA_PGCG_XQ_ZZ_GXD
where COMMUNITY = '上海花园'
  and BZ = '2018年市税务局招标数据入库,12.02整理';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = 'CB0F6F2207BE66B1E053AF5D14ACBB0C';


select *
from T_BASE_COMMUNITY
where ID = 'CBOF6F220BAB66B1E053AF5D14ACBBOC';

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = 'CB0F6F220BAB66B1E053AF5D14ACBB0C';

select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID = 'CB0F6F220BAB66B1E053AF5D14ACBB0C';

select *
from T_COMMTY_GL_ZRZ
where ZRZBDCDYID = '684021';

select count(distinct COMMUNITY_ID)
from t_commty_gl_zrz;

select count(distinct COMMUNITY_ID)
from T_COMMTY_GL_ZD;


select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID not in (select id from T_BASE_COMMUNITY);

select *
from T_BASE_COMMUNITY
where ID = 'CBOF6F220BAB66B1E053AF5D14ACBBOC';

select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID = '333980427918912282';

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '333980427918912282';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '333980427918912282';


select count(0)
from T_BASE_COMMUNITY
where ID in (select distinct COMMUNITY_ID
             from t_commty_gl_zrz);

select count(0)
from T_BASE_COMMUNITY
where ID in (select distinct COMMUNITY_ID
             from T_COMMTY_GL_ZD);



select distinct PROPERTY_NAME
from T_DATA_XQ_ZZ_GXD
where VERSION = '2022'
  and PRICE_CXHD is not null;

select LPYT
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ = '2018年市税务局招标数据入库,12.06整理';



