select *
from T_DATA_WSXX;

truncate table T_DATA_WSXX;
-- ����ȫ������
insert into T_DATA_WSXX (id, bdcdyid, zrzbdcdyid, qxdm, ywh, fwbm, FYBH, zl, fwyt, fwyt3, scjzmj, jyzj, jydj,
                         price_total, price, ywlx, create_time)
select sys_guid(),
       bdcdyid,
       zrzbdcdyid,
       qxdm,
       ywh,
       fwbm,
       fybh,
       zl,
       fwyt,
       fwyt3,
       scjzmj,
       jyzj,
       jydj,
       price_total,
       price,
       ywlx,
       create_time
from (select BDCDYID,
             ZRZBDCDYID,
             ZL,
             FWBM,
             YWH,
             FYBH,
             QXDM,
             FWYT,
             FWYT3,
             SCJZMJ,
             jyzj,
             round(jydj, 2) jydj,
             PRICE_TOTAL,
             PRICE,
             YWLX,
             create_time
      from (select to_char(c.create_time, 'yyyy-MM-dd') create_time,
                   hb.BDCDYID,
                   hb.ZRZBDCDYID,
                   hb.zl,
                   c.FWBM,
                   c.FYBH,
                   c.YWH,
                   hb.QXDM,
                   hb.fwyt3,
                   hb.fwyt4                             fwyt,
                   hb.scjzmj,
                   c.JYJG                               jyzj,
                   (c.JYJG / hb.scjzmj)                 jydj,
                   JG.PRICE_TOTAL,
                   JG.PRICE,
                   c.YWLX
            from JNPG.T_API_WSXX C
                     left join jnpg.t_base_h_xz hb ON HB.FWBM = c.FWBM
                     left join JNPG.T_H_PRICE_JZ JG ON JG.FWBM = C.FWBM
            WHERE c.sm = '��˰'
              and c.fwbm is not null
              and hb.SCJZMJ is not null
              and SCJZMJ <> 0
              and JYJG is not null
              and JSJE is not null
            group by hb.BDCDYID,
                     hb.ZRZBDCDYID, hb.zl, c.fwbm, hb.fwyt3, hb.scjzmj, JG.PRICE_TOTAL, c.YWLX, c.YWH, hb.QXDM, c.FYBH,
                     JG.PRICE, hb.fwyt4,
                     c.JYJG,
                     to_char(c.create_time, 'yyyy-MM-dd')
            order by to_char(c.create_time, 'yyyy-MM-dd') desc) a);

select *
from T_DATA_WSXX
where JSZJ is not null;

truncate table TABLEITEM;
-- �����˰����
INSERT INTO TABLEITEM (aa, bb, cc)
select FWBM, FYBH, JSZJ
from (select FWBM, FYBH, sum(JSJE) JSZJ
      from (select *
            from (select FWBM, FYBH, sm, NSRMC, JSJE, row_number() over (partition by FWBM,FYBH,NSRMC order by FWBM) r
                  from T_API_WSXX
                  where nsrlx = 'Ȩ����'
                    and sm = '��˰')
            where r = 1)
      group by FWBM, FYBH);

select *
from T_DATA_WSXX;


select *
from T_DATA_WSXX
where JSZJ is not null;

-- ���¼�˰����
update T_DATA_WSXX a
set JSZJ =(select CC
           from TABLEITEM b
           where b.aa = a.FWBM
             and b.bb = a.FYBH)
where EXISTS(select 1
             from TABLEITEM b
             where b.aa = a.FWBM
               and b.bb = a.FYBH);

-- ���¼�˰�ܼ�
update T_DATA_WSXX
set JSDJ = round(JSZJ / SCJZMJ, 2)
where JSZJ is not null;



select *
from T_DATA_WSXX;

truncate table TABLEITEM;
-- ����ʵ�ɽ��
insert into TABLEITEM (aa, bb)
select YWH, sum(SNJE)
from T_API_WSXX
group by YWH;

-- ����ʵ�ɽ��
update T_DATA_WSXX a
set SNJE = (select bb from TABLEITEM b where a.YWH = b.aa)
where EXISTS(select 1 from TABLEITEM b where b.aa = a.YWH);

select *
from T_DATA_WSXX;


truncate table TABLEITEM;

-- ��������
insert into TABLEITEM (aa, bb, cc)
select BDCDYID, SMX, SMY
from (select BDCDYID, SMX, SMY, row_number() over (partition by BDCDYID order by BDCDYID) r
      from TX_ZRZ_XZ_P)
where r = 1;

-- ���´�����
update T_DATA_WSXX a
set (smx, smy) = (select bb, cc
                  from TABLEITEM b
                  where b.aa = a.ZRZBDCDYID)
where EXISTS(select 1
             from TABLEITEM b
             where b.aa = a.ZRZBDCDYID);


truncate table TABLEITEM;

-- ����¥����Ȼ����ϵ
insert into TABLEITEM (aa, bb)
select COMMUNITY_ID, ZRZBDCDYID
from V_COMMUNITY_GL_ZRZ;

-- ���¹�ϵ
update T_DATA_WSXX a
set COMMUNITY_ID = (select aa
                    from TABLEITEM b
                    where b.bb = a.ZRZBDCDYID)
where EXISTS(select 1
             from TABLEITEM b
             where b.bb = a.ZRZBDCDYID);


select *
from T_DATA_WSXX;


update T_DATA_WSXX a
set (COM_SMX, COM_SMY) = (select b.SMX, b.SMY
                          from TX_COMMUNITY b
                          where b.id = a.COMMUNITY_ID)
where EXISTS(select 1
             from TX_COMMUNITY b
             where b.id = a.COMMUNITY_ID);
select *
from T_DATA_WSXX;

-- ����¥������
update T_DATA_WSXX a
set COMMUNITY = (select community from T_BASE_COMMUNITY b where a.COMMUNITY_ID = b.ID )
where EXISTS(select 1 from T_BASE_COMMUNITY b where a.COMMUNITY_ID = b.ID ) and COMMUNITY_ID is not null ;

-- ������Ȼ������
update T_DATA_WSXX a
set ZRZZL = (select zl from T_BASE_ZRZ_XZ b where a.ZRZBDCDYID = b.BDCDYID )
where EXISTS(select 1 from T_BASE_ZRZ_XZ b where a.ZRZBDCDYID = b.BDCDYID );
