select *
from T_SQ;

select *
from T_POPULATION;

update T_POPULATION
set VERSION = '20220328';

select *
from T_CITY;


update T_COUNTY
set CITY_ID = 30;

select *
from T_DJZQ;

select *
from T_DJQ;

select *
from T_DJQ
where XZQDM like '370181004%';

select *
from T_DJZQ
where XZQDM like '370181004%';

update T_DJZQ
set DJQ_ID = substr(XZQDM, 1, 9);

update T_DJZQ a
set DJQ_ID = (select b.ID
              from (select id, XZQDM, row_number() over (partition by XZQDM order by XZQDM) r
                    from T_DJQ) b
              where r = 1
                and a.DJQ_ID = b.XZQDM)
where exists(select 1
             from (select id, XZQDM, row_number() over (partition by XZQDM order by XZQDM) r
                   from T_DJQ) b
             where r = 1
               and a.DJQ_ID = b.XZQDM);

select a.XZQDM, a.XZQMC, b.XZQMC
from T_DJZQ a
         left join T_DJQ b on a.DJQ_ID = b.XZQDM;


select XZQDM, count(0)
from T_DJQ
group by XZQDM
having count(0) > 1;

select *
from T_DJQ
where XZQDM = '370112909';

select *
from (select id, XZQDM, row_number() over (partition by XZQDM order by XZQDM) r
      from T_DJQ)
where r = 1;

select *
from T_POLICY_LOAN;


select *
from T_H_XZ;

select *
from t_county;

update T_COUNTY
set HIGHER = 0
where HIGHER is null;

select count(0)
from T_NETDATA_CJJG;

select count(0)
from T_SCHOOLAREA;

select *
from t_data_catalog
where LINK_URL is null;

update t_data_catalog
set IS_TIPS = '0'
where TIPS_CONTENT is null;

select *
from T_GXD_HOUSE;
select *
from T_GXD_COMMUNITY;
select *
from T_GXD_BUILDING_COEFFICENT;

select distinct SUMMARYASSESSMENTCOEFFICIENT
from T_GXD_BUILDING_COEFFICENT;


select *
from T_GXD_UNIT;

select *
from T_GXD_PUB_DICT_VALUE;

select *
from T_GXD_COMMUNITY_PRICE;
select *
from T_GXD_RESIDENCE_COEFFICIENT;
select *
from T_GXD_ADDRESS_ALIAS;



select *
from T_NETDATA_COMMUNITY_ER;

select *
from T_DATA_DEAL_INFO;

select *
from T_PQ
where PQMC = '华山北片区';

truncate table T_SQ;

select *
from T_POPULATION;

update T_GDP
set VERSION = '20230214'
where VERSION is null;

select *
from T_SCHOOLAREA;

select *
from t_policy_loan;

truncate table t_policy_loan;

update t_policy_loan
set VERSION = '20230208'
where VERSION is null;

alter user JNPG quota unlimited on BDCP;
grant unlimited tablespace to BDCP;

select community_id,
       city_code,
       communityname,
       area_id,
       grade,
       isdeleted,
       full_name,
       communitystatus
from T_GXD_COMMUNITY;

select address_id, community_id, street_name, street_number_name
from T_GXD_STREET;

select sn_id, address_id, street_name, street_number
from T_GXD_STREET_NUMBER;

select a.COMMUNITY_ID, a.COMMUNITYNAME, b.STREET_NAME, b.STREET_NUMBER_NAME, c.STREET_NAME, c.STREET_NUMBER
from T_GXD_COMMUNITY a
         left join T_GXD_STREET b on a.COMMUNITY_ID = b.COMMUNITY_ID
         left join T_GXD_STREET_NUMBER c on b.community_id = c.ADDRESS_ID
where a.COMMUNITYNAME like '%经十路%';


select BUILDING_ID, sum(decode(ASPECT, '', 1, 1)), count(0)
from (select distinct c.BUILDING_ID, a.ASPECT
      from T_GXD_HOUSE a
               left join T_GXD_UNIT b on a.UNIT_ID = b.UNIT_ID
               left join T_GXD_BUILDING c on b.BUILDING_ID = c.BUILDING_ID
      where a.ASPECT is not null)
group by BUILDING_ID
order by sum(decode(ASPECT, '', 1, 1)) desc;

select distinct ASPECT
from T_GXD_HOUSE
where ASPECT is not null;

