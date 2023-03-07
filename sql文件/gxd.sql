select zrz.BUILDING_ID,
       zrz.COMMUNITY_ID,
       area.NAME,
       community.COMMUNITYNAME,
       community.FULL_NAME || zrz.BUILDING_NAME as                 zrzzl,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGTYPE'
          and s.CODE = zrz.BUILDINGTYPE)        as                 BUILDINGTYPE,
       (select NAME
        from T_GXD_PUB_DICT_VALUE s
        where DICT_KEY = 'BUILDINGFORM'
          and s.CODE = zrz.BUILDINGFORM)        as                 BUILDINGFORM,
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
from T_GXD_HOUSE;

select *
from T_GXD_H
where hPrice is not null;

select *
from T_GXD_ZRZ where PRICE is not null ;

-- 总量 2242779 无总层数 203844 无所在层 18609
select *
from T_GXD_HOUSE
where CURRENTFLOOR is not null
  and TOTALFLOOR is not null
order by TOTALFLOOR desc;



select *
from T_GXD_H
where COMMUNITY_ID = '438617131';

select *
from T_GXD_RESIDENCE_COEFFICIENT
where DATA_ID = '438617131';

select COMMUNITY_ID,count(0)
from T_GXD_COMMUNITY_PRICE group by COMMUNITY_ID,PRICE_DATE,PRICE having count(0) > 1 order by count(0) desc ;

select *
from T_GXD_COMMUNITY_PRICE where COMMUNITY_ID = '587388141';

select *
from T_GXD_ZRZ
where COMMUNITY_ID = '438617131';

create table T_GXD_H as
select a.*,
       b.USEOF,
       b.C_VALUE,
       b.CODE,
       trunc(PRICE * C_VALUE, 2)     as hPrice,
       trunc(NEW_PRICE * C_VALUE, 2) as hNewPrice
from (select h.HOUSE_ID,
             zrz.NAME,
             zrz.BUILDING_ID,
             zrz.COMMUNITY_ID,
             zrz.ZRZZL || h.HOUSE_NAME hzl,
             h.CURRENTFLOOR,
             h.TOTALFLOOR,
             h.ASPECT,
             zrz.PRICE,
             zrz.NEW_PRICE
      from T_GXD_HOUSE h
               left join T_GXD_UNIT u on h.UNIT_ID = u.UNIT_ID
               left join T_GXD_ZRZ zrz on u.BUILDING_ID = zrz.BUILDING_ID) a
         left join T_GXD_RESIDENCE_COEFFICIENT b
                   on a.COMMUNITY_ID = b.DATA_ID and a.CURRENTFLOOR = b.MIN_VALUE and a.TOTALFLOOR = b.MAX_VALUE;

-- 2242779 2243629
select count(0)
from T_GXD_HOUSE;

select HOUSE_ID, count(0)
from (select a.*, b.USEOF, b.C_VALUE, b.CODE
      from (select h.HOUSE_ID,
                   zrz.NAME,
                   zrz.BUILDING_ID,
                   zrz.COMMUNITY_ID,
                   zrz.ZRZZL || h.HOUSE_NAME hzl,
                   h.CURRENTFLOOR,
                   h.TOTALFLOOR,
                   h.ASPECT,
                   zrz.PRICE,
                   zrz.NEW_PRICE
            from T_GXD_HOUSE h
                     left join T_GXD_UNIT u on h.UNIT_ID = u.UNIT_ID
                     left join T_GXD_ZRZ zrz on u.BUILDING_ID = zrz.BUILDING_ID) a
               left join T_GXD_RESIDENCE_COEFFICIENT b
                         on a.COMMUNITY_ID = b.DATA_ID and a.CURRENTFLOOR = b.MIN_VALUE and a.TOTALFLOOR = b.MAX_VALUE)
group by HOUSE_ID
having count(0) > 1;

select *
from T_GXD_H where HOUSE_ID = '488110899';


select h.HOUSE_ID,
--        zrz.NAME,
--        zrz.BUILDING_ID,
--        zrz.COMMUNITY_ID,
--        zrz.ZRZZL || h.HOUSE_NAME hzl,
       h.CURRENTFLOOR,
       h.TOTALFLOOR
--        h.ASPECT,
--        zrz.PRICE,
--        zrz.NEW_PRICE
from T_GXD_HOUSE h
         left join T_GXD_UNIT u on h.UNIT_ID = u.UNIT_ID;
--          left join T_GXD_ZRZ zrz on u.BUILDING_ID = zrz.BUILDING_ID;
select *
from T_GXD_ZRZ
where BUILDING_ID in (select BUILDING_ID
                      from T_GXD_ZRZ
                      group by BUILDING_ID
                      having count(0) > 1);

select *
from T_GXD_COMMUNITY_PRICE
where COMMUNITY_ID = '438623671';
select BUILDING_ID
from T_GXD_ZRZ
group by BUILDING_ID
having count(0) > 1;


select *
from T_GXD_RESIDENCE_COEFFICIENT
where DATA_ID = '1';

select *
from T_GXD_COMMUNITY
where COMMUNITY_ID in (select DATA_ID
                       from T_GXD_RESIDENCE_COEFFICIENT);


-- 5858
select a.ADDRESS_ID,
       a.COMMUNITY_ID,
       a.STREET_NAME,
       a.STREET_NUMBER_NAME,
       b.SN_ID,
       b.ADDRESS_ID,
       b.STREET_NAME,
       b.STREET_NUMBER
from T_GXD_STREET a
         left join T_GXD_STREET_NUMBER b on a.COMMUNITY_ID = b.ADDRESS_ID;


-- 路号
select distinct COMMUNITY_ID, STREET_NAME, STREET_NUMBER_NAME, STREET_NAME || STREET_NUMBER_NAME
from (select a.COMMUNITY_ID,
             a.STREET_NAME,
             a.STREET_NUMBER_NAME
      from T_GXD_STREET a
      union all
      select b.ADDRESS_ID as COMMUNITY_ID,
             b.STREET_NAME,
             b.STREET_NUMBER
      from T_GXD_STREET_NUMBER b)
;



