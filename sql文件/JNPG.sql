select *
from pg_const
where constslsid = '2021091101';

select count(0)
from T_H_PRICE_JZ where QXDM = '370102';


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

-- 杀掉被锁住的表
ALTER system kill session '92, 8947';

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

select community_id, lpyt, count(0)
from T_COMMUNITY_YT
group by community_id, lpyt
having count(0) > 1;

select distinct lpyt
from T_COMMUNITY_YT;

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

select distinct COMMUNITY_ID, FWYT, PRICE
from (select a.COMMUNITY_ID, a.FWYT, a.PRICE
      from T_PRICE_COMMTY a
      where a.bz = '槐荫区-补充'
         or a.bz like '%国信达2阶段第三3批小区清单%');

-- 580
select *
from (select COMMUNITY_ID, BDCDYID, zl, FWYT, PRICE, row_number() over (partition by BDCDYID,FWYT order by BDCDYID) r
      from (select b.community_id,
                   c.BDCDYID,
                   c.ZL,
                   b.FWYT,
                   b.PRICE
            from T_COMMTY_GL_ZRZ a
                     left join (select distinct a.COMMUNITY_ID, a.FWYT, a.PRICE
                                from T_PRICE_COMMTY a
                                where a.bz = '槐荫区-补充'
                                   or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
                     left join T_BASE_ZRZ_XZ c on a.ZRZBDCDYID = c.BDCDYID
                     left join T_DATA_TQJG_ZRZ d on a.ZRZBDCDYID = d.BDCDYID and b.FWYT = d.FWYT4
            where b.COMMUNITY_ID is not null
              and c.BDCDYID is not null
            union all
            select b.COMMUNITY_ID, c.BDCDYID, c.ZL, b.FWYT, b.PRICE
            from T_COMMTY_GL_ZD a
                     left join (select distinct a.COMMUNITY_ID, a.FWYT, a.PRICE
                                from T_PRICE_COMMTY a
                                where a.bz = '槐荫区-补充'
                                   or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
                     left join T_BASE_ZRZ_XZ c on a.ZD_ID = c.ZDBDCDYID
                     left join T_DATA_TQJG_ZRZ d on c.BDCDYID = d.BDCDYID and b.FWYT = d.FWYT4
            where b.COMMUNITY_ID is not null
              and c.ZDBDCDYID is not null))
where r = 1;



select bdcdyid, fwyt, count(0)
from (select b.COMMUNITY_ID, c.BDCDYID, b.FWYT, b.PRICE
      from T_COMMTY_GL_ZRZ a
               left join (select distinct a.COMMUNITY_ID, a.FWYT, a.PRICE
                          from T_PRICE_COMMTY a
                          where a.bz = '槐荫区-补充'
                             or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_BASE_ZRZ_XZ c on a.ZRZBDCDYID = c.BDCDYID
               left join T_DATA_TQJG_ZRZ d on a.ZRZBDCDYID = d.BDCDYID and b.FWYT = d.FWYT4
      where b.COMMUNITY_ID is not null
        and c.BDCDYID is not null
      union all
      select b.COMMUNITY_ID, c.BDCDYID, b.FWYT, b.PRICE
      from T_COMMTY_GL_ZD a
               left join (select distinct a.COMMUNITY_ID, a.FWYT, a.PRICE
                          from T_PRICE_COMMTY a
                          where a.bz = '槐荫区-补充'
                             or a.bz like '%国信达2阶段第三3批小区清单%') b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_BASE_ZRZ_XZ c on a.ZD_ID = c.ZDBDCDYID
               left join T_DATA_TQJG_ZRZ d on c.BDCDYID = d.BDCDYID and b.FWYT = d.FWYT4
      where b.COMMUNITY_ID is not null
        and c.ZDBDCDYID is not null)
group by BDCDYID, FWYT
order by BDCDYID, FWYT;

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

select a.BDCDYID, a.FWYT, a.PRICE, a.DATA_SOURCE
from T_PRICE_ZRZ a
         left join V_GXD_ZRZ_PRICE b on a.BDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where b.PRICE is not null
  and a.DATA_SOURCE = '1';

-- 将数据来源为空的改为99
update T_PRICE_ZRZ
set DATA_SOURCE = '99'
where DATA_SOURCE is null;

select a.*, (select b.DATA_SOURCE from T_PRICE_ZRZ b where a.BDCDYID = b.BDCDYID and a.FWYT = b.FWYT) DATA_SOURCE
from V_GXD_ZRZ_PRICE a;

select *
from V_GXD_ZRZ_PRICE;

-- 将不动产单元id和房屋用途相同的更新为国信达的价格
UPDATE T_PRICE_ZRZ A -- 使用别名
SET PRICE =
        (SELECT B.PRICE FROM V_GXD_ZRZ_PRICE B WHERE B.BDCDYID = A.BDCDYID and b.FWYT = a.FWYT)
WHERE a.DATA_SOURCE <> '1'
  and a.DATA_SOURCE <> '99'
  and EXISTS(SELECT 1 FROM V_GXD_ZRZ_PRICE B WHERE B.BDCDYID = A.BDCDYID and b.FWYT = a.FWYT);


UPDATE T_PRICE_ZRZ A -- 使用别名
SET QXDM =
            (SELECT B.QXDM FROM TX_ZRZ_XZ_P B WHERE B.BDCDYID = A.BDCDYID)
WHERE a.QXDM is null
  and EXISTS(SELECT 1 FROM V_GXD_ZRZ_PRICE B WHERE B.BDCDYID = A.BDCDYID);

select a.BDCDYID, (select QXDM from TX_ZRZ_XZ_P b where a.BDCDYID = b.BDCDYID and b.QXDM is not null)
from T_PRICE_ZRZ a
where QXDM is null;

insert into T_PRICE_ZRZ (id, bdcdyid, fwyt, price, zcs, bz, DATA_SOURCE, QXDM, zl)
select sys_guid(),
       BDCDYID,
       FWYT,
       PRICE,
       ZCS,
       '小区价格脚本导入20220730国信达提供',
       '4',
       QXDM,
       zl
from (select a.*,
             (select b.DATA_SOURCE
              from T_PRICE_ZRZ b
              where a.BDCDYID = b.BDCDYID
                and a.FWYT = b.FWYT
                and rownum = 1) DATA_SOURCE
      from V_GXD_ZRZ_PRICE a)
where DATA_SOURCE is null;

select *
from V_GXD_ZRZ_PRICE
where QXDM is null;

create table T_H_PRICE_JZ_730 parallel 8 as
select *
from T_H_PRICE_JZ nologging;

truncate table T_H_PRICE_JZ;


delete
from T_H_PRICE_JZ
where ZRZBDCDYID in (select bdcdyid from T_PRICE_ZRZ where T_PRICE_ZRZ.QXDM = '370104');

delete
from T_H_PRICE_JZ
where ID in (select id
             from T_H_PRICE_JZ
             where BDCDYID in (SELECT BDCDYID
                               from T_H_PRICE_JZ
                               GROUP BY BDCDYID
                               HAVING COUNT(*) > 1)
               and PRICE is not null
               and CREATEUSER = 'pool-5-thread-37');


select distinct a.id,
                a.COMMUNITY,
                a.ZL,
                a.alias,
                (select count(0)
                 from T_COMMUNITY_YT b
                 where b.COMMUNITY_ID = a.ID)    yts,
                (select count(0)
                 from T_COLLECT_COMMUNITY_PRICE_HIS b
                 where b.COMMUNITY_ID = a.ID
                   and b.PRICE is not null
                   and b.VERSION = '2022080115') jgs,
                (select count(0)
                 from T_COLLECT_COMMUNITY_ZJ_HIS c
                 where c.COMMUNITY_ID = a.ID
                   and c.ZJ is not null
                   and c.VERSION = '2022080115') zjs
from T_BASE_COMMUNITY a
         left join
     T_COMMUNITY_YT b
     on a.ID = b.COMMUNITY_ID
WHERE b.LPYT is not null
  and a.DEL_FLAG = '0'
order by a.COMMUNITY;


insert into T_COLLECT_COMMUNITY_PRICE_HIS (ID, COMMUNITY_ID, LPYT, PRICE, VERSION, DATA_SOURCE, CREATE_TIME,
                                           CREATE_USER)
select sys_guid(),
       a.ID,
       a.LPYT,
       a.PRICE,
       '202208',
       '国信达',
       sysdate,
       'zhangbin'
from (select a.ID, b.LPYT, c.PRICE
      from T_BASE_COMMUNITY a
               left join T_COMMUNITY_YT b on a.ID = b.COMMUNITY_ID
               left join (select COMMUNITY_ID,
                                 fwyt,
                                 PRICE,
                                 DATASOURCE,
                                 row_number() over (partition by COMMUNITY_ID,FWYT order by CREATETIME desc ) r
                          from T_PRICE_COMMTY
                          where DATASOURCE = '2') c on a.ID = c.COMMUNITY_ID and b.LPYT = c.FWYT
      where b.LPYT is not null
        and c.PRICE is not null
        and c.r = 1) a;

select *
from (select COMMUNITY_ID,
             fwyt,
             PRICE,
             DATASOURCE,
             row_number() over (partition by COMMUNITY_ID,FWYT order by CREATETIME desc ) r
      from T_PRICE_COMMTY
      where DATASOURCE = '2') a
where r = 1;

select *
from V_COMMUNITY_GL_ZRZ;
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
;

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
INSERT INTO JNPG.T_JGGL_EMPLOYEE (ID, COMPANYID, EMPLOYEENAME, ZJZL, IDCARD, PHONENUMBER, RYLB, ADDRESS, EMAIL, REMARK,
                                  CZSJ, CZRY, STATUS, GJSZCH, GJSZYJG, GJSZJYXQ, DEPARTMENT_ID, STAFF_ID, USERNAME,
                                  PASSWORD, ZCH, MRGJS, QZSQ, GJSQ)
VALUES ('eb6a346561bd494f98c4267bb73fcd76', '4c74d486628e4cb2a643ce8e4feffa4a', '李御', '1', '370112199707232901',
        '17533331234', '3', '济南市历下区鲁商国奥城', 'liyu@cs.com', null,
        TO_DATE('2022-03-11 11:46:21', 'YYYY-MM-DD HH24:MI:SS'), 'zhangbin1', '1', null, '济南市智慧评估测试公司', null,
        null, 356301226926706292, 'liyu', '123', null, '0', '1', '0');


SELECT T1.*, T2.PGSXM, DECODE(T4.ACTFLAG, '410', '1', '310', '0') THZT, T2.PGSJ PGSJ_PZ, t5.STAFF_ID
FROM T_YW_PGRW T1,
     T_YW_PGBGPZ T2,
     T_WORKFLOW_ACTINST T3,
     T_WORKFLOW_ACTINST T4,
     T_JGGL_EMPLOYEE T5
WHERE T1.ACTFLAG = '310'
  AND T1.ID = T2.PGRW_ID
  and T1.ACTINSTID = T3.ID
  AND T3.PREID = T4.ID
  --and T5.STAFF_ID = ?
  and T1.USERID = T5.ID;

select id
from T_BASE_COMMUNITY
where COMMUNITY = '泰山科技大厦';

select distinct FWYT4
from T_DATA_TQJG_ZRZ
where BDCDYID in (select ZRZBDCDYID
                  from V_COMMUNITY_GL_ZRZ
                  where COMMUNITY_ID = '356301746617749401');

select b.COMMUNITY_ID, a.BDCDYID, a.FWYT4
from V_COMMUNITY_GL_ZRZ b
         left join T_DATA_TQJG_ZRZ a on a.BDCDYID = b.ZRZBDCDYID
where b.COMMUNITY_ID = '356301746617749401';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '356301746617749401';

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
       '储藏室/阁楼',
       sys_guid()
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT4,
                                 SCJZMJ,
                                 row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                          from T_BASE_H_XZ) a
                    where a.r = 1
                      and FWYT4 = '住宅'
                      and SCJZMJ < 30) b
                   on a.BDCDYID = b.ZRZBDCDYID
         left join T_DATA_TQJG_ZRZ c on a.BDCDYID = c.BDCDYID and c.FWYT5 = '储藏室/阁楼'
where b.FWYT4 is not null
  and c.BDCDYID is null;


select *
from T_COMMUNITY_YT
where COMMUNITY_ID = 'CB0F6F220B9866B1E053AF5D14ACBB0C';

select distinct gl.ZD_ID, c.COMMUNITY, zd.QXDM, zrz.QXDM
from T_COMMTY_GL_ZD gl
         left join T_BASE_ZD_XZ zd on zd.BDCDYID = gl.ZD_ID
         left join T_BASE_COMMUNITY c on gl.COMMUNITY_ID = c.ID
         left join t_base_zrz_Xz zrz on zrz.ZDBDCDYID = gl.ZD_ID
where gl.DEL_FLAG = '0'
  and c.community is not null
  and zrz.bdcdyid is not null
  --and zrz.QXDM = '370104'
  and COMMUNITY = '蓝石大溪地';

select distinct ZDBDCDYID zd_id, COMMUNITY
from V_COMMUNITY_GL_ZRZ
where QXDM = '370104';



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
        and zrz.ZDBDCDYID IN ('2523986AA9FC4496A31567C7CB19B6B5', ' 66085e2889044a379fc8ed78d9fc404d',
                              ' CE42971A633342E78F042AF2FFB28FA1', ' FFABF7E6193E45CEA1ABC46F4238D6E6',
                              ' a1928fe84eee46689b05efede29c993d')
        and zrz.QXDM = '370103') TE
         LEFT JOIN T_PRICE_ZRZ P ON P.BDCDYID = TE.BDCDYID and TE.FWYT5 = p.FWYT
