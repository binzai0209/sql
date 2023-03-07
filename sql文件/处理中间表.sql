select *
from T_DATA_WSXX;

truncate table T_DATA_WSXX;
-- 处理全部数据
insert into T_DATA_WSXX (id, bdcdyid, zrzbdcdyid, qxdm, ywh, fwbm, FYBH, zl, fwyt, fwyt3, scjzmj, jyzj, jydj,
                         price_total, price, ywlx, create_time)
select sys_guid(),
       a.bdcdyid,
       a.zrzbdcdyid,
       a.qxdm,
       a.ywh,
       a.fwbm,
       a.fybh,
       a.zl,
       a.fwyt,
       a.fwyt3,
       a.scjzmj,
       a.jyzj,
       a.jydj,
       a.price_total,
       a.price,
       a.ywlx,
       a.create_time
from (select BDCDYID,
             ZRZBDCDYID,
             ZL,
             FWBM,
             YWH,
             FYBH,
             QXDM,
             FWYT,
             FWYT3,
             SCJZMJ,
             jyzj,
             round(jydj, 2) jydj,
             PRICE_TOTAL,
             PRICE,
             YWLX,
             create_time
      from (select to_char(c.create_time, 'yyyy-MM-dd') create_time,
                   hb.BDCDYID,
                   hb.ZRZBDCDYID,
                   hb.zl,
                   c.FWBM,
                   c.FYBH,
                   c.YWH,
                   hb.QXDM,
                   hb.fwyt3,
                   hb.fwyt4                             fwyt,
                   hb.scjzmj,
                   c.JYJG                               jyzj,
                   (c.JYJG / hb.scjzmj)                 jydj,
                   JG.PRICE_TOTAL,
                   JG.PRICE,
                   c.YWLX
            from JNPG.T_API_WSXX C
                     left join jnpg.t_base_h_xz hb ON HB.FWBM = c.FWBM
                     left join JNPG.T_H_PRICE_JZ JG ON JG.FWBM = C.FWBM
            WHERE c.sm = '契税'
              and c.fwbm is not null
              and hb.SCJZMJ is not null
              and SCJZMJ <> 0
              and JYJG is not null
              and JSJE is not null
            group by hb.BDCDYID,
                     hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH,
                     JG.PRICE, hb.fwyt4,
                     c.JYJG,
                     to_char(c.create_time, 'yyyy-MM-dd')
            order by to_char(c.create_time, 'yyyy-MM-dd') desc)) a
         left join T_DATA_WSXX b
                   on a.BDCDYID = b.BDCDYID and a.ZRZBDCDYID = b.ZRZBDCDYID and a.YWH = b.YWH and a.FYBH = b.FYBH and
                      a.FWBM = b.FWBM
where b.BDCDYID is null;

insert into T_DATA_WSXX (id, bdcdyid, zrzbdcdyid, qxdm, ywh, fwbm, FYBH, zl, fwyt, fwyt3, scjzmj, jyzj, jydj,
                         price_total, price, ywlx, create_time)
select sys_guid(),
       bdcdyid,
       zrzbdcdyid,
       qxdm,
       ywh,
       fwbm,
       fybh,
       zl,
       fwyt,
       fwyt3,
       scjzmj,
       jyzj,
       jydj,
       price_total,
       price,
       ywlx,
       create_time
from (select BDCDYID,
             ZRZBDCDYID,
             ZL,
             FWBM,
             YWH,
             FYBH,
             QXDM,
             FWYT,
             FWYT3,
             SCJZMJ,
             jyzj,
             round(jydj, 2) jydj,
             PRICE_TOTAL,
             PRICE,
             YWLX,
             create_time
      from (select to_char(c.create_time, 'yyyy-MM-dd') create_time,
                   hb.BDCDYID,
                   hb.ZRZBDCDYID,
                   hb.zl,
                   c.FWBM,
                   c.FYBH,
                   c.YWH,
                   hb.QXDM,
                   hb.fwyt3,
                   hb.fwyt4                             fwyt,
                   hb.scjzmj,
                   c.JYJG                               jyzj,
                   (c.JYJG / hb.scjzmj)                 jydj,
                   JG.PRICE_TOTAL,
                   JG.PRICE,
                   c.YWLX
            from JNPG.T_API_WSXX C
                     left join jnpg.t_base_h_xz hb ON HB.FWBM = c.FWBM
                     left join JNPG.T_H_PRICE_JZ JG ON JG.FWBM = C.FWBM
            WHERE c.sm = '契税'
              and c.fwbm is not null
              and hb.SCJZMJ is not null
              and SCJZMJ <> 0
              and JYJG is not null
              and JSJE is not null
            group by hb.BDCDYID,
                     hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH,
                     JG.PRICE, hb.fwyt4,
                     c.JYJG,
                     to_char(c.create_time, 'yyyy-MM-dd')
            order by to_char(c.create_time, 'yyyy-MM-dd') desc) a
      where 1 = 1
        and (YWLX like '%一手%' or YWLX like '%商品%')
      order by create_time desc);

