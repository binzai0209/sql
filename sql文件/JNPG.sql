select *
from pg_const
where constslsid = '2021091101';

select *
from pg_const
where constslsid = (select CONSTSLSID
                    from pg_constcls
                    where CONSTCLSTYPE = 'BGLX');

select *
from T_PRICE_ZRZ
where zl like '%开元大街%'
  and FWYT = '储藏室/阁楼'
  and BZ = '20221027更新';

select bdcdyid,
       PRICE,
       SUBSTRING(PRICE, LOCATE('.', PRICE))
from T_PRICE_ZRZ
where LOCATE('.', PRICE) != 0
  and length(SUBSTRING(PRICE, LOCATE('.', PRICE))) > 3


update T_PRICE_ZRZ
set PRICE = round(PRICE, 2)
where zl like '%开元大街%'
  and FWYT = '储藏室/阁楼'
  and BZ = '20221027更新';


select count(0)
from T_H_PRICE_JZ
where QXDM = '370102';

select *
from T_BASE_ZRZ_XZ
where QXDM = '370114';

select *
from T_BASE_H_XZ
where QXDM = '370114';

select distinct QXDM
from T_BASE_H_XZ
where QXDM is not null;

select *
from pg_constcls
where constclsname like '%区县%';

select *
from pg_constcls
where CONSTCLSTYPE = 'BGLB';

select *
from pg_constcls
where MBBSM = '20220913';


-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

select b.owner,b.object_name,a.session_id,a.locked_mode
  from v$locked_object a,dba_objects b
where b.object_id = a.object_id;

select b.username,b.sid,b.serial#,logon_time
  from v$locked_object a,v$session b
where a.session_id = b.sid order by b.logon_time;

alter system kill session '213,24471' immediate;
-- 22817
ALTER system kill session '47, 43465';

alter system kill session '47,43465' immediate;

GRANT ALTER SYSTEM TO JNPG;


SELECT *
FROM t_api_record
WHERE TO_CHAR(REQ_TIME, 'YYYY-MM-DD') = TO_CHAR(SYSDATE, 'YYYY-MM-DD');

-- 查询宗地被重复关联的楼盘
select te.*, row_number() over (partition by zd_id order by createtime desc) f
from (select t.zd_id, t.community_id, c.community, t.createtime
      from jnpg.t_commty_gl_zd t
               left join t_base_community c on t.community_id = c.id and c.del_flag = '0'
      where t.zd_id in (select t.zd_id
                        from jnpg.t_commty_gl_zd t
                                 left join t_base_community c on t.community_id = c.id and c.del_flag = '0'
                        group by t.zd_id
                        having count(0) > 1)) te;


select b.COMMUNITY as 父楼盘, a.COMMUNITY as 子楼盘, b.ID 父楼盘id, a.ID 子楼盘id
from T_BASE_COMMUNITY a
         left join T_BASE_COMMUNITY b on a.PARENTCOMMUNITYID = b.ID
where a.PARENTCOMMUNITYID is not null
  and a.DEL_FLAG = '0';

select *
from v_tj_zrz_fwyt;


insert into T_COMMUNITY_YT (id, community_id, lpyt, pch, data_source, create_user, create_time)
select sys_guid(), co.COMMUNITY_ID, co.FWYT4, '', '', 'zhangbin', sysdate
from (select distinct a.COMMUNITY_ID, a.FWYT4
      from (select distinct a.COMMUNITY_ID, b.FWYT4
            from T_COMMTY_GL_ZRZ a
                     left join (select DISTINCT BDCDYID, FWYT4
                                from T_DATA_TQJG_ZRZ
                                where BDCDYID is not null
                                  and FWYT4 is not null
                                order by BDCDYID) b on a.ZRZBDCDYID = b.BDCDYID
            where b.FWYT4 is not null
            union all
            select distinct a.COMMUNITY_ID, b.FWYT4
            from T_COMMTY_GL_ZD a
                     left join (select DISTINCT ZDBDCDYID, FWYT4
                                from T_DATA_TQJG_ZRZ
                                where ZDBDCDYID is not null
                                  and FWYT4 is not null
                                order by ZDBDCDYID) b on a.ZD_ID = b.ZDBDCDYID
            where b.FWYT4 is not null) a
      order by a.COMMUNITY_ID) co;

select distinct a.COMMUNITY_ID, a.FWYT4
from (select distinct a.COMMUNITY_ID, b.FWYT4
      from T_COMMTY_GL_ZRZ a
               left join (select DISTINCT ZRZBDCDYID, FWYT4
                          from T_BASE_H_XZ
                          where ZRZBDCDYID is not null
                            and FWYT4 is not null
                          order by ZRZBDCDYID) b on a.ZRZBDCDYID = b.ZRZBDCDYID
      where b.FWYT4 is not null
      union all
      select distinct a.COMMUNITY_ID, b.FWYT4
      from T_COMMTY_GL_ZD a
               left join (select DISTINCT ZDBDCDYID, FWYT4
                          from T_BASE_H_XZ
                          where ZRZBDCDYID is not null
                            and FWYT4 is not null
                          order by ZRZBDCDYID) b on a.ZD_ID = b.ZDBDCDYID
      where b.FWYT4 is not null) a
order by a.COMMUNITY_ID;

create table T_PRICE_ZRZ_BAK_730 parallel 8 as
select *
from T_PRICE_ZRZ nologging;

select distinct b.community_id, c.BDCDYID, d.FWYT4
from T_COMMTY_GL_ZRZ a
         left join (select distinct a.COMMUNITY_ID
                    from T_PRICE_COMMTY a
                    where a.bz = '槐荫区-补充'
                       or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_BASE_ZRZ_XZ c on a.ZRZBDCDYID = c.BDCDYID
         left join T_DATA_TQJG_ZRZ d on a.ZRZBDCDYID = d.BDCDYID
where b.COMMUNITY_ID is not null
  and c.BDCDYID is not null
union all
select b.COMMUNITY_ID, c.BDCDYID, d.FWYT4
from T_COMMTY_GL_ZD a
         left join (select distinct a.COMMUNITY_ID
                    from T_PRICE_COMMTY a
                    where a.bz = '槐荫区-补充'
                       or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_BASE_ZRZ_XZ c on a.ZD_ID = c.ZDBDCDYID
         left join T_DATA_TQJG_ZRZ d on c.BDCDYID = d.BDCDYID
where b.COMMUNITY_ID is not null
  and c.ZDBDCDYID is not null;

-- 还原历下区数据
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, updatetime,
                         updateuser, data_source, zl, jzmj, zcs, hbdcdyid, ywh, bdcdyh, fwbm, zrzid, wqsj, zjh, pch,
                         gxdyt, qxdm, qxmc, state, jzpc, sdjg, jgly)
select *
from T_PRICE_ZRZ_BACK_220620
where QXDM = '370102';
-- 创建历下还原备份表
create table T_PRICE_ZRZ_BAK_lxhy parallel 8 as
select *
from T_PRICE_ZRZ nologging;

-- 将数据来源为空的改为99
update T_PRICE_ZRZ
set DATA_SOURCE = '99'
where DATA_SOURCE is null;

-- 将不动产单元id和房屋用途相同的更新为国信达的价格
UPDATE T_PRICE_ZRZ A -- 使用别名
SET PRICE =
        (SELECT B.PRICE FROM V_GXD_ZRZ_PRICE B WHERE B.BDCDYID = A.BDCDYID and b.FWYT = a.FWYT)
WHERE a.DATA_SOURCE <> '1'
  and a.DATA_SOURCE <> '99'
  and EXISTS(SELECT 1 FROM V_GXD_ZRZ_PRICE B WHERE B.BDCDYID = A.BDCDYID and b.FWYT = a.FWYT);

UPDATE T_PRICE_ZRZ A -- 使用别名
SET ZCS = (SELECT B.ZCS FROM T_BASE_ZRZ_XZ B WHERE B.BDCDYID = A.BDCDYID)
WHERE EXISTS(SELECT 1 FROM T_BASE_ZRZ_XZ B WHERE B.BDCDYID = A.BDCDYID)
  and a.ZCS is null;

select id, lpyt, sum(zfxprice), sum(ajkprice), sum(bkprice), sum(gxdprice), sum(swprice)
from (select a.id,
             b.LPYT,
             decode(c.DATA_SOURCE, '中房协', TO_NUMBER(c.PRICE), 0) zfxPrice,
             decode(c.DATA_SOURCE, '安居客', TO_NUMBER(c.PRICE), 0) ajkPrice,
             decode(c.DATA_SOURCE, '贝壳', TO_NUMBER(c.PRICE), 0)   bkPrice,
             decode(c.DATA_SOURCE, '国信达', TO_NUMBER(c.PRICE), 0) gxdPrice,
             decode(c.DATA_SOURCE, '税务', TO_NUMBER(c.PRICE), 0)   swPrice
      from T_BASE_COMMUNITY a
               left join t_community_yt b on a.id = b.COMMUNITY_ID
               left join T_COLLECT_COMMUNITY_PRICE_HIS c on a.ID = c.COMMUNITY_ID and c.LPYT = b.LPYT)
where gxdprice is not null
   or swprice is not null
group by id, lpyt;

SELECT TE.*,
       P.PRICE,
       decode(P.FWYT, '', TE.FWYT5, NULL, TE.FWYT5, P.FWYT) as FWYT,
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
        and zrz.ZL like '%绿地国际花都一区8号楼%'
        and zrz.QXDM = '370104') TE
         LEFT JOIN T_PRICE_ZRZ P ON P.BDCDYID = TE.BDCDYID and TE.FWYT5 = p.FWYT
WHERE 1 = 1
order by p.zl, p.fwyt;

-- 李裕账号服务器的 staffId 356301226926706292
-- 本地306312188468535855
select *
from T_JGGL_EMPLOYEE;

select *
from (select a.*, c.ID GROUP_ID, c.PARENT_ID, row_number() over ( partition by a.BDCDYID order by a.QXDM,a.ZL) r
      from T_BEV_TASK_SCOPE a
               left join T_BEV_SCOPE_GROUP_DATA b on a.ID = b.SCOPE_ID
               left join T_BEV_SCOPE_GROUP c on c.id = b.GROUP_ID
      where 1 = 1
        and a.task_id = '413642450532972361'
        and b.SCOPE_ID is not null)
where r = 1;
select a.*, c.ID GROUP_ID, c.PARENT_ID, row_number() over ( partition by a.BDCDYID order by a.QXDM,a.ZL) r
from T_BEV_TASK_SCOPE a
         left join T_BEV_SCOPE_GROUP_DATA b on a.ID = b.SCOPE_ID
         left join T_BEV_SCOPE_GROUP c on c.id = b.GROUP_ID
where 1 = 1
  and a.task_id = '413642450532972361'
  and b.SCOPE_ID is not null
order by qxdm, zl;


select a.ZRZBDCDYID,
       b.BDCDYID,
       b.PRICE,
       a.PRICE,
       a.JG_SINGLE,
       b.FWYT,
       a.FWYT,
       a.hfwyt,
       b.DATA_SOURCE