WHERE 1 = 1
order by p.zl, p.fwyt;

select bdcdyid,
       zrzbdcdyid,
       zdbdcdyid,
       fwyt4  fwyt,
       fwyt3,
       zl,
       qsc,
       szc,
       zcs,
       scjzmj jzmj,
       qxdm
from t_base_h_xz
where 1 = 1
  and zrzbdcdyid in ('827920', '680340', '1404852');

select *
from T_H_PRICE_JZ
where PRICE is not null
  and OLD_PRICE is not null
  and PRICE <> OLD_PRICE;

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

select *
from T_PRICE_ZRZ;

delete
from T_BEV_GROUP_STANDARD
where TASK_ID = ?1;

select *
from T_BEV_TASK
where ID = '413634994469746562';
select *
from T_BEV_GROUP_STANDARD;
-- zrzbdcdyid  zdbdcdyid  qsc szc zcs jzmj cg jcnd ywdt business_id business_name education_district

select *
from T_BEV_TASK_SCOPE;

select *
from T_PRICE_ZRZ
where ZL like '%历城区旅游路13077号%文化体育旅游城%';

select *
from T_BEV_GROUP_FACTOR;

select *
from T_H_PRICE_JZ;
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

select *
from T_PRICE_ZRZ
where BDCDYID = '410895';

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '410895'
  and FWYT = '地下室';

