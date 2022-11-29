select create_time1,
       ZL,
       FWBM,
       FYBH,
       FWYT,
       FWYT3,
       SCJZMJ,
       jyzj,
       round(jydj, 2)                               jydj,
       (select sum(JSJE)
        from (select *
              from (select FWBM,
                           FYBH,
                           sm,
                           NSRMC,
                           JSJE,
                           row_number() over (partition by FWBM,FYBH,NSRMC,CREATE_TIME order by FWBM) r
                    from T_API_WSXX
                    where FWBM is not null -- and JSFE is not null
                      and FWBM <> '0'
                      and nsrlx = '权利人'
                      and sm = '契税')
              where r = 1) b
        where b.FWBM = a.FWBM
          and b.fybh = a.FYBH)                      jsjg,
       round(((select sum(JSJE)
               from (select *
                     from (select FWBM,
                                  FYBH,
                                  sm,
                                  NSRMC,
                                  JSJE,
                                  row_number() over (partition by FWBM,fybh,NSRMC,CREATE_TIME order by FWBM) r
                           from T_API_WSXX
                           where FWBM is not null --and JSFE is not null
                             and FWBM <> '0'
                             and nsrlx = '权利人'
                             and sm = '契税')
                     where r = 1) b
               where b.FWBM = a.FWBM
                 and b.fybh = a.FYBH) / SCJZMJ), 2) jsdj,
       PRICE_TOTAL,
       PRICE
from (select to_char(c.create_time, 'yyyyMMdd') create_time1,
             hb.zl,
             c.FWBM,
             c.FYBH,
             hb.QXDM,
             hb.fwyt3,
             jg.fwyt,
             hb.scjzmj,
             c.JYJG                             jyzj,
             (c.JYJG / hb.scjzmj)               jydj,
             JG.PRICE_TOTAL,
             JG.PRICE
      from JNPG.T_API_WSXX C
               left join jnpg.t_base_h_xz hb ON HB.FWBM = c.FWBM
               left join JNPG.T_H_PRICE_JZ JG ON JG.FWBM = C.FWBM
      WHERE c.sm = '契税'
        and c.fwbm is not null
        and hb.SCJZMJ is not null
        and SCJZMJ <> 0
        and JYJG is not null
        and JSJE is not null
      group by hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, c.FYBH, JG.PRICE_TOTAL, hb.QXDM, JG.PRICE, jg.fwyt, c.JYJG,
               to_char(c.create_time, 'yyyyMMdd')
      order by to_char(c.create_time, 'yyyyMMdd')) a
where FWBM = '2010042200016640800132';

select *
from T_API_WSXX
where FWBM = '2010042200016640800132';


select *
from T_API_WSXX
where FWBM in (select fwbm from T_API_WSXX where JSFE is null);

select *
from T_API_WSXX;

select *
from T_BASE_H_XZ
where FWYT4 = '车位/车库'
  and ZL like '%鲁商%';


select create_time,
       ZL,
       FWBM,
       FYBH,
       QXDM,
       FWYT,
       FWYT3,
       SCJZMJ,
       jyzj,
       round(jydj, 2) jydj,
       PRICE_TOTAL,
       PRICE,
       YWLX
from (select to_char(c.create_time, 'yyyyMMdd') create_time,
             hb.zl,
             c.FWBM,
             c.FYBH,
             hb.QXDM,
             hb.fwyt3,
             hb.fwyt4                           fwyt,
             hb.scjzmj,
             c.JYJG                             jyzj,
             (c.JYJG / hb.scjzmj)               jydj,
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
      group by hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, hb.QXDM, c.FYBH, JG.PRICE, hb.fwyt4, c.JYJG,
               to_char(c.create_time, 'yyyyMMdd')
      order by to_char(c.create_time, 'yyyyMMdd')) a
where 1 = 1;


(select sum(JSJE)
 from (select *
       from (select FWBM, sm, NSRMC, JSJE, row_number() over (partition by FWBM,NSRMC order by FWBM) r
             from T_API_WSXX
             where FWBM is not null
               and FWBM <> '0'
               and nsrlx = '权利人'
               and sm = '契税')
       where r = 1) b
 where b.FWBM = a.FWBM)
;
select sum(JSJE)
from (select *
      from (select FWBM, sm, NSRMC, JSJE, row_number() over (partition by FWBM,NSRMC order by FWBM) r
            from T_API_WSXX
            where FWBM = ''
              and nsrlx = '权利人'
              and sm = '契税')
      where r = 1);


select create_time,
       ZL,
       FWBM,
       QXDM,
       FWYT,
       FWYT3,
       SCJZMJ,
       jyzj,
       round(jydj, 2) jydj,
       PRICE_TOTAL,
       PRICE,
       YWLX
from (select to_char(c.create_time, 'yyyyMMdd') create_time,
             hb.zl,
             c.FWBM,
             hb.QXDM,
             hb.fwyt3,
             hb.fwyt4                           fwyt,
             hb.scjzmj,
             c.JYJG                             jyzj,
             (c.JYJG / hb.scjzmj)               jydj,
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
      group by hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, hb.QXDM, JG.PRICE, hb.fwyt4, c.JYJG,
               to_char(c.create_time, 'yyyyMMdd')
      order by to_char(c.create_time, 'yyyyMMdd')) a
where 1 = 1
  and (YWLX like '%一手%' or YWLX like '%商品%')


select create_time,
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
       YWLX
from (select to_char(c.create_time, 'yyyy-MM-dd') create_time,
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
      group by hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH, JG.PRICE, hb.fwyt4,
               c.JYJG,
               to_char(c.create_time, 'yyyy-MM-dd')
      order by to_char(c.create_time, 'yyyy-MM-dd') desc) a
where 1 = 1
  and FWYT <> '住宅'
  AND create_time < TO_CHAR(SYSDATE, 'yyyy-MM-dd');

select YWH
from T_API_WSXX;


select sum(JSJE) JSZJ
from (select *
      from (select FWBM,
                   FYBH,
                   sm,
                   NSRMC,
                   JSJE,
                   row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
            from T_API_WSXX
            where FWBM = FWBM
              and fybh = FYBH
              and nsrlx = '权利人'
              and sm = '契税')
      where r = 1);

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
       round(jydj, 2)       jydj,
       PRICE_TOTAL,
       PRICE,
       YWLX,
       (select sum(JSJE) JSZJ
        from (select *
              from (select FWBM, FYBH, sm, NSRMC, JSJE, row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
                    from T_API_WSXX
                    where FWBM = FWBM
                      and fybh = FYBH
                      and nsrlx = '权利人'
                      and sm = '契税')
              where r = 1)) JSZJ,
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
      group by hb.BDCDYID, hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM,
               c.FYBH, JG.PRICE, hb.fwyt4, c.JYJG, to_char(c.create_time, 'yyyy-MM-dd')
      order by to_char(c.create_time, 'yyyy-MM-dd') desc) a
where 1 = 1;


select sum(JSJE) JSZJ
from (select *
      from (select FWBM, FYBH, sm, NSRMC, JSJE, row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
            from T_API_WSXX
            where FWBM = '2012022800033738100049'
              and fybh = 'F37010320220077268'
              and nsrlx = '权利人'
              and sm = '契税')
      where r = 1)