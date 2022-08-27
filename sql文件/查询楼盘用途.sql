-- 根据楼盘名称查询楼盘id
select id
from T_BASE_COMMUNITY
where COMMUNITY = '东泰凯悦中心';
-- 根据楼盘id查询宗地id
select ZD_ID
from T_COMMTY_GL_ZD
where COMMUNITY_ID = '356301252696510029';
-- 根据楼盘id查询自然幢id
select *
from T_COMMTY_GL_ZRZ
where COMMUNITY_ID = '356301252696510029';
-- 根据自然幢id查询户的用途
select zl, ZRZBDCDYID, SCJZMJ, FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID in (select T_BASE_ZRZ_XZ.BDCDYID
                     from T_BASE_ZRZ_XZ
                     where ZDBDCDYID = '59f739a6-756b-4e14-9ca5-16a864a27093');

select *
from T_BASE_ZRZ_XZ
where ZDBDCDYID = '59f739a6-756b-4e14-9ca5-16a864a27093';