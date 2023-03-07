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
       decode(fwyt, '储藏室/阁楼', decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj), '车位/车库',
              decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj), jyzj)           as jyzj,
       round(decode(fwyt, '储藏室/阁楼', decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj), '车位/车库',
                    decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj), jyzj), 2) as jydj,
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
         left join (select *
                    from (select ywh, sm, SLHJMQK, row_number() over (partition by YWH order by YWH) r
                          from T_API_WSXX
                          where SM = '土地增值税')
                    where r = 1) b on a.YWH = b.YWH
where 1 = 1;


-- decode(b.SLHJMQK, 0, 0, null, JSJE, JSJE)
select decode(FWYT4, '储藏室/阁楼', sum(decode(b.SLHJMQK, 0, 0, null, JSJE, JSJE)), '车位/车库',
              sum(decode(b.SLHJMQK, 0, 0, null, JSJE, JSJE)), sum(JSJE)) JSZJ
from (select *
      from (select a.FWBM,
                   FYBH,
                   sm,
                   NSRMC,
                   JSJE,
                   YWH,
                   b.FWYT4,
                   row_number() over (partition by a.FWBM,FYBH,NSRMC order by a.FWBM) r
            from T_API_WSXX a
                     left join T_BASE_H_XZ b on a.FWBM = b.FWBM
            where a.FWBM = '2016050400071282200012'
              and fybh = 'F37010420220060913'
              and nsrlx = '权利人'
              and sm = '契税') a
      where r = 1) a
         left join (select *
                    from (select ywh, sm, SLHJMQK, row_number() over (partition by YWH order by YWH) r
                          from T_API_WSXX
                          where SM = '土地增值税')
                    where r = 1) b on a.YWH = b.YWH
group by FWYT4;


select BDCDYID,
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
  and BDCDYID = '-3635284'
order by create_time desc;



select to_char(c.create_time, 'yyyy-MM-dd') create_time,
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
  and hb.BDCDYID = '-3635284'
group by hb.BDCDYID,
         hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH,
         JG.PRICE, hb.fwyt4,
         c.JYJG,
         to_char(c.create_time, 'yyyy-MM-dd')
order by to_char(c.create_time, 'yyyy-MM-dd') desc;

select FWBM
from T_BASE_H_XZ where BDCDYID = '-3635284';

select distinct FYBH
from T_API_WSXX where FWBM = '2009041000001898200335';