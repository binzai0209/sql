create table T_H_PRICE_JZ_825 parallel 8 as select * from T_H_PRICE_JZ nologging;

create table T_H_PRICE_JZ_ssy parallel 8 as select * from T_H_PRICE_JZ nologging;


create table T_PRICE_ZRZ_BAK_726 parallel 8 as select * from T_PRICE_ZRZ nologging;
create table T_PRICE_ZRZ_BAK_ssy parallel 8 as select * from T_PRICE_ZRZ nologging;
create table T_PRICE_COMMTY_BAK parallel 8 as select * from T_PRICE_COMMTY nologging;

update T_H_PRICE_JZ
set PRICE = null,PRICE_TOTAL = null
where FWYT = '商业';

update T_H_PRICE_JZ
set PRICE = null,PRICE_TOTAL = null
where FWYT = '商铺';

delete
from T_PRICE_ZRZ
where FWYT = '商业';

delete
from T_PRICE_ZRZ
where FWYT = '商铺';




delete
from T_H_PRICE_JZ
where ZRZBDCDYID in (select bdcdyid from T_PRICE_ZRZ where T_PRICE_ZRZ.QXDM = '370104');


select a.BDCDYID,a.PRICE,a.FWYT,a.FWYT3,b.PRICE
from T_H_PRICE_JZ a left join T_H_PRICE_JZ_721 b on a.BDCDYID = b.BDCDYID
where a.PRICE <> b.PRICE;



