-----------------------------------------------------------------------------鲁商国奥城-----------------------------------
-- 2号楼不动
-- 1号楼不动

-- 6号楼  3047.62  839281
update T_H_PRICE_JZ
set PRICE       = 3047.62,
    PRICE_TOTAL = 3047.62 * JZMJ,
    ISONE='1',
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where ZRZBDCDYID = '839281'
  and FWYT = '车位/车库';

-- 3号楼 除子母车位  3047.62 838665
update T_H_PRICE_JZ
set PRICE       = 3047.62,
    PRICE_TOTAL = 3047.62 * JZMJ,
    ISONE='1',
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where ZRZBDCDYID = '838665'
  and FWYT = '车位/车库'
  and FWYT3 <> '子母车位';


-- 4-5号楼  普通车位 tn < 14 3047.62  > 14 155000  1134724
update T_H_PRICE_JZ
set PRICE       = 3047.62,
    PRICE_TOTAL = 3047.62 * JZMJ,
    ISONE='1',
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where BDCDYID in (select BDCDYID
                  from T_BASE_H_XZ
                  where ZRZBDCDYID = '1134724'
                    and FWYT4 = '车位/车库'
                    and SCTNJZMJ < 14);

update T_H_PRICE_JZ
set PRICE       = 155000 / JZMJ,
    PRICE_TOTAL = 155000,
    ISONE='1',
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where BDCDYID in (select BDCDYID
                  from T_BASE_H_XZ
                  where ZRZBDCDYID = '1134724'
                    and FWYT4 = '车位/车库'
                    and SCTNJZMJ > 14);


update T_H_PRICE_JZ
set PRICE       = 2476.1905,
    PRICE_TOTAL = 2476.1905 * JZMJ,
    SCJ         = 2600,
    ISONE='1',
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where ZRZBDCDYID = '838665'
  and FWYT3 = '子母车位';

update T_H_PRICE_JZ
set PRICE       = 5066.67,
    PRICE_TOTAL = 5066.67 * JZMJ,
    SCJ         = 5320,
    ISONE='1',
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where BDCDYID in (select BDCDYID
                  from T_BASE_H_XZ
                  where ZRZBDCDYID = '1134724'
                    and FWYT3 = '普通车位'
                    and SCTNJZMJ > 14);

update T_H_PRICE_JZ
set PRICE_TOTAL = null,
    PRICE=null
where ZRZBDCDYID = '1134724'
  and FWYT3 in ('立体车位', '双层车位');


---------------------------------------------------诚基中心---------------------------------------------------------------------

select *
from T_BASE_ZRZ_XZ
where zl = '历下区诚基中心22号-32号楼';

select FWYT4,SCJZMJ,count(0)
from T_BASE_H_XZ
where ZRZBDCDYID = '1563815' group by FWYT4,SCJZMJ order by FWYT4;

update T_H_PRICE_JZ
set PRICE       = 11428.57,
    PRICE_TOTAL = 11428.57 * JZMJ,
    SCJ         = 12000,
    ISONE='1',
    UPDATEUSER='zhangbin',
    UPDATETIME  = sysdate,
    BZ='1109套内面积修改'
where ZRZBDCDYID = '1563815'
  and FWYT = '公寓';

update T_H_PRICE_JZ
set PRICE_TOTAL = null,
    PRICE=null
where ZRZBDCDYID = '1563815'
  and FWYT = '办公';

update T_H_PRICE_JZ
set PRICE_TOTAL = null,
    PRICE=null
where ZRZBDCDYID = '1563815'
  and FWYT = '商铺';

select *
from T_BASE_H_XZ where BDCDYID = '09b7c438-b9a6-4234-9091-17394cf53997';