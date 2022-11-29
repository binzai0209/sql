select BDCDYID, BDCDYH, FWBM, zl, FWYT4, FWYT3, SCJZMJ
from T_BASE_H_XZ
where BDCDYH = '370125002900GB00019F10100057';

select BDCDYID,
       BDCDYH,
       FWBM,
       zl,
       FWYT4,
       FWYT3,
       SCJZMJ,
       FWYT2,
       FWYT1
from T_BASE_H_XZ
where FWBM = '20080717000641';

select BDCDYID, BDCDYH, FWBM, zl, FWYT4, FWYT3, SCJZMJ
from T_BASE_H_XZ
where zl = '历城区北园大街9号荣盛时代国际广场5号楼、6号楼、7号楼、8号楼5-1211';


select *
from T_BASE_H_XZ;
select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '幢未落地-414022';
update T_H_PRICE_JZ
set QXDM = '370102'
where PRICE is not null
  and QXDM is null;

select count(0)
from T_H_PRICE_JZ
where PRICE is null
  and FWYT = '住宅';
select *
from T_YW_PRICE_FEEDBACK
where zl = '历下区文化东路78号万豪中心6号楼506';

select FWYT4, FWYT3
from T_BASE_H_XZ
where ZRZBDCDYID = '680960'
  and FWYT3 = '居住配套用房';

update T_H_PRICE_JZ
set FWYT = '住宅'
where ZRZBDCDYID = '680960'
  and FWYT3 = '居住式公寓';

select *
from T_H_PRICE_JZ
where ZRZBDCDYID = '680960';
select *
from (select ZRZBDCDYID, FWYT4, FWYT3, row_number() over (partition by ZRZBDCDYID,FWYT3,SCJZMJ order by SCJZMJ) r
      from T_BASE_H_XZ)
where r = 1;


select distinct FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID = '1268782';

-- 历下区龙泽路1号西江华府五区   36-40  按5600   40-47 按5040
update T_H_PRICE_JZ
set PRICE       = 5333.33,
    PRICE_TOTAL = JZMJ * 5333.33,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ          = '历下区龙泽路1号西江华府五区：车位面积32-34       按5600市场价  5333.33（不含税）        面积40-47     按5040 市场价       4800（不含税）'
where FWYT = '车位/车库'
  and ZRZBDCDYID in (select BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZL like '历下区龙泽路1号西江华府五区%')
  and JZMJ >= 36
  and jzmj <= 40;


update T_H_PRICE_JZ
set PRICE       = 4800,
    PRICE_TOTAL = JZMJ * 4800,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ          = '历下区龙泽路1号西江华府五区：车位面积32-34       按5600市场价  5333.33（不含税）        面积40-47     按5040 市场价       4800（不含税）'
where FWYT = '车位/车库'
  and ZRZBDCDYID in (select BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZL like '历下区龙泽路1号西江华府五区%')
  and JZMJ >= 40
  and jzmj <= 47;

-- 历下区龙泽路1号西江华府四区   32       按5600
update T_H_PRICE_JZ
set PRICE       = 5333.33,
    PRICE_TOTAL = JZMJ * 5333.33,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ          = '历下区龙泽路1号西江华府四区：车位面积32 按5600市场价  5333.33（不含税）'
where FWYT = '车位/车库'
  and ZRZBDCDYID in (select BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZL like '历下区龙泽路1号西江华府四区%')
  and JZMJ = 32.6;

-- 历下区龙泽路1号西江华府六区   34-41  按5600
update T_H_PRICE_JZ
set PRICE       = 5333.33,
    PRICE_TOTAL = JZMJ * 5333.33,
    UPDATEUSER='zhangbin',
    UPDATETIME=sysdate,
    BZ          = '历下区龙泽路1号西江华府六区：车位面积34-41       按5600市场价  5333.33（不含税）'
where FWYT = '车位/车库'
  and ZRZBDCDYID in (select BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZL like '历下区龙泽路1号西江华府六区%')
  and JZMJ >= 34
  and jzmj <= 41;

