create table T_H_PRICE_JZ_0815 parallel 8 as
select *
from T_H_PRICE_JZ nologging;

select a.BDCDYID, a.PRICE, a.FWYT, b.BDCDYID, b.FWYT, b.PRICE
from T_H_PRICE_JZ a
         left join T_H_PRICE_JZ_0815 b on a.BDCDYID = b.BDCDYID
where b.BDCDYID is null
  and a.PRICE is not null
order by a.BDCDYID;

select BDCDYID, count(0)
from T_H_PRICE_JZ
group by BDCDYID
having count(0) > 1;


select *
from T_H_PRICE_JZ_0815
where BDCDYID = '11211251';

select *
from T_H_PRICE_JZ
where BDCDYID = '11211251';

select *
from T_PRICE_ZRZ
where BDCDYID = '831343';

select *
from T_PRICE_ZRZ
where BDCDYID = '434387';


select distinct ZRZBDCDYID
from T_BASE_H_XZ
where BDCDYID in (select a.BDCDYID
                  from T_H_PRICE_JZ a
                           left join T_H_PRICE_JZ_0815 b on a.BDCDYID = b.BDCDYID
                  where b.BDCDYID is null
                    and a.PRICE is not null);

select distinct BDCDYID
from T_PRICE_ZRZ where TO_CHAR(CREATETIME, 'YYYY-MM-DD') = '2022-08-15';
