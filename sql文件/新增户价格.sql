insert into T_H_PRICE_JZ (ID, BDCDYID, BDCDYH, ZRZBDCDYID, ZDBDCDYID, QXDM, ZL, FWYT, PRICE, PRICE_TOTAL, JZMJ, SZC,
                          ZCS, CREATEUSER, CREATETIME, FWYT3, FWBM)
select sys_guid(),
       BDCDYID,
       BDCDYH,
       ZRZBDCDYID,
       ZDBDCDYID,
       QXDM,
       ZL,
       FWYT3,
       round((153000 /1.05)/SCJZMJ,2),
       153000 /1.05,
       SCJZMJ,
       SZC,
       ZCS,
       'zhangbin',
       sysdate,
       FWYT3,
       FWBM
from T_BASE_H_XZ
where BDCDYH = '370126001019GB00004F00040009';

select *
from T_H_PRICE_JZ where zl = '槐荫区绿地香榭新里广场33号楼111';
select SCJZMJ
from T_BASE_H_XZ where zl = '槐荫区绿地香榭新里广场33号楼111';

update T_H_PRICE_JZ
set PRICE_TOTAL = 11500* jzmj,price =11500
where zl = '槐荫区绿地香榭新里广场33号楼111';

select *
from T_DATA_WSXX where SMX is null ;

select *
from T_H_PRICE_JZ where ZL = '槐荫区绿地香榭新里广场33号楼111';