select *
from T_DATA_TAX_PGJG_SZ01;

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


insert into T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ, SZC,
                          ZCS, CREATEUSER, CREATETIME, FWYT3, FWBM, BZ);
select sys_guid(),
       a.BDCDYID,
       c.BDCDYH,
       c.ZRZBDCDYID,
       c.ZDBDCDYID,
       c.QXDM,
       c.ZL,
       c.FWYT4,
       a.JG_SINGLE,
       a.JG_SINGLE * c.SCJZMJ,
       c.SCJZMJ,
       c.SZC,
       c.ZCS,
       'zhangbin',
       sysdate,
       c.FWYT3,
       c.FWBM,
       '830新增税务价格'
from T_DATA_TAX_PGJG_SZ01 a
         left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID
         left join T_BASE_H_XZ c on a.BDCDYID = c.BDCDYID
where b.BDCDYID is null
  and a.BDCDYID is not null;


select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '幢未落地-73381';

select *
from T_DATA_TAX_PGJG_SZ01
where BDCDYID = '-12064195';



select *
from T_H_PRICE_JZ
where BZ = '830新增税务价格';


select a.*
from T_DATA_TAX_PGJG_SZ01 a
         left join T_H_PRICE_JZ b on a.FWBM = b.FWBM
     --left join T_BASE_H_XZ c on a.FWBM = c.FWBM
