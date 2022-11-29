truncate table T_DATA_TQJG_ZRZ;

-- 插入'住宅', '储藏室/阁楼', '地下室', '商铺', '公寓', '办公'
insert into T_DATA_TQJG_ZRZ(bdcdyid, xmmc, bdcdyh, xmbh, zddm, zdbdcdyid, zrzh, zl, jgrq, zcs, dscs, dxcs, ghyt,
                            fwjg, zts, qxdm, qxmc, bdcdyh_new, bdcdyh_old, zdbdcdyid_new, jzjg, tqzh, fwyt4, fwyt5,
                            id)
select a.BDCDYID,
       a.XMMC,
       a.BDCDYH,
       a.XMBH,
       a.ZDDM,
       a.ZDBDCDYID,
       a.ZRZH,
       a.ZL,
       a.JGRQ,
       a.ZCS,
       a.DSCS,
       a.DXCS,
       a.GHYT,
       a.FWJG,
       a.ZTS,
       a.QXDM,
       a.QXMC,
       a.BDCDYH_NEW,
       a.BDCDYH_OLD,
       a.ZDBDCDYID_NEW,
       a.JZJG,
       a.TQZH,
       b.FWYT4,
       b.FWYT4,
       sys_guid()
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT4,
                                 row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                          from T_BASE_H_XZ
                          where delete_flag is null) a
                    where a.r = 1) b
                   on a.BDCDYID = b.ZRZBDCDYID
         left join T_DATA_TQJG_ZRZ c on a.BDCDYID = c.BDCDYID and c.FWYT4 = b.FWYT4
where b.FWYT4 is not null
  and c.id is null;

select *
from T_DATA_TQJG_ZRZ
where BDCDYID = '680960';

-- 插入车位
insert into T_DATA_TQJG_ZRZ(bdcdyid, xmmc, bdcdyh, xmbh, zddm, zdbdcdyid, zrzh, zl, jgrq, zcs, dscs, dxcs, ghyt,
                            fwjg, zts, qxdm, qxmc, bdcdyh_new, bdcdyh_old, zdbdcdyid_new, jzjg, tqzh, fwyt4, fwyt5,
                            id)
select a.BDCDYID,
       a.XMMC,
       a.BDCDYH,
       a.XMBH,
       a.ZDDM,
       a.ZDBDCDYID,
       a.ZRZH,
       a.ZL,
       a.JGRQ,
       a.ZCS,
       a.DSCS,
       a.DXCS,
       a.GHYT,
       a.FWJG,
       a.ZTS,
       a.QXDM,
       a.QXMC,
       a.BDCDYH_NEW,
       a.BDCDYH_OLD,
       a.ZDBDCDYID_NEW,
       a.JZJG,
       a.TQZH,
       '车位/车库',
       b.FWYT3,
       sys_guid()
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT3,
                                 row_number() over (partition by ZRZBDCDYID,FWYT3 order by ZRZBDCDYID) r
                          from T_BASE_H_XZ
                          where FWYT4 = '车位/车库'
                            and DELETE_FLAG is null) a
                    where a.r = 1) b
                   on a.BDCDYID = b.ZRZBDCDYID
         left join T_DATA_TQJG_ZRZ c on a.BDCDYID = c.BDCDYID and FWYT4 = '车位/车库' and c.FWYT5 = b.FWYT3
where b.FWYT3 is not null
  and c.ID is null;

select *
from T_DATA_TQJG_ZRZ
where BDCDYID = 'FCGIS+1383634';

select distinct FWYT3
from T_BASE_H_XZ
where ZRZBDCDYID = 'FCGIS+1383634'
  and FWYT4 = '车位/车库';

select distinct FWYT4
from T_BASE_H_XZ where ZRZBDCDYID = '684038';

select *
from V_COMMUNITY_GL_ZRZ where ZRZBDCDYID = '684038';

select *
from T_COMMUNITY_YT where COMMUNITY_ID = 'CB0F6F220C3466B1E053AF5D14ACBB0C';

select *
from T_DATA_TQJG_ZRZ where BDCDYID = '684038';



