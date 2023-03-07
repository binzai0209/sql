select *
from jnpg.t_data_swjgzl a
where a.lzzl like '%阳光100%国际新城%';

select a.id,
       a.community_id,
       z.BDCDYID,
       a.fwyt,
       a.price,
       a.statistics_date,
       a.createtime,
       a.updatetime,
       a.datasource,
       a.version,
       a.createuser,
       a.bz
FROM jnpg.t_price_commty a
         left join jnpg.t_commty_gl_zd zd on zd.community_id = a.community_id
         left join jnpg.t_base_zrz_xz z on z.zdbdcdyid = zd.zd_id
where z.zl like '%阳光100%国际新城%';

select *
from T_PRICE_COMMTY a
where COMMUNITY_ID in
      (select b.community_id
       from T_COMMTY_GL_ZD b
       where b.ZD_ID in (select c.ZDBDCDYID from T_BASE_ZRZ_XZ c where c.ZL like '%阳光100%国际新城%'));



select b.community_id,
       c.BDCDYID,
       c.ZL,
       b.FWYT,
       b.PRICE,
       c.ZCS,
       c.QXDM
from T_COMMTY_GL_ZRZ a
         left join (select distinct a.COMMUNITY_ID, a.FWYT, a.PRICE
                    from T_PRICE_COMMTY a
                    where a.bz = '槐荫区-补充'
                       or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_BASE_ZRZ_XZ c on a.ZRZBDCDYID = c.BDCDYID
         left join T_DATA_TQJG_ZRZ d on a.ZRZBDCDYID = d.BDCDYID and b.FWYT = d.FWYT4
where b.COMMUNITY_ID is not null
  and c.BDCDYID is not null
  and c.BDCDYID = '985307';


select b.COMMUNITY_ID,
       c.BDCDYID,
       c.ZL,
       b.FWYT,
       b.PRICE,
       c.ZCS,
       c.QXDM
from T_COMMTY_GL_ZD a
         left join (select distinct a.COMMUNITY_ID, a.FWYT, a.PRICE
                    from T_PRICE_COMMTY a
                    where a.bz = '槐荫区-补充'
                       or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_BASE_ZRZ_XZ c on a.ZD_ID = c.ZDBDCDYID
         left join T_DATA_TQJG_ZRZ d on c.BDCDYID = d.BDCDYID and b.FWYT = d.FWYT4
where b.COMMUNITY_ID is not null
  and d.ID is not null
  and c.ZDBDCDYID is not null
  and c.BDCDYID = '985307';


select BDCDYID, XMMC, FWYT4, FWYT3
from T_DATA_TQJG_ZRZ
where BDCDYID in (select BDCDYID
                  from T_BASE_ZRZ_XZ
                  where ZDBDCDYID = '939afde5-2e81-4f04-b3ad-1a7815951dc7');


SELECT TE.*,
       P.PRICE,
       decode(P.FWYT, '', TE.FWYT5, NULL, TE.FWYT5, P.FWYT) FWYT,
       P.COMMUNITY_ID
FROM (SELECT ZRZ.BDCDYID,
             ZRZ.ZL,
             ZRZ.QXDM,
             ZRZ.QXMC,
             ZRZ.ZDBDCDYID,
             ZRZ.BDCDYH,
             ZRZ.SCJZMJ JZMJ,
             ZRZ.ZCS,
             tq.FWYT5
      FROM T_BASE_ZRZ_XZ ZRZ
               left join T_DATA_TQJG_ZRZ tq on tq.BDCDYID = ZRZ.BDCDYID
      WHERE 1 = 1
        and zrz.QXDM = '370102') TE
         LEFT JOIN T_PRICE_ZRZ P ON P.BDCDYID = TE.BDCDYID and TE.FWYT5 = p.FWYT
WHERE 1 = 1
  --AND PRICE is null
  and decode(P.FWYT, '', TE.FWYT5, NULL, TE.FWYT5, P.FWYT) <> '住宅'
  and te.BDCDYID = '966065'
order by p.zl, p.fwyt;


select ID
from T_BASE_COMMUNITY
where COMMUNITY = '天安时代广场';

select distinct FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID in (select V_COMMUNITY_GL_ZRZ.ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY_ID = '356301630653632001');

select *
from T_COMMUNITY_YT
where COMMUNITY_ID = '356301630653632001';

select *
from T_COLLECT_COMMUNITY_PRICE_HIS
where COMMUNITY_ID = '356301630653632001';


select *
from (select a.bdcdyid,
             a.zrzbdcdyid,
             a.zdbdcdyid,
             a.fwyt4                                      fwyt,
             a.fwyt3,
             a.zl,
             decode(a.QSC, '', '0', null, '0', a.QSC) as  qsc,
             decode(a.SZC, '', '0', null, '0', a.SZC) as  szc,
             decode(a.ZCS, '', '0', null, '0', a.ZCS) as  zcs,
             a.scjzmj                                     jzmj,
             a.qxdm,
             decode(e.cx, '', decode(f.cx, '', '', null, '', f.CX), null, decode(f.cx, '', '', null, '', f.CX),
                    e.cx)                             as  CX,
             decode(e.YWDT, '', decode(f.YWDT, '', '', null, '', f.YWDT), null,
                    decode(f.YWDT, '', '', null, '', f.YWDT),
                    e.YWDT)                           as  YWDT,
             decode(e.CG, '', decode(f.CG, '', 0, null, 0, f.CG), null, decode(f.CG, '', 0, null, 0, f.CG),
                    e.CG)                             as  CG,
             decode(e.ZXQK, '', decode(f.ZXQK, '', '', null, '', f.ZXQK), null,
                    decode(f.ZXQK, '', '', null, '', f.ZXQK),
                    e.ZXQK)                           as  ZXQK,
             b.JZJG,
             decode(d.JCND, '',
                    decode(e.JCND, '',
                           decode(f.JCND, '',
                                  decode(b.JGRQ, null,
                                         decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                         to_char(b.JGRQ, 'yyyy')), null,
                                  decode(b.JGRQ, null,
                                         decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                         to_char(b.JGRQ, 'yyyy')), f.JCND), null,
                           decode(f.JCND, '',
                                  decode(b.JGRQ, null, decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                         to_char(b.JGRQ, 'yyyy')), null,
                                  decode(b.JGRQ, null, decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                         to_char(b.JGRQ, 'yyyy')), f.JCND), e.JCND), null,
                    decode(e.JCND, '',
                           decode(f.JCND, '',
                                  decode(b.JGRQ, null, decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                         to_char(b.JGRQ, 'yyyy')), null,
                                  decode(b.JGRQ, null, decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                         to_char(b.JGRQ, 'yyyy')), f.JCND), null, decode(f.JCND, '',
                                                                                         decode(b.JGRQ,
                                                                                                null,
                                                                                                decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                                                                                to_char(b.JGRQ, 'yyyy')),
                                                                                         null,
                                                                                         decode(b.JGRQ,
                                                                                                null,
                                                                                                decode(a.JGSJ, null, '', to_char(a.JGSJ, 'yyyy')),
                                                                                                to_char(b.JGRQ, 'yyyy')),
                                                                                         f.JCND), e.JCND), '暂无', '',
                    '暂无竣工时间', '', '暂无信息', '', '在建', '', '暂无', '',
                    d.JCND)                           as  JCND,
             d.BUSS_ID                                    BUSINESS_ID,
             decode(g.NAME, '', '无', null, '无', g.NAME) BUSINESS_NAME

      from T_BASE_H_XZ a
               left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
               left join V_COMMUNITY_GL_ZRZ c on a.ZRZBDCDYID = c.ZRZBDCDYID
               left join T_BASE_COMMUNITY d on c.COMMUNITY_ID = d.ID
               left join T_PG_XXBC e on a.BDCDYH = e.BDCDYH
               left join T_YW_XXBC f on a.BDCDYH = f.BDCDYH
               left join TX_BUSINESS_ZONE g on d.BUSS_ID = g.ID)
where YWDT IS NOT NULL;

select distinct JCND
from T_BASE_COMMUNITY;

select JCND
from T_BASE_COMMUNITY
where JCND = ' 2022';

update T_BASE_COMMUNITY
set JCND = replace(JCND, '年', '');

select *
from T_BASE_BUSINESS_ZONE;

select a.ID, a.COMMUNITY, a.ZL, b.ID, b.NAME
from T_BASE_COMMUNITY a
         left join TX_BUSINESS_ZONE b on a.BUSS_ID = b.ID
where BUSS_ID is not null;

select *
from T_BEV_TASK;

select *
from T_BEV_TASK_SCOPE
where TASK_ID = '413690373778061231';

select *
from T_BEV_SCOPE_GROUP;

SELECT *
FROM T_BEV_SCOPE_GROUP a
WHERE TASK_ID = '413690373778061231'
START WITH a.ID = '413690373778061252'
CONNECT BY PRIOR a.ID = a.PARENT_ID;

select *
from T_BEV_GROUP_STANDARD
where GROUP_ID in (SELECT a.ID
                   FROM T_BEV_SCOPE_GROUP a
                   START WITH a.ID = '413690373778061249'
                   CONNECT BY PRIOR a.ID = a.PARENT_ID);

select *
from T_BEV_SCOPE_GROUP
where TASK_ID = '413690382367995549';
--413697576438216345
--413697576438216346
--413697576438216347

select *
from T_BEV_SCOPE_GROUP_DATA
where GROUP_ID in ('413697576438216345', '413697576438216346', '413697576438216347');


select *
from T_BEV_TASK;

delete
from T_BEV_TASK_SCOPE
where id in (select SCOPE_ID
             from T_BEV_SCOPE_GROUP_DATA
             where GROUP_ID in (SELECT a.ID
                                FROM T_BEV_SCOPE_GROUP a
                                START WITH a.ID = :id
                                CONNECT BY PRIOR a.ID = a.PARENT_ID));

delete
from T_BEV_SCOPE_GROUP_DATA
where GROUP_ID in (SELECT a.ID
                   FROM T_BEV_SCOPE_GROUP a
                   START WITH a.ID = ?1
                   CONNECT BY PRIOR a.ID = a.PARENT_ID);

delete
from T_BEV_SCOPE_GROUP
where ID in (SELECT a.ID
             FROM T_BEV_SCOPE_GROUP a
             START WITH a.ID = :id
             CONNECT BY PRIOR a.ID = a.PARENT_ID);

select *
from (select a.*, c.ID GROUP_ID, c.PARENT_ID, row_number() over ( partition by a.BDCDYID order by a.QXDM,a.ZL) r
      from T_BEV_TASK_SCOPE a
               left join T_BEV_SCOPE_GROUP_DATA b on a.ID = b.SCOPE_ID
               left join T_BEV_SCOPE_GROUP c on c.id = b.GROUP_ID
      where 1 = 1
        and a.task_id = '413690382367995549'
        and b.SCOPE_ID is not null
        and GROUP_ID is not null
      order by qxdm, zl)
where r = 1

select *
from T_BEV_GROUP_STANDARD;

delete
from T_BEV_GROUP_STANDARD
where GROUP_ID in (SELECT a.ID
                   FROM T_BEV_SCOPE_GROUP a
                   START WITH a.ID = ?1
                   CONNECT BY PRIOR a.ID = a.PARENT_ID);

select *
from T_H_PRICE_JZ
where zl like '%历城区世纪大道11977号中新锦绣天地东苑一区18号楼102%';

select *
from T_BASE_H_XZ
where zl = '历城区世纪大道11977号中新锦绣天地东苑一区18号楼102';

select *
from T_BEV_TASK_SCOPE;

select *
from T_API_RECORD
order by REQ_TIME desc;

select QSC
from T_BASE_H_XZ
where ZL = '历下区经十路9777号1号楼1002';

select *
from T_BEV_TASK_SCOPE;

select *
from T_BEV_SCOPE_GROUP
where TASK_ID = '413725910337468364'
  and ID = '413725910337468392';

select a.*, b.PRICE, b.PRICE * a.JZMJ price_total, b.EXPRESSION, c.GROUP_LABEL, c.GROUP_NAME
from T_BEV_TASK_SCOPE a
         left join T_BEV_RESULT_RECORD b on a.id = b.SCOPE_ID
         left join T_BEV_SCOPE_GROUP c on a.TASK_ID = c.TASK_ID
         left join T_BEV_SCOPE_GROUP_DATA d on d.GROUP_ID = c.ID and d.SCOPE_ID = a.ID
where 1 = 1
  and c.ID = '413725910337468392';


select GROUP_ID, count(0)
from T_BEV_SCOPE_GROUP_DATA
where GROUP_ID in (select id
                   from T_BEV_SCOPE_GROUP
                   where TASK_ID = '413725910337468364')
group by GROUP_ID;

select *
from T_BEV_SCOPE_GROUP_DATA
where GROUP_ID = '413725910337468392';



select a.*, b.PRICE, b.PRICE * a.JZMJ price_total, b.EXPRESSION, c.GROUP_LABEL, c.GROUP_NAME
from T_BEV_TASK_SCOPE a
         left join T_BEV_RESULT_RECORD b on a.id = b.SCOPE_ID
         left join T_BEV_SCOPE_GROUP c on a.TASK_ID = c.TASK_ID
         left join T_BEV_SCOPE_GROUP_DATA d on d.SCOPE_ID = a.ID and c.ID = d.GROUP_ID
where 1 = 1
  and a.TASK_ID = '413725910337468364'
  and d.GROUP_ID = '413725910337468392'
order by a.szc, a.zl;

select *
from T_BEV_SCOPE_GROUP;
select a.*, b.PRICE, b.PRICE * a.JZMJ price_total, b.EXPRESSION, c.GROUP_LABEL, c.GROUP_NAME
from T_BEV_TASK_SCOPE a
         left join T_BEV_RESULT_RECORD b on a.id = b.SCOPE_ID
         left join (select a.SCOPE_ID, a.GROUP_ID, b.GROUP_NAME, b.GROUP_LABEL
                    from T_BEV_SCOPE_GROUP_DATA a
                             left join T_BEV_SCOPE_GROUP b on a.GROUP_ID = b.ID) c on a.id = c.SCOPE_ID
where 1 = 1
  and a.TASK_ID = '413725910337468364'
  and c.GROUP_ID = '413725910337468392'
order by a.szc, a.zl;

select a.SCOPE_ID, b.GROUP_NAME, b.GROUP_LABEL
from T_BEV_SCOPE_GROUP_DATA a
         left join T_BEV_SCOPE_GROUP b on a.GROUP_ID = b.ID;

select *
from T_BEV_GROUP_STANDARD;



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
       decode(b.SLHJMQK, 0, 0, null, jyzj, jyzj)           as jyzj,
       round(decode(b.SLHJMQK, 0, 0, null, jydj, jydj), 2) as jydj,
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
where 1 = 1
  and a.YWH = '08691666833962253';

select *
from (select ywh, sm, SLHJMQK, row_number() over (partition by YWH order by YWH) r
      from T_API_WSXX
      where SM = '土地增值税')
where r = 1
  and YWH = '08691666833962253';

select *
from T_API_WSXX
where YWH = '08691666833962253';

-- decode(b.SLHJMQK, 0, 0, null, JSJE, JSJE)
select sum(decode(b.SLHJMQK, 0, 0, null, JSJE, JSJE)) JSZJ
from (select *
      from (select FWBM, FYBH, sm, NSRMC, JSJE, YWH, row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
            from T_API_WSXX
            where FWBM = '2016050400071282200012'
              and fybh = 'F37010420220060913'
              and nsrlx = '权利人'
              and sm = '契税') a
      where r = 1) a
         left join (select *
                    from (select ywh, sm, SLHJMQK, row_number() over (partition by YWH order by YWH) r
                          from T_API_WSXX
                          where SM = '土地增值税')
                    where r = 1) b on a.YWH = b.YWH;

select *
from T_API_WSXX
where YWH = '10341666504020067'
  and SM = '土地增值税';


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
group by hb.BDCDYID,
         hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH,
         JG.PRICE, hb.fwyt4,
         c.JYJG,
         to_char(c.create_time, 'yyyy-MM-dd')
order by to_char(c.create_time, 'yyyy-MM-dd') desc;

select YWH, SM
from T_API_WSXX;

select decode(FWYT4, '储藏室/阁楼', sum(decode(b.SLHJMQK, 0, 0, null, JSJE, JSJE)), '车位/车库',
              sum(decode(b.SLHJMQK, 0, 0, null, JSJE, JSJE)), sum(JSJE)) JSZJ
from (select *
      from (select a.FWBM,
                   FYBH,
                   sm,
                   NSRMC,
                   JSJE,
                   ywh,
                   fwyt4,
                   row_number() over (partition by a.FWBM,FYBH,NSRMC order by a.FWBM) r
            from T_API_WSXX a
                     left join T_BASE_H_XZ b on a.FWBM = b.FWBM
            where a.FWBM = '2014050800051484400112'
              and fybh = 'F37010320220069275'
              and nsrlx = '权利人'
              and sm = '契税')
      where r = 1) a
         left join (select *
                    from (select ywh, sm, SLHJMQK, row_number() over (partition by YWH order by YWH) r
                          from T_API_WSXX
                          where SM = '土地增值税')
                    where r = 1) b on a.YWH = b.YWH
group by FWYT4;

select *
from T_API_WSXX
where FWBM = '2014050800051484400112'
  and fybh = 'F37010320220069275';

select distinct FWYT4
from T_BASE_H_XZ;



select *
from (select BDCDYID,
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
      where 1 = 1
        and a.ZL like '%市中区魏家庄万达广场帝%'
        and YWLX like '%二手%'
        and FWYT <> '住宅'
        and a.PRICE is not null
      order by create_time desc);


select *
from T_BASE_PQ;

select *
from T_BASE_SQ;

select BDCDYID, ZDBDCDYID, ZL, ZCS, SCJZMJ jzmj, QXDM, fwyt
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select TASK_ID,
                                 zrzbdcdyid,
                                 fwyt,
                                 row_number() over (partition by ZRZBDCDYID,FWYT,TASK_ID order by ZRZBDCDYID) r
                          from T_BEV_TASK_SCOPE)
                    where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null
order by qxdm, zl

select *
from T_BASE_H_XZ;


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
  and (YWLX like '%一手%' or YWLX like '%商品%')
order by create_time desc


-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

ALTER system kill session '289, 41285';

select count(0)
from T_DATA_WSXX;

select distinct SFLD
from T_BASE_SCHOOLDISTRICT;


SELECT t.id,
       t.NAME,
       t.first_pinyin,
       t.contact_name,
       t.mobile_phone,
       t.photo,
       t.sales_id,
       t.customer_type,
       t.store_id,
       t.accept_time,
       t.grade,
       t.home_address,
       t.create_time,
       t.update_time,
       t.remark,
       t.create_by,
       t.update_by,
       t.del_flag,
       t.birthday,
       t.address,
       t2.final_received_fee,
       t2.received_fee,
       t2.message,
       GROUP_CONCAT(t1.vin SEPARATOR ',')           vin,
       GROUP_CONCAT(t1.plate SEPARATOR ',')         plate,
       GROUP_CONCAT(t1.insurance_due SEPARATOR ',') insurance_due
FROM t_customer t
         LEFT JOIN t_customer_car t1 ON t.id = t1.customer_id
    AND t1.del_flag = 0
         LEFT JOIN (SELECT tr.customer_id,
                           cb.final_received_fee,
                           cb.received_fee,
                           cb.message
                    FROM t_coupon_batch cb
                             LEFT JOIN t_coupon_record tr ON tr.batch_id = cb.id
                    WHERE cb.id IN (SELECT max(tcb.id)
                                    FROM t_coupon_record tcr
                                             LEFT JOIN t_coupon_batch tcb ON tcr.batch_id = tcb.id
                                        AND tcb.del_flag = 0
                                        AND tcb.message IS NOT NULL
                                    GROUP BY tcr.customer_id)
                    GROUP BY tr.customer_id) t2 ON t2.customer_id = t.id
WHERE 1 = 1
  AND t.del_flag = 0
  AND t.customer_type = 4
GROUP BY t.id
ORDER BY t.create_time DESC LIMIT 100;

select distinct replace(replace(WQJG, '"', ''), ',', '')
from T_DATA_WQJG_230306_test;

select replace(replace(decode(wqjg, '', '0.00', null, '0.00', WQJG), '"', ''), ',', ''),
       to_date(WQRQ, 'yyyy-mm-dd HH24:MI:SS'),
       to_date(BARQ, 'yyyy-mm-dd HH24:MI:SS')
from T_DATA_WQJG_230306
where  WQRQ is not null and BARQ is not null ;

select *
from wqjg1 where wqjg  = '';