from (select a.BDCDYID,
             b.BDCDYID                                                                  hbdcdyid,
             a.FWYT,
             b.FWYT                                                                     hfwyt,
             a.JG_SINGLE,
             b.PRICE,
             a.JZMJ,
             b.JZMJ                                                                     hjzmj,
             a.ZL,
             b.ZL                                                                       hzl,
             a.ZRZBDCDYID,
             b.ZRZBDCDYID                                                               hzrzbdcdyid,
             row_number() over (partition by a.ZRZBDCDYID,a.FWYT order by a.ZRZBDCDYID) r
      from T_DATA_TAX_PGJG_SZ01 a
               left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID or a.zl = b.ZL and a.FWYT = b.FWYT
      where b.BDCDYID is not null
        and b.ZL is not null
        and a.JG_SINGLE <> b.PRICE) a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where r = 1
  and a.FWYT not like '%车%';


select a.BDCDYID,
       b.BDCDYID,
       a.ZRZBDCDYID,
       b.ZRZBDCDYID,
       a.ZL,
       b.ZL,
       a.JG_SINGLE,
       b.PRICE,
       a.FWYT,
       b.FWYT,
       a.JZMJ,
       b.JZMJ
from T_DATA_TAX_PGJG_SZ01 a
         left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID or a.FWBM = b.FWBM
where a.JG_SINGLE <> b.PRICE
  and a.BDCDYID in (select a.BDCDYID
                    from T_DATA_TAX_PGJG_SZ01 a
                             left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID or a.FWBM = b.FWBM
                    where a.JG_SINGLE <> b.PRICE)
order by a.BDCDYID;

SELECT A.ID
     , A.GROUP_NAME
     , LEVEL                                    "层次"
     , PRIOR A.ID                               "父节点"
     , CONNECT_BY_ROOT A.PARENT_ID              "根节点"
     , DECODE(CONNECT_BY_ISLEAF, 1, A.ID, NULL) "子节点"
     , DECODE(CONNECT_BY_ISLEAF, 1, '是', '否') "是否子节点"
FROM T_BEV_SCOPE_GROUP A
START WITH A.ID in (select id
                    from T_BEV_SCOPE_GROUP b
                    where b.PARENT_ID = '0'
                      and b.TASK_ID = '413677342847285060') --从PARENT为空开始扫描
CONNECT BY PRIOR A.ID = A.PARENT_ID --以CHILD为父列连接PARENT
ORDER SIBLINGS BY ID DESC --对层次排序
;

select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;

select a.COMMUNITY_ID,
       b.ZRZBDCDYID,
       a.JG_ZZ,
       row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID order by a.JG_ZZ) r
from T_DATA_PGCG_XQ_ZZ_GXD a
         left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
where b.COMMUNITY_ID is not null
  and c.PRICE is null
  and b.ZRZBDCDYID = '90797';



select a.BDCDYID, a.PRICE, b.PRICE, a.FWYT, b.FWYT
from T_PRICE_ZRZ a
         left join(select *
                   from (select ZRZBDCDYID,
                                BDCDYID,
                                PRICE,
                                FWYT,
                                row_number() over (partition by ZRZBDCDYID,FWYT,PRICE order by ZRZBDCDYID) r
                         from T_H_PRICE_JZ
                         where PRICE is not null)
                   where r = 1) b on a.BDCDYID = b.ZRZBDCDYID and a.FWYT = b.FWYT
where b.PRICE is not null
  and a.PRICE <> b.PRICE
  --and a.FWYT = '住宅'
order by a.BDCDYID;



select *
from T_BEV_TASK;
select *
from T_BEV_TASK_SCOPE;
select *
from T_BEV_SCOPE_GROUP;
select *
from T_BEV_SCOPE_GROUP_DATA;
select *
from T_BEV_GROUP_STANDARD;
select *
from T_BEV_GROUP_FACTOR;
select *
from T_BEV_GROUP_STANDARD;



select BDCDYID, ZDBDCDYID, ZL, ZCS, SCJZMJ jzmj, QXDM, fwyt
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select TASK_ID,
                                 zrzbdcdyid,
                                 fwyt,
                                 row_number() over (partition by ZRZBDCDYID,FWYT,TASK_ID order by ZRZBDCDYID) r
                          from T_BEV_TASK_SCOPE)
                    where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
where TASK_ID = '413690382367995549'
order by qxdm, zl;

select *
from T_BEV_TASK_SCOPE
where TASK_ID = '413690382367995549';

select *
from (select TASK_ID,
             zrzbdcdyid,
             fwyt,
             row_number() over (partition by ZRZBDCDYID,FWYT order by ZRZBDCDYID) r
      from T_BEV_TASK_SCOPE)
where r = 1;


select *
from T_API_WSXX
WHERE CREATE_TIME < TO_DATE('20220916', 'yyyyMMdd');


-- 差 网签价格  都用房屋编码
select create_time1,
       ZL,
       FWBM,
       FWYT,
       FWYT3,
       SCJZMJ,
       jyzj,
       round(jydj, 2)                               jydj,
       (select sum(JSJE)
        from (select *
              from (select FWBM, sm, NSRMC, JSJE, row_number() over (partition by FWBM,NSRMC order by FWBM) r
                    from T_API_WSXX
                    where FWBM is not null
                      and FWBM <> '0'
                      and nsrlx = '权利人'
                      and sm = '契税')
              where r = 1) b
        where b.FWBM = a.FWBM)                      jsjg,
       round(((select sum(JSJE)
               from (select *
                     from (select FWBM, sm, NSRMC, JSJE, row_number() over (partition by FWBM,NSRMC order by FWBM) r
                           from T_API_WSXX
                           where FWBM is not null
                             and FWBM <> '0'
                             and nsrlx = '权利人'
                             and sm = '契税')
                     where r = 1) b
               where b.FWBM = a.FWBM) / SCJZMJ), 2) jsdj,
       PRICE_TOTAL,
       PRICE
from (select to_char(c.create_time, 'yyyyMMdd') create_time1,
             hb.zl,
             c.FWBM,
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
      WHERE c.fwbm in (select distinct fwbm
                       from JNPG.T_API_WSXX a
                       where a.SM = '土地增值税'
                         and a.slhjmqk <> '0'
                         and a.ywlx like '%二手%')
        and c.sm = '契税'
        and c.fwbm is not null
        and hb.fwyt3 not like '%住宅%'
        and c.ywlx like '%二手%'
      group by hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, JG.PRICE, jg.fwyt, c.JYJG,
               to_char(c.create_time, 'yyyyMMdd')
      order by to_char(c.create_time, 'yyyyMMdd')) a
where FWBM = '2013011000041807300038';

select FWYT3, FWYT4
from T_BASE_H_XZ
where zl = '历下区凤山南路1577号银丰玖玺城五区车库-1610';

select *
from T_API_WSXX
where FWBM = '2013011000041807300038'
  and NSRLX = '权利人';

select *
from (select FWBM, sm, NSRMC, JSJE, row_number() over (partition by FWBM,NSRMC order by FWBM) r
      from T_API_WSXX
      where FWBM is not null
        and FWBM <> '0'
        and nsrlx = '权利人'
        and sm = '契税')
where r = 1;
select FWBM, sm, NSRMC, JSJE, row_number() over (partition by FWBM,NSRMC order by FWBM) r
from T_API_WSXX
where FWBM is not null
  and nsrlx = '权利人'
  and sm = '契税';

select *
from T_API_WSXX
where FWBM = '2015092200064791600003';
select sum(JSJE)
from T_API_WSXX b
where b.nsrlx = '权利人'
  and sm = '契税'
  and b.FWBM = '2015092200064791600003';

select *
from T_API_WSXX
where FWBM = ''
  and nsrlx = '权利人'
  and sm = '契税';


select sum(JSJE)
from T_API_WSXX
where jsfe = '1'
  and nsrlx = '权利人'
order by FWBM;

select *
from T_API_WSXX
where to_char(create_time, 'yyyyMMdd') = to_char(sysdate, 'yyyyMMdd')
  and FWBM = '20080925005673';
-- 有土地增值 是卖房


select *
from T_API_WSXX a
where to_char(create_time, 'yyyyMMdd') = to_char(sysdate, 'yyyyMMdd')
  and a.nsrlx = '权利人'
  and a.jsfe = '50';

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
        and zrz.ZL like '%钢城区北赵小区19-C1%'
        and zrz.QXDM = '371203') TE
         LEFT JOIN T_PRICE_ZRZ P ON P.BDCDYID = TE.BDCDYID and TE.FWYT5 = p.FWYT
WHERE 1 = 1
order by p.zl, p.fwyt;


select a.QXDM                       区县名称,
       b.COMMUNITY                  楼盘名称,
       a.ZL                         坐落,
       a.FWYT                       房屋用途,
       round(c.SCJZMJ, 2)           建筑面积,
       a.PRICE                      单价,
       round(c.SCJZMJ * a.PRICE, 2) 总价
from T_PRICE_ZRZ a
         left join V_COMMUNITY_GL_ZRZ b on a.BDCDYID = b.ZRZBDCDYID
         left join (select *
                    from (select ZRZBDCDYID, SCJZMJ, row_number() over (partition by ZRZBDCDYID order by co desc ) r
                          from (select ZRZBDCDYID, SCJZMJ, count(0) co
                                from T_BASE_H_XZ
                                where FWYT4 = '车位/车库'
                                group by ZRZBDCDYID, SCJZMJ))
                    where r = 1
                    order by ZRZBDCDYID) c on a.BDCDYID = c.ZRZBDCDYID
where a.FWYT like '%车%'
  and PRICE <> 0
order by b.COMMUNITY;


select *
from T_PRICE_ZRZ;


select distinct BDCDYID
from T_YW_PRICE_FEEDBACK;


update T_H_PRICE_JZ
set ISONE ='1'
where BDCDYID in (select T_YW_PRICE_FEEDBACK.BDCDYID
                  from T_YW_PRICE_FEEDBACK);
select ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ
where COMMUNITY = '龙山希思庄园';


select *
from T_PRICE_ZRZ
where BDCDYID in (select ZRZBDCDYID
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY = '龙山希思庄园')
  and FWYT = '住宅';


select zrz.BDCDYID,
       zrz.ZL,
       zrz.ZHS,
       zrz.TQZH,
       zrz.SCJZMJ,
       zrz.ZCS,
       zrz.ZTS,
       zrz.DSCS,
       zrz.DXCS,
       decode(zrz.JGRQ, '', decode(b.JCND, '', '', null, '', JCND), null, decode(b.JCND, '', '', null, '', JCND),
              to_char(zrz.JGRQ, 'yyyy-mm-dd')) AS JCND,
       c.FWYT4                                    fwyt