insert into T_DATA_TQJG_ZRZ(bdcdyid, xmmc, bdcdyh, xmbh, zddm, zdbdcdyid, zrzh, zl, jgrq, zcs, dscs, dxcs, ghyt,
                            fwjg, zts, qxdm, qxmc, bdcdyh_new, bdcdyh_old, zdbdcdyid_new, jzjg, tqzh, fwyt4, fwyt5,
                            id)
select a.BDCDYID,
       a.XMMC,
       a.BDCDYH,
       a.XMBH,
       a.ZDDM,
       a.ZDBDCDYID,
       a.ZRZH,
       a.ZL,
       a.JGRQ,
       a.ZCS,
       a.DSCS,
       a.DXCS,
       a.GHYT,
       a.FWJG,
       a.ZTS,
       a.QXDM,
       a.QXMC,
       a.BDCDYH_NEW,
       a.BDCDYH_OLD,
       a.ZDBDCDYID_NEW,
       a.JZJG,
       a.TQZH,
       b.FWYT4,
       b.FWYT4,
       sys_guid()
from T_BASE_ZRZ_XZ a
         left join (select *
                    from (select ZRZBDCDYID,
                                 FWYT4,
                                 row_number() over (partition by ZRZBDCDYID,FWYT4 order by ZRZBDCDYID) r
                          from T_BASE_H_XZ
                          where FWYT4 is not null) a
                    where a.r = 1) b
                   on a.BDCDYID = b.ZRZBDCDYID
         left join T_DATA_TQJG_ZRZ c on a.BDCDYID = c.BDCDYID and c.FWYT4 = b.FWYT4
where b.FWYT4 is not null
  and c.ID is null;

select *
from T_DATA_TQJG_ZRZ
where BDCDYID = '627309';

select distinct FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID = '627309';

select count(BDCDYID)
from T_DATA_TQJG_ZRZ;

select QXDM, count(0)
from T_DATA_TQJG_ZRZ
group by QXDM;

select ZRZBDCDYID, count(0)
from V_COMMUNITY_GL_ZRZ
group by ZRZBDCDYID
having count(0) > 1;

select *
from V_COMMUNITY_GL_ZRZ
where ZRZBDCDYID = '431027';

select *
from T_DATA_TQJG_ZRZ
where FWYT4 is null;

select BDCDYID, FWYT5, count(0)
from T_DATA_TQJG_ZRZ
group by BDCDYID, FWYT5
having count(0) > 1;

select distinct FWYT3

from T_BASE_H_XZ
where BZ = 'admin：于2022-11-07新增';

select FWYT4, FWYT3
from T_BASE_H_XZ
where ZRZBDCDYID = '618981';

select BDCDYID, count(0)
from T_DATA_TQJG_ZRZ
where BDCDYID in (select BDCDYID
                  from T_BASE_ZRZ_XZ
                  where FCFHT is null)
group by BDCDYID
order by count(0) desc;

select *
from T_DATA_TQJG_ZRZ
where BDCDYID = '1418812';
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '公寓', '公寓', null, null, 'E66E9AC089836DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '办公', '办公', null, null, 'E66E9AC089846DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '商业商务', '商业商务', null, null, 'E66E9AC089856DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '车位/车库', null, null, 'E66E9AC089866DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '轻型车车位', null, null, 'E66E9AC3506D6DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '自行车库', null, null, 'E66E9AC3506E6DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '无障碍机动车车位', null, null, 'E66E9AC3506F6DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '微型车车位', null, null, 'E66E9AC350706DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '小型车车位', null, null, 'E66E9AC350716DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '双层立体车位', null, null, 'E66E9AC350726DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '中型车车位', null, null, 'E66E9AC350736DA6E053AF5D14AC4E2B', null, '0', null);
INSERT INTO JNPG.T_DATA_TQJG_ZRZ (BDCDYID, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JGRQ, ZCS, DSCS, DXCS, GHYT, FWJG, ZTS, QXDM, QXMC, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, JZJG, TQZH, FWYT1, FWYT2, FWYT3, FWYT4, FWYT5, CLZT, QSZT, ID, SFWQ, DEL_FLAG, UPDATE_FLAG) VALUES ('1418812', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, 3, 0, 0, null, '3', 2580, '370112', '历城', null, null, null, null, '车库', null, null, null, '车位/车库', '三层立体车位', null, null, 'E66E9AC350746DA6E053AF5D14AC4E2B', null, '0', null);


