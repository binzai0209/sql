select *
from pg_const
where constslsid = '2021091101';

select *
from V_BASE_H_XZ;

select *
from pg_constcls
where constclsname like '%区县%';


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

select *
from T_COMMUNITY_YT;

truncate table T_COMMUNITY_YT;

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

select *
from T_CFG_COMMON_URL;



select *
from V_COMMUNITY_GL_ZRZ;


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


select *
from T_COMMUNITY_YT
where COMMUNITY_ID in (select id from T_BASE_COMMUNITY where COMMUNITY = '中垠广场');

select a.BDCDYID, a.FWYT4, b.COMMUNITY_ID, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '银座数码广场',
                                        '永安大厦',
                                        '鸿苑大厦',
                                        '555国际',
                                        '保险大厦',
                                        '铭盛大厦',
                                        '丰利大厦',
                                        '济南彩云大厦',
                                        '天安财险大厦',
                                        '新宇写字楼',
                                        '华能大厦',
                                        '泰山科技大厦',
                                        '大地锐城',
                                        '建筑新村',
                                        '凯旋商务中心',
                                        '畅远商座写字楼',
                                        '银荷大厦',
                                        '全运村中央广场')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null;
--and a.FWYT4 = '办公';

select a.BDCDYID, a.FWYT4, b.COMMUNITY_ID, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '天安时代广场',
                                        '中弘广场',
                                        '汇阳大厦',
                                        '金泉大厦',
                                        '历东商务大厦',
                                        '诚创大厦',
                                        '浦发大厦',
                                        '普利广场',
                                        '齐鲁软件大厦',
                                        '三联大厦',
                                        '中信广场',
                                        '新生活家园-商业楼',
                                        '鲁信大厦',
                                        '中垠广场',
                                        '泺源大厦',
                                        '历下软件园',
                                        '华电国际')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null;

select a.BDCDYID, a.FWYT4, b.COMMUNITY_ID, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '天安时代广场',
                                        '中弘广场',
                                        '汇阳大厦',
                                        '金泉大厦',
                                        '历东商务大厦',
                                        '诚创大厦',
                                        '浦发大厦',
                                        '普利广场',
                                        '齐鲁软件大厦',
                                        '三联大厦',
                                        '中信广场',
                                        '新生活家园-商业楼',
                                        '鲁信大厦',
                                        '中垠广场',
                                        '泺源大厦',
                                        '历下软件园',
                                        '华电国际')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null;



select a.BDCDYID, a.FWYT4, b.COMMUNITY_ID, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '银座数码广场',
                                        '永安大厦',
                                        '鸿苑大厦',
                                        '555国际',
                                        '保险大厦',
                                        '铭盛大厦',
                                        '丰利大厦',
                                        '济南彩云大厦',
                                        '天安财险大厦',
                                        '新宇写字楼',
                                        '华能大厦',
                                        '泰山科技大厦',
                                        '大地锐城',
                                        '建筑新村',
                                        '凯旋商务中心',
                                        '畅远商座写字楼',
                                        '银荷大厦',
                                        '全运村中央广场',
                                        '天安时代广场',
                                        '中弘广场',
                                        '汇阳大厦',
                                        '金泉大厦',
                                        '历东商务大厦',
                                        '诚创大厦',
                                        '浦发大厦',
                                        '普利广场',
                                        '齐鲁软件大厦',
                                        '三联大厦',
                                        '中信广场',
                                        '新生活家园-商业楼',
                                        '鲁信大厦',
                                        '中垠广场',
                                        '泺源大厦',
                                        '历下软件园',
                                        '华电国际')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null
  and a.FWYT4 = '办公';

select a.BDCDYID, a.FWYT4, b.COMMUNITY_ID, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '棋盘小区二区',
                                        '东源小区',
                                        '中国人民武装警察部队山东省总队医院',
                                        '精神卫生宿舍',
                                        '山东省国土空间规划院',
                                        '羊头峪路19号',
                                        '按察司街94-1号')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null;
--and a.FWYT4 like '%车%';