from T_BASE_ZRZ_XZ zrz
         left join T_COMMTY_GL_ZD z on zrz.ZDBDCDYID = z.ZD_ID
         left join T_BASE_COMMUNITY b on z.COMMUNITY_ID = b.ID
         left join (select *
                    from (select bdcdyid, fwyt4, row_number() over (partition by BDCDYID,FWYT4 order by BDCDYID) r
                          from T_DATA_TQJG_ZRZ)
                    where r = 1) c on zrz.BDCDYID = c.BDCDYID
where zrz.ZL like '%鲁商国奥城%';


select *
from T_BASE_H_XZ
where BDCDYID = '121212121212121212';

select zrzbdcdyid
from V_COMMUNITY_GL_ZRZ;



select *
from T_H_PRICE_JZ
where zl like '历下区工业南路57号高新万达广场8号地块南区商业中心';

select *
from T_PRICE_ZRZ
where zl = '历下区工业南路57号高新万达广场8号地块南区商业中心';

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '929741'
  and FWYT3 = '商务办公'
  and JZMJ < 70;

update T_H_PRICE_JZ
set PRICE       = 8142.86,
    PRICE_TOTAL = 8142.86 * JZMJ,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ='商务办公实际用途公寓'
where BDCDYID in (select BDCDYID
                  from T_H_PRICE_JZ
                  where ZRZBDCDYID = '929741'
                    and FWYT3 = '商务办公'
                    and JZMJ < 70);

select PRICE
from GXDZZGX20220826
where ZRZBDCDYID = 'LWSXCQ_Z1470'
  and FWYT = '住宅';

update GXDZZGX20220826
set PRICE       = 4679,
    PRICE_TOTAL = 4679 * JZMJ
where ZRZBDCDYID = 'LWSXCQ_Z1804'
  and FWYT = '住宅';


select count(0)
from T_BASE_H_XZ;



select lower(temp.column_name) as column_name,
       (case
            when (temp.nullable = 'N'
                and temp.constraint_type != 'P') then '1'
            else null
           end)                as is_required,
       (case
            when temp.constraint_type = 'P' then '1'
            else '0'
           end)                as is_pk,
       temp.column_id          as sort,
       temp.comments           as column_comment,
       (case
            when temp.constraint_type = 'P' then '1'
            else '0'
           end)                as is_increment,
       lower(temp.data_type)   as column_type
from (select col.column_id,
             col.column_name,
             col.nullable,
             col.data_type,
             colc.comments,
             uc.constraint_type,
             row_number() over (partition
                 by
                 col.column_name
                 order by
                     uc.constraint_type desc) as row_flg
      from user_tab_columns col
               left join
           user_col_comments colc
           on colc.table_name = col.table_name
               and colc.column_name = col.column_name
               left join
           user_cons_columns ucc
           on ucc.table_name = col.table_name
               and ucc.column_name = col.column_name
               left join
           user_constraints uc
           on uc.constraint_name = ucc.constraint_name
      where col.table_name = upper('t_base_zrz_xz')) temp
WHERE temp.row_flg = 1
ORDER BY temp.column_id;

select *
from T_BASE_H_XZ
where bz = 'lilu：于2022-11-09新增'
  and FWYT4 is null;

select distinct FWYT4, FWYT3
from T_BASE_H_XZ
where FWYT4 is not null;

select distinct FWYT3, PNAME
from T_FWYT_ASYS_500
where PNAME is not null;

select distinct PNAME
from T_FWYT_ASYS
where PNAME is not null;

select FWYT3, count(0)
from T_FWYT_ASYS_500
group by FWYT3
having count(0) > 1;

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '618981';

-- tnmj > 14  155000
update T_H_PRICE_JZ
set PRICE_TOTAL = 155000,
    PRICE       = 155000 / JZMJ,
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where BDCDYID in (select BDCDYID
                  from T_BASE_H_XZ
                  where ZRZBDCDYID = '618981'
                    and SCTNJZMJ > 14);

select distinct FWYT4, FWYT3
from T_BASE_H_XZ
where ZRZBDCDYID in (select BDCDYID
                     from T_BASE_ZRZ_XZ
                     where zl like '%历下区经十路9777号%');

--

select ZRZBDCDYID, ZRZ_ZL
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = 'CB0F6F22107066B1E053AF5D14ACBB0C';


select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '838665'
  and FWYT3 = '子母车位';

select BDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724'
  and FWYT4 = '车位/车库'
  and SCTNJZMJ > 14;

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '838665'
  and FWYT = '车位/车库'
  and FWYT3 <> '子母车位';

select count(0)
from T_BASE_H_XZ
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY_ID = 'CB0F6F22107066B1E053AF5D14ACBB0C')
  and FWYT3 in ('车库', '车位', '双层停车位')
  and SCTNJZMJ < 14;

-- select BDCDYID
-- from T_BASE_H_XZ
-- where ZRZBDCDYID = '618981'
--   and SCTNJZMJ > 14;


update T_BASE_H_XZ a
set FWYT4 = (select PNAME from T_FWYT_ASYS_500 b where a.FWYT3 = b.FWYT3 and ROWNUM = 1 and PNAME is not null)
where exists(select 1 from T_FWYT_ASYS_500 b where a.FWYT3 = b.FWYT3 and ROWNUM = 1 and PNAME is not null)
  and BZ = 'lilu：于2022-11-09新增';

select dyh,
       fh,
       qsc,
       cx,
       szc,
       zcs,
       cg,
       zrzh,
       SCJZMJ,
       FWYT3,
       FWYT4
from T_BASE_H_XZ
where zl = '历下区经十路9777号鲁商国奥城项目4、5号楼5-3501';
INSERT INTO JNPG.T_BASE_H_XZ (BDCDYID, YSDM, BDCDYH, XMBH, FWBM, ZRZBDCDYID, ZDDM, ZDBDCDYID, ZRZH, LJZID, LJZH, CID,
                              CH, ZL, MJDW, QSC, SZC, ZCS, HH, SHBW, HX, HXJG, FWYT1, FWYT2, FWYT3, YCJZMJ, YCTNJZMJ,
                              YCFTJZMJ, YCDXBFJZMJ, YCQTJZMJ, YCFTXS, SCJZMJ, SCTNJZMJ, SCFTJZMJ, SCDXBFJZMJ, SCQTJZMJ,
                              SCFTXS, GYTDMJ, FTTDMJ, DYTDMJ, TDSYQR, FDCJYJG, GHYT, FWJG, JGSJ, FWLX, FWXZ, ZDMJ, SYMJ,
                              CQLY, QTGSD, QTGSX, QTGSN, QTGSB, FCFHT, ZT, QXDM, QXMC, DJQDM, DJQMC, DJZQDM, DJZQMC,
                              YXBZ, CQZT, DYZT, XZZT, BLZT, YYZT, DCXMID, FH, BGZT, DJZT, CREATETIME, MODIFYTIME,
                              FCFHTWJ, YFWXZ, YFWYT, YGHYT, YFWJG, RELATIONID, YZL, XMMC, FWCB, GZWLX, YFWCB, PACTNO,
                              XMZL, SFLJQPJYC, QLXZ, TDSYQQSRQ, TDSYNX, TDSYQZZRQ, FCFHTSLTX, CRJJE, FWTDYT, ZZC, DYH,
                              BZ, CHSJ, MYC, DY, MJDWMC, FWYTMC, YTMJ, YZM, XGSJ, FXH, SFQC, QCSJ, ZRZHLINK,
                              YZRZBDCDYID, YBDCDYH, ZRZZL, CHJG, ZQFWBM, SCFCFHTSJ, FCT, SCFCTSJ, FHT, SCFHTSJ, FWZT,
                              FCFHTWJLX, DCXMBH, BDCDYH_OLD, ZDBDCDYID_NEW, BDCDYH_NEW, QDH, JYFHTPATH, FWXSZT, DCZT,
                              DI_CHANGE, SCJZMJ1, FWYT4, QSZT, TQZH, TQHH, OPSTATE, FH1, TQHH2, ZT_SYNC, FWZLZT,
                              UPDATE_FLAG, DELETE_FLAG, ZZYT, QUALIFY, CX, CG)
VALUES ('37330821', null, '370102012202GB00012F10030268', null, '2013072500045398600825', '1134724',
        '370102012202GB00012', 'ab83f2b29ee844f09455c0e8322b127d', '20130725000453986', null, null, null, '35',
        '历下区经十路9777号鲁商国奥城项目4、5号楼5-3501', '1', 35.0000000000000000, '35', 51, 0, null, null, null, '2',
        '2', '办公', 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000,
        0.0000000000000000, 538.3900000000000000, 350.1400000000000000, 188.2500000000000000, 0.0000000000000000,
        0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, null,
        0.0000000000000000, null, '3', null, null, null, 0.0000000000000000, 0.0000000000000000, null, null, null, null,
        null, null, 1, '370102', null, null, null, null, null, null, null, null, null, null, null, null, '3501', null,
        null, null, null, null, null, null, null, null, '7297', null, null, null, null, null, null, null, 0, null, null,
        0, null, null, null, null, 35.0000000000000000, '1', null, null, null, '1', null, null, null,
        'xMNssIQusFgmrAhzTDCrFwmompP+7jtSLThmiRfro5E=', TO_DATE('2018-03-24 09:54:19', 'YYYY-MM-DD HH24:MI:SS'), 10, 0,
        null, null, null, '370102012202GB00012F10030268', null, null, '2013072500045398600825', null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, '办公', '1', '5', '3501', 10,
        '3501', null, 1, null, '1', null, null, null, null, null);


-- 查看路径
SELECT T.TABLESPACE_NAME,
       D.FILE_NAME,
       D.AUTOEXTENSIBLE,
       D.BYTES,
       D.MAXBYTES,
       D.STATUS
FROM DBA_TABLESPACES T,
     DBA_DATA_FILES D
WHERE T.TABLESPACE_NAME = D.TABLESPACE_NAME
ORDER BY TABLESPACE_NAME, FILE_NAME;

select BDCDYID
from T_BASE_H_XZ
where zl = '历下区经十路9777号鲁商国奥城项目4、5号楼-204';

select QUALIFY
from T_BASE_H_XZ
where zl = '历下区经十路9777号鲁商国奥城项目4、5号楼5-3501';

select *
from T_FILE_PATH;

select distinct szc
from T_BASE_H_XZ;

-- t_file_path_realestate主键序列
create sequence seq_t_file_path_realestate
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

select *
from T_BASE_H_XZ
where QUALIFY is not null;

select *
from T_BASE_H_XZ;

update T_BASE_H_XZ
set QUALIFY = null
where QUALIFY is not null;

select *
from T_FILE_PATH_REALESTATE;

select *
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724'
  and QUALIFY = '1';

-- 历下区经十路9777号鲁商国奥城项目4、5号楼子母车位06

update T_BASE_H_XZ
set QUALIFY = '1'
where zl = '历下区经十路9777号鲁商国奥城项目4、5号楼子母车位06';