select *
from T_BASE_ZRZ_XZ
where BDCDYID = '1418812';
INSERT INTO JNPG.T_BASE_ZRZ_XZ (BDCDYID, YSDM, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JZWMC, JGRQ, JZWGD, ZZDMJ, ZYDMJ, YCJZMJ, SCJZMJ, TDSYQR, DYTDMJ, FTTDMJ, FDCJYJG, ZCS, DSCS, DXCS, DXSD, GHYT, FWJG, ZTS, JZWJBYT, BZ, ZT, QXDM, QXMC, DJQDM, DJQMC, DJZQDM, DJZQMC, DCXMID, YXBZ, FCFHT, FCFHTWJ, BGZT, DJZT, CREATETIME, MODIFYTIME, YCBDCDYID, RELATIONID, ZDTWJ, ZZSYQQSRQ, ZZSYNX, ZZSYQZZRQ, ZZHBZCRQSRQ, ZZHBZCRSYNX, ZZHBZCRZZRQ, ZZYCNXQSRQ, ZZYCNXSYNX, ZZYCNXZZRQ, ZZTDDJ, FZZSYQQSRQ, FZZSYNX, FZZSYQZZRQ, FZZHBZCRQSRQ, FZZHBZCRSYNX, FZZHBZCRZZRQ, FZZYCNXQSRQ, FZZYCNXSYNX, FZZYCNXZZRQ, FZZTDDJ, ZRZZDT, FTXS, BUILDING_U, LABELS, ZHUANGHAO, CLASSID, BUILDING_N, BUILDING_C, BUILDING_S, BUILT_DATE, UPDATEDATE, UPLAYERS, DOWNLAYERS, RKSJ, CHSJ, BSM, USERID, ZBM, YZM, XGSJ, SFQC, QCSJ, ZRZLINK, XNZRZ, CHXMBH, DSFHDJ, DXFHDJ, CHJG, KZDJ, ZZTS, FZZTS, KFJSDW, JLDW, HOUSE_STAT, CHBG, CHDW, KFDW, SJSYNX, LG, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, CODE, PARCELCODE, ADDRESS, STRUCT, XQ_NAME, LAYERS, UNITCODE, BUILDDATE, PROPERTY, CQ_NAME, TOTAL_AREA, DESIGN_YT, MPCODE, FLOOR_STAT, IS_DELETE, HAVE_FLOOR, TKNAME, DWMC, TCMC, FHBM, JZJG, FWCS, SJLY, CTSJ, TEMBH, OBJECTID, GRAPHICS_C, SEALUP_STA, DYS, DCXMBH, SFFTXS, BDCDYHZH, NZDBDCDYID, NBDCDYH, ZDBDCQZH, ZDGHXKZH, DJDM, DCZT, ZHS, OPSTATE, TQZH, SFTQ, FDCQ_FLAG, ZT_SYNC, FWZLZT, ZT_DJ, DELETE_FLAG) VALUES ('1418812', '1', '历城区花园路136号聚隆广场地下车库及其他', '370112001002GB00005F10330000', '20171028000821821', '370112001002GB00005', 'dd04210e271b47808b367a8078e59cb1', '20171028000821821', '历城区花园路136号聚隆广场地下车库及其他', null, null, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 160918.8700000000000000, null, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 3, 0, 0, 0.0000000000000000, null, '3', 2580, null, null, null, '370112', '历城', '370112001', '山大', '370112001002', '002街坊', '1f1cdb72-582d-46cf-8d46-5deca10ca8e7', null, null, null, null, 3, TO_DATE('2020-04-16 16:58:53', 'YYYY-MM-DD HH24:MI:SS'), null, null, '1022321', null, null, 0, null, null, 0, null, null, 0, null, null, null, 0, null, null, 0, null, null, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, TO_DATE('2020-04-16 16:58:53', 'YYYY-MM-DD HH24:MI:SS'), 0, null, '20171028000821821', 'jdC/KwO0nLChUZvLoAHhXFIkc1OCdlFxo+ifNfi96F8=', TO_DATE('2020-04-22 11:21:30', 'YYYY-MM-DD HH24:MI:SS'), 0, null, null, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 10, '车库', '0', '1', 1, null, 3, 0);


