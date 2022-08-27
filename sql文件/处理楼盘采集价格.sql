-- 原版
select zrzbdcdyid, fwyt, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库'
        and v.ZRZBDCDYID not in ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507', '1538618',
                                 '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664'))
group by zrzbdcdyid, fwyt
having count(0) > 1
order by count(0) desc;


select zrzbdcdyid, fwyt, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '储藏室/阁楼' /*and v.ZRZBDCDYID='460162'*/
     )
group by zrzbdcdyid, fwyt
having count(0) > 1
order by count(0) desc;
------------------------------------------------------------------------------------------------------------------------


select a.ZRZBDCDYID,a.FWYT,b.BDCDYID,b.FWYT4
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库'
        and v.ZRZBDCDYID not in ('1279463', '1358052', '1471673', '1134063', '1279462', '1127943', '1302507', '1538618',
                                 '1174766', '1039743', '1538617', '639668', '639660', '639667', '639664')) a
left join T_DATA_TQJG_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT4
where price_jz is null and  b.BDCDYID is not null ;


select a.ZRZBDCDYID,a.FWYT,b.BDCDYID,b.FWYT4
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '储藏室/阁楼' /*and v.ZRZBDCDYID='460162'*/
     ) a left join T_DATA_TQJG_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT4
where b.FWYT4 is not null;


delete
from T_PRICE_ZRZ
where BZ = '0824新增价格';

select distinct BZ
from T_PRICE_ZRZ;

update T_H_PRICE_JZ
set OLD_PRICE = PRICE;



