insert into T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ, SZC,
                          ZCS, CREATEUSER, CREATETIME, FWYT3, FWBM)
select sys_guid(),
       BDCDYID,
       BDCDYH,
       ZRZBDCDYID,
       ZDBDCDYID,
       QXDM,
       ZL,
       FWYT4,
       11500,
       11500 * SCJZMJ,
       SCJZMJ,
       SZC,
       ZCS,
       'zhangbin',
       sysdate,
       FWYT3,
       FWBM
from T_BASE_H_XZ
where zl = '�������̵��������㳡10��¥104';

select *
from T_H_PRICE_JZ where zl = '�������̵��������㳡33��¥111';
select SCJZMJ
from T_BASE_H_XZ where zl = '�������̵��������㳡33��¥111';

update T_H_PRICE_JZ
set PRICE_TOTAL = 11500* jzmj,price =11500
where zl = '�������̵��������㳡33��¥111';

select *
from T_DATA_WSXX where SMX is null ;

select *
from T_H_PRICE_JZ where ZL = '�������̵��������㳡33��¥111';