where b.FWBM is null
  and a.FWBM is not null;
--and a.FWBM is not null;

select a.*
from T_DATA_TAX_PGJG_SZ01 a
where a.fwbm not in (select b.fwbm from T_H_PRICE_JZ b where a.FWBM = b.FWBM and b.fwbm is not null);

select count(0)
from T_DATA_TAX_PGJG_SZ01
where FWBM is not null;


select *
from T_DATA_TAX_PGJG_SZ01 a
         left join T_H_PRICE_JZ b on a.FWBM = b.FWBM
where a.JG_SINGLE <> b.PRICE;

select *
from T_DATA_TAX_PGJG_SZ01
where BDCDYID in (select BDCDYID
                  from T_H_PRICE_JZ
                  where BZ = '830新增税务价格'
                    and FWYT = '地下室');

select *
from T_DATA_TAX_PGJG_SZ01
where BDCDYID = '-3229509';

select FWYT4
from T_BASE_H_XZ
where BDCDYID = '-3229509';

select *
from T_DATA_TAX_PGJG_SZ01
where;



select BDCDYID
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;


select *
from T_BASE_H_XZ
where ZL = '市中区历阳大街2号银丰山庄1-3号楼车库';


select a.BDCDYID
from T_DATA_TAX_PGJG_SZ01 a
         left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID or a.zl = b.zl or a.FWBM = b.FWBM
where a.JG_SINGLE <> b.PRICE
group by a.BDCDYID
having count(0) > 1;

update T_H_PRICE_JZ a
set (a.PRICE, a.bz) =(select b.JG_SINGLE, '830更新税务价格'
                      from T_DATA_TAX_PGJG_SZ01 b
                      where (a.BDCDYID = b.BDCDYID
                          or a.FWBM = b.FWBM)
                        and a.PRICE <> b.JG_SINGLE)
where exists(select 1
             from T_DATA_TAX_PGJG_SZ01 b
             where (a.BDCDYID = b.BDCDYID
                 or a.FWBM = b.FWBM)
               and a.PRICE <> b.JG_SINGLE)
  and BDCDYID in (select a.BDCDYID
                  from T_DATA_TAX_PGJG_SZ01 a
                           left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID or a.zl = b.zl or a.FWBM = b.FWBM
                  where a.JG_SINGLE <> b.PRICE);


select *
from T_H_PRICE_JZ
where BZ = '830更新税务价格';

update T_H_PRICE_JZ
set PRICE_TOTAL = PRICE * JZMJ
where BZ = '830更新税务价格';



select *
from T_H_PRICE_JZ
where BZ = '830更新税务价格';


update T_H_PRICE_JZ
set OLD_PRICE = PRICE
where OLD_PRICE is null;


select distinct a.ZRZBDCDYID, b.ZRZBDCDYID
from T_DATA_TAX_PGJG_SZ01 a
         left join T_H_PRICE_JZ b on a.BDCDYID = b.BDCDYID or a.zl = b.zl
where a.JG_SINGLE <> b.PRICE;