select a.bdcdyid,
       a.zrzbdcdyid,
       a.zdbdcdyid,
       a.fwyt4                                              fwyt,
       a.fwyt3,
       a.zl,
       decode(a.QSC, '', null, null, null, a.QSC) as        qsc,
       decode(a.SZC, '', null, null, null, a.SZC) as        szc,
       decode(a.ZCS, '', null, null, null, a.ZCS) as        zcs,
       a.scjzmj                                             jzmj,
       a.qxdm,
       decode(e.cx, '', decode(f.cx, '', '', null, '', f.CX), null, decode(f.cx, '', '', null, '', f.CX),
              e.cx)                               as        CX,
       decode(e.YWDT, '', decode(f.YWDT, '', '', null, '', f.YWDT), null,
              decode(f.YWDT, '', '', null, '', f.YWDT),
              e.YWDT)                             as        YWDT,
       decode(e.CG, '', decode(f.CG, '', 0, null, 0, f.CG), null, decode(f.CG, '', 0, null, 0, f.CG),
              e.CG)                               as        CG,
       decode(e.ZXQK, '', decode(f.ZXQK, '', '', null, '', f.ZXQK), null,
              decode(f.ZXQK, '', '', null, '', f.ZXQK),
              e.ZXQK)                             as        ZXQK,
       b.JZJG,
       decode(d.JCND, '',
              decode(e.JCND, '',
                     decode(f.JCND, '',
                            decode(b.JGRQ, null,
                                   decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), null,
                            decode(b.JGRQ, null,
                                   decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), f.JCND), null,
                     decode(f.JCND, '',
                            decode(b.JGRQ, null, decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), null,
                            decode(b.JGRQ, null, decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), f.JCND), e.JCND), null,
              decode(e.JCND, '',
                     decode(f.JCND, '',
                            decode(b.JGRQ, null,
                                   decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), null,
                            decode(b.JGRQ, null,
                                   decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), f.JCND), null,
                     decode(f.JCND, '',
                            decode(b.JGRQ, null, decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), null,
                            decode(b.JGRQ, null, decode(a.JGSJ, null, null, to_char(a.JGSJ, 'yyyy')),
                                   to_char(b.JGRQ, 'yyyy')), f.JCND), e.JCND), '暂无竣工时间', null, '暂无信息',
              null, '在建', null, '暂无', null,
              d.JCND)                             as        JCND,
       d.BUSS_ID                                            BUSINESS_ID,
       decode(g.NAME, '', '无商圈', null, '无商圈', g.NAME) BUSINESS_NAME
        ,
       d.COMMUNITY,
       d.ID                                                 COMMUNITY_ID
from T_BASE_H_XZ a
         left join T_BASE_ZRZ_XZ b on a.ZRZBDCDYID = b.BDCDYID
         left join V_COMMUNITY_GL_ZRZ c on a.ZRZBDCDYID = c.ZRZBDCDYID
         left join T_BASE_COMMUNITY d on c.COMMUNITY_ID = d.ID
         left join T_PG_XXBC e on a.BDCDYH = e.BDCDYH
         left join T_YW_XXBC f on a.BDCDYH = f.BDCDYH
         left join TX_BUSINESS_ZONE g on d.BUSS_ID = g.ID
where a.BDCDYID in (select BDCDYID
                    from T_BASE_H_XZ
                    where ZRZBDCDYID in (select bdcdyid
                                         from (select zrz.BDCDYID,
                                                      zrz.ZL,
                                                      zrz.ZHS,
                                                      zrz.TQZH,
                                                      zrz.SCJZMJ,
                                                      zrz.ZCS,
                                                      zrz.ZTS,
                                                      zrz.DSCS,
                                                      zrz.DXCS,
                                                      decode(zrz.JGRQ, '', decode(b.JCND, '', '', null, '', JCND), null,
                                                             decode(b.JCND, '', '', null, '', JCND),
                                                             to_char(zrz.JGRQ, 'yyyy-mm-dd')) AS JCND,
                                                      c.FWYT4                                    fwyt
                                               from T_BASE_ZRZ_XZ zrz
                                                        left join T_COMMTY_GL_ZD z on zrz.ZDBDCDYID = z.ZD_ID
                                                        left join T_BASE_COMMUNITY b on z.COMMUNITY_ID = b.ID
                                                        left join (select *
                                                                   from (select bdcdyid,
                                                                                fwyt4,
                                                                                row_number() over (partition by BDCDYID,FWYT4 order by BDCDYID) r
                                                                         from T_DATA_TQJG_ZRZ)
                                                                   where r = 1) c on zrz.BDCDYID = c.BDCDYID
                                               where zrz.ZL like '历城区凤鸣路4962号济南万达文化体育旅游城文化旅游服务设施及衍生设施建设项目%'
                                                 and FWYT4 is null)));