insert into T_DATA_WSXX (id, bdcdyid, zrzbdcdyid, qxdm, ywh, fwbm, FYBH, zl, fwyt, fwyt3, scjzmj, jyzj, jydj,
                         price_total, price, ywlx, create_time)
select sys_guid(),
       bdcdyid,
       zrzbdcdyid,
       qxdm,
       ywh,
       fwbm,
       fybh,
       zl,
       fwyt,
       fwyt3,
       scjzmj,
       jyzj,
       jydj,
       price_total,
       price,
       ywlx,
       create_time
from (where SM = '土地增值税')
         select BDCDYID,
             ZRZBDCDYID,
             ZL,
             FWBM,
             a.YWH,
             FYBH,
             QXDM,
             FWYT,
             FWYT3,
             SCJZMJ,
             b.SLHJMQK,
             decode(fwyt, '储藏室/阁楼', decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj), '地下室',
                    decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj), '车位/车库',
                    decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj), jyzj)           as jyzj,
             round(decode(fwyt, '储藏室/阁楼', decode(b.SLHJMQK, 0, 0, null, jydj, jydj), '地下室',
                          decode(b.SLHJMQK, 0, 0, null, jydj, jydj), '车位/车库',
                          decode(b.SLHJMQK, 0, 0, null, jydj, jydj), jydj), 2) as jydj,
             PRICE_TOTAL,
             PRICE,
             YWLX,
             create_time
from (select to_char(c.create_time, 'yyyy-MM-dd') create_time, hb.BDCDYID, hb.ZRZBDCDYID, hb.zl, c.FWBM, c.FYBH, c.YWH, hb.QXDM, hb.fwyt3, hb.fwyt4 fwyt, hb.scjzmj, c.JYJG jyzj, (c.JYJG / hb.scjzmj) jydj, JG.PRICE_TOTAL, JG.PRICE, c.YWLX
    from JNPG.T_API_WSXX C
    left join jnpg.t_base_h_xz hb ON HB.FWBM = c.FWBM
    left join JNPG.T_H_PRICE_JZ JG ON JG.FWBM = C.FWBM
    WHERE c.sm = '契税'
    and c.fwbm is not null
    and hb.SCJZMJ is not null
    and SCJZMJ <> 0
    and JYJG is not null
    and JSJE is not null
    group by hb.BDCDYID, hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH, JG.PRICE, hb.fwyt4, c.JYJG, to_char(c.create_time, 'yyyy-MM-dd')
    order by to_char(c.create_time, 'yyyy-MM-dd') desc) a
    left join (select *
    from (select ywh, sm, SLHJMQK, row_number() over (partition by YWH order by YWH) r
    from T_API_WSXX
    where r = 1) b on a.YWH = b.YWH
    where 1 = 1
    and YWLX like '%二手%'
    order by create_time desc);

truncate table TABLEITEM;
-- 处理计税单价
INSERT INTO TABLEITEM (aa, bb, cc)
select FWBM, FYBH, JSZJ
from (select FWBM, FYBH, sum(JSJE) JSZJ
      from (select *
            from (select FWBM, FYBH, sm, NSRMC, JSJE, row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
                  from T_API_WSXX
                  where nsrlx = '权利人'
                    and sm = '契税')
            where r = 1)
      group by FWBM, FYBH);

select *
from T_DATA_WSXX;


select *
from T_DATA_WSXX
where JSZJ is not null;

