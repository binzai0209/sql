insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz, SCJ)
select sys_guid(),
       ZRZBDCDYID,
       ZDBDCDYID,
       COMMUNITY_ID,
       round(PRICE / 1.05, 2) as price,
       FWYT,
       sysdate,
       'zhangbin',
       '4',
       ZRZ_ZL,
       QXDM,
       '20221116区县非住宅入库',
       PRICE                     scj
from (select *
      from (select v.ZRZBDCDYID,
                   v.ZDBDCDYID,
                   v.COMMUNITY_ID,
                   v.PRICE,
                   v.FWYT,
                   v.ZRZ_ZL,
                   v.QXDM,
                   pz.price                                                            price_jz,
                   row_number() over (partition by v.ZRZBDCDYID order by v.ZRZBDCDYID) R
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
            where v.fwyt = '储藏室/阁楼' and v.BZ = '20221116区县非住宅入库')
      where r = 1)
where price_jz is null;

select BDCDYID,FWYT,count(0)
from T_PRICE_ZRZ group by BDCDYID,FWYT having count(0) >1;


insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz, SCJ)
select sys_guid(),
       ZRZBDCDYID,
       ZDBDCDYID,
       COMMUNITY_ID,
       round(PRICE / 1.05, 2) as price,
       FWYT,
       sysdate,
       'zhangbin',
       '4',
       ZRZ_ZL,
       QXDM,
       '20221116区县非住宅入库',
       PRICE                     scj
from (select *
      from (select v.ZRZBDCDYID,
                   v.ZDBDCDYID,
                   v.COMMUNITY_ID,
                   v.PRICE,
                   v.FWYT,
                   v.ZRZ_ZL,
                   v.QXDM,
                   pz.price                                                            price_jz,
                   row_number() over (partition by v.ZRZBDCDYID order by v.ZRZBDCDYID) R
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
            where v.fwyt = '车位/车库' and v.BZ = '20221116区县非住宅入库')
      where r = 1)
where price_jz is null;
;