select distinct ZRZBDCDYID
from T_BASE_H_XZ
where ZRZBDCDYID in (select bdcdyid
                     from (select zrz.BDCDYID,
                                  zrz.ZL,
                                  zrz.ZHS,
                                  zrz.TQZH,
                                  zrz.SCJZMJ,
                                  zrz.ZCS,
                                  zrz.ZTS,
                                  zrz.DSCS,
                                  zrz.DXCS,
                                  decode(zrz.JGRQ, '', decode(b.JCND, '', '', null, '', JCND), null,
                                         decode(b.JCND, '', '', null, '', JCND),
                                         to_char(zrz.JGRQ, 'yyyy-mm-dd')) AS JCND,
                                  c.FWYT4                                    fwyt
                           from T_BASE_ZRZ_XZ zrz
                                    left join T_COMMTY_GL_ZD z on zrz.ZDBDCDYID = z.ZD_ID
                                    left join T_BASE_COMMUNITY b on z.COMMUNITY_ID = b.ID
                                    left join (select *
                                               from (select bdcdyid,
                                                            fwyt4,
                                                            row_number() over (partition by BDCDYID,FWYT4 order by BDCDYID) r
                                                     from T_DATA_TQJG_ZRZ)
                                               where r = 1) c on zrz.BDCDYID = c.BDCDYID
                           where zrz.ZL like '历城区凤鸣路4962号济南万达文化体育旅游城文化旅游服务设施及衍生设施建设项目%'
                             and FWYT4 is null));
select zrz.BDCDYID,
       zrz.ZL,
       zrz.ZHS,
       zrz.TQZH,
       zrz.SCJZMJ,
       zrz.ZCS,
       zrz.ZTS,
       zrz.DSCS,
       zrz.DXCS,
       decode(zrz.JGRQ, '', decode(b.JCND, '', '', null, '', JCND), null, decode(b.JCND, '', '', null, '', JCND),
              to_char(zrz.JGRQ, 'yyyy-mm-dd')) AS JCND,
       c.FWYT4                                    fwyt,
       decode(d.ID, '', '0', null, '0', '1')      status
from T_BASE_ZRZ_XZ zrz
         left join T_COMMTY_GL_ZD z on zrz.ZDBDCDYID = z.ZD_ID
         left join T_BASE_COMMUNITY b on z.COMMUNITY_ID = b.ID
         left join (select *
                    from (select bdcdyid, fwyt4, row_number() over (partition by BDCDYID,FWYT4 order by BDCDYID) r
                          from T_DATA_TQJG_ZRZ)
                    where r = 1) c on zrz.BDCDYID = c.BDCDYID
         left join (select *
                    from (select id,
                                 ZRZBDCDYID,
                                 FWYT,
                                 row_number() over (partition by ZRZBDCDYID,FWYT order by ZRZBDCDYID) r
                          from T_BEV_TASK_SCOPE
                          where TASK_ID = '413725910337468364')
                    where r = 1) d on zrz.BDCDYID = d.ZRZBDCDYID  and d.FWYT = c.FWYT4
where  FWYT4 is not null
  and zrz.ZL like '%鲁商国奥城%';



select BDCDYID, ZDBDCDYID, ZL, ZCS, SCJZMJ jzmj, QXDM, fwyt
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select TASK_ID,
                                 zrzbdcdyid,
                                 fwyt,
                                 row_number() over (partition by ZRZBDCDYID,FWYT,TASK_ID order by ZRZBDCDYID) r
                          from T_BEV_TASK_SCOPE
                          where TASK_ID = '413725910337468364')
                    where r = 1) b on a.BDCDYID = b.ZRZBDCDYID
where b.ZRZBDCDYID is not null
  and TASK_ID = '413725910337468364'
order by qxdm, zl;

select distinct ZRZBDCDYID
from T_BEV_TASK_SCOPE
where TASK_ID = '413725910337468364';

select *
from T_BEV_TASK;

select a.BDCDYID, a.ZDBDCDYID, a.ZL, b.FWYT4 FWYT, a.ZCS, SCJZMJ jzmj, a.QXDM
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select bdcdyid, fwyt4, row_number() over (partition by BDCDYID,FWYT4 order by BDCDYID) r
                          from T_DATA_TQJG_ZRZ)
                    where r = 1) b on a.BDCDYID = b.BDCDYID
         left join V_COMMUNITY_GL_ZRZ c on a.BDCDYID = c.ZRZBDCDYID
where 1 = 1
  and a.zl like '%历城区凤鸣路4962号济南万达文化体育旅游城文化旅游服务设施及衍生设施建设项目%'
order by a.qxdm, a.zl;

select BDCDYID, FWYT4, count(0)
from ((select *
       from (select bdcdyid, fwyt4, row_number() over (partition by BDCDYID,FWYT4 order by BDCDYID) r
             from T_DATA_TQJG_ZRZ)
       where r = 1))
group by BDCDYID, FWYT4
having count(0) > 1;