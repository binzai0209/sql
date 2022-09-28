-- 添加计税总价
INSERT INTO TABLEITEM (aa, bb, cc)
select FWBM, FYBH, JSZJ
from (select FWBM, FYBH, sum(JSJE) JSZJ
      from (select *
            from (select FWBM, FYBH, sm, NSRMC, JSJE, row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
                  from T_API_WSXX
                  where nsrlx = '权利人'
                    and sm = '契税')
            where r = 1)
      group by FWBM, FYBH);

-- 更新计税总价
update T_DATA_WSXX a
set JSZJ =(select CC
           from TABLEITEM b
           where b.aa = a.FWBM
             and b.bb = a.FYBH)
where EXISTS(select 1
             from TABLEITEM b
             where b.aa = a.FWBM
               and b.bb = a.FYBH);

-- 添加实纳金额
truncate table TABLEITEM;

insert into TABLEITEM (aa,bb)
select YWH,sum(SNJE)
from T_API_WSXX group by YWH;

-- 更新实纳金额
update T_DATA_WSXX a
set SNJE = (select bb from TABLEITEM b where a.YWH = b.aa)
where EXISTS(select 1 from TABLEITEM b where b.aa = a.YWH);
