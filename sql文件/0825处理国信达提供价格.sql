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
       '0829新增地下室价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
      where v.fwyt = '地下室' /*and v.ZRZBDCDYID='460162'*/
     ) a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where price_jz is null;


select *
from T_PRICE_ZRZ
where BZ = '0829新增地下室价格';

update T_H_PRICE_JZ
set PRICE       = null,
    PRICE_TOTAL = null
where ZRZBDCDYID in (select distinct T_PRICE_ZRZ.BDCDYID
                     from T_PRICE_ZRZ
                     where BZ = '0829新增地下室价格')
  and FWYT = '地下室';


select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

select *
from T_H_PRICE_JZ
where BDCDYID in (select BDCDYID
                  from T_H_PRICE_JZ
                  group by BDCDYID
                  having count(0) > 1)
order by BDCDYID;



select *
from T_H_PRICE_JZ
where ZRZBDCDYID in (select bdcdyid from T_PRICE_ZRZ where BZ = '0829新增地下室价格')
  and FWYT = '地下室';

select distinct ZRZBDCDYID, FWYT
from T_H_PRICE_JZ
where PRICE <> OLD_PRICE;


select *
from T_BASE_H_XZ
where ZRZBDCDYID = '幢未落地-181861';

select *
from T_PRICE_ZRZ
where BDCDYID = '幢未落地-181861';

delete
from T_H_PRICE_JZ
where ZRZBDCDYID = '幢未落地-181861';

select *
from T_BASE_H_XZ
where ZRZBDCDYID = '幢未落地-181861';


select *
from T_H_PRICE_JZ
where JZPC = '202208152105532050922';



select *
from t_data_pgcg_xq3_gxd
where COMMUNITY = '十亩园东街11号';

select *
from T_BASE_H_XZ
where ZRZBDCDYID in (select ZRZBDCDYID
                     from V_COMMUNITY_GL_ZRZ
                     where COMMUNITY = '十亩园东街11号');

select *
from v_community_gl_zrz_xq3_gxd;

select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;

select *
from T_PRICE_ZRZ
where BZ = '0829新增地下室价格';



select *
from T_PRICE_ZRZ;


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
order by a.COMMUNITY_ID, a.ZRZBDCDYID;

select *
from T_PRICE_ZRZ
where BDCDYID = '130832';


create table T_H_PRICE_JZ_829 parallel 8 as
select *
from T_H_PRICE_JZ nologging;


update T_H_PRICE_JZ
set OLD_PRICE = PRICE;

select distinct BDCDYID
from T_PRICE_ZRZ
where BZ = '0829新增地下室价格';

-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

-- 杀掉被锁住的表
ALTER system kill session '228, 22685';


-- 储藏室、阁楼 地下室

select zrzbdcdyid, fwyt, count(0)
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
      where v.fwyt = '储藏室/阁楼'
        and v.QXDM = '370103')
group by zrzbdcdyid, fwyt
having count(0) > 1
order by count(0) desc;


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
       '0830新增地下室价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
      where v.fwyt = '地下室'
        and v.QXDM = '370103') a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where price_jz is null;



select *
from T_PRICE_ZRZ
where BZ = '0830新增地下室价格';

