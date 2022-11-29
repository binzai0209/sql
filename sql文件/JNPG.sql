select *
from pg_const
where constslsid = '2021091101';

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
where MBBSM = '20220913';


-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

-- 22817
ALTER system kill session '291, 22817';

alter system kill session '273,22717' immediate;

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

select bdcdyid, zl
from T_BASE_H_XZ
where ZRZBDCDYID in (select zrzbdcdyid from V_COMMUNITY_GL_ZRZ where COMMUNITY_ID in);


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
                    and JZMJ < 70)

select COMMUNITY_ID
from V_COMMUNITY_GL_ZRZ
where ZRZBDCDYID in (select ZRZBDCDYID from T_BASE_H_XZ where BDCDYID in ());


select count(0)
from T_BASE_H_XZ;

insert
into t_ys_chk_rule
(id, chk_list_id, xh, field_name, field_declare, is_not_null, field_length, digits_length, repetition_chk, VALUE_TYPE,
 regular_expression)
values ('62977a19b7e54153858b2f526c142a4a', 'd505c1d946134c41ac2c22dfe39949ef,t_base_h_xz', 119, 'DYH', '单元号', '',
        '', '', '', 'number');



insert
into t_ys_chk_rule
(id, chk_list_id, xh, field_name, field_declare, is_not_null, field_length, digits_length, repetition_chk, VALUE_TYPE,
 regular_expression)
values ('62977a19b7e54153858b2f526c142a4a', 'd505c1d946134c41ac2c22dfe39949ef,t_base_h_xz', 119, 'DYH', '单元号', '',
        '', '', '', 'number');



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
from;

select *
from T_BASE_ZRZ_XZ
where zl = '槐荫区经六路500号新世界阳光花园（西区';

select *
from T_BASE_COMMUNITY
where COMMUNITY = '槐荫区经六路500号新世界阳光花园（西区）';

select count(0)
from T_BASE_H_XZ
where ZL like '槐荫区经六路500号新世界阳光花园（西区）%' and;

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
from T_BASE_ZRZ_XZ where BDCDYID = '1134724';

select *
from T_BASE_COMMUNITY where COMMUNITY like '%鲁商国奥城%';

select *
from T_API_WSXX order by CREATE_TIME desc ;

select *
from T_BASE_H_XZ where ROWNUM = 1;

select *
from T_BASE_ZD_XZ where BDCDYID = 'ab83f2b29ee844f09455c0e8322b127d';

select *
from TX_SCHOOL_AREA_A where COMMUNITY_ID='3b4f486bf28a4f2bbee1760fd8446ea2';

select *
from T_BASE_SCHOOLDISTRICT;

select *
from T_BASE_ZRZ_XZ where zl = '历下区旅游路21477号杰正岭寓广场2号楼';

select FWYT3,FWYT4
from T_BASE_H_XZ where ZRZBDCDYID = '684038' and FWYT4 = '办公';

select count(0)
from T_H_PRICE_JZ where ZRZBDCDYID = '684038' ;

update T_H_PRICE_JZ
set FWYT = '办公'
where FWYT3 = '商业服务' and ZRZBDCDYID = '684038';


select BDCDYID
from T_BASE_ZRZ_XZ where ZL like '市中区经十路21566号万科悦峯中心办公楼%';

select *
from T_BASE_H_XZ where ZRZBDCDYID = '1456254';

select *
from T_NETDATA_COMMUNITY_NEW;

select *
from T_BASE_COMMUNITY;

select *
from t_base_enterprise