select a.ZRZBDCDYID, b.BDCDYID, a.FWYT, b.FWYT, a.JG_SINGLE, b.PRICE, b.DATA_SOURCE
from (select ZRZBDCDYID,
             FWYT,
             JG_SINGLE,
             row_number() over (partition by ZRZBDCDYID,FWYT,JG_SINGLE order by ZRZBDCDYID) r
      from T_DATA_TAX_PGJG_SZ01) a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where a.r = 1
  and a.JG_SINGLE <> b.PRICE;

select a.ZRZBDCDYID, b.BDCDYID, a.FWYT, b.FWYT, a.JG_SINGLE, b.PRICE, b.DATA_SOURCE
from (select a.ZRZBDCDYID, a.FWYT, a.JG_SINGLE
      from (select ZRZBDCDYID,
                   FWYT,
                   JG_SINGLE,
                   row_number() over (partition by ZRZBDCDYID,FWYT,JG_SINGLE order by ZRZBDCDYID) r
            from T_DATA_TAX_PGJG_SZ01) a
      where a.r = 1) a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID
where a.FWYT <> b.FWYT
  and a.FWYT not like '%车%'
  and b.FWYT not like '%车%';


select distinct JGLY
from T_PRICE_ZRZ
where DATA_SOURCE is null;

update T_PRICE_ZRZ
set DATA_SOURCE = '4'
where JGLY = '4:国信达提供'
  and DATA_SOURCE is null;


select a.id,
       a.task_id,
       a.type,
       a.name,
       a.price,
       a.fwyt,
       b.GROUP_NAME fwyt3,
       group_id,
       scope_id,
       price_total,
       zrzbdcdyid,
       zdbdcdyid,
       qsc,
       szc,
       zcs,
       jzmj,
       cg,
       jcnd,
       ywdt,
       business_id,
       business_name,
       education_district,
       cx,
       zxqk,
       jzjg
from T_BEV_GROUP_STANDARD a
         left join T_BEV_SCOPE_GROUP b on a.GROUP_ID = b.ID
where group_id = '413655979679954535';

update T_PRICE_ZRZ
set DATA_SOURCE ='4'
where JGLY = '4:国信达提供'
  and DATA_SOURCE is null;

insert into T_PRICE_ZRZ (id, bdcdyid, ZDBDCDYID, fwyt, price, zcs, QXDM, JZMJ, zl, DATA_SOURCE, bz, CREATETIME,
                         CREATEUSER, QXMC)
select sys_guid(),
       a.ZRZBDCDYID,
       c.ZDBDCDYID,
       a.FWYT,
       a.PRICE,
       c.ZCS,
       c.QXDM,
       c.SCJZMJ,
       c.ZL,
       '1',
       '831新增税务价格',
       sysdate,
       'zhangbin',
       c.QXMC
from (select ZRZBDCDYID, FWYT, PRICE, row_number() over (partition by ZRZBDCDYID,FWYT order by ZRZBDCDYID,PRICE) r
      from T_H_PRICE_JZ
      where BZ = '830新增税务价格'
        and FWYT is not null) a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
         left join T_BASE_ZRZ_XZ c on a.ZRZBDCDYID = c.BDCDYID
where r = 1
  and b.BDCDYID is null;



select *
from T_BASE_COMMUNITY
where CREATETIME is not null
  and TO_CHAR(CREATETIME, 'YYYY-MM-DD') = TO_CHAR(sysdate, 'YYYY-MM-DD')
  and PARENTCOMMUNITYID is not null;


select *
from T_BEV_SCOPE_GROUP;
select *
from T_BEV_TASK_SCOPE;
select *
from T_BEV_TASK;
select *
from T_BEV_GROUP_STANDARD;
select *
from T_BEV_SCOPE_GROUP;
select *
from T_BEV_SCOPE_GROUP_DATA;


select TASK_NAME, ID
from T_BEV_TASK a
         left join (select *
                    from (select TASK_ID, row_number() over (partition by TASK_ID order by TASK_ID) r
                          from T_BEV_GROUP_STANDARD)
                    where r = 1) b on a.ID = b.TASK_ID
where b.TASK_ID is not null;

select *
from T_BEV_GROUP_STANDARD;

select *
from T_BEV_TASK;

SELECT *
FROM T_BEV_TASK_SCOPE
WHERE ID IN (SELECT SCOPE_ID FROM T_BEV_SCOPE_GROUP_DATA WHERE GROUP_ID = '413677338552317882');

select *
from T_BEV_RESULT_RECORD
where TASK_ID = '413677342847285060';

select *
from T_BEV_SCOPE_GROUP;

select *
from T_BASE_H_XZ
where zl = '历下区经十路110号';

select Constclstype
from pg_constcls
where CONSTCLSNAME = '批量评估任务状态';

select *
from T_BEV_TASK;

select *
from pg_const;

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



select *
from T_BEV_TASK;

select *
from T_BEV_TASK_SCOPE
where TASK_ID = '413677338552317856';

truncate table T_BEV_RESULT_RECORD;



