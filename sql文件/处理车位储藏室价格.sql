-- 原版
select *
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库'
        and v.ZRZBDCDYID not in ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507', '1538618',
                                 '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664'))
where ZRZBDCDYID = '1279462';


select zrzbdcdyid, fwyt, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '储藏室/阁楼' /*and v.ZRZBDCDYID='460162'*/
     )
group by zrzbdcdyid, fwyt
having count(0) > 1
order by count(0) desc;

-----------------------------------------------------------------------------------------------------------------------------
-- 处理版本
-- 车位/车库价格
select QXDM, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库'
        and v.ZRZBDCDYID not in ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507', '1538618',
                                 '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664')) a
where price_jz is null
group by QXDM;

select count(distinct BDCDYID), count(0)
from T_DATA_TQJG_ZRZ
where FWYT4 like '%车%';

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz)
select sys_guid(),
       ZRZBDCDYID,
       ZDBDCDYID,
       COMMUNITY_ID,
       PRICE,
       FWYT,
       sysdate,
       'zhangbin',
       '4',
       ZRZ_ZL,
       QXDM,
       '0824新增价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库'
        and v.ZRZBDCDYID not in ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507', '1538618',
                                 '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664'))
where price_jz is null;

select a.QXDM, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
      where v.fwyt = '储藏室/阁楼') a
where price_jz is null
group by QXDM;


select *
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
      where v.fwyt = '储藏室/阁楼') a
where price_jz is null
  and QXDM is null;

delete
from T_PRICE_ZRZ
where BZ = '0824新增价格';

select *
from T_PRICE_ZRZ
where BZ = '0824新增价格';

select BDCDYID,FWYT,count(0)
from T_PRICE_ZRZ group by BDCDYID,FWYT having count(0) > 1;

select *
from T_PRICE_ZRZ where BDCDYID ='幢未落地-499161';

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz,SCJ)
select sys_guid(),
       ZRZBDCDYID,
       ZDBDCDYID,
       COMMUNITY_ID,
       round(PRICE/1.05,2) as price,
       FWYT,
       sysdate,
       'zhangbin',
       '4',
       ZRZ_ZL,
       QXDM,
       '0824新增价格',
       PRICE scj
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
      where v.fwyt = '储藏室/阁楼')
where price_jz is null;

select *
from T_PRICE_ZRZ where BZ = '0824新增价格';

select *
from T_PRICE_ZRZ
where BZ = '0824新增价格';

select *
from T_PRICE_ZRZ
where PRICE is null;

select count(0)
from T_BASE_H_XZ
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '0824新增价格');

select distinct a.PRICE, a.FWYT, a.FWYT3, ZRZBDCDYID, b.PRICE, b.FWYT,a.PRICE - b.PRICE jgc
from T_H_PRICE_JZ a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where ZRZBDCDYID in (select T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '0824新增价格')
  and a.PRICE is not null;

select *
from TX_COMMUNITY_A where ZL = '济南市花园路200号';

select BDCDYID,count(0)
from T_H_PRICE_JZ group by BDCDYID having count(0) > 1;

select *
from T_H_PRICE_JZ where BDCDYID = '5564414';