select distinct a.ASPECT
from T_GXD_HOUSE a
         left join T_GXD_UNIT b on a.UNIT_ID = b.UNIT_ID
         left join T_GXD_BUILDING c on b.BUILDING_ID = c.BUILDING_ID
where c.BUILDING_ID = '438642497';

select *
from T_GXD_COMMUNITY;

select a.*
from (select a.HOUSE_ID,
             c.COMMUNITY_ID,
             f.NAME,
             e.FULL_NAME || c.BUILDING_NAME || b.UNIT_NAME || a.HOUSE_NAME as hzl,
             a.CURRENTFLOOR,
             a.TOTALFLOOR,
             a.ASPECT,
             d.SUMMARYASSESSMENTCOEFFICIENT,
             (select NAME
              from T_GXD_PUB_DICT_VALUE s
              where DICT_KEY = 'BUILDINGTYPE'
                and s.CODE = c.BUILDINGTYPE)                               as BUILDINGTYPE,
             (select NAME
              from T_GXD_PUB_DICT_VALUE s
              where DICT_KEY = 'BUILDINGFORM'
                and s.CODE = c.BUILDINGFORM)                                  BUILDINGFORM,
             (select NAME
              from T_GXD_PUB_DICT_VALUE s
              where DICT_KEY = 'GRADE'
                and s.CODE = e.GRADE)                                      as GRADE,
             (select NAME
              from T_GXD_PUB_DICT_VALUE s
              where s.DICT_VALUE_ID = g.PROPERTY_TYPE)                     as PROPERTY_TYPE,
             g.PRICE_TYPE,
             g.PRICE_DATE,
             g.PRICE,
             g.CONFIDENCE,
             row_number() over (partition by a.HOUSE_ID order by a.HOUSE_ID)  r
      from T_GXD_HOUSE a
               left join T_GXD_UNIT b on a.UNIT_ID = b.UNIT_ID
               left join T_GXD_BUILDING c on b.BUILDING_ID = c.BUILDING_ID
               left join T_GXD_BUILDING_COEFFICENT d on c.BUILDING_ID = d.BUILDING_ID
               left join T_GXD_COMMUNITY e on e.COMMUNITY_ID = c.COMMUNITY_ID
               left join T_GXD_AREA f on e.AREA_ID = f.AREA_ID
               left join T_GXD_COMMUNITY_PRICE g on e.COMMUNITY_ID = g.COMMUNITY_ID) a
where r = 1;



select a.HOUSE_ID,
       c.COMMUNITY_ID,
       b.BUILDING_ID,
       f.NAME,
       e.FULL_NAME || c.BUILDING_NAME || b.CRA_NAME || a.HOUSE_NAME as hzl,
       b.CRA_NAME,
       a.CURRENTFLOOR,
       a.TOTALFLOOR,
       a.ASPECT,
       d.SUMMARYASSESSMENTCOEFFICIENT,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGTYPE'
          and s.CODE = c.BUILDINGTYPE)                              as BUILDINGTYPE,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGFORM'
          and s.CODE = c.BUILDINGFORM)                                 BUILDINGFORM,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'GRADE'
          and s.CODE = e.GRADE)                                     as GRADE,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where s.DICT_VALUE_ID = g.PROPERTY_TYPE)                    as PROPERTY_TYPE,
       g.PRICE_TYPE,
       g.PRICE_DATE,
       g.PRICE,
       g.CONFIDENCE,
       row_number() over (partition by a.HOUSE_ID order by a.HOUSE_ID) r
from T_GXD_HOUSE a
         left join T_GXD_UNIT b on a.UNIT_ID = b.UNIT_ID
         left join T_GXD_BUILDING c on b.BUILDING_ID = c.BUILDING_ID
         left join T_GXD_BUILDING_COEFFICENT d on c.BUILDING_ID = d.BUILDING_ID
         left join T_GXD_COMMUNITY e on e.COMMUNITY_ID = c.COMMUNITY_ID
         left join T_GXD_AREA f on e.AREA_ID = f.AREA_ID
         left join T_GXD_COMMUNITY_PRICE g on e.COMMUNITY_ID = g.COMMUNITY_ID
where e.COMMUNITY_ID = '710100340';

select *
from T_GXD_COMMUNITY
where COMMUNITY_ID = '710100340';

select *
from T_GXD_BUILDING
where COMMUNITY_ID = '710100340';