select a.BDCDYID, a.ZDBDCDYID, a.ZL, b.FWYT4, a.ZCS, SCJZMJ jzmj, a.QXDM
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select bdcdyid, fwyt4, row_number() over (partition by BDCDYID,FWYT4 order by BDCDYID) r
                          from T_DATA_TQJG_ZRZ)
                    where r = 1) b on a.BDCDYID = b.BDCDYID
         left join V_COMMUNITY_GL_ZRZ c on a.BDCDYID = c.ZRZBDCDYID
where 1 = 1;

select distinct ZDBDCDYID ZD_ID, COMMUNITY
from V_COMMUNITY_GL_ZRZ
where ZDBDCDYID is not null
order by ZDBDCDYID;

select BDCDYID
from T_BEV_TASK_SCOPE
group by BDCDYID
having count(0) > 1;

select count(0)
from T_BEV_TASK_SCOPE;

select *
from T_BEV_SCOPE_GROUP;


select *
from T_BEV_GROUP_STANDARD;

select *
from T_BEV_TASK;
select *
from T_BEV_SCOPE_GROUP_DATA
where SCOPE_ID in (select id
                   from T_BEV_TASK_SCOPE
                   where TASK_ID = '413672957685675778'
                     and ZRZBDCDYID in ('827920')
                     and FWYT in ('办公'));

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '356301235516640962';

select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID = '356301235516640962';

select *
from T_BASE_COMMUNITY
where ID = '356301235516640962';

select a.COMMUNITY_ID, b.COMMUNITY_ID, a.ZD_ID, b.BDCDYID, b.COMMUNITY
from T_COMMTY_GL_ZD a
         left join TX_COMMUNITY_A b on a.ZD_ID = b.BDCDYID
         left join TX_SHYQZD_XZ c on a.ZD_ID = c.BDCDYID
where b.BDCDYID is null
  and c.BDCDYID is null
order by a.COMMUNITY_ID;


select *
from TX_COMMUNITY_A
where BDCDYID = '21C7F8A6-A1DB-45D8-A2A3-514BCBB1DB86';

select *
from TX_COMMUNITY_A;

select *
from T_BASE_COMMUNITY wh;



select *
from T_BEV_SCOPE_GROUP_DATA
where GROUP_ID in (select GROUP_ID
                   from T_BEV_TASK_SCOPE
                   where TASK_ID = :taskId
                     and BDCDYID in (bdcdyidList)
                     and FWYT in (fwytList))



select a.COMMUNITY_ID, b.ZRZBDCDYID, a.JG_ZZ, d.PRICE
from T_DATA_PGCG_XQ_ZZ_GXD a
         left join V_COMMUNITY_GL_ZRZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_DATA_TQJG_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT5 = '住宅'
         left join T_PRICE_ZRZ d on c.BDCDYID = d.BDCDYID and c.FWYT5 = d.FWYT
where b.COMMUNITY_ID is not null
  and c.BDCDYID is not null
  and d.PRICE is not null
order by a.COMMUNITY_ID;

select *
from T_PRICE_ZRZ
where BDCDYID = '458363';

select count(0)
from V_COMMUNITY_GL_ZRZ_ZZ;

-- 15338
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, QXMC, ZCS, bz);
select sys_guid(),
       d.BDCDYID,
       d.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       '住宅',
       sysdate,
       'zhangbin',
       '4',
       d.ZL,
       a.QXDM,
       d.QXMC,
       d.ZCS,
       '0905新增国信达住宅价格'
from T_DATA_PGCG_XQ_ZZ_GXD a
         left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = '住宅'
         left join T_BASE_ZRZ_XZ d on b.ZRZBDCDYID = d.BDCDYID
where b.COMMUNITY_ID is not null
  and c.PRICE is null;

select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;

select *
from T_PRICE_ZRZ
where BDCDYID = '190725';


select *
from T_PRICE_ZRZ
where COMMUNITY_ID = 'CB0F6F22076C66B1E053AF5D14ACBB0C';

select *
from T_PRICE_ZRZ
where BZ = '0919新增国信达住宅价格';


select COMMUNITY_ID, count(0)
from T_DATA_PGCG_XQ_ZZ_GXD
where BZ = '9.19住宅整理入库'
group by COMMUNITY_ID
having count(0) > 1;

select *
from T_DATA_PGCG_XQ_ZZ_GXD
where COMMUNITY_ID = 'CB0F6F22076C66B1E053AF5D14ACBB0C';



select *
from T_DATA_PGCG_XQ_ZZ_GXD
where COMMUNITY_ID = 'CB0F6F220B1066B1E053AF5D14ACBB0C';

select *
from T_PRICE_ZRZ
where COMMUNITY_ID = 'CB0F6F220B1066B1E053AF5D14ACBB0C';



select *
from T_PRICE_ZRZ
where BDCDYID = '90797';

select COMMUNITY_ID, count(0)
from T_DATA_PGCG_XQ_ZZ_GXD
group by COMMUNITY_ID
having count(0) > 1;

select *
from T_PRICE_ZRZ
where BZ = '0905新增国信达住宅价格';