select ZRZBDCDYID,count(0)
from T_BASE_H_XZ group by ZRZBDCDYID having count(0) > 1 order by count(0);

select *
from T_BASE_H_XZ where ZRZBDCDYID = '1549840';
INSERT INTO JNPG.T_BASE_H_XZ (BDCDYID, YSDM, BDCDYH, XMBH, FWBM, ZRZBDCDYID, ZDDM, ZDBDCDYID, ZRZH, LJZID, LJZH, CID, CH, ZL, MJDW, QSC, SZC, ZCS, HH, SHBW, HX, HXJG, FWYT1, FWYT2, FWYT3, YCJZMJ, YCTNJZMJ, YCFTJZMJ, YCDXBFJZMJ, YCQTJZMJ, YCFTXS, SCJZMJ, SCTNJZMJ, SCFTJZMJ, SCDXBFJZMJ, SCQTJZMJ, SCFTXS, GYTDMJ, FTTDMJ, DYTDMJ, TDSYQR, FDCJYJG, GHYT, FWJG, JGSJ, FWLX, FWXZ, ZDMJ, SYMJ, CQLY, QTGSD, QTGSX, QTGSN, QTGSB, FCFHT, ZT, QXDM, QXMC, DJQDM, DJQMC, DJZQDM, DJZQMC, YXBZ, CQZT, DYZT, XZZT, BLZT, YYZT, DCXMID, FH, BGZT, DJZT, CREATETIME, MODIFYTIME, FCFHTWJ, YFWXZ, YFWYT, YGHYT, YFWJG, RELATIONID, YZL, XMMC, FWCB, GZWLX, YFWCB, PACTNO, XMZL, SFLJQPJYC, QLXZ, TDSYQQSRQ, TDSYNX, TDSYQZZRQ, FCFHTSLTX, CRJJE, FWTDYT, ZZC, DYH, BZ, CHSJ, MYC, DY, MJDWMC, FWYTMC, YTMJ, YZM, XGSJ, FXH, SFQC, QCSJ, ZRZHLINK, YZRZBDCDYID, YBDCDYH, ZRZZL, CHJG, ZQFWBM, SCFCFHTSJ, FCT, SCFCTSJ, FHT, SCFHTSJ, FWZT, FCFHTWJLX, DCXMBH, BDCDYH_OLD, ZDBDCDYID_NEW, BDCDYH_NEW, QDH, JYFHTPATH, FWXSZT, DCZT, DI_CHANGE, SCJZMJ1, FWYT4, QSZT, TQZH, TQHH, OPSTATE, FH1, TQHH2, ZT_SYNC, FWZLZT, UPDATE_FLAG, DELETE_FLAG, ZZYT, QUALIFY) VALUES ('53224482', null, '370104100209GB01009F10760002', null, '2019052900090335300000', '1549840', '370104100209GB01009', '02776c2444944be4bdf1249a1c26cfdd', '72', null, null, null, '1', '槐荫区美里东路3000号德迈国际中心72号厂房101', '1', 1.0000000000000000, '1', 0, 0, null, null, null, null, '9056', '综合厂房(丙二类)', 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 429.4100000000000000, 398.7000000000000000, 30.7100000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, null, 0.0000000000000000, null, '3', null, null, null, 0.0000000000000000, 0.0000000000000000, null, null, null, null, null, null, 0, '370104', '槐荫', null, null, null, null, null, null, null, null, null, null, null, '101', null, null, null, null, null, null, null, null, null, '400001', null, null, null, null, null, null, null, 0, null, null, 0, null, null, null, null, 1.0000000000000000, '1', null, TO_DATE('2022-01-18 15:07:44', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null, 'a+DD9FX9ewU6fyVcAmFLrXh+r8ogn3AdHa77W0QVt/0=', TO_DATE('2022-01-18 15:07:44', 'YYYY-MM-DD HH24:MI:SS'), 1, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 2, null, null, null, null, null);
INSERT INTO JNPG.T_BASE_H_XZ (BDCDYID, YSDM, BDCDYH, XMBH, FWBM, ZRZBDCDYID, ZDDM, ZDBDCDYID, ZRZH, LJZID, LJZH, CID, CH, ZL, MJDW, QSC, SZC, ZCS, HH, SHBW, HX, HXJG, FWYT1, FWYT2, FWYT3, YCJZMJ, YCTNJZMJ, YCFTJZMJ, YCDXBFJZMJ, YCQTJZMJ, YCFTXS, SCJZMJ, SCTNJZMJ, SCFTJZMJ, SCDXBFJZMJ, SCQTJZMJ, SCFTXS, GYTDMJ, FTTDMJ, DYTDMJ, TDSYQR, FDCJYJG, GHYT, FWJG, JGSJ, FWLX, FWXZ, ZDMJ, SYMJ, CQLY, QTGSD, QTGSX, QTGSN, QTGSB, FCFHT, ZT, QXDM, QXMC, DJQDM, DJQMC, DJZQDM, DJZQMC, YXBZ, CQZT, DYZT, XZZT, BLZT, YYZT, DCXMID, FH, BGZT, DJZT, CREATETIME, MODIFYTIME, FCFHTWJ, YFWXZ, YFWYT, YGHYT, YFWJG, RELATIONID, YZL, XMMC, FWCB, GZWLX, YFWCB, PACTNO, XMZL, SFLJQPJYC, QLXZ, TDSYQQSRQ, TDSYNX, TDSYQZZRQ, FCFHTSLTX, CRJJE, FWTDYT, ZZC, DYH, BZ, CHSJ, MYC, DY, MJDWMC, FWYTMC, YTMJ, YZM, XGSJ, FXH, SFQC, QCSJ, ZRZHLINK, YZRZBDCDYID, YBDCDYH, ZRZZL, CHJG, ZQFWBM, SCFCFHTSJ, FCT, SCFCTSJ, FHT, SCFHTSJ, FWZT, FCFHTWJLX, DCXMBH, BDCDYH_OLD, ZDBDCDYID_NEW, BDCDYH_NEW, QDH, JYFHTPATH, FWXSZT, DCZT, DI_CHANGE, SCJZMJ1, FWYT4, QSZT, TQZH, TQHH, OPSTATE, FH1, TQHH2, ZT_SYNC, FWZLZT, UPDATE_FLAG, DELETE_FLAG, ZZYT, QUALIFY) VALUES ('53224483', null, '370104100209GB01009F10760001', null, '2019052900090335300001', '1549840', '370104100209GB01009', '02776c2444944be4bdf1249a1c26cfdd', '72', null, null, null, '1', '槐荫区美里东路3000号德迈国际中心72号厂房102', '1', 1.0000000000000000, '1', 0, 0, null, null, null, null, '9056', '综合厂房(丙二类)', 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 429.4100000000000000, 398.7000000000000000, 30.7100000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, null, 0.0000000000000000, null, '3', null, null, null, 0.0000000000000000, 0.0000000000000000, null, null, null, null, null, null, 0, '370104', '槐荫', null, null, null, null, null, null, null, null, null, null, null, '102', null, null, null, null, null, null, null, null, null, '400002', null, null, null, null, null, null, null, 0, null, null, 0, null, null, null, null, 1.0000000000000000, '1', null, TO_DATE('2022-01-18 15:07:47', 'YYYY-MM-DD HH24:MI:SS'), null, '1', null, null, null, 'a+DD9FX9ewU6fyVcAmFLrT07WeOy0qf5ZO+ThMpPLmM=', TO_DATE('2022-01-18 15:07:47', 'YYYY-MM-DD HH24:MI:SS'), 2, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 2, null, null, null, null, null);

select *
from T_BASE_ZRZ_XZ where BDCDYID = '1549840';
INSERT INTO JNPG.T_BASE_ZRZ_XZ (BDCDYID, YSDM, XMMC, BDCDYH, XMBH, ZDDM, ZDBDCDYID, ZRZH, ZL, JZWMC, JGRQ, JZWGD, ZZDMJ, ZYDMJ, YCJZMJ, SCJZMJ, TDSYQR, DYTDMJ, FTTDMJ, FDCJYJG, ZCS, DSCS, DXCS, DXSD, GHYT, FWJG, ZTS, JZWJBYT, BZ, ZT, QXDM, QXMC, DJQDM, DJQMC, DJZQDM, DJZQMC, DCXMID, YXBZ, FCFHT, FCFHTWJ, BGZT, DJZT, CREATETIME, MODIFYTIME, YCBDCDYID, RELATIONID, ZDTWJ, ZZSYQQSRQ, ZZSYNX, ZZSYQZZRQ, ZZHBZCRQSRQ, ZZHBZCRSYNX, ZZHBZCRZZRQ, ZZYCNXQSRQ, ZZYCNXSYNX, ZZYCNXZZRQ, ZZTDDJ, FZZSYQQSRQ, FZZSYNX, FZZSYQZZRQ, FZZHBZCRQSRQ, FZZHBZCRSYNX, FZZHBZCRZZRQ, FZZYCNXQSRQ, FZZYCNXSYNX, FZZYCNXZZRQ, FZZTDDJ, ZRZZDT, FTXS, BUILDING_U, LABELS, ZHUANGHAO, CLASSID, BUILDING_N, BUILDING_C, BUILDING_S, BUILT_DATE, UPDATEDATE, UPLAYERS, DOWNLAYERS, RKSJ, CHSJ, BSM, USERID, ZBM, YZM, XGSJ, SFQC, QCSJ, ZRZLINK, XNZRZ, CHXMBH, DSFHDJ, DXFHDJ, CHJG, KZDJ, ZZTS, FZZTS, KFJSDW, JLDW, HOUSE_STAT, CHBG, CHDW, KFDW, SJSYNX, LG, BDCDYH_NEW, BDCDYH_OLD, ZDBDCDYID_NEW, CODE, PARCELCODE, ADDRESS, STRUCT, XQ_NAME, LAYERS, UNITCODE, BUILDDATE, PROPERTY, CQ_NAME, TOTAL_AREA, DESIGN_YT, MPCODE, FLOOR_STAT, IS_DELETE, HAVE_FLOOR, TKNAME, DWMC, TCMC, FHBM, JZJG, FWCS, SJLY, CTSJ, TEMBH, OBJECTID, GRAPHICS_C, SEALUP_STA, DYS, DCXMBH, SFFTXS, BDCDYHZH, NZDBDCDYID, NBDCDYH, ZDBDCQZH, ZDGHXKZH, DJDM, DCZT, ZHS, OPSTATE, TQZH, SFTQ, FDCQ_FLAG, ZT_SYNC, FWZLZT, ZT_DJ, DELETE_FLAG) VALUES ('1549840', null, '槐荫区美里东路3000号德迈国际中心72号厂房', '370104100209GB01009F10760000', '20190529000903353', '370104100209GB01009', '02776c2444944be4bdf1249a1c26cfdd', '20190529000903353幢', '槐荫区美里东路3000号德迈国际中心72号厂房', null, null, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 858.8200000000000000, null, 0.0000000000000000, 0.0000000000000000, 0.0000000000000000, 3, 0, 0, 0.0000000000000000, null, '3', 2, null, null, null, '370104', '槐荫', '370104100', '吴家堡镇', '370104100209', '肖家屯', '643bbf1c-142e-404e-bff7-b1917ae7b0ef', null, null, null, null, 1, TO_DATE('2022-01-18 15:07:44', 'YYYY-MM-DD HH24:MI:SS'), null, '1357721', '1047764', null, null, 0, null, null, 0, null, null, 0, null, null, null, 0, null, null, 0, null, null, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 0, null, '20190529000903353', 'a+DD9FX9ewU6fyVcAmFLrVbkajPUMNKOz8fDay7/xNA=', TO_DATE('2022-01-19 10:37:14', 'YYYY-MM-DD HH24:MI:SS'), 0, null, null, 0, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, 2, null, null, 0);

-- cx cg
select SZC,QSC,ZCS,ZRZH,DYH,FH,SCJZMJ,FWYT4
from T_BASE_H_XZ;