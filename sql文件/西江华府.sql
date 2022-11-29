update T_H_PRICE_JZ
set PRICE      = 5333.33,
    PRICE_TOTAL=5333.33 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5600
where ZL like '历下区龙泽路1号西江华府一区%' and FWYT = '车位/车库' and JZMJ >= 32 and JZMJ < 40;

update T_H_PRICE_JZ
set PRICE      = 4800,
    PRICE_TOTAL=4800 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5040
where ZL like '历下区龙泽路1号西江华府一区%' and FWYT = '车位/车库' and JZMJ > 40 and JZMJ <= 47;

select distinct ZRZBDCDYID
from T_H_PRICE_JZ where ZL like '历下区龙泽路1号西江华府六区%' and FWYT = '车位/车库' and JZMJ >= 34 and JZMJ <= 41;

select *
from T_PRICE_ZRZ where BDCDYID = '1254783';


update T_H_PRICE_JZ
set PRICE      = 5333.33,
    PRICE_TOTAL=5333.33 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5600
where ZL like '历下区龙泽路1号西江华府二区%' and FWYT3='小型车位' and JZMJ = 35.57;

update T_H_PRICE_JZ
set PRICE      = 4276.19,
    PRICE_TOTAL=4276.19 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=4490
where ZL like '历下区龙泽路1号西江华府二区%' and FWYT3='子母车位' and JZMJ = 71.14;


update T_H_PRICE_JZ
set PRICE      = 5333.33,
    PRICE_TOTAL=5333.33 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5600
where ZL like '历下区龙泽路1号西江华府五区%' and FWYT = '车位/车库' and JZMJ >= 36 and JZMJ <= 40;

update T_H_PRICE_JZ
set PRICE      = 4800,
    PRICE_TOTAL=4800 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5040
where ZL like '历下区龙泽路1号西江华府五区%' and FWYT = '车位/车库' and JZMJ >= 40 and JZMJ <= 47;


update T_H_PRICE_JZ
set PRICE      = 5333.33,
    PRICE_TOTAL=5333.33 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5600
where ZL like '历下区龙泽路1号西江华府四区%' and FWYT='车位/车库' and JZMJ = 32.6;



update T_H_PRICE_JZ
set PRICE      = 5333.33,
    PRICE_TOTAL=5333.33 * JZMJ,
    BZ='1031处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5600
where ZL like '历下区龙泽路1号西江华府六区%' and FWYT = '车位/车库' and JZMJ >= 34 and JZMJ <= 41;




update T_H_PRICE_JZ
set PRICE      = 4800,
    PRICE_TOTAL=4800 * JZMJ,
    BZ='111处理价格',
    UPDATETIME=sysdate,
    UPDATEUSER='zhangbin',
    SCJ=5040
where ZL like '历下区龙泽路1号西江华府五区4号车库%' and FWYT='车位/车库' and JZMJ = 39.69;
select *
from T_BASE_H_XZ;