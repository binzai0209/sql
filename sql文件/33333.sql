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
            WHERE c.sm = 'ÆõË°'
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
            order by to_char(c.create_time, 'yyyy-MM-dd') desc) a);


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
      WHERE c.sm = 'ÆõË°'
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
where 1 = 1;



