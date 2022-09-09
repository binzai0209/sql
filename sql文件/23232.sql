select id

from T_BASE_COMMUNITY
where COMMUNITY = '°ÂÊ¢´óÏÃ';

select *
from V_COMMUNITY_GL_ZRZ
where COMMUNITY_ID = '9292e1f349ca4f538db6e639cd1a77aa';
select *
from T_BASE_ZRZ_XZ
where ZDBDCDYID in (select ZD_ID
                    from T_COMMTY_GL_ZD
                    where COMMUNITY_ID = '9292e1f349ca4f538db6e639cd1a77aa');
select distinct FWYT4
from T_BASE_H_XZ
where ZRZBDCDYID = '851760';

select *
from T_COMMUNITY_YT
where COMMUNITY_ID = '9292e1f349ca4f538db6e639cd1a77aa';



select a.COMMUNITY, a.id
from T_BASE_COMMUNITY a
         left join TX_COMMUNITY_A c on c.COMMUNITY_ID = a.ID
where a.SFSH = '2' and SFLD = '1'
  and c.COMMUNITY_ID is null
  and a.DEL_FLAG = '0';


select a.COMMUNITY, a.id
from T_BASE_COMMUNITY a
         left join T_COMMTY_GL_ZD b on a.ID = b.COMMUNITY_ID
         left join TX_SHYQZD_XZ c on c.BDCDYID = b.ZD_ID
where a.SFSH = '1' and SFLD = '1'
  and c.BDCDYID is null
  and a.DEL_FLAG = '0';