-- 查看利用率
select *
from (Select a.tablespace_name,
             to_char(a.bytes / 1024 / 1024, '99,999.999')                         total_bytes,
             to_char(b.bytes / 1024 / 1024, '99,999.999')                         free_bytes,
             to_char(a.bytes / 1024 / 1024 - b.bytes / 1024 / 1024, '99,999.999') use_bytes,
             to_char((1 - b.bytes / a.bytes) * 100, '99.99') || '%'               use
      from (select tablespace_name,
                   sum(bytes) bytes
            from dba_data_files
            group by tablespace_name) a,
           (select tablespace_name,
                   sum(bytes) bytes
            from dba_free_space
            group by tablespace_name) b
      where a.tablespace_name = b.tablespace_name
      union all
      select c.tablespace_name,
             to_char(c.bytes / 1024 / 1024, '99,999.999')                  total_bytes,
             to_char((c.bytes - d.bytes_used) / 1024 / 1024, '99,999.999') free_bytes,
             to_char(d.bytes_used / 1024 / 1024, '99,999.999')             use_bytes,
             to_char(d.bytes_used * 100 / c.bytes, '99.99') || '%'         use
      from (select tablespace_name, sum(bytes) bytes
            from dba_temp_files
            group by tablespace_name) c,
           (select tablespace_name, sum(bytes_cached) bytes_used
            from v$temp_extent_pool
            group by tablespace_name) d
      where c.tablespace_name = d.tablespace_name)
order by tablespace_name;


-- 查看路径
SELECT T.TABLESPACE_NAME,
       D.FILE_NAME,
       D.AUTOEXTENSIBLE,
       D.BYTES,
       D.MAXBYTES,
       D.STATUS
FROM DBA_TABLESPACES T,
     DBA_DATA_FILES D
WHERE T.TABLESPACE_NAME = D.TABLESPACE_NAME
ORDER BY TABLESPACE_NAME, FILE_NAME;

ALTER TABLESPACE JNPG ADD DATAFILE
    '/oracle/app/oracle/product/11.2.0/db/dbs/JNPG4.dbf' SIZE 4 G
    AUTOEXTEND ON
    NEXT 4 G
    MAXSIZE UNLIMITED;

-- 370112003008GB01002F10000127
-- 370112003008GB01051F10010127
select *
from T_BASE_H_XZ
where BDCDYH = '370112003008GB01051F10010127';

select BDCDYID,
       ZL,
       round(SCJZMJ, 2) SCJZMJ,
       ZCS,
       ZRZH,
       DSCS,
       DXCS,
       QXDM
from T_BASE_ZRZ_XZ
where QXDM = '370102'
  and DSCS is not null
  and DXCS is not null
  and DSCS <> 0;

select COMMUNITY,
       ALIAS,
       ZL,
       KFS,
       WYGS,
       ZDS,
       ZHS,
       JCND,
       RJL,
       lhl
from T_BASE_COMMUNITY
where ALIAS is not null
  and ZHS is not null;

select distinct CLASS_TEXT
from TX_POI_4326
where CLASS_TEXT like '%路%';

select XXMC, zl, XXLX, xxxz, XXDJ
from T_BASE_SCHOOLDISTRICT;


select BDCDYH,
       FWBM,
       SM,
       NSRMC,
       NSRLX,
       JSJE,
       SLHJMQK,
       SNJE,
       WSSJ,
       JSFE
from T_API_WSXX
where YWLX like '%二手%';

select count(0)
from T_H_PRICE_JZ
where FWYT = '住宅'
  and PRICE is not null;

select count(0)
from T_H_PRICE_JZ
where FWYT <> '住宅'
  and PRICE is not null;

select DATA_SOURCE, count(0)
from T_PRICE_ZRZ
group by DATA_SOURCE;

select *
from T_PRICE_ZRZ
where DATA_SOURCE is null;

update T_PRICE_ZRZ
set DATA_SOURCE = '4'
where DATA_SOURCE is null
  and JGLY = '4:国信达提供';

update T_PRICE_ZRZ
set DATA_SOURCE = '1'
where DATA_SOURCE is null
  and JGLY = '1:税务提供';

select QXDM, count(0)
from T_PRICE_ZRZ
where DATA_SOURCE = '1'
group by QXDM;

select FWYT, count(0)
from T_PRICE_ZRZ
where DATA_SOURCE = '1'
  and QXDM = '370103'
group by FWYT;

select *
from T_PRICE_ZRZ
where FWYT = '住宅';

select QXDM, count(0)
from T_PRICE_ZRZ
where BZ like '%2018年市税务局招标数据入库%'
group by QXDM;


select *
from T_BASE_ZRZ_XZ
where ZL like '%鲁商国奥城%';

select zl, hh, FXH
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724';

select *
from T_FILE_PATH_REALESTATE;

-- JNPG.T_DATA_PGCG_XQ3_GXD.BZ='20221116区县非住宅入库'  批量更新scj

select *
from T_DATA_PGCG_XQ3_GXD
where BZ = '20221116区县非住宅入库';
select count(0)
from T_BASE_H_XZ
where ZRZBDCDYID in (select BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '20221116区县非住宅入库');

select distinct ISONE
from T_H_PRICE_JZ;

select *
from T_H_PRICE_JZ
where ZRZBDCDYID in (select BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '20221116区县非住宅入库')
  and ISONE is not null;

select BDCDYID, FH, HH, SZC
from T_BASE_H_XZ
where zl = '历下区经十路9777号鲁商国奥城项目4、5号楼子母车位06';

update T_BASE_H_XZ
set FH     = '子母车位06',
    QUALIFY='1'
where BDCDYID = '37329689';

select distinct PNAME fwyt4
from T_FWYT_ASYS
where FWYT3 in (select distinct FWYT3
                from T_BASE_H_XZ
                where FWYT4 is null
                  and fwyt3 is not null)
  and PNAME is not null;

select count(0)
from T_BASE_H_XZ
where FWYT4 is null
  and fwyt3 is not null;

-- 195864  184905
update T_BASE_H_XZ a
set FWYT4 = (select PNAME fwyt4
             from T_FWYT_ASYS
             where FWYT3 = a.FWYT3
               and ROWNUM = 1
               and PNAME is not null)
where FWYT4 is null
  and FWYT3 is not null;


select BDCDYID, zl
from T_BASE_ZRZ_XZ
where zl like '%鲁商国奥城%';

select count(0)
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724'
  and QUALIFY = '1';

select QUALIFY
from T_BASE_H_XZ
where BDCDYID = '37329680';

update T_BASE_H_XZ
set cx = null
where bdcdyid IN (
                  '37329691', '37331136', '37329848', '37329860', '37329694', '37329849', '37329858', '37329859',
                  '37329873', '37329876', '37330309', '37330312', '37330165', '37330705', '37330775', '37331004',
                  '37331037', '37331070', '37331105', '37329695'
    );


select *
from T_BASE_ZRZ_XZ
where zl = '槐荫区经六路500号新世界阳光花园（西区';

select *
from T_BASE_COMMUNITY
where COMMUNITY = '槐荫区经六路500号新世界阳光花园（西区）';



select distinct ISONE
from T_H_PRICE_JZ
where ZL like '槐荫区经六路500号新世界阳光花园（西区）%'
  and FWYT3 = '车库';

update T_H_PRICE_JZ
set PRICE       = round(13500 / JZMJ, 2),
    PRICE_TOTAL = 13500,
    BZ          = '整体更新国信达提供'
where ZL like '槐荫区经六路500号新世界阳光花园（西区）%'
  and FWYT3 = '车库';

update T_H_PRICE_JZ
set OLD_PRICE = PRICE
where ZL like '槐荫区经六路500号新世界阳光花园（西区）%'
  and FWYT3 = '车库';

select *
from T_API_WSXX;

select ZDBDCDYID
from T_BASE_ZRZ_XZ
where BDCDYID = '1134724';

select *
from T_BASE_COMMUNITY
where COMMUNITY like '%鲁商国奥城%';

select *
from T_API_WSXX
order by CREATE_TIME desc;

select *
from T_BASE_H_XZ
where ROWNUM = 1;

select *
from T_BASE_ZD_XZ
where BDCDYID = 'ab83f2b29ee844f09455c0e8322b127d';

select *
from TX_SCHOOL_AREA_A
where COMMUNITY_ID = '3b4f486bf28a4f2bbee1760fd8446ea2';

select *
from T_BASE_SCHOOLDISTRICT;

select *
from T_BASE_ZRZ_XZ
where zl = '历下区旅游路21477号杰正岭寓广场2号楼';

select FWYT3, FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID = '684038'
  and FWYT4 = '办公';

select count(0)
from T_H_PRICE_JZ
where ZRZBDCDYID = '684038';

update T_H_PRICE_JZ
set FWYT = '办公'
where FWYT3 = '商业服务'
  and ZRZBDCDYID = '684038';


select BDCDYID
from T_BASE_ZRZ_XZ
where ZL like '市中区经十路21566号万科悦峯中心办公楼%';

select *
from T_BASE_H_XZ
where ZRZBDCDYID = '1456254';

select *
from T_NETDATA_COMMUNITY_NEW;

select *
from T_BASE_COMMUNITY;

select *
from T_H_PRICE_JZ
where zl = '商河县彩虹路以北、商西路以西（凤凰城小区）3#楼K06';

select *
from T_H_PRICE_JZ
where BDCDYH = '370126001019GB00004F00040009';

update T_H_PRICE_JZ
set PRICE_TOTAL = 153000,
    PRICE       = round(153000 / JZMJ, 2),
    BZ='单户变更总价   市场价（含税）153000   数据来源：税务'
where BDCDYID = '48018477';

select BDCDYH
from T_BASE_H_XZ
where ZL like '商河县彩虹路以北、商西路以西（凤凰城小区）3#楼K06%';


select COMMUNITY_ID
from JNPG.T_DATA_PGCG_XQ_ZZ_GXD
where COMMUNITY = '鲁能领秀城东一区';

select *
from T_PRICE_ZRZ
where BDCDYID in (select ZRZBDCDYID, ZRZ_ZL
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY_ID = 'CB0F6F22108166B1E053AF5D14ACBB0C')
  and FWYT = '住宅';


select distinct QXDM
from T_H_PRICE_JZ_730;

select distinct QXDM
from T_H_PRICE_JZ_0813;

select distinct QXDM
from T_H_PRICE_JZ_0815;

select *
from T_BASE_SQ;

select *
from T_BASE_COMMUNITY;

select distinct BZ
from T_PRICE_ZRZ;


create table T_H_PRICE_JZ_2022ZJ parallel 8 as
select *
from T_H_PRICE_JZ_1025 nologging;

delete
from T_H_PRICE_JZ_2020ZJ
where FWYT <> '住宅';

truncate table T_H_PRICE_JZ_2020ZJ;

insert into T_H_PRICE_JZ_2020ZJ (id, bdcdyid, bdcdyh, zrzbdcdyid, zdbdcdyid, qxdm, zl, fwyt, price, price_total, jzmj,
                                 szc, zcs, createuser, createtime, jzpc, fwyt3, fwbm, updateuser, updatetime, old_price,
                                 bz, isone)
select *
from T_H_PRICE_JZ_1025
where FWYT = '住宅';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '333980427918912282';


