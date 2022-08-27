select *
from T_BEV_TASK_SCOPE;

select *
from T_BEV_SCOPE_GROUP_DATA;


select *
from T_BEV_SCOPE_GROUP;


SELECT ID
FROM T_BEV_TASK_SCOPE
WHERE 1 = 1
  and id in (select SCOPE_ID
             from T_BEV_SCOPE_GROUP_DATA
             where GROUP_ID in (SELECT Id
                                FROM T_BEV_SCOPE_GROUP
                                START WITH ID = '1'
                                Connect BY Prior ID = PARENT_ID))
  -- and zl like ?
order by qxdm, zl;



select a.*, c.GROUP_NAME, c.ID, c.PARENT_ID
from T_BEV_TASK_SCOPE a
         left join T_BEV_SCOPE_GROUP_DATA b on a.ID = b.SCOPE_ID
         left join T_BEV_SCOPE_GROUP c on c.id = b.GROUP_ID
where c.ID in (SELECT Id
               FROM T_BEV_SCOPE_GROUP
               START WITH ID = '1'
               Connect BY Prior ID = PARENT_ID)
  and b.SCOPE_ID is not null;



select a.*, c.GROUP_NAME
from T_BEV_TASK_SCOPE a
         left join T_BEV_SCOPE_GROUP_DATA b on a.ID = b.SCOPE_ID
         left join T_BEV_SCOPE_GROUP c on c.id = b.GROUP_ID
where a.task_id = '413634990174779077'
  and b.SCOPE_ID is not null
order by qxdm, zl;

select *
from T_BEV_SCOPE_GROUP;

select *
from T_BEV_GROUP_STANDARD ;

select *
from T_BASE_COMMUNITY;

select *
from T_BEV_SCOPE_GROUP;




