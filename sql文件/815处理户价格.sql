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
from T_PRICE_ZRZ
where TO_CHAR(CREATETIME, 'YYYY-MM-DD') = '2022-08-15';

SELECT A.ID
     , A.GROUP_NAME
     , LEVEL                                    "层次"
     , PRIOR A.ID                               "父节点"
     , CONNECT_BY_ROOT A.PARENT_ID              "根节点"
     , DECODE(CONNECT_BY_ISLEAF, 1, A.ID, NULL) "子节点"
     , DECODE(CONNECT_BY_ISLEAF, 1, '是', '否') "是否子节点"
FROM T_BEV_SCOPE_GROUP A
START WITH A.ID in (select id
                    from T_BEV_SCOPE_GROUP b
                    where b.PARENT_ID = '0'
                      and b.TASK_ID = '413677342847285060') --从PARENT为空开始扫描
CONNECT BY PRIOR A.ID = A.PARENT_ID --以CHILD为父列连接PARENT
ORDER SIBLINGS BY ID DESC --对层次排序;