select a.BDCDYID, a.ZL
from T_BASE_ZRZ_XZ a
         left join T_DATA_TQJG_ZRZ b on a.BDCDYID = b.BDCDYID
         left join T_PRICE_ZRZ c on a.BDCDYID = c.BDCDYID and b.FWYT5 = c.FWYT
where a.BDCDYID not in (select ZRZBDCDYID from V_COMMUNITY_GL_ZRZ)
  and a.QXDM = '370112'
  and c.PRICE is null
  and b.FWYT5 is not null;

select BDCDYID, ZL, ZDBDCDYID
from T_BASE_ZRZ_XZ
where BDCDYID = '208394';


select *
from T_COMMTY_GL_ZRZ
where ZRZBDCDYID = '208394';

select *
from T_YW_PRICE_FEEDBACK
where ZL like '%天悦府%';

select COMMUNITY_ID
from V_COMMUNITY_GL_ZRZ
where ZRZBDCDYID = '913926';

select *
from T_PRICE_ZRZ
where BDCDYID = '913926';

select *
from T_BASE_ZRZ_XZ
where BDCDYID not;

select *
from T_PRICE_ZRZ
where zl = '槐荫区纬六路47号楼';

select *
from T_BASE_H_XZ
where ZL like '%鲁商国奥城%';

select *
from T_COMMTY_GL_ZRZ;

select *
from T_PRICE_ZRZ;

delete
from T_BASE_H_XZ
where ZRZBDCDYID in (select T_BASE_ZRZ_XZ.BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZL like '%会展西路88号%');

select JGSJ, zqzr
from T_BASE_H_XZ
where ZRZBDCDYID in (select T_BASE_ZRZ_XZ.BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZL like '%会展西路88号%');
update T_BASE_H_XZ
set JGSJ = TIMESTAMP '2010-01-01 10:34:14'
where ZRZBDCDYID in (select T_BASE_ZRZ_XZ.BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZL like '%会展西路88号%')


select *
from BDCDCK.BDCS_ZRZ_XZ
where ZL like '%会展西路88号%';

select distinct BZ
from T_BASE_H_XZ
where BZ like '%lilu%';



truncate table base_h_temp;


create table base_h_temp as
select *
from T_BASE_H_XZ
where 1 = 2;
select *
from (select distinct FWYT3, PNAME fwyt4
      from T_FWYT_ASYS_500
      where PNAME is not null
        and FWYT3 is not null)
where FWYT3 = '商业';

select distinct FWYT3, PNAME fwyt4
from T_FWYT_ASYS_500
where PNAME is not null
  and FWYT3 is not null

select count(0)
from T_BASE_H_XZ
where FWYT4 = '商铺';

select *
from T_FWYT_ASYS_500
where FWYT3 = '商业';

select *
from T_PRICE_ZRZ
where FWYT = '商铺';


select id
from T_BASE_COMMUNITY
where COMMUNITY = '敦厚里';

select *
from TX_COMMUNITY_A
where COMMUNITY_ID = '356301244106575737';

select *
from T_BASE_COMMUNITY
where SFLD is null
  and id not like '%li%';

select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID = '356302176114478762'
  and rownum = 1;

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '356302176114478762';

select ZDBDCDYID
from T_BASE_ZRZ_XZ
where zl = '槐荫区经三纬十一路294号';

select BDCDYID, ZRZBDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724';

select *
from T_BASE_H_XZ
where zl like '%万达%';

select *
from task;

SELECT *
FROM (SELECT TMP_PAGE.*,
             ROWNUM PAGEHELPER_ROW_ID
      FROM (SELECT a.id,
                   a.hbdcdyid,
                   a.zrzbdcdyid,
                   a.zdbdcdyid,
                   a.community_id,
                   a.task_name,
                   a.object_type,
                   a.zl,
                   a.investigator_id,
                   a.investigator_name,
                   a.client,
                   a.client_idnum,
                   a.sfqlr,
                   a.result,
                   a.investigator_sign,
                   a.client_sign,
                   a.qlr_sign,
                   a.create_user,
                   a.create_time,
                   a.check_id,
                   a.task_desc,
                   a.actflag,
                   a.pub_time,
                   a.del_flag,
                   a.TASK_LEVEL,
                   a.ACTINSTID,
                   a.ACCEPT_TIME,
                   b.field_total,
                   a.PHONE,
                   a.TASK_TYPE,
                   a.DEP_ID,
                   a.TASK_YT,
                   a.smx,
                   a.smy,
                   a.HOMEOWNER
            FROM t_yw_survey_task a
                     LEFT JOIN
                 (SELECT taskid,
                         count(1) field_total
                  FROM T_YW_SURVEY_FIELD
                  GROUP BY taskid) b
                 ON a.ID = b.TASKID
            WHERE a.actflag = '200'
            order by create_time desc) TMP_PAGE)
WHERE PAGEHELPER_ROW_ID <= 10
  AND PAGEHELPER_ROW_ID > 0;



SELECT count(0)
FROM t_yw_survey_task a
         LEFT JOIN
     (SELECT taskid,
             count(1) field_total
      FROM T_YW_SURVEY_FIELD
      GROUP BY taskid) b
     ON a.ID = b.TASKID
WHERE a.actflag = '200';



SELECT *
FROM (SELECT TMP_PAGE.*,
             ROWNUM PAGEHELPER_ROW_ID
      FROM (SELECT a.id,
                   a.hbdcdyid,
                   a.zrzbdcdyid,
                   a.zdbdcdyid,
                   a.community_id,
                   a.task_name,
                   a.object_type,
                   a.zl,
                   a.investigator_id,
                   a.investigator_name,
                   a.client,
                   a.client_idnum,
                   a.sfqlr,
                   a.result,
                   a.investigator_sign,
                   a.client_sign,
                   a.qlr_sign,
                   a.create_user,
                   a.create_time,
                   a.check_id,
                   a.task_desc,
                   a.actflag,
                   a.pub_time,
                   a.del_flag,
                   a.TASK_LEVEL,
                   a.ACTINSTID,
                   a.ACCEPT_TIME,
                   b.field_total,
                   a.PHONE,
                   a.TASK_TYPE,
                   a.DEP_ID,
                   a.TASK_YT,
                   a.smx,
                   a.smy,
                   a.HOMEOWNER
            FROM t_yw_survey_task a
                     LEFT JOIN
                 (SELECT taskid,
                         count(1) field_total
                  FROM T_YW_SURVEY_FIELD
                  GROUP BY taskid) b
                 ON a.ID = b.TASKID
            WHERE a.actflag = '200'
            order by create_time desc) TMP_PAGE)
WHERE PAGEHELPER_ROW_ID <= 10
  AND PAGEHELPER_ROW_ID > 0;

select *
from V_DATA_WSXX_MISSING;

select *
from T_API_WSXX;


select count(0)
from V_DATA_WSXX_MISSING;

select count(0)
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
      from (select to_char(c.create_time, 'yyyy-MM-dd')                                                            create_time,
                   hb.BDCDYID,
                   hb.ZRZBDCDYID,
                   hb.zl,
                   c.FWBM,
                   c.FYBH,
                   c.YWH,
                   hb.QXDM,
                   hb.fwyt3,
                   decode(hb.fwyt4, '车位/车库', decode(sign(c.JYJG - 300000), 1, '住宅', -1, hb.fwyt4, hb.fwyt4),
                          '储藏室/阁楼', decode(sign(c.JYJG - 300000), 1, '住宅', -1, hb.fwyt4, hb.fwyt4),
                          hb.fwyt4)                                                                                fwyt,
                   hb.scjzmj,
                   c.JYJG                                                                                          jyzj,
                   (c.JYJG / hb.scjzmj)                                                                            jydj,
                   JG.PRICE_TOTAL,
                   JG.PRICE,
                   c.YWLX,
                   row_number() over (partition by hb.BDCDYID,
                       hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH,
                       JG.PRICE, hb.fwyt4,
                       c.JYJG, to_char(c.create_time, 'yyyy-MM-dd') order by to_char(c.create_time, 'yyyy-MM-dd')) r
            from JNPG.T_API_WSXX C
                     left join jnpg.t_base_h_xz hb ON HB.FWBM = c.FWBM
                     left join JNPG.T_H_PRICE_JZ JG ON JG.FWBM = C.FWBM
            WHERE c.sm = '契税'
              and c.fwbm is not null
              and hb.SCJZMJ is not null
              and SCJZMJ <> 0
              and JYJG is not null
              and JSJE is not null
            order by to_char(c.create_time, 'yyyy-MM-dd') desc)
      where r = 1);


select *
from T_YW_PGRW;

select a.COMMUNITY_ID, a.COMMUNITY, b.COMMUNITY, a.COMM_ZL, b.ZL
from TX_COMMUNITY_A a
         left join T_BASE_COMMUNITY b on a.COMMUNITY_ID = b.ID
where b.ID is not null;

update TX_COMMUNITY_A a
set COMMUNITY = (select b.COMMUNITY from T_BASE_COMMUNITY b where a.COMMUNITY_ID = b.ID and a.COMMUNITY <> b.COMMUNITY)
where EXISTS(select 1 from T_BASE_COMMUNITY b where a.COMMUNITY_ID = b.ID and a.COMMUNITY <> b.COMMUNITY);

select COMMUNITY || ',' || zl as name
from T_BASE_COMMUNITY;

select decode(zl, null, COMMUNITY, '', COMMUNITY, COMMUNITY || ',' || zl) as name
from T_BASE_COMMUNITY;

select row_number() over (partition by BDCDYID order by BDCDYID) r
from T_BASE_H_XZ;

select *
from T_H_PRICE_JZ
where BDCDYID = '38571803';

select ZL, BDCDYID
from T_BASE_H_XZ
where zl like '市中区阳光新路67号欧亚大观商都A、%2-1513%';

select *
from T_YW_PGRW
where ZL = '槐荫区金科世界城一区商业、商务办公楼2612';

select *
from T_BASE_H_XZ
where BDCDYID = '5044526';

select *
from T_PRICE_ZRZ;


select *
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ = '2018年市税务局招标数据入库,12.06整理'
  and LPYT = '高层';

select BDCDYID, DSCS
from T_BASE_ZRZ_XZ
where BDCDYID in (select ZRZBDCDYID
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY_ID = 'CB0F6F220C2966B1E053AF5D14ACBB0C');

select ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = 'CB0F6F220C2966B1E053AF5D14ACBB0C';

select *
from T_PRICE_ZRZ
where ZL = '长清区大学路6677号恒大绿洲小区一期10号楼';

select *
from T_API_RECORD
order by REQ_TIME desc;

select *
from T_YW_PGRW;

select *
from T_YW_PRICE_FEEDBACK
where BDCDYH = '370105012002GB00001F00010751';

select *
from T_BASE_H_XZ
where BDCDYID = '8915376';

select *
from T_H_PRICE_JZ
where bdcdyid = '8915376';

select *
from T_BASE_H_XZ;

select *
from T_BASE_H_XZ
where ZRZBDCDYID = '599760'
  and bz is not null;


