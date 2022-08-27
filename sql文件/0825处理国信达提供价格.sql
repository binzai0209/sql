select zrzbdcdyid, fwyt, count(0), max(price_jz), min(price_jz)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库')
where price_jz is null
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

select zrzbdcdyid, fwyt, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '办公' /*and v.ZRZBDCDYID='460162'*/
     )
group by zrzbdcdyid, fwyt
having count(0) > 1
order by count(0) desc;

select zrzbdcdyid, fwyt, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '公寓' /*and v.ZRZBDCDYID='460162'*/
     )
group by zrzbdcdyid, fwyt
having count(0) > 1
order by count(0) desc;


-- 车位/车库
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
       '0825新增价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and instr(pz.fwyt, '车') > 0
      where v.fwyt = '车位/车库'
         /*and v.ZRZBDCDYID not in('1279463','1358052','1471673','1134063','1279462','1127943','1302507','1538618',
         '1174766','1039743','1538617','639668','639660','639667','639664')*/
     )
where price_jz is null;


-- 储藏室/阁楼
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
       '0825新增价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '储藏室/阁楼' /*and v.ZRZBDCDYID='460162'*/
     )
where price_jz is null;


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
       '0825新增价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '办公' /*and v.ZRZBDCDYID='460162'*/
     )
where price_jz is null;


insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz)
select sys_guid(),
       ZRZBDCDYID,
       a.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.PRICE,
       a.FWYT,
       sysdate,
       'zhangbin',
       '4',
       ZRZ_ZL,
       a.QXDM,
       '0825新增价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '公寓' /*and v.ZRZBDCDYID='460162'*/
     ) a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where price_jz is null;


select a.BDCDYID, a.FWYT, a.PRICE, b.FWYT4
from T_PRICE_ZRZ a
         left join T_DATA_TQJG_ZRZ b on a.BDCDYID = b.BDCDYID
where a.FWYT = '储藏室/阁楼'
  and b.FWYT4 = '地下室';


select *
from T_PRICE_ZRZ
where BDCDYID in (select BDCDYID
                  from T_PRICE_ZRZ
                  where bdcdyid in (select BDCDYID
                                    from T_PRICE_ZRZ
                                    where FWYT = '储藏室/阁楼')
                    and BDCDYID not in ('458124',
                                        '600520',
                                        '639043',
                                        '646343',
                                        '633682',
                                        '657220',
                                        '629783',
                                        '629785',
                                        '629787',
                                        '629792',
                                        '629820',
                                        '630840',
                                        '630842',
                                        '630860',
                                        '630900',
                                        '630920',
                                        '630940',
                                        '630942',
                                        '630960',
                                        '630961',
                                        '-91332',
                                        '-91362',
                                        '412970',
                                        '458509',
                                        '458510',
                                        '458511',
                                        '628320',
                                        '628440',
                                        '629780',
                                        '633881',
                                        '633884',
                                        '633885',
                                        '634141',
                                        '634780',
                                        '635620',
                                        '655105',
                                        '647160',
                                        '457533',
                                        '457641',
                                        '457643',
                                        '413566',
                                        '412383',
                                        '600203',
                                        '600204',
                                        '600205',
                                        '600206',
                                        '600207',
                                        '600208',
                                        '600209',
                                        '600211',
                                        '23234',
                                        '23237',
                                        '625700',
                                        '625822',
                                        '625824',
                                        '625826',
                                        '625827',
                                        '625829',
                                        '625830',
                                        '459220',
                                        '460011',
                                        '460014',
                                        '460015',
                                        '460016',
                                        '460017',
                                        '460018',
                                        '460042',
                                        '460046',
                                        '644611',
                                        '644619',
                                        '644620',
                                        '134',
                                        '853785',
                                        '662320',
                                        '626102',
                                        '626103',
                                        '458217',
                                        '636981',
                                        '460048',
                                        '460049',
                                        '460050',
                                        '460051',
                                        '460052',
                                        '460053',
                                        '460054',
                                        '460055',
                                        '460057',
                                        '460058',
                                        '460060',
                                        '460114',
                                        '460157',
                                        '460159',
                                        '460161',
                                        '460162',
                                        '460170',
                                        '460179',
                                        '460190',
                                        '597799')
                    and FWYT = '储藏室/阁楼');


insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz)
select sys_guid(),
       a.BDCDYID,
       a.ZDBDCDYID,
       b.COMMUNITY_ID,
       b.PRICE,
       a.FWYT4,
       sysdate,
       'zhangbin',
       '4',
       a.ZL,
       a.QXDM,
       '0825新增价格'
from T_DATA_TQJG_ZRZ a
         left join T_PRICE_ZRZ b on a.BDCDYID = b.BDCDYID and b.FWYT = '储藏室/阁楼'