select *
from T_H_PRICE_JZ
where ZRZBDCDYID in (select bdcdyid from T_PRICE_ZRZ where T_PRICE_ZRZ.BZ = '0830新增地下室价格')
  and FWYT = '地下室';
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E7720931252F4E21E053AF5D14AC0B6E', '-12064195', '370103016000GB00148F00040014', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--114', '地下室', 3760.000000, 45345.600000,
        '12.06', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100030', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093125574E21E053AF5D14AC0B6E', '-12064173', '370103016000GB00148F00040002', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--102', '地下室', 3760.000000, 31960.000000,
        '8.5', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100008', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093125954E21E053AF5D14AC0B6E', '-12064174', '370103016000GB00148F00040003', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--103', '地下室', 3760.000000, 52903.200000,
        '14.07', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100009', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093127544E21E053AF5D14AC0B6E', '-12064175', '370103016000GB00148F00040004', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--104', '地下室', 3760.000000, 37788.000000,
        '10.05', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100010', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093127634E21E053AF5D14AC0B6E', '-12064196', '370103016000GB00148F00040013', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--113', '地下室', 3760.000000, 43540.800000,
        '11.58', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100031', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209312AC84E21E053AF5D14AC0B6E', '-12064182', '370103016000GB00148F00040011', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--111', '地下室', 3760.000000, 58054.400000,
        '15.44', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100017', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209312ADA4E21E053AF5D14AC0B6E', '-12064169', '370103016000GB00148F00040015', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--115', '地下室', 3760.000000, 52903.200000,
        '14.07', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100004', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E7720931246E4E21E053AF5D14AC0B6E', '-12064170', '370103016000GB00148F00040016', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--116', '地下室', 3760.000000, 31960.000000,
        '8.5', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100005', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093127E44E21E053AF5D14AC0B6E', '-12064188', '370103016000GB00148F00040048', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--109', '地下室', 3760.000000, 43540.800000,
        '11.58', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100023', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093127F44E21E053AF5D14AC0B6E', '-12064178', '370103016000GB00148F00040007', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--107', '地下室', 3760.000000, 61664.000000,
        '16.4', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100013', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093124B84E21E053AF5D14AC0B6E', '-12064171', '370103016000GB00148F00040017', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--117', '地下室', 3760.000000, 32636.800000,
        '8.68', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100006', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093129FD4E21E053AF5D14AC0B6E', '-12064176', '370103016000GB00148F00040005', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--105', '地下室', 3760.000000, 36284.000000,
        '9.65', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100011', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E7720931286C4E21E053AF5D14AC0B6E', '-12064200', '370103016000GB00148F00040018', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--118', '地下室', 3760.000000, 29027.200000,
        '7.72', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100035', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E7720931286F4E21E053AF5D14AC0B6E', '-12064191', '370103016000GB00148F00040052', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--113', '地下室', 3760.000000, 43540.800000,
        '11.58', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100026', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E7720931251A4E21E053AF5D14AC0B6E', '-12064190', '370103016000GB00148F00040053', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--114', '地下室', 3760.000000, 58054.400000,
        '15.44', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100025', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093128784E21E053AF5D14AC0B6E', '-12064166', '370103016000GB00148F00040051', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--112', '地下室', 3760.000000, 38690.400000,
        '10.29', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100001', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311D564E21E053AF5D14AC0B6E', '-12064185', '370103016000GB00148F00040046', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--107', '地下室', 3760.000000, 70725.600000,
        '18.81', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100020', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093122644E21E053AF5D14AC0B6E', '-12064186', '370103016000GB00148F00040047', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--108', '地下室', 3760.000000, 87044.000000,
        '23.15', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100021', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311F2F4E21E053AF5D14AC0B6E', '-12064177', '370103016000GB00148F00040006', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--106', '地下室', 3760.000000, 44744.000000,
        '11.9', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100012', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093120CA4E21E053AF5D14AC0B6E', '-12064189', '370103016000GB00148F00040049', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--110', '地下室', 3760.000000, 43540.800000,
        '11.58', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100024', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093122874E21E053AF5D14AC0B6E', '-12064184', '370103016000GB00148F00040045', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--106', '地下室', 3760.000000, 54407.200000,
        '14.47', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100019', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311F824E21E053AF5D14AC0B6E', '-12064197', '370103016000GB00148F00040021', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--121', '地下室', 3760.000000, 38088.800000,
        '10.13', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100032', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311FC84E21E053AF5D14AC0B6E', '-12064165', '370103016000GB00148F00040050', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--111', '地下室', 3760.000000, 54407.200000,
        '14.47', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100000', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311FEC4E21E053AF5D14AC0B6E', '-3181940', '370103016000GB00148F00040102', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼', '地下室', 3760.000000, 40908.800000,
        '10.88', null, '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '20080925068275', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093121854E21E053AF5D14AC0B6E', '-12064183', '370103016000GB00148F00040044', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--105', '地下室', 3760.000000, 79787.200000,
        '21.22', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100018', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093121964E21E053AF5D14AC0B6E', '-3181942', '370103016000GB00148F00040104', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼', '地下室', 3760.000000, 51324.000000,
        '13.65', null, '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '20080925340464', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093121974E21E053AF5D14AC0B6E', '-3181920', '370103016000GB00148F00040103', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼', '地下室', 3760.000000, 31433.600000,
        '8.36', null, '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '20080925062796', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E7720931200A4E21E053AF5D14AC0B6E', '-12064179', '370103016000GB00148F00040008', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--108', '地下室', 3760.000000, 54407.200000,
        '14.47', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100014', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311E644E21E053AF5D14AC0B6E', '-12064168', '370103016000GB00148F00040041', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--102', '地下室', 3760.000000, 31734.400000,
        '8.44', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100003', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093120134E21E053AF5D14AC0B6E', '-12064193', '370103016000GB00148F00040012', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--112', '地下室', 3760.000000, 43540.800000,
        '11.58', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100028', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093123624E21E053AF5D14AC0B6E', '-12064172', '370103016000GB00148F00040001', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--101', '地下室', 3760.000000, 32636.800000,
        '8.68', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100007', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311CD74E21E053AF5D14AC0B6E', '-12064198', '370103016000GB00148F00040020', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--120', '地下室', 3760.000000, 24778.400000,
        '6.59', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100033', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093121DD4E21E053AF5D14AC0B6E', '-12064167', '370103016000GB00148F00040040', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--101', '地下室', 3760.000000, 38690.400000,
        '10.29', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100002', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311CFF4E21E053AF5D14AC0B6E', '-12064199', '370103016000GB00148F00040019', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--119', '地下室', 3760.000000, 29027.200000,
        '7.72', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100034', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311EA44E21E053AF5D14AC0B6E', '-12064192', '370103016000GB00148F00040043', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼2--104', '地下室', 3760.000000, 39893.600000,
        '10.61', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100027', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093122004E21E053AF5D14AC0B6E', '-3181946', '370103016000GB00148F00040107', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼', '地下室', 3760.000000, 80689.600000,
        '21.46', null, '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '20080925615787', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E77209311D0F4E21E053AF5D14AC0B6E', '-12064180', '370103016000GB00148F00040009', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--109', '地下室', 3760.000000, 47150.400000,
        '12.54', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100015', null, null, null, '830新增税务价格');
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME, OLD_PRICE,
                               BZ)