select *
from T_BEV_SCOPE_GROUP
order by GROUP_LEVEL;

select *
from T_DATA_PGCG_XQ_ZZ_GXD
where COMMUNITY_ID = 'CB0F6F220BD266B1E053AF5D14ACBB0C';


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



select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '458363';

select *
from T_DATA_TAX_PGJG_SZ01
where ZRZBDCDYID = '458363';

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
from T_PRICE_ZRZ
where BDCDYID = '1128123';


update T_H_PRICE_JZ
set OLD_PRICE = PRICE
where PRICE is not null
  and PRICE <> OLD_PRICE;


create table T_H_PRICE_JZ_0906 parallel 8 as
select *
from T_H_PRICE_JZ nologging;

select count(0)
from T_PRICE_ZRZ
where BZ = '0905新增国信达住宅价格';

select *
from T_H_PRICE_JZ
where PRICE <> OLD_PRICE;

select BDCDYID
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

select count(0)
from T_H_PRICE_JZ
where PRICE is not null;

select count(0)
from T_H_PRICE_JZ_0905
where PRICE is not null;

select distinct FWYT4
from T_BASE_H_XZ
where FWYT4 is not null;

select distinct QXDM
from T_BASE_H_XZ
where QXDM is not null;



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
                          from T_BASE_H_XZ
                          where delete_flag is null) a
                    where a.r = 1) b
                   on a.BDCDYID = b.ZRZBDCDYID
         left join T_DATA_TQJG_ZRZ c on a.BDCDYID = c.BDCDYID and b.FWYT4 = c.FWYT4
where b.FWYT4 is not nullF
  and c.BDCDYID is not null;


select BDCDYID, ZDBDCDYID, ZL, ZCS, SCJZMJ jzmj, QXDM
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select TASK_ID,
                                 zrzbdcdyid,
                                 fwyt,
                                 row_number() over (partition by ZRZBDCDYID,FWYT order by ZRZBDCDYID) r
                          from T_BEV_TASK_SCOPE)
                    where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null
  and TASK_ID = :taskId;


select *
from T_H_PRICE_JZ
where zl = '锦绣城（二区）1号楼118';

-- 槐荫区齐州路1472号锦绣城(二区)11号楼1-118
select *
from T_H_PRICE_JZ
where zl like '%锦绣城%二区%1号楼1-119%';

update T_H_PRICE_JZ
set PRICE_TOTAL = PRICE * JZMJ
where id = 'f0791f78954241a0b45fc129713088db';

select *
from T_BEV_RESULT_RECORD;

select SCOPE_ID, count(0)
from T_BEV_RESULT_RECORD
group by SCOPE_ID
having count(0) > 1;

select *
from T_BEV_GROUP_FACTOR;

select *
from T_BEV_SCOPE_GROUP;


select a.*, b.PRICE, b.PRICE * a.JZMJ price_total
from T_BEV_TASK_SCOPE a
         left join T_BEV_RESULT_RECORD b on a.id = b.SCOPE_ID
where a.TASK_ID = '413677342847285060';



select a.*, b.PRICE, b.PRICE * a.JZMJ price_total
from T_BEV_TASK_SCOPE a
         left join T_BEV_RESULT_RECORD b on a.id = b.SCOPE_ID
where 1 = 1
order by qxdm, zl;

select ID
from T_BASE_COMMUNITY
where COMMUNITY = '下水河新村社区';


select *
from TX_COMMUNITY_A
where COMMUNITY_ID = '356301244106575476';

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '356301244106575476';


select *
from T_BASE_ZRZ_XZ
where zl like '%万象新天小区三区%';

select zl, PRICE, FWYT, CREATEUSER, CREATETIME, JGLY, bz
from T_PRICE_ZRZ
where zl like '%万象新天小区三区%';

truncate table T_BEV_RESULT_RECORD;

select *
from T_BEV_RESULT_RECORD;

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

--槐荫区经七路17号楼底层122房
select *
from T_H_PRICE_JZ
where zl like '%经七路%17号%122%';

select *
from T_BEV_TASK_SCOPE;

select *
from T_BEV_TASK_SCOPE;

select *
from T_H_PRICE_JZ
where BDCDYH = '370104001002GB01001F10000020';



select *
from T_H_PRICE_JZ
where zl = '历城区世纪大道11977号中新锦绣天地东苑一区18号楼102';

select *
from T_H_PRICE_JZ
where BDCDYH = '370104001002GB01001F10000020';
select *
from T_BASE_H_XZ
where FWBM = '20080925212403';

select *
from T_BASE_H_XZ
where zl like '%经七路%17号%122%';


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
from T_BEV_TASK;
select *
from T_BEV_TASK_SCOPE
where BDCDYID in (select BDCDYID
                  from T_BEV_TASK_SCOPE
                  group by BDCDYID
                  having count(0) > 1)
order by ZL;

select *
from T_API_WSXX
WHERE CREATE_TIME < TO_DATE('20220916', 'yyyyMMdd');