where a.BDCDYID in (select BDCDYID
                    from T_PRICE_ZRZ
                    where bdcdyid in (select BDCDYID
                                      from T_PRICE_ZRZ
                                      where FWYT = '储藏室/阁楼')
                      and BDCDYID not in ('458124',
                                          '600520',
                                          '639043',
                                          '646343',
                                          '633682',
                                          '657220',
                                          '629783',
                                          '629785',
                                          '629787',
                                          '629792',
                                          '629820',
                                          '630840',
                                          '630842',
                                          '630860',
                                          '630900',
                                          '630920',
                                          '630940',
                                          '630942',
                                          '630960',
                                          '630961',
                                          '-91332',
                                          '-91362',
                                          '412970',
                                          '458509',
                                          '458510',
                                          '458511',
                                          '628320',
                                          '628440',
                                          '629780',
                                          '633881',
                                          '633884',
                                          '633885',
                                          '634141',
                                          '634780',
                                          '635620',
                                          '655105',
                                          '647160',
                                          '457533',
                                          '457641',
                                          '457643',
                                          '413566',
                                          '412383',
                                          '600203',
                                          '600204',
                                          '600205',
                                          '600206',
                                          '600207',
                                          '600208',
                                          '600209',
                                          '600211',
                                          '23234',
                                          '23237',
                                          '625700',
                                          '625822',
                                          '625824',
                                          '625826',
                                          '625827',
                                          '625829',
                                          '625830',
                                          '459220',
                                          '460011',
                                          '460014',
                                          '460015',
                                          '460016',
                                          '460017',
                                          '460018',
                                          '460042',
                                          '460046',
                                          '644611',
                                          '644619',
                                          '644620',
                                          '134',
                                          '853785',
                                          '662320',
                                          '626102',
                                          '626103',
                                          '458217',
                                          '636981',
                                          '460048',
                                          '460049',
                                          '460050',
                                          '460051',
                                          '460052',
                                          '460053',
                                          '460054',
                                          '460055',
                                          '460057',
                                          '460058',
                                          '460060',
                                          '460114',
                                          '460157',
                                          '460159',
                                          '460161',
                                          '460162',
                                          '460170',
                                          '460179',
                                          '460190',
                                          '597799')
                      and FWYT = '储藏室/阁楼')
  and a.FWYT5 = '地下室';

select *
from T_PRICE_ZRZ
where BZ = '0825新增价格';

select a.BDCDYID, a.ZRZBDCDYID, a.FWYT, a.PRICE, b.FWYT, b.PRICE, a.PRICE - b.PRICE jgc
from T_H_PRICE_JZ a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where b.BDCDYID in (select BDCDYID
                    from T_PRICE_ZRZ
                    where BZ = '0825新增价格')
  and a.PRICE is not null;

select *
from T_PRICE_ZRZ
where BDCDYID = '1087445';

select *
from T_PRICE_ZRZ
where BDCDYID in (select BDCDYID
                  from T_PRICE_ZRZ
                  where BZ = '0825新增价格');

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '1087445'
  and PRICE is not null;

select count(0)
from T_PRICE_ZRZ
where BZ = '0825新增价格';

update T_H_PRICE_JZ_825
set OLD_PRICE = PRICE;

create table T_H_PRICE_JZ_826 parallel 8 as
select *
from T_H_PRICE_JZ_825 nologging;

select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

select BDCDYID
from T_H_PRICE_JZ
where BDCDYID in (select BDCDYID
                  from T_H_PRICE_JZ
                  group by BDCDYID
                  having count(0) > 1);


select count(0)
from T_H_PRICE_JZ;

select count(distinct BDCDYID)
from T_BASE_H_XZ
where ZRZBDCDYID in (select BDCDYID
                     from T_PRICE_ZRZ
                     where bz = '0825新增价格');

select count(distinct BDCDYID)
from T_H_PRICE_JZ
where ZRZBDCDYID in (select BDCDYID
                     from T_PRICE_ZRZ
                     where bz = '0825新增价格');


create table T_H_PRICE_JZ_826 parallel 8 as
select *
from T_H_PRICE_JZ_825 nologging;


select *
from T_H_PRICE_JZ
where PRICE <> OLD_PRICE
  and PRICE is not null
  and OLD_PRICE is not null;

select count(0)
from T_H_PRICE_JZ
where PRICE is not null;

select FWYT, count(0)
from T_H_PRICE_JZ
where PRICE is not null
group by FWYT;


select QXDM, count(0)
from T_H_PRICE_JZ
where PRICE is not null
group by QXDM;

select a.COMMUNITY_ID, a.ZRZBDCDYID, b.FWYT, b.PRICE, c.BDCDYID, c.FWYT4
from V_COMMUNITY_GL_ZRZ a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and b.FWYT = '储藏室/阁楼'
         left join T_DATA_TQJG_ZRZ c on a.ZRZBDCDYID = c.BDCDYID and c.FWYT4 = '地下室'
where b.BDCDYID is not null
  and c.BDCDYID is not null
order by a.COMMUNITY_ID;


select a.ZRZBDCDYID, b.FWYT4, c.BDCDYID, c.FWYT, c.PRICE
from V_COMMUNITY_GL_ZRZ a
         left join T_DATA_TQJG_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and b.FWYT4 = '地下室'
         left join T_PRICE_ZRZ c on b.BDCDYID = c.BDCDYID-- and c.FWYT = '储藏室/阁楼'
where a.ZRZBDCDYID in (select BDCDYID
                       from T_PRICE_ZRZ
                       where FWYT = '储藏室/阁楼')
  and b.BDCDYID is not null
order by a.ZRZBDCDYID;


select BDCDYID
from T_PRICE_ZRZ
where FWYT = '储藏室/阁楼';

select a.COMMUNITY_ID, a.ZRZBDCDYID, b.FWYT4, c.PRICE, c.BDCDYID, b.BDCDYID
from V_COMMUNITY_GL_ZRZ a
         left join T_DATA_TQJG_ZRZ b on a.ZRZBDCDYID = b.BDCDYID
         left join T_PRICE_ZRZ c on b.BDCDYID = c.BDCDYID and b.FWYT4 = c.FWYT
where b.FWYT4 in ('地下室', '储藏室/阁楼')
order by a.COMMUNITY_ID,a.ZRZBDCDYID;

select *
from T_PRICE_ZRZ
where BDCDYID = '130832';