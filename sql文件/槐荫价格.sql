SELECT REQ_TIME, REQ_PARAMS, RESULT_INFO, substr(RESULT_INFO, 18, 28) bdcdyh, substr(RESULT_INFO, 55, 9) price
FROM T_API_RECORD
WHERE TO_CHAR(REQ_TIME, 'YYYY-MM-DD') = TO_CHAR(sysdate, 'YYYY-MM-DD')
  and API_NAME = '/api/Open/queryPGPrice'
  and RESULT_INFO is not null
  and substr(RESULT_INFO, 18, 28) like '370104%'
order by REQ_TIME desc;

select *
from T_API_RECORD
where API_NAME = '/api/Open/queryPGPrice'
order by REQ_TIME desc;

select distinct PRICE
from T_H_PRICE_JZ
where ZRZBDCDYID = '860826'
  and FWYT = '办公';

select a.BDCDYID, a.FWYT, a.PRICE, b.BDCDYID, b.FWYT, b.PRICE
from T_PRICE_ZRZ_BACK_220619 a
         left join T_PRICE_ZRZ_BACK_220622 b on a.BDCDYID = b.BDCDYID and a.FWYT = b.FWYT
where a.QXDM = '370102'
  and a.PRICE <> b.PRICE;
select b.REQ_TIME,
       a.BDCDYH,
       a.FWBM,
       a.ZL,
       a.FWYT,
       a.JZMJ,
       a.PRICE,
       a.PRICE_TOTAL,
       b.bdcdyh,
       b.price
from T_H_PRICE_JZ a
         left join (SELECT REQ_TIME,
                           REQ_PARAMS,
                           RESULT_INFO,
                           substr(RESULT_INFO, 18, 28) bdcdyh,
                           substr(RESULT_INFO, 55, 9)  price
                    FROM T_API_RECORD
                    WHERE TO_CHAR(REQ_TIME, 'YYYY-MM-DD') = TO_CHAR(sysdate, 'YYYY-MM-DD')
                      and API_NAME = '/api/Open/queryPGPrice'
                      and RESULT_INFO is not null
                      and RESULT_INFO like '%370104%') b on a.BDCDYH = b.bdcdyh
where b.bdcdyh is not null
  and a.FWYT <> '住宅'
order by b.REQ_TIME desc, a.BDCDYH;

select *
from T_API_RECORD
WHERE TO_CHAR(REQ_TIME, 'YYYY-MM-DD') = TO_CHAR(sysdate, 'YYYY-MM-DD')
order by REQ_TIME;