-- (select sum(JSJE)
--         from T_API_WSXX b
--         where b.nsrlx = '权利人'
--           and sm = '契税'
--           and b.FWBM = a.FWBM)            jsjg,
--        ((select sum(JSJE)
--          from T_API_WSXX b
--          where b.nsrlx = '权利人'
--            and sm = '契税'
--            and b.FWBM = a.FWBM) / SCJZMJ) jsdj,
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

select distinct jsfe
from T_API_WSXX;

select *
from T_API_WSXX a
where to_char(create_time, 'yyyyMMdd') = to_char(sysdate, 'yyyyMMdd')
  and a.nsrlx = '权利人'
  and a.jsfe = '50';

select *
from T_BASE_H_XZ
where FWYT4 = '车位/车库'
  and ZL like '%鲁商%';

select *
from T_API_WSXX;


select *
from jnpg.t_price_zrz b
where b.bdcdyid not in (select a.zrzbdcdyid from jnpg.t_h_price_jz a)
  and STATE = '0';

select *
from T_PRICE_ZRZ
where STATE is null
  and BZ = '小区价格脚本导入20220730国信达提供';

update T_PRICE_ZRZ
set STATE = '0'
where STATE is null
  and BZ = '小区价格脚本导入20220730国信达提供';

select *
from T_PRICE_ZRZ
where BDCDYID = 'fbc6a8ad17604492a200c5a4545f16df';

select distinct FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID = 'fbc6a8ad17604492a200c5a4545f16df';

411847,3760,地下室
幢未落地-76390,6078,车库
1269,3829,地下室
659630,3691,储藏室/
阁楼
647482,6114,储藏室/
阁楼
幢未落地-503506,4000,储藏室/
阁楼
627708,3080,储藏室/
阁楼
637382,4778,车位/
车库
627706,3080,储藏室/
阁楼
幢未落地-76797,3916,地下室

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '647482'
  and FWYT = '储藏室/阁楼';
select *
from T_BASE_H_XZ
where ZRZBDCDYID = '647482'
  and FWYT4 = '储藏室/阁楼';

select *
from T_PRICE_ZRZ
where STATE = '0';


select id,
       business_type,
       object_type,
       field_name,
       field_name_desc,
       field_sort,
       use_type,
       create_user,
       create_time,
       update_user,
       update_time,
       field_type,
       field_enumerate
from t_yw_survey_field_option;

select *
from T_H_PRICE_JZ
where zl = '槐荫区泰安路887号恒大雅苑13号楼1-105';

update T_H_PRICE_JZ
set PRICE       = 19500,
    PRICE_TOTAL = 19500 * JZMJ
where zl = '槐荫区泰安路887号恒大雅苑13号楼1-105';


select FWYT4, FWYT3
from T_BASE_H_XZ
where zl = '历下区经十路38号舜山园二期A座及地下人防车库1-2001';


select *
from T_YW_SURVEY_TASK;

select id,
       hbdcdyid,
       zrzbdcdyid,
       zdbdcdyid,
       community_id,
       TASK_LEVEL,
       task_name,
       task_desc,
       object_type,
       zl,
       actflag,
       investigator_id,
       investigator_name,
       client,
       client_idnum,
       sfqlr,
       result,
       investigator_sign,
       client_sign,
       qlr_sign,
       create_user,
       create_time,
       CHECK_ID,
       del_flag,
       actinstid,
       pub_time,
       accept_time,
       phone,
       homeowner,
       dep_id,
       task_yt,
       smx,
       smy,
       task_type
from t_yw_survey_task
WHERE del_flag = ?;
--
-- -- t_cfg_adjust_factor_standard主键序列
-- create sequence seq_t_workflow_actinst
--     increment by 1
--     start with 10
--     nomaxvalue
--     nominvalue
--     cache 20;
--
--         select id, business_type, object_type, field_name, field_name_desc, field_sort, use_type, create_user, create_time, update_user, update_time, field_type, field_enumerate from t_yw_survey_field_option


select *
from V_DATA_PGJG_H_GXD;
select *
from jnpg.t_api_wsxx a
where a.FWBM = '2012101800039350500009';

select *
from T_API_WSXX
where ZJHM = '370302199008297528';

select BDCDYID
from T_H_PRICE_JZ
where zl = '历下区经十路9777号3号楼2904';

select *
from T_H_PRICE_JZ_0921
where zl = '历下区经十路9777号3号楼2904';

select QXDM
from T_BASE_ZRZ_XZ
where zl = '钢城区北赵小区19-C1';

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
order by p.zl, p.fwyt;

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


select BDCDYID
from T_BASE_ZRZ_XZ where zl = '莱芜区凤城东大街伯箫路77号天晟·上府文园3幢';

select *
from v_data_h_xx where BDCDYID = 'LWSXCQ_38861';

select *
from T_BEV_GROUP_STANDARD where NAME = '历下区经十路10817号-103';

select *
from T_H_PRICE_JZ;