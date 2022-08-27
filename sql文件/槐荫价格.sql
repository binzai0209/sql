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

select *
from T_H_PRICE_JZ
where ZL = '槐荫区党杨路3166号绿地国际花都四区地下车库2--1595';
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME)
VALUES ('5c171683927346939cfb5c1a6a6aa932', '14222887', '370104999999GB00373F10021908', '845233',
        'd30a847b-5e66-4763-9007-113caa92d5be', '370104', '槐荫区党杨路3166号绿地国际花都四区地下车库2--1595',
        '车位/车库', 3763.000000, 105777.930000, '28.11', '-1', '1', 'pool-5-thread-1',
        TO_DATE('2022-07-30', 'YYYY-MM-DD HH24:MI:SS'), '202207301735395350302', '车位', '2011122200032870101911', null,
        null);


select *
from T_H_PRICE_JZ
where ZL = '槐荫区阳光新路21号阳光100国际新城5号车库5-64（-）';
INSERT INTO JNPG.T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ,
                               SZC, ZCS, CREATEUSER, CREATETIME, JZPC, FWYT3, FWBM, UPDATEUSER, UPDATETIME)
VALUES ('291eca7100a2453ea279b55c6837b6e5', '-2932780', '370104001008GB01032F10900001', '648263',
        'dce9329a-775c-4e30-9722-5b471f22adbf', '370104', '槐荫区阳光新路21号阳光100国际新城5号车库', '车位/车库',
        5188.520000, 14626697.300000, '2819.05', '0', '2', 'pool-4-thread-38',
        TO_DATE('2022-07-23', 'YYYY-MM-DD HH24:MI:SS'), '202207232228143750642', '车库', '20080925632276', null, null);