select a.BDCDYID, a.FWYT5, b.COMMUNITY_ID, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '老东门万货汇购物广场', '
                                        清风河畔
                                            ')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null;

select COMMUNITY_ID, LPYT, count(0)
from T_COMMUNITY_YT
group by COMMUNITY_ID, LPYT
having count(0) > 1;

select *
from T_COMMUNITY_YT
where COMMUNITY_ID = '356301750912716311';

--insert into T_COMMUNITY_YT (id, community_id, lpyt, CREATE_USER, CREATE_TIME)
select b.COMMUNITY_ID, a.FWYT5, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '山东省粮食局宿舍',
                                        '山东省政协机关第一宿舍',
                                        '海尔绿城全运村御园',
                                        '历下区机关宿舍',
                                        '小园庄42号',
                                        '黑虎泉北路139号',
                                        '南圩子门外街7号楼',
                                        '建工燕东苑',
                                        '贡院墙根街4号',
                                        '新宇写字楼',
                                        '十亩园街',
                                        '历山路165号',
                                        '山东工艺美术学院(千佛山校区)',
                                        '燕翔路10号',
                                        '浆水泉路20号',
                                        '环山小区',
                                        '解放东路63号',
                                        '文化东路25号',
                                        '建筑新村南路31号')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null;



select a.BDCDYID, a.FWYT5, b.COMMUNITY_ID, b.COMMUNITY
from T_DATA_TQJG_ZRZ a
         left join (select *
                    from V_COMMUNITY_GL_ZRZ
                    where COMMUNITY in (
                                        '解放东路64号',
                                        '御金十二墅',
                                        '济南热力集团宿舍楼',
                                        '黄台南路56号',
                                        '旭辉银盛泰中心·翰林府',
                                        '解放路2号小区')) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null;



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

select distinct a.FWYT5
from T_DATA_TQJG_ZRZ a
         left join V_COMMUNITY_GL_ZRZ b on a.BDCDYID = b.ZRZBDCDYID
where b.COMMUNITY_ID = 'CB0F6F220B9866B1E053AF5D14ACBB0C'
  and b.ZRZBDCDYID is not null;

select *
from T_COMMUNITY_YT
where COMMUNITY_ID = 'CB0F6F220B9866B1E053AF5D14ACBB0C';

select v.*,
       pz.fwyt        幢用途,
       pz.price       幢基准价,
       ch.lpyt        楼盘用途,
       ch.price       楼盘价格,
       c.community_id 楼盘ID,
       c.community    楼盘名称
from v_tj_zrz_fwyt v
         left join t_price_zrz pz on pz.bdcdyid = v.zrzbdcdyid and pz.fwyt = '公寓'
         left join v_community_gl_zrz c on c.ZRZBDCDYID = v.zrzbdcdyid
         left join t_collect_community_price_his ch
                   on ch.community_id = c.community_id and ch.data_source in ('税务', '国信达') and ch.lpyt = '公寓'
where v.gy > 0
order by v.gy desc;

insert into T_COMMUNITY_YT (id, community_id, lpyt, create_user, create_time)
select sys_guid(), ID, FWYT5, 'zhangbin', sysdate
from (select distinct a.ID, c.FWYT5
      from T_BASE_COMMUNITY a
               left join V_COMMUNITY_GL_ZRZ b on a.ID = b.COMMUNITY_ID
               left join T_DATA_TQJG_ZRZ c on b.ZRZBDCDYID = c.BDCDYID
      where c.FWYT5 in ('子母车位', '微型车位')
      order by a.ID);

select sys_guid(), ID, FWYT5, 'zhangbin', sysdate
from (select distinct a.ID, c.FWYT5
      from T_BASE_COMMUNITY a
               left join V_COMMUNITY_GL_ZRZ b on a.ID = b.COMMUNITY_ID
               left join T_DATA_TQJG_ZRZ c on b.ZRZBDCDYID = c.BDCDYID
      where c.FWYT5 in ('子母车位', '微型车位')
      order by a.ID);

select *
from T_PRICE_ZRZ
where zl = '槐荫区经二路383号';


select distinct FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY = '外海中央花园三区');



