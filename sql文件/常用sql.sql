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