select count(0), count(distinct BUILDING_ID), count(distinct COMMUNITY_ID)
from T_GXD_BUILDING
where BUILDING_ID in (select T_GXD_UNIT.BUILDING_ID
                      from T_GXD_UNIT
                      where T_GXD_UNIT.BUILDING_ID is not null)
union all
select count(0), count(distinct BUILDING_ID), count(distinct COMMUNITY_ID)
from T_GXD_BUILDING
where BUILDING_ID not in (select T_GXD_UNIT.BUILDING_ID
                          from T_GXD_UNIT
                          where T_GXD_UNIT.BUILDING_ID is not null);

select count(0)
from T_GXD_COMMUNITY;
select *
from T_GXD_COMMUNITY
where COMMUNITY_ID in (select COMMUNITY_ID
                       from T_GXD_BUILDING
                       where BUILDING_ID not in (select T_GXD_UNIT.BUILDING_ID
                                                 from T_GXD_UNIT
                                                 where T_GXD_UNIT.BUILDING_ID is not null));

select *
from T_GXD_COMMUNITY
where COMMUNITY_ID = '610321293';

--716033345,A3-1-11号楼
select *
from T_GXD_UNIT
where BUILDING_ID = '716033345';

select a.COMMUNITY_ID, a.BUILDING_ID, b.COMMUNITYNAME, b.FULL_NAME, a.BUILDING_NAME
from T_GXD_BUILDING a
         left join T_GXD_COMMUNITY b on a.COMMUNITY_ID = b.COMMUNITY_ID
where b.COMMUNITYNAME like '%阳光%';

select a.UNIT_ID,
       b.BUILDING_ID,
       TGB.BUILDING_NAME,
       b.UNIT_NAME,
       a.HOUSE_NAME,
       a.CURRENTFLOOR,
       TGB.COMMUNITY_ID,
       c.COMMUNITYNAME,
       c.FULL_NAME
from T_GXD_HOUSE a
         left join T_GXD_UNIT b on a.UNIT_ID = b.UNIT_ID
         left join T_GXD_BUILDING TGB on b.BUILDING_ID = TGB.BUILDING_ID
         left join T_GXD_COMMUNITY c on TGB.COMMUNITY_ID = c.COMMUNITY_ID
where a.HOUSE_NAME like '-%';

select *
from T_GXD_HOUSE;


select *
from T_GXD_COMMUNITY
where COMMUNITY_ID in (select COMMUNITY_ID
                       from T_GXD_BUILDING
                       where BUILDING_ID not in (select T_GXD_UNIT.BUILDING_ID
                                                 from T_GXD_UNIT
                                                 where T_GXD_UNIT.BUILDING_ID is not null));
select *
from T_GXD_BUILDING
where COMMUNITY_ID = '438618089';

select *
from T_GXD_UNIT
where BUILDING_ID in (select T_GXD_BUILDING.BUILDING_ID
                      from T_GXD_BUILDING
                      where COMMUNITY_ID = '438618089');

select *
from T_GXD_HOUSE
where UNIT_ID = '646374940';

select *
from T_GXD_UNIT
where BUILDING_ID not in (select T_GXD_BUILDING.BUILDING_ID
                          from T_GXD_BUILDING);

select *
from T_GXD_UNIT
where BUILDING_ID = '715431275';

select unit_id, city_code, unit_name, building_id, isdeleted, cra_name
from T_GXD_UNIT t
where trim(translate(t.UNIT_NAME, '0123456789.', ' ')) is NULL;

update T_GXD_UNIT
set CRA_NAME = CRA_NAME || '单元'
where trim(translate(UNIT_NAME, '0123456789.', ' ')) is NULL;

select *
from T_GXD_PUB_DICT_VALUE;

select *
from T_GXD_FULL_DOCUMENTATION
where HZL like '-';

select *
from T_GXD_COMMUNITY_PRICE;

create table T_GXD_FULL_DOCUMENTATION as
select a.HOUSE_ID,
       c.COMMUNITY_ID,
       f.NAME,
       e.FULL_NAME || c.BUILDING_NAME || b.UNIT_NAME || a.HOUSE_NAME as hzl,
       a.CURRENTFLOOR,
       a.TOTALFLOOR,
       a.ASPECT,
       d.SUMMARYASSESSMENTCOEFFICIENT,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGTYPE'
          and s.CODE = c.BUILDINGTYPE)                               as BUILDINGTYPE,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGFORM'
          and s.CODE = c.BUILDINGFORM)                                  BUILDINGFORM,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'GRADE'
          and s.CODE = e.GRADE)                                      as GRADE,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where s.DICT_VALUE_ID = g.PROPERTY_TYPE)                     as PROPERTY_TYPE,
       g.PRICE_TYPE,
       g.PRICE_DATE,
       g.PRICE,
       g.CONFIDENCE,
       row_number() over (partition by a.HOUSE_ID order by a.HOUSE_ID)  r