-- 更新计税总价
update T_DATA_WSXX a
set JSZJ =(select CC
           from TABLEITEM b
           where b.aa = a.FWBM
             and b.bb = a.FYBH)
where EXISTS(select 1
             from TABLEITEM b
             where b.aa = a.FWBM
               and b.bb = a.FYBH);

-- 更新计税单价
update T_DATA_WSXX
set JSDJ = round(JSZJ / SCJZMJ, 2)
where JSZJ is not null;



select *
from T_DATA_WSXX;

truncate table TABLEITEM;
-- 处理实纳金额
insert into TABLEITEM (aa, bb)
select YWH, sum(SNJE)
from T_API_WSXX
group by YWH;

-- 更新实纳金额
update T_DATA_WSXX a
set SNJE = (select bb from TABLEITEM b where a.YWH = b.aa)
where EXISTS(select 1 from TABLEITEM b where b.aa = a.YWH);

select *
from T_DATA_WSXX;


truncate table TABLEITEM;

-- 处理幢坐标
insert into TABLEITEM (aa, bb, cc)
select BDCDYID, SMX, SMY
from (select BDCDYID, SMX, SMY, row_number() over (partition by BDCDYID order by BDCDYID) r
      from TX_ZRZ_XZ_P)
where r = 1;

-- 更新幢坐标
update T_DATA_WSXX a
set (smx, smy) = (select bb, cc
                  from TABLEITEM b
                  where b.aa = a.ZRZBDCDYID)
where EXISTS(select 1
             from TABLEITEM b
             where b.aa = a.ZRZBDCDYID);


truncate table TABLEITEM;

-- 处理楼盘自然幢关系
insert into TABLEITEM (aa, bb)
select COMMUNITY_ID, ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ;

-- 更新关系
update T_DATA_WSXX a
set COMMUNITY_ID = (select aa
                    from TABLEITEM b
                    where b.bb = a.ZRZBDCDYID)
where EXISTS(select 1
             from TABLEITEM b
             where b.bb = a.ZRZBDCDYID);


select *
from T_DATA_WSXX;


update T_DATA_WSXX a
set (COM_SMX, COM_SMY) = (select b.SMX, b.SMY
                          from TX_COMMUNITY b
                          where b.id = a.COMMUNITY_ID)
where EXISTS(select 1
             from TX_COMMUNITY b
             where b.id = a.COMMUNITY_ID);
select *
from T_DATA_WSXX;

-- 更新楼盘名称
update T_DATA_WSXX a
set COMMUNITY = (select community from T_BASE_COMMUNITY b where a.COMMUNITY_ID = b.ID)
where EXISTS(select 1 from T_BASE_COMMUNITY b where a.COMMUNITY_ID = b.ID)
  and COMMUNITY_ID is not null;

-- 更新自然幢坐落
update T_DATA_WSXX a
set ZRZZL = (select zl from T_BASE_ZRZ_XZ b where a.ZRZBDCDYID = b.BDCDYID)
where EXISTS(select 1 from T_BASE_ZRZ_XZ b where a.ZRZBDCDYID = b.BDCDYID);

truncate table TABLEITEM;
-- 添加计税总价
INSERT INTO TABLEITEM (aa, bb, cc)
select FWBM, FYBH, JSZJ
from (select FWBM, FYBH, sum(JSJE) JSZJ
      from (select *
            from (select FWBM, FYBH, sm, NSRMC, JSJE, row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
                  from T_API_WSXX
                  where nsrlx = '权利人'
                    and sm = '契税')
            where r = 1)
      group by FWBM, FYBH);

-- 更新计税总价
update T_DATA_WSXX a
set JSZJ =(select CC
           from TABLEITEM b
           where b.aa = a.FWBM
             and b.bb = a.FYBH)
where EXISTS(select 1
             from TABLEITEM b
             where b.aa = a.FWBM
               and b.bb = a.FYBH);

-- 添加实纳金额
truncate table TABLEITEM;

insert into TABLEITEM (aa, bb)
select YWH, sum(SNJE)
from T_API_WSXX
group by YWH;

-- 更新实纳金额
update T_DATA_WSXX a
set SNJE = (select bb from TABLEITEM b where a.YWH = b.aa)
where EXISTS(select 1 from TABLEITEM b where b.aa = a.YWH);

select *
from T_DATA_WSXX;