select KFS, WYGS
from T_BASE_COMMUNITY
where XZLDJ is not null
  and ZJDW is not null
  and ZJJG is not null;

select *
from t_base_enterprise;

select *
from T_YW_PRICE_FEEDBACK
where TBFW is not null;

select *
from T_H_PRICE_JZ;

select *
from T_PRICE_ZRZ
where DATA_SOURCE is null;


select *
from T_H_PRICE_JZ
where ZL like '%经十路9777%3号楼%'
  and FWYT = '办公';

select *
from T_YW_PRICE_FEEDBACK
where ISWJ = '1';

select *
from T_YW_PGRW
where id = '450018134879933358';

select *
from T_COLLECT_COMMUNITY_ZJ_HIS;

select *
from T_ZRZ_PRICE_RECORD;

select *
from T_COMMUNITY_PRICE_RECORD;



select *
from T_API_WQXX;

select *
from T_API_WQXX_ZRFXX;
ZRZ_PRICE_20221207;

select *
from T_H_PRICE_JZ
where ZL like '历下区奥体西路2377号万科城%'
  and FWYT3 = '储藏'
  and szc in ('-1', '-2');

update T_H_PRICE_JZ
set PRICE      = 4400,
    PRICE_TOTAL=4400 * JZMJ,
    BZ='20230113 修改'
where id in (select ID
             from T_H_PRICE_JZ
             where ZL like '历下区奥体西路2377号万科城%'
               and FWYT3 = '储藏'
               and szc in ('-1', '-2'));


SELECT count(0)
FROM t_yw_price_feedback;

select ID, XZQ
from T_BASE_COMMUNITY
where COMMUNITY like '%财政局家属楼%';

select *
from T_DATA_XQ_ZZ_GXD
where COMMUNITY_ID_PG = '450018246549082640';

select *
from T_DATA_XQ_ZZ_GXD
where COMMUNITY_ID_PG = '450017769807712961';

select *
from T_PRICE_ZRZ
where COMMUNITY_ID = '450017769807712961'
  and FWYT = '住宅';

select ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '450017769807712961';

select distinct ZRZBDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY_ID = '450017769807712961')
  and FWYT4 = '住宅';


-- GXDZZGX20220826
select ID, COMMUNITY
from T_BASE_COMMUNITY
where COMMUNITY like '%富康苑别墅%';

select *
from T_PRICE_ZRZ
where COMMUNITY_ID = '450017739742941964';

select *
from T_DATA_XQ_ZZ_GXD
where COMMUNITY_ID_PG = '356301235516641266';

select *
from T_PRICE_ZRZ
where COMMUNITY_ID = '356301235516641026'
  and ZZFSYT = '联排别墅';

select *
from T_PRICE_ZRZ
where BDCDYID in (select ZRZBDCDYID
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY_ID = '450017739742942044');

update T_PRICE_ZRZ a
set COMMUNITY_ID = (select b.COMMUNITY_ID from V_COMMUNITY_GL_ZRZ b where a.BDCDYID = b.ZRZBDCDYID)
where EXISTS(select 1 from V_COMMUNITY_GL_ZRZ b where a.BDCDYID = b.ZRZBDCDYID)
  and COMMUNITY_ID is null;


select *
from ZRZ_PRICE_20221207
where COMMUNITY_ID = '450017739742941964'
  and ZZFSYT = '联排别墅';
select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '450017739742941964';
select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID = '450017739742941964';

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '450017739742941964';

select *
from T_BASE_ZRZ_XZ
where ZDBDCDYID = 'LWSXCQ_170309113602M9P75793E5';
select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '356301244106575388';

select distinct ZRZBDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where COMMUNITY_ID = 'CB0F6F220FC966B1E053AF5D14ACBB0C'
                       and ZZFSYT = '洋房')
  and FWYT4 = '住宅';

select distinct ZRZBDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID in (select ZRZ_PRICE_20221207.BDCDYID
                     from ZRZ_PRICE_20221207
                     where COMMUNITY_ID = '356301244106575506'
                       and ZZFSYT = '联排别墅')
  and FWYT4 = '住宅';

select distinct ZRZBDCDYID
from T_H_PRICE_JZ
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where COMMUNITY_ID = 'CB0F6F220FC966B1E053AF5D14ACBB0C'
                       and ZZFSYT = '洋房')
  and FWYT = '住宅';

select distinct ZRZBDCDYID
from GXDZZGX20220826
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where COMMUNITY_ID = '356301235516641266'
                       and ZZFSYT = '双拼别是');

select distinct ZRZBDCDYID
from GXDZZGX20220826

where ZRZBDCDYID in (select ZRZ_PRICE_20221207.BDCDYID
                     from ZRZ_PRICE_20221207
                     where COMMUNITY_ID = '356301244106575505'
                       and ZZFSYT = '联排别墅');


insert into GXDZZGX20220826 (id, bdcdyid, zrzbdcdyid, qxdm, zl, fwyt, price, price_total, jzmj, szc, zcs, createuser,
                             createtime, jzpc, fwyt3, fwbm, updateuser, updatetime, old_price, bz, isone)
select id,
       bdcdyid,
       zrzbdcdyid,
       qxdm,
       zl,
       fwyt,
       price,
       price_total,
       jzmj,
       szc,
       zcs,
       createuser,
       create_time,
       JZPC,
       fwyt3,
       fwbm,
       updateuser,
       update_time,
       OLD_PRICE,
       '御璟花园',
       isone
from H_PRICE_20221207
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where COMMUNITY_ID = '356301244106575538'
                       and ZZFSYT = '高层')
  and FWYT = '住宅';

insert into GXDZZGX20220826 (id, bdcdyid, zrzbdcdyid, qxdm, zl, fwyt, price, price_total, jzmj, szc, zcs, createuser,
                             createtime, jzpc, fwyt3, fwbm, updateuser, updatetime, old_price, bz, isone)
select id,
       bdcdyid,
       zrzbdcdyid,
       qxdm,
       zl,
       fwyt,
       price,
       price_total,
       jzmj,
       szc,
       zcs,
       createuser,
       create_time,
       JZPC,
       fwyt3,
       fwbm,
       updateuser,
       update_time,
       OLD_PRICE,
       '阳光美郡',
       isone
from H_PRICE_20221207
where ZRZBDCDYID in (select ZRZ_PRICE_20221207.BDCDYID
                     from ZRZ_PRICE_20221207
                     where COMMUNITY_ID = '356301235516641026'
                       and ZZFSYT = '联排别墅')
  and FWYT = '住宅';

update GXDZZGX20220826
set BZ = '雪野·绿苑联排'
where ZRZBDCDYID in (select ZRZ_PRICE_20221207.BDCDYID
                     from ZRZ_PRICE_20221207
                     where COMMUNITY_ID = '356301244106575505'
                       and ZZFSYT = '联排别墅');

update GXDZZGX20220826
set PRICE      = 8000,
    PRICE_TOTAL= round(8000 * JZMJ, 2)
where BZ = '御璟花园'
  and ISONE is null;

select distinct PRICE, ISONE
from GXDZZGX20220826
where BZ = '雅居苑';

select count(0)
from GXDZZGX20220826
where BZ = '雪野·绿苑联排';

select BDCDYH, FWBM
from T_BASE_H_XZ
where BDCDYID = '9ee69d35-a1fc-430e-8a18-7ad2713f6e00';

select BDCDYID, ZRZBDCDYID, ZDBDCDYID
from T_BASE_H_XZ
where BDCDYID = '51592564';

select SMX, SMY, LAT, LNG
from T_BASE_COMMUNITY;

select smx, smy
from TX_ZD_P_4326
where BDCDYID = '9e341b4d-1e10-4488-9e34-fbe763068fc1';

select *
from T_YW_SURVEY_TASK;

select *
from T_BASE_SCHOOLDISTRICT
where XXMC = '张夏街道中心小学';
select *
from T_BASE_SQ;

select *
from EST_BASE.T_BASE_POLICY;

select ID
from T_BASE_COMMUNITY
where XZQ = '高新';

select distinct QXMC
from T_BASE_ZRZ_XZ
where QXMC = '高新';

update T_BASE_ZRZ_XZ
set QXMC = '高新'
where BDCDYID in (select ZRZBDCDYID
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY_ID in (select ID
                                         from T_BASE_COMMUNITY
                                         where XZQ = '高新'));



update T_BASE_H_XZ
set QXMC = '高新'
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY_ID in (select ID
                                            from T_BASE_COMMUNITY
                                            where XZQ = '高新'));

select distinct qxmc
from T_BASE_H_XZ
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY_ID in (select ID
                                            from T_BASE_COMMUNITY
                                            where XZQ = '高新'));

select count(0)
from T_BASE_H_XZ;

select count(0)
from EST_DATAOMP.T_REALESTATE_H_XZ;

select BDCDYID, count(0)
from T_BASE_H_XZ
group by BDCDYID
having count(0) > 1;

select *
from T_BASE_H_XZ
where BDCDYID = '12726628';

select *
from T_BASE_H_XZ
where BDCDYID in (select BDCDYID
                  from T_BASE_H_XZ
                  group by BDCDYID
                  having count(0) > 1)
  and BZ is null;

delete
from T_BASE_H_XZ
where BDCDYID in (select BDCDYID
                  from T_BASE_H_XZ
                  group by BDCDYID
                  having count(0) > 1)
  and BZ is null;

select count(0)
from T_BASE_ZRZ_XZ;

select count(0)
from EST_DATAOMP.T_REALESTATE_ZRZ_XZ;

select *
from T_BASE_COMMUNITY_ER_0531;

select *
from T_DATA_DEAL_INFO;

select *
from T_BASE_COMMUNITY_NEW_test;

truncate table T_BASE_COMMUNITY_NEW_test;

create table T_BASE_COMMUNITY_NEW_test as
select *
from T_BASE_COMMUNITY_NEW_0531;

create table T_DATA_DEAL_INFO_temp as
select *
from T_DATA_DEAL_INFO;

select *
from T_DATA_DEAL_INFO_TEST;

select *
from T_DATA_CZXX_BK;

select *
from T_BASE_H_XZ
where FWBM = '201604270000769989';

select *
from T_BASE_H_XZ
where BDCDYID = '1';

select *
from V_COMMUNITY_GL_ZRZ;

select distinct SFLD
from T_BASE_SCHOOLDISTRICT;

select *
from tx_business_zone;

select *
from T_BASE_PQ;

select distinct FWYT4
from T_BASE_H_XZ
where FWYT4 like '%储藏室%';

select *
from T_BASE_H_XZ
where FWYT4 = '储藏室';

select *
from TX_SCHOOL_AREA_A;

select *
from H_PRICE_20221207;

select *
from T_H_PRICE_JZ;

select *
from T_API_RECORD
order by REQ_TIME;

select SCJZMJ
from T_BASE_ZRZ_XZ
where BDCDYID = '1499472';