from T_GXD_HOUSE a
         left join T_GXD_UNIT b on a.UNIT_ID = b.UNIT_ID
         left join T_GXD_BUILDING c on b.BUILDING_ID = c.BUILDING_ID
         left join T_GXD_BUILDING_COEFFICENT d on c.BUILDING_ID = d.BUILDING_ID
         left join T_GXD_COMMUNITY e on e.COMMUNITY_ID = c.COMMUNITY_ID
         left join T_GXD_AREA f on e.AREA_ID = f.AREA_ID
         left join T_GXD_COMMUNITY_PRICE g on e.COMMUNITY_ID = g.COMMUNITY_ID
;

select community_id,
       city_code,
       property_type,
       price_type,
       price_date,
       price,
       confidence,
       status_cd,
       (select NAME
        from T_GXD_PUB_DICT_VALUE b
        where a.PROPERTY_TYPE = b.DICT_VALUE_ID)
from T_GXD_COMMUNITY_PRICE a;

select *
from T_GXD_PUB_DICT_VALUE;

select *
from T_GXD_COMMUNITY_PRICE;

update T_GXD_COMMUNITY_PRICE a
set TYPE_VALUE = (select CODE
                  from T_GXD_PUB_DICT_VALUE b
                  where a.PROPERTY_TYPE = b.DICT_VALUE_ID)
where exists(select 1
             from T_GXD_PUB_DICT_VALUE b
             where a.PROPERTY_TYPE = b.DICT_VALUE_ID);

select *
from T_GXD_BUILDING
where BUILDING_ID = '598786526';



select *
from T_GXD_COMMUNITY_PRICE
where COMMUNITY_ID = '710100340';

select a.COMMUNITY_ID, count(0)
from T_GXD_BUILDING a
         left join T_GXD_COMMUNITY_PRICE b on a.COMMUNITY_ID = b.COMMUNITY_ID and a.BUILDINGFORM = b.TYPE_VALUE
where b.PRICE is not null
group by a.COMMUNITY_ID
having count(0) > 1
order by count(0) desc;


select *
from T_GXD_COMMUNITY_PRICE
where COMMUNITY_ID = '660424196';

select COMMUNITY_ID, PROPERTY_TYPE, PRICE_DATE, PRICE, count(0)
from T_GXD_COMMUNITY_PRICE
group by COMMUNITY_ID, PROPERTY_TYPE, PRICE_DATE, PRICE
having count(0) > 1
order by count(0) desc;

select *
from T_GXD_BUILDING;

select *
from T_GXD_PUB_DICT_VALUE;

select *
from T_GXD_FULL_DOCUMENTATION
where R = 1;

select *
from T_GXD_RESIDENCE_COEFFICIENT;

select *
from T_GXD_PUB_DICT_VALUE
where DICT_VALUE_ID = '15754250';
select *
from JNPG.T_DATA_XQ_ZZ_GXD A
WHERE A.COMMUNITY_ID = '710100340';

select *
from T_GXD_COMMUNITY_PRICE
where COMMUNITY_ID = '710100340';

select COMMUNITY_ID, PRICE, count(0)
from T_GXD_COMMUNITY_PRICE
group by COMMUNITY_ID, PRICE
having count(0) > 1;

select *
from T_GXD_RESIDENCE_COEFFICIENT;

select *
from t_gxd_BUILDING
where BUILDING_ID in (select DATA_ID
                      from T_GXD_RESIDENCE_COEFFICIENT);

select *
from T_GXD_ADDRESS_ALIAS;

select *
from T_GXD_COMMUNITY
where COMMUNITY_ID in (select ADDRESS_ID from T_GXD_ADDRESS_ALIAS);