VALUES ('E772093120744E21E053AF5D14AC0B6E', '-12064181', '370103016000GB00148F00040010', '幢未落地-73381',
        '053afd93eedb4bb1a9e84e2f134d9cce', '370103', '市中区玉函东区15号楼1--110', '地下室', 3760.000000, 50797.600000,
        '13.51', '-1', '7', 'zhangbin', TO_DATE('2022-08-30 16:20:50', 'YYYY-MM-DD HH24:MI:SS'), null, '地下室',
        '2014041000051044100016', null, null, null, '830新增税务价格');



create table T_H_PRICE_JZ_0909 parallel 8 as
select *
from T_H_PRICE_JZ nologging;

create table T_PRICE_ZRZ_0909 parallel 8 as
select *
from T_PRICE_ZRZ nologging;

select BDCDYID, FWYT
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;

select *
from T_PRICE_ZRZ
where BDCDYID = 'LWSXCQ_Z15908';

select BDCDYID
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

select *
from T_H_PRICE_JZ
where PRICE is not null
  and PRICE <> OLD_PRICE;

update T_H_PRICE_JZ
set OLD_PRICE = PRICE
where PRICE is not null
  and PRICE <> OLD_PRICE;

select distinct bz
from T_PRICE_ZRZ;

select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;



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
       '0909新增国信达价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
           --where v.fwyt = '车位/车库'
      where v.BZ = '9.9日上午入库（四县+莱芜/钢城）') a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where price_jz is null;



select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;



select a.BDCDYID,
       a.FWYT,
       b.BDCDYID,
       b.ZRZBDCDYID,
       b.FWYT,
       b.FWYT3,
       a.PRICE,
       b.PRICE
from T_PRICE_ZRZ a
         left join T_H_PRICE_JZ b on a.BDCDYID = b.ZRZBDCDYID and a.FWYT = b.FWYT
where b.PRICE is not null
  and a.PRICE = b.PRICE
  and a.BZ = '0902新增国信达价格';

select BDCDYID
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;


select *
from T_H_PRICE_JZ
where PRICE is not null
  and PRICE <> OLD_PRICE;



select BDCDYID
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

select *
from T_H_PRICE_JZ
where PRICE is not null
  and PRICE <> OLD_PRICE;

insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz);
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
       '0909新增国信达价格'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
         --where v.BZ = '9.9日上午入库（四县+莱芜/钢城）'
         --where v.fwyt = '储藏室/阁楼' /*and v.ZRZBDCDYID='460162'*/
     )
where price_jz is null;

select *
from v_community_gl_zrz_xq3_gxd
where ZRZBDCDYID = 'LWSXCQ_Z15908';

select *
from v_community_gl_zrz_ccs
where ZRZBDCDYID = 'LWSXCQ_Z15908';

select *
from v_community_gl_zrz
where ZRZBDCDYID = 'LWSXCQ_Z15908';

select *
from v_tj_zrz_fwyt
where ZRZBDCDYID = 'LWSXCQ_Z15908';


select COMMUNITY_ID, count(0)
from t_data_pgcg_xq3_gxd
where BZ = '9.9日上午入库（四县+莱芜/钢城）'
group by COMMUNITY_ID
having count(0) > 1;



select *
from T_DATA_PGCG_XQ3_GXD
where COMMUNITY_ID = '450017709678170811';

select ZRZBDCDYID, FWYT, count(0)
from (select sys_guid(),
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
             '0906新增国信达价格',
             BZ
      from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
            from v_community_gl_zrz_xq3_gxd v
                     left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt --and (pz.fwyt='储藏室/阁楼' or pz.fwyt='地下室')
                 --where v.fwyt = '储藏室/阁楼' /*and v.ZRZBDCDYID='460162'*/
            where v.BZ = '9.9日上午入库（四县+莱芜/钢城）')
      where price_jz is null)
group by ZRZBDCDYID, FWYT
having count(0) > 1;


select *
from T_PRICE_ZRZ where DATA_SOURCE is null ;

update T_PRICE_ZRZ
set DATA_SOURCE = '4'
where JGLY = '4:国信达提供' and DATA_SOURCE is null ;

select count(0) from T_PRICE_ZRZ;