update T_PRICE_ZRZ a
set JZMJ = (select SCJZMJ from T_BASE_ZRZ_XZ b where a.BDCDYID = b.BDCDYID)
where exists(select 1 from T_BASE_ZRZ_XZ b where a.BDCDYID = b.BDCDYID)
  and JZMJ is null;

select count(0)
from T_PRICE_ZRZ;

select *
from T_BEV_TASK_SCOPE;

select *
from T_CFG_ADJUST_FACTOR;

select *
from T_CFG_ADJUST_FACTOR_STANDARD;

select ZDBDCDYID, count(0)
from T_PRICE_ZRZ
where FWYT = '办公'
group by ZDBDCDYID;

select *
from T_BASE_H_XZ;
select *
from T_PRICE_ZRZ
where ZDBDCDYID = 'ffe697c43390480cb358ff1eae59416a';

select *
from T_PRICE_JZ_H_BG
where BZ like '%朝向%';

select count(0)
from T_PRICE_JZ_H_BG;

select *
from T_PRICE_ZRZ
where ZL = '槐荫区经六路500号新世界阳光花园（西区）中地下车库';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY = '槐荫区经六路500号新世界阳光花园（西区）';

select *
from T_H_PRICE_JZ
where ZL like '槐荫区经六路500号新世界阳光花园（西区）%'
  and FWYT like '%车位%';

update T_H_PRICE_JZ
set PRICE_TOTAL = 135000,
    PRICE=135000 / JZMJ
where ZL like '槐荫区经六路500号新世界阳光花园（西区）%'
  and FWYT like '%车位%';


select *
from T_PRICE_ZRZ
where BDCDYID = '641381';

delete
from T_PRICE_JZ_H_BG
where FWYT <> '办公';

select *
from T_BASE_H_XZ
where ZCS is null;

truncate table T_PRICE_JZ_H_BG;

select count(0)
from T_PRICE_ZRZ
where FWYT = '办公'
  and QXDM = '370103';

select count(0)
from T_BASE_H_XZ
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where FWYT = '办公'
                       and QXDM = '370103');

select count(0)
from T_BASE_H_XZ
where FWYT4 = '办公'
  and QXDM = '370103';

select distinct ZRZBDCDYID
from T_BASE_H_XZ
where cx is not null;


select distinct cx
from T_PRICE_JZ_H_BG
where CX is not null;

select *
from T_PRICE_JZ_H_BG
where PRICE is not null;

delete
from T_PRICE_JZ_H_BG
where FWYT <> '办公';

select distinct ZJDW
from T_BASE_COMMUNITY
where ZJDW is not null;

select distinct TYPE
from T_BASE_ENTERPRISE;


select *
from T_FILE_PATH_REALESTATE;

select distinct FWYT3
from T_FWYT_ASYS_500
where FWYT3 is not null;

select zl,
       ZCS,
       DYH,
       ZRZH,
       FWYT3,
       FWYT4,
       CG,
       CX
from t_base_h_xz
WHERE zrzbdcdyid = '1134724'
  and FWYT3 is not null
  and FWYT4 is null;

select zl,
       ZCS,
       DYH,
       ZRZH,
       FWYT3,
       FWYT4,
       CG,
       CX
from t_base_h_xz
WHERE BDCDYID in ('37329694',
                  '37329873',
                  '37329876',
                  '37330309',
                  '37330312',
                  '37330165',
                  '37329858',
                  '37329859',
                  '37329849',
                  '37329691',
                  '37329848',
                  '37331070',
                  '37331105',
                  '37331136',
                  '37331004',
                  '37331037',
                  '37330775',
                  '37329695',
                  '37329860',
                  '37330705');

select *
from t_base_h_xz
WHERE BDCDYID in ('37329694',
                  '37329873',
                  '37329876',
                  '37330309',
                  '37330312',
                  '37330165',
                  '37329858',
                  '37329859',
                  '37329849',
                  '37329691',
                  '37329848',
                  '37331070',
                  '37331105',
                  '37331136',
                  '37331004',
                  '37331037',
                  '37330775',
                  '37329695',
                  '37329860',
                  '37330705');

-- 历下区经十路9777号鲁商国奥城项目4、5号楼物业用房05

update T_BASE_H_XZ
set DYH   = '1',
    FWYT4 = null,
    CX    = null
where BDCDYID in ('37329694',
                  '37329873',
                  '37329876',
                  '37330309',
                  '37330312',
                  '37330165',
                  '37329858',
                  '37329859',
                  '37329849',
                  '37329691',
                  '37329848',
                  '37331070',
                  '37331105',
                  '37331136',
                  '37331004',
                  '37331037',
                  '37330775',
                  '37329695',
                  '37329860',
                  '37330705');



select *
from t_file_path_realestate
where YW_ID in ('37329694',
                '37329873',
                '37329876',
                '37330309',
                '37330312',
                '37330165',
                '37329858',
                '37329859',
                '37329849',
                '37329691',
                '37329848',
                '37331070',
                '37331105',
                '37331136',
                '37331004',
                '37331037',
                '37330775',
                '37329695',
                '37329860',
                '37330705');

select *
from TX_COMMUNITY
where SMID = '10799';

select SMX, SMY, LAT, LNG
from T_BASE_COMMUNITY;

select *
from TX_COMMUNITY
where COMMUNITY like '%测%';

select *
from T_BASE_COMMUNITY
where COMMUNITY like '%测试%';

select *
from T_YW_PRICE_FEEDBACK;

select *
from T_H_PRICE_RECORD;

select *
from TX_POI_4326
where NAME = '测试217';

select *
from TX_COMMUNITY_A
where COMMUNITY like '%测试%';

select *
from T_BASE_H_XZ
where ZRZBDCDYID = '幢未落地-94035';

select *
from TX_COMMUNITY
where COMMUNITY like '%测试%';

select *
from T_BASE_COMMUNITY
where SMID = '6091';

select CG
from T_BASE_H_XZ;

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '450017988851044940';

select *
from T_BASE_COMMUNITY wh;

select count(0)
from T_COMMTY_GL_ZD;

select count(0)
from T_SCAN_TASK;

select max(ID)
from T_FILE_PATH_REALESTATE;

select *
from TX_COMMUNITY_A
where COMMUNITY = '测试楼盘217';

select ZL, FWYT4, ZRZH
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724'
  and FWYT4 = '办公';
-- 20180130000835346幢
select ZRZH
from T_BASE_H_XZ
where ZRZBDCDYID = '1523557';
update T_BASE_H_XZ
set ZRZH = '20180130000835346幢'
where ZRZBDCDYID = '1523557';

select ZL
from T_BASE_ZRZ_XZ
where BDCDYID = '1523557';

select distinct DYH
from T_BASE_H_XZ
where ZRZBDCDYID = '631740';

select DYH
from T_BASE_H_XZ
where BDCDYID = '-3975432';

SELECT T.ZL,
       T.BDCDYID,
       T.BDCDYH,
       TO_CHAR(T.QSC)        QSC,
       T.SZC,
       T.ZCS,
       nvl(T.FH, T.TQHH)     HH,
       T.DYH,
       nvl(T.ZRZH, T.TQZH)   TQZH,
       ROUND(T.SCJZMJ, 2)    JZMJ,
       ROUND(T.SCTNJZMJ, 2)  TNJZMJ,
       ROUND(T.SCFTJZMJ, 2)  FTJZMJ,
       NVL(T.FWYT4, T.FWYT3) YT,
       T.FWYT3,
       J.PRICE,
       J.PRICE_TOTAL,
       T.QUALIFY,
       nvl(T.CX, B.CX)       CX,
       nvl(T.CG, B.CG)       CG
FROM (SELECT * FROM T_BASE_H_XZ WHERE ZRZBDCDYID = '631740') T
         LEFT JOIN T_PG_XXBC B ON T.BDCDYH = B.BDCDYH
         LEFT JOIN (SELECT *
                    FROM (SELECT PRICE,
                                 PRICE_TOTAL,
                                 BDCDYID,
                                 FWBM,
                                 ROW_NUMBER() OVER (PARTITION BY PRICE, PRICE_TOTAL, BDCDYID,FWBM ORDER BY CREATETIME DESC ) RN
                          FROM T_H_PRICE_JZ P
                          where ZRZBDCDYID = '631740') B
                    WHERE B.RN = 1) J ON T.FWBM = J.FWBM
ORDER BY TO_NUMBER(T.QSC), YT;

select DYH, SZC
from T_BASE_H_XZ
where BDCDYID = '-2729621';

update T_BASE_H_XZ
set DYH = 1,
    SZC = 1
where BDCDYID = '-2729621';

select zl, cg, cx, BDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724';

update T_BASE_ZRZ_XZ
set JGRQ = null
where BDCDYID = '1134724';



UPDATE T_BASE_H_XZ
SET CG = null,
    CX=null
WHERE BDCDYID in
      ('37331041', '37331014', '37331007', '37331044', '37331011', '37331046', '37330991', '37330947', '37330963',
       '37330994', '37330964', '37330996', '37330935', '37330927', '37330936', '37330926');

select *
from (select BDCDYID, CX
      from T_BASE_H_XZ
      where CX is not null) a
where a.CX like '、';


SELECT *
FROM T_BASE_COMMUNITY
WHERE ID IN (SELECT COMMUNITY_ID
             FROM T_COMMTY_GL_ZD
             WHERE ZD_ID IN (SELECT ZDBDCDYID FROM T_BASE_ZRZ_XZ WHERE BDCDYID = '1347476')
               AND DEL_FLAG = '0'
             UNION
             SELECT COMMUNITY_ID
             FROM T_COMMTY_GL_ZRZ
             WHERE ZRZBDCDYID = '1347476')
  AND DEL_FLAG = '0';

select *
from V_COMMUNITY_GL_ZRZ
where ZRZBDCDYID = '1347476';

select *
from TX_COMMUNITY_A
where BDCDYID = 'bb1d3339-1a11-4c4b-8b77-5856966bbf60';

select *
from T_BASE_H_XZ
where zl like '历城区花园路136号聚隆广场地下车库及其他%';

select *
from T_BASE_ZRZ_XZ
where BDCDYID = '1534165';


alter user JNPG quota unlimited on EST_BASE;

select *
from dba_sys_privs
where grantee = 'BDCP';

grant unlimited tablespace to EST_BASE;

select ZL, FWYT4, FWBM
from T_BASE_H_XZ
where ZRZBDCDYID = '838665'
  and FWYT4 = '办公';

select *
from T_BASE_ZRZ_XZ
where ZL like '%经十路9777%';
-- 838665

select *
from T_YW_PRICE_FEEDBACK
where ZL = '历下区经十路9777号3号楼1807';

select *
from dba_sys_privs
where GRANTEE = 'EST_BASE';

update T_BASE_H_XZ
set cx=replace(cx, '、', ',')
where CX is not null;

select *
from AI_SIMPLEDATA.TX_POI_YBZB t
where name like '%大华紫郡%';

select *
from AI_SIMPLEDATA.TX_POI_YBZB t
where name like '%文昌山庄199号%';