select a.BUILDING_ID, TGC.COMMUNITYNAME, TGC.FULL_NAME, TGB.BUILDING_NAME, a.SUMMARYASSESSMENTCOEFFICIENT
from T_GXD_BUILDING_COEFFICENT a
         left join T_GXD_BUILDING TGB on a.BUILDING_ID = TGB.BUILDING_ID
         left join T_GXD_COMMUNITY TGC on TGB.COMMUNITY_ID = TGC.COMMUNITY_ID
where tgc.COMMUNITY_ID = '438620697';

select *
from T_GXD_COMMUNITY
where COMMUNITYNAME like '%大华%';

select a.*, b.NAME, b.DICT_KEY, b.CODE
from T_GXD_COMMUNITY_PRICE a
         left join T_GXD_PUB_DICT_VALUE b on a.PROPERTY_TYPE = b.DICT_VALUE_ID
where COMMUNITY_ID = '438620697';

select *
from T_GXD_PUB_DICT_VALUE
where CODE = '5';

SELECT 1
from dual;

select *
from T_GXD_PUB_DICT_VALUE;

select *
from T_GXD_HOUSE
where UNIT_ID in (select UNIT_ID
                  from T_GXD_UNIT
                  where BUILDING_ID = '726456148');

select *
from T_GXD_PUB_DICT_VALUE;

select *
from T_GXD_HOUSE;

select *
from T_GXD_BUILDING;

create table T_GXD_BUILDING_PO as
select *
from T_GXD_BUILDING
WHERE 1 = 2;

select *
from T_GXD_BUILDING_PO;

select *
from T_GXD_AREA;

select *
from T_GXD_COMMUNITY;
select *
from T_GXD_ZRZ;

create table T_GXD_ZRZ as
select zrz.BUILDING_ID,
       zrz.COMMUNITY_ID,
       area.NAME,
       community.COMMUNITYNAME,
       community.FULL_NAME || zrz.BUILDING_NAME as  zrzzl,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGTYPE'
          and s.CODE = zrz.BUILDINGTYPE) as                        BUILDINGTYPE,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGFORM'
          and s.CODE = zrz.BUILDINGFORM) as                        BUILDINGFORM,
       tgbu.SUMMARYASSESSMENTCOEFFICIENT,
       price.PRICE_DATE,
       price.PRICE,
       trunc((price.PRICE * tgbu.SUMMARYASSESSMENTCOEFFICIENT), 2) new_price
from T_GXD_BUILDING_PO zrz
         left join T_GXD_COMMUNITY community on zrz.COMMUNITY_ID = community.COMMUNITY_ID
         left join T_GXD_AREA area on community.AREA_ID = area.AREA_ID
         left join T_GXD_BUILDING_COEFFICENT tgbu on zrz.BUILDING_ID = tgbu.BUILDING_ID
         left join (select COMMUNITY_ID,
                           PROPERTY_TYPE,
                           PRICE_DATE,
                           PRICE,
                           CONFIDENCE,
                           row_number() over (partition by COMMUNITY_ID,PRICE_DATE,PRICE order by PRICE_DATE desc ) r
                    from T_GXD_COMMUNITY_PRICE) price
                   on r = 1 and zrz.COMMUNITY_ID = PRICE.COMMUNITY_ID and PROPERTY_TYPE = zrz.DICT_FORM_ID;

select *
from T_GXD_BUILDING_PO;

update T_GXD_BUILDING_PO zrz
set zrz.DICT_FORM_ID = (select DICT_VALUE_ID
                        from T_GXD_PUB_DICT_VALUE s
                        where DICT_KEY = 'BUILDINGFORM'
                          and s.CODE = zrz.BUILDINGFORM)
where exists(select 1
             from T_GXD_PUB_DICT_VALUE s
             where DICT_KEY = 'BUILDINGFORM'
               and s.CODE = zrz.BUILDINGFORM);


select *
from T_GXD_PUB_DICT_VALUE
where DICT_VALUE_ID = '15753679';
select *
from T_GXD_COMMUNITY_PRICE
where COMMUNITY_ID = '438624108';

select *
from T_GXD_BUILDING_PO
where BUILDING_ID = '438625936';


select *
from (select COMMUNITY_ID,
             PROPERTY_TYPE,
             PRICE_DATE,
             PRICE,
             CONFIDENCE,
             TYPE_VALUE,
             row_number() over (partition by COMMUNITY_ID,PRICE_DATE,PRICE order by PRICE_DATE desc ) r
      from T_GXD_COMMUNITY_PRICE)
where r = 1
  and COMMUNITY_ID = '438624108';







