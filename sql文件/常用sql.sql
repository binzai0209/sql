-- 批量更新评估成果
begin
    for cur in (select h.BDCDYH, t.ZL
                from T_BASE_H_XZ h,
                     T_DATA_PGJG t
                where t.ZL = h.ZL)
        loop

            update T_DATA_PGJG set BDCDYH = cur.BDCDYH where ZL = cur.ZL ;
        end loop;
end;

-- 清空房源信息相关数据
delete
from t_dj_fyxxfrom;
delete
from t_dj_slxxform;
delete
from t_dj_csfxxgrid;
delete
from t_dj_zrfxxgrid;

--地
select *
from t_data_wqjg_h_avg_year2_1 T;
--幢
select (select Z.zcs from T_BASE_ZRZ_XZ z where z.BDCDYID = h.zrzbdcdyid and rownum = 1) ZCS
from t_data_wqjg_h_avg_year3_1 H;
--户
select *
from t_base_h_xz;

-- 可展示全部信息的户
select *
from t_base_h_xz
WHERE CH is not null
  and ZL is not null
  and QSC is not null
  and SZC is not null
  and ZCS is not null
  and HH is not null
  and HX is not null
  and HXJG is not null
  and SCTNJZMJ is not null
  and SCJZMJ is not null
  and FWJG is not null
  and FWLX is not null
  and FWXZ is not null
  and FWYT4 is not null
  and HX is not null;

-- 去重数量查询
select count(distinct bdcdyh)
from v_data_tax_pgjg
where bdcdyh is not null;

-- 分页查询成交价格
select *
from (select rownum as num, t.* from t_data_cjjg t where rownum <= 12) table_cjjg
where table_cjjg.num >= 1;

-- 字典大类
select *
from pg_constcls
where constclsname like '%来源%';
-- 字典小类
select *
from pg_const
where constslsid = '2021112301';


-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

-- 杀掉被锁住的表
ALTER system kill session '42, 5185';

select *
from pg_const
where consttrans like '%梯%';

delete
from PG_ZD;
delete
from PG_H;
delete
from PG_ZRZ;

select *
from pg_h;
select *
from pg_zd;
select *
from pg_zrz;

select *
from t_Data_Pgcg_h_Gxd
where BDC_ZKW is not null;

select *
from t_base_community
where id = 'CB0F6F22077266B1E053AF5D14ACBB0C';



select *
from t_commty_gl_zd;

select *
from t_commty_gl_gxd;

select *
from t_base_community_bk;

select *
from t_base_community;


select *
from t_data_pgcg_community_gxd;

select *
from T_BASE_ZD_XZ;



select count(*)
from t_base_h_xz h
where h.zdbdcdyid in (select c.zd_id from t_commty_gl_zd c where c.community_id = 'CB0F6F22077366B1E053AF5D14ACBB0C');


select *
from (select C.*, D.FWYT4, D.JG_SINGLE, d.community community_temp
      from T_BASE_COMMUNITY C
               LEFT JOIN V_DATA_TAX_PGJG_COMMUNITY D ON C.ID = D.COMMUNITY_ID)
where community_temp is not null;

select *
from v_data_pgjg_community_gxd;

select *
from t_base_community c
where c.kfgs_id is null;


select count(distinct gsmc)
from t_base_enterprise;

select *
from t_base_enterprise
where gsmc = '济南银都房地产开发有限公司';



select count(*)
from T_DATA_PGCG_H_GXD
where hbdcdyh is not null;

select count(bdcdyh)
from V_DATA_TAX_PGJG;



select *
from ESCOMMUNITY
where id = 'CB0F6F220C6766B1E053AF5D14ACBB0C';

SELECT *
FROM v_data_pgjg_community_gxd g
WHERE g.name = (SELECT max(s.name) FROM v_data_pgjg_community_gxd s WHERE g.name = s.name);

select *
from (select t.*, row_number() over (partition by id order by rownum) rn from v_data_pgjg_community_gxd t)
where rn = 1
  and sfgl = '0';


select count(distinct id)
from v_data_pgjg_community_gxd;


select *
from t_base_community c
where c.community = '万达华府';


select CAST(h.PRICE * h.JZMJ AS NUMBER(10, 6))
from T_PRICE_H h;


select count(*)
from T_PRICE_H
where QSC is null;