select tt.zd_id, tt.createtime, c.id, c.community
from t_base_community c,
     T_COMMTY_GL_ZD tt
where c.id = tt.community_id
  and c.del_flag = '0'
  and tt.zd_id in (select gz.zd_id
                   from t_commty_gl_zd gz
                   group by gz.zd_id
                   having count(0) > 1);



select *
from T_BEV_SCOPE_GROUP;

select *
from T_BEV_SCOPE_GROUP;

select *
from T_BEV_SCOPE_GROUP_DATA;

select *
from T_BEV_TASK_SCOPE;


select SCOPE_ID
from T_BEV_SCOPE_GROUP_DATA
where GROUP_ID in (SELECT Id
                   FROM T_BEV_SCOPE_GROUP
                   START WITH ID = '6'
                   Connect BY Prior ID = PARENT_ID);


select *
from T_PRICE_ZRZ;


select *
from T_PRICE_ZRZ
where DATA_SOURCE is null;

update T_PRICE_ZRZ
set DATA_SOURCE = '1'
where JGLY = '1:税务提供'
  and DATA_SOURCE is null;



select a.BDCDYID, a.FWYT, b.BDCDYID, b.FWYT5
from T_PRICE_ZRZ a
         left join T_DATA_TQJG_ZRZ b on a.BDCDYID = b.BDCDYID
where BZ = '0824新增价格'
  and a.FWYT = '车位/车库'
  and b.FWYT4 = '车位/车库'
  and b.FWYT5 <> '车位/车库';

select count(0)
from T_PRICE_ZRZ;

select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;


select *
from T_PRICE_ZRZ
where QXDM = '371202';

select *
from T_H_PRICE_JZ
where QXDM = '371202';

select *

from T_BEV_GROUP_STANDARD;

select distinct DATA_SOURCE
from T_PRICE_ZRZ
where QXDM = '370103';

select *
from T_PRICE_ZRZ
where DATA_SOURCE is null;

update T_PRICE_ZRZ
set DATA_SOURCE = '4'
where JGLY = '4:国信达提供'
  and DATA_SOURCE is null;

select *
from T_BEV_SCOPE_GROUP;

delete
from T_BEV_SCOPE_GROUP;

delete
from T_BEV_SCOPE_GROUP_DATA;

select *
from T_BEV_GROUP_STANDARD;

select *
from T_BEV_TASK_SCOPE
where FWYT = '住宅';

select *
from T_BEV_SCOPE_GROUP_DATA;

delete
from T_BEV_SCOPE_GROUP_DATA;

select *
from T_BEV_SCOPE_GROUP as of timestamp to_timestamp('2022-08-25 15:00:00', 'yyyy-mm-dd hh24:mi:ss');


delete
from T_BEV_SCOPE_GROUP_DATA
where GROUP_ID = '413642235784607556';


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

select ZDBDCDYID zd_id, COMMUNITY, QXDM
from (select ZDBDCDYID, COMMUNITY, QXDM, row_number() over (partition by ZDBDCDYID,COMMUNITY order by ZDBDCDYID) r
      from V_COMMUNITY_GL_ZRZ)
where r = 1
  and COMMUNITY = '国华东方美郡';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY = '中建大学里';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '356304770274725391';

select *
from T_BASE_ZRZ_XZ
where ZDBDCDYID in (select ZD_ID
                    from T_COMMTY_GL_ZD
                    where COMMUNITY_ID = '356304770274725391');

select *
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '356304770274725391'

select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID = '356304770274725391';



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
order by p.zl, p.fwyt


SELECT ZRZ.BDCDYID,
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
                              ' a1928fe84eee46689b05efede29c993d');


select *
from T_BASE_ZRZ_XZ where ZDBDCDYID in ('2523986AA9FC4496A31567C7CB19B6B5', '66085e2889044a379fc8ed78d9fc404d',
                              'CE42971A633342E78F042AF2FFB28FA1', 'FFABF7E6193E45CEA1ABC46F4238D6E6',
                              'a1928fe84eee46689b05efede29c993d');

select *
from V_COMMUNITY_GL_ZRZ where ZDBDCDYID is null ;