select *
from T_BASE_ZRZ_XZ
where ZL like '%大华紫郡A3%';

select *
from V_PRICE_ZRZ_ZZ_370112;

select *
from T_YW_PRICE_FEEDBACK;

alter user JNPG account unlock;



select *
from T_BASE_ZD_XZ
where ZL like '%地块%';


alter user JNPG quota unlimited on AI_SIMPLEDATA;
grant unlimited tablespace to AI_SIMPLEDATA;


select a.*, b.PRICE, b.PRICE * a.JZMJ price_total, b.EXPRESSION, c.GROUP_LABEL, c.GROUP_NAME, D.ZL ZRZZL
from T_BEV_RESULT_RECORD b
         left join T_BEV_TASK_SCOPE a on a.id = b.SCOPE_ID
         left join T_BASE_ZRZ_xZ D on a.ZRZBDCDYID = D.BDCDYID
         left join (select a.SCOPE_ID, a.GROUP_ID, b.GROUP_NAME, b.GROUP_LABEL, b.TASK_ID
                    from T_BEV_SCOPE_GROUP_DATA a
                             left join (select *
                                        from (SELECT A.*,
                                                     DECODE(CONNECT_BY_ISLEAF, 1, '是', '否') is_leaf
                                              FROM T_BEV_SCOPE_GROUP A
                                              START WITH A.ID in (select id
                                                                  from T_BEV_SCOPE_GROUP b
                                                                  where b.PARENT_ID = '0')
                                              CONNECT BY PRIOR A.ID = A.PARENT_ID
                                              ORDER SIBLINGS BY ID DESC)
                                        where is_leaf = '是') b on a.GROUP_ID = b.ID) c
                   on a.id = c.SCOPE_ID and c.TASK_ID = b.TASK_ID
where 1 = 1
  and b.TASK_ID = '521771679593043598'
order by a.szc, a.zl;

select *
from T_BEV_TASK_SCOPE
where TASK_ID = '521771679593043598';

select *
from T_BEV_RESULT_RECORD
where TASK_ID = '521771679593043598';

select BDCDYID, ZL, BDCDYH, FWBM, FWYT3, FWYT4, SCJZMJ
from T_BASE_H_XZ
where ZRZBDCDYID = '1134724'
  and FWYT4 = '办公';

select *
from t_yw_survey_task;

select FH, DYH
from T_BASE_H_XZ
where ZRZBDCDYID = 'f850b6b43f5b4c5db54100dec6e8536c';

update T_BASE_H_XZ
set FH = replace(FH, '车位', '')
where ZRZBDCDYID = 'f850b6b43f5b4c5db54100dec6e8536c';

select BDCDYID, ZRZBDCDYID, ZL, FH
from T_BASE_H_XZ
where ASCIISTR(fh) like '%\%';
update T_BASE_H_XZ
set FWYT3 = '储藏室',
    FWYT4='储藏室/阁楼'
where ZRZBDCDYID = '幢未落地-90000'
  and ZL like '%储%';

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '幢未落地-90000';

select BDCDYID,
       ZL,
       FWBM,
       FH,
       HH,
       FWYT1,
       FWYT2,
       FWYT3,
       FWYT4,
       SCJZMJ
from T_BASE_H_XZ
where ZRZBDCDYID = '幢未落地-90000'
order by FWYT4;

select *
from V_TJ_ZRZ_FWYT;


select ZRZBDCDYID, jgsj
from (select BDCDYID,
             ZRZBDCDYID,
             to_char(JGSJ, 'yyyymmdd')                                       jgsj,
             row_number() over (partition by ZRZBDCDYID order by JGSJ desc ) r
      from T_BASE_H_XZ
      where JGSJ is not null)
where r = 1;
create view V_TJ_ZRZ_JGRQ as
select a.BDCDYID,
       a.ZL,
       decode(decode(a.JGRQ, null, b.jgsj, '', b.jgsj, to_char(a.JGRQ, 'yyyymmdd')), null, c.JCND, '', c.JCND,
              decode(a.JGRQ, null, b.jgsj, '', b.jgsj, to_char(a.JGRQ, 'yyyymmdd'))) jgrq
from T_BASE_ZRZ_XZ a
         left join (select ZRZBDCDYID, jgsj
                    from (select ZRZBDCDYID,
                                 to_char(JGSJ, 'yyyymmdd')                                       jgsj,
                                 row_number() over (partition by ZRZBDCDYID order by JGSJ desc ) r
                          from T_BASE_H_XZ
                          where JGSJ is not null)
                    where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
         LEFT JOIN V_COMMUNITY_GL_ZRZ VC ON VC.ZRZBDCDYID = A.BDCDYID
         left join T_BASE_COMMUNITY c on VC.COMMUNITY_ID = c.id;


select JGSJ
from T_BASE_H_XZ;

select JGRQ
from T_BASE_ZRZ_XZ
where JGRQ is not null;

select FH, DYH, HH
from T_BASE_H_XZ
where ZRZBDCDYID = '929741';



select qxdm,
       zrzbdcdyid,
       max(zdbdcdyid)                                 zdbdcdyid,
       max(delete_flag)                               delete_flag,
       sum(c)                                         zhs,
       max(qszt)                                      qszt,
       sum(djsl)                                      djhs,
       max(zcs)                                       zcs,
       max(qsc_max)                                   dscs,
       min(qsc_min)                                   dxcs,
       sum(decode(t.fwyt4, '住宅', t.c, 0))        as zz,
       sum(decode(t.fwyt4, '办公', t.c, 0))        as bg,
       sum(decode(t.fwyt4, '公寓', t.c, 0))        as gy,
       sum(decode(t.fwyt4, '储藏室/阁楼', t.c, 0)) as ccs,
       sum(decode(t.fwyt4, '车位/车库', t.c, 0))   as cw,
       sum(decode(t.fwyt4, '商业', t.c, 0))        as sy,
       sum(decode(t.fwyt4, '商铺', t.c, 0))        as sp,
       sum(decode(t.fwyt4, '商场', t.c, 0))        as sc,
       sum(decode(t.fwyt4, '商业服务', t.c, 0))    as syfw,
       sum(decode(t.fwyt4, '商业商务', t.c, 0))    as sysw,
       sum(decode(t.fwyt4, '商务', t.c, 0))        as sw,
       sum(decode(t.fwyt4, '地下室', t.c, 0))      as dxs,
       sum(decode(t.fwyt4, '工业', t.c, 0))        as industry,
       sum(decode(t.fwyt4, '仓储', t.c, 0))        as cc,
       sum(decode(t.fwyt4, '车间', t.c, 0))        as cj,
       sum(decode(t.fwyt4, '', t.c, 0))            as qt,
       v.jgrq
from (select z.qxdm,
             z.zdbdcdyid,
             zrzbdcdyid,
             fwyt4,
             max(nvl(t.delete_flag, 0))  delete_flag,
             count(0)                    c,
             max(to_number(qsc))         qsc_max,
             min(to_number(qsc))         qsc_min,
             max(z.zcs)                  zcs,
             max(qszt)                   qszt,
             sum(decode(qszt, '', 0, 1)) djsl
      from t_base_h_xz t
               left join T_BASE_ZRZ_XZ z on t.ZRZBDCDYID = z.BDCDYID
      where 1 = 1
--and zl like '%历下区工业南路100号枫润山居7号楼%'
        and zrzbdcdyid is not null --and t.delete_flag is null
      group by z.qxdm, z.zdbdcdyid, zrzbdcdyid, fwyt4) t
         left join V_TJ_ZRZ_JGRQ v on t.ZRZBDCDYID = v.BDCDYID
group by qxdm, zrzbdcdyid, v.jgrq;

select distinct FWYT4
from T_BASE_H_XZ;

select ZL, ZCS, SZC, SCJZMJ
from T_BASE_H_XZ
where FWYT4 = '商业';

-- 13:35
update T_BASE_H_XZ
set FWYT4 = null
where FWYT4 not in ('住宅', '储藏室/阁楼', '商铺', '办公', '车位/车库', '公寓', '工业', '商业', '商业服务', '地下室');

-- 13027
select count(0)
from T_BASE_H_XZ
where FWYT4 not in ('住宅', '储藏室/阁楼', '商铺', '办公', '车位/车库', '公寓', '工业', '商业', '商业服务', '地下室');

-- 4589631
select count(0)
from T_BASE_H_XZ
where FWYT4 in ('住宅', '储藏室/阁楼', '商铺', '办公', '车位/车库', '公寓', '工业', '商业', '商业服务', '地下室');
-- 5050604
select count(0)
from T_BASE_H_XZ;

--447946
select count(0)
from T_BASE_H_XZ
where FWYT4 is null;

select distinct QSC
from T_BASE_H_XZ
where ZRZBDCDYID = '73084890b43a4ca4ac071fc786d16f52';

SELECT T.ZL,
       T.BDCDYID,
       T.BDCDYH,
       TO_CHAR(T.QSC)        QSC,
       T.SZC,
       T.ZCS,
       nvl(T.FH, T.TQHH)     HH,
       T.DYH,
       nvl(T.ZRZH, T.TQZH)   TQZH,
       ROUND(T.SCJZMJ, 2)    JZMJ,
       ROUND(T.SCTNJZMJ, 2)  TNJZMJ,
       ROUND(T.SCFTJZMJ, 2)  FTJZMJ,
       NVL(T.FWYT4, T.FWYT3) YT,
       T.FWYT3,
       J.PRICE,
       J.PRICE_TOTAL,
       T.QUALIFY,
       nvl(T.CX, B.CX)       CX,
       nvl(T.CG, B.CG)       CG
FROM (SELECT * FROM T_BASE_H_XZ WHERE ZRZBDCDYID = '73084890b43a4ca4ac071fc786d16f52') T
         LEFT JOIN T_PG_XXBC B ON T.BDCDYH = B.BDCDYH
         LEFT JOIN (SELECT *
                    FROM (SELECT PRICE,
                                 PRICE_TOTAL,
                                 BDCDYID,
                                 FWBM,
                                 ROW_NUMBER() OVER (PARTITION BY PRICE, PRICE_TOTAL, BDCDYID,FWBM ORDER BY CREATETIME DESC ) RN
                          FROM T_H_PRICE_JZ P
                          where ZRZBDCDYID = '73084890b43a4ca4ac071fc786d16f52') B
                    WHERE B.RN = 1) J ON T.FWBM = J.FWBM
ORDER BY TO_NUMBER(T.QSC), YT;

select *
from T_BASE_H_XZ where ZRZBDCDYID = 'FCGIS+1482800';

select BDCDYID,count(0)
from TX_ZRZ_XZ group by BDCDYID having count(0) >1;

select *
from t_data_erfjg;

select *
from T_DATA_WQJG;

select count(0)
from T_DATA_ERFJG2;
select count(0)
from T_DATA_WQJG2;

select userenv('language')
from DUAL;

select ZL
from T_BASE_ZRZ_XZ where BDCDYID = '幢未落地-118333';

select *
from T_BASE_H_XZ where ZRZBDCDYID = '幢未落地-118333';