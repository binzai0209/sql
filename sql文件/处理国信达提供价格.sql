-- ������
create table T_H_PRICE_JZ_0921 parallel 8 as
select *
from T_H_PRICE_JZ nologging;

-- ��Ȼ������
create table T_PRICE_ZRZ_0909 parallel 8 as
select *
from T_PRICE_ZRZ nologging;

-- �ж��ظ�
select BDCDYID
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

-- ����ԭʼ�۸�
update T_H_PRICE_JZ
set OLD_PRICE = PRICE
where PRICE is not null
  and PRICE <> OLD_PRICE;

-- �������Ŵ�����
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, bz);
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
       '0921�������Ŵ�۸�'
from (select v.*, pz.price price_jz, pz.fwyt fwyt_jz, pz.data_source
      from v_community_gl_zrz_xq3_gxd v
               left join t_price_zrz pz on v.ZRZBDCDYID = pz.bdcdyid and v.fwyt = pz.fwyt
         --where v.fwyt = '��λ/����'
         where v.BZ = '9.21���ߡ��ֳǷ�סլС���۸񲹳�'
     ) a
         left join T_PRICE_ZRZ b on a.ZRZBDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where price_jz is null;


-- ������סլ�۸�
insert into T_PRICE_ZRZ (id, bdcdyid, zdbdcdyid, community_id, price, fwyt, createtime, createuser, data_source, zl,
                         qxdm, QXMC, ZCS, bz)
select sys_guid(),
       b.BDCDYID,
       b.ZDBDCDYID,
       a.COMMUNITY_ID,
       a.JG_ZZ,
       'סլ',
       sysdate,
       'zhangbin',
       '4',
       b.ZL,
       b.QXDM,
       b.QXMC,
       b.ZCS,
       '0919�������Ŵ�סլ�۸�'
from (select a.COMMUNITY_ID,
             b.ZRZBDCDYID,
             a.JG_ZZ,
             row_number() over (partition by a.COMMUNITY_ID,b.ZRZBDCDYID,a.JG_ZZ order by a.JG_ZZ) r
      from T_DATA_PGCG_XQ_ZZ_GXD a
               left join V_COMMUNITY_GL_ZRZ_ZZ b on a.COMMUNITY_ID = b.COMMUNITY_ID
               left join T_PRICE_ZRZ c on b.ZRZBDCDYID = c.BDCDYID and c.FWYT = 'סլ'
      where b.COMMUNITY_ID is not null
        and c.PRICE is null AND A.BZ = '9.19סլ�������') a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
where a.r = 1;

-- �ж���ӵĴ��۸��Ƿ��ظ�
select BDCDYID, FWYT, count(0)
from T_PRICE_ZRZ
group by BDCDYID, FWYT
having count(0) > 1;

-- ����۸�� �ж��Ƿ����ظ�������
select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;

-- �ж��Ƿ�������м۸�
select *
from T_H_PRICE_JZ
where PRICE is not null
  and PRICE <> OLD_PRICE;





