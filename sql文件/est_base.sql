-- 数据表
truncate table T_YW_SURVEYDATA_H;
truncate table T_YW_SURVEYDATA_ZRZ;
truncate table T_YW_SURVEYDATA_ZD;
truncate table T_YW_SURVEYDATA_COMMUNITY;
-- 审核表
truncate table T_YW_DATA_REVIEW;
-- 文件
truncate table T_YW_SURVEY_FILE;
-- 规则检查结果表
truncate table T_YW_SURVEY_FIELD;

-- 勘查结果表
truncate table T_YW_SURVEY_FIELD_VALUE;
-- 任务表
truncate table T_YW_SURVEY_TASK;
-- 勘查数据表
truncate table T_YW_SURVEY_DATACHECK;
-- 勘查关联规则表
truncate table T_YW_CHECK_RULE;
truncate table T_CHECK_GL_RULE;
-- 检查结果表
truncate table T_CHK_RECORD_INFO;
-- 流程表
truncate table T_WORKFLOW_ACTINST;


select *
from T_YW_SURVEY_TASK;


select *
from T_SCAN_TASK;


-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

-- 杀掉被锁住的表
ALTER system kill session '223, 27797';

select *
from T_YW_DATA_REVIEW;


select *
from T_YW_SURVEY_FIELD_VALUE;

select *
from T_YW_SURVEY_TASK
where ID = '20d2ac4042a4451883e8b3c39862b062';


select *
from T_YW_DATA_REVIEW
where CHK_ID = 'cf03fc0e51f14ad58ede9b1364eedd05';

select CHECK_ID
from T_YW_SURVEY_TASK
where CHECK_ID = '32bf1c9ed8cb4cb2b013ba67df975a7f';

select *
from T_YW_SURVEY_FIELD
where CHECK_ID = 'e98119d55efe43338f1ce1645a160a7c';

select *
from T_YW_SURVEY_FIELD_VALUE
where CHECK_ID = 'e98119d55efe43338f1ce1645a160a7c';

select *
from T_PRICE_ZRZ;

select id,
       hbdcdyid,
       zrzbdcdyid,
       zdbdcdyid,
       community_id,
       TASK_LEVEL,
       task_name,
       task_desc,
       object_type,
       zl,
       actflag,
       investigator_id,
       investigator_name,
       client,
       client_idnum,
       sfqlr,
       result,
       investigator_sign,
       client_sign,
       qlr_sign,
       create_user,
       create_time,
       CHECK_ID,
       del_flag,
       actinstid,
       pub_time,
       accept_time,
       phone,
       homeowner,
       dep_id,
       task_yt,
       task_type
from t_yw_survey_task
where id = '25de69d750714b058a8c04420c0b6a56';

select *
from T_YW_SURVEY_TASK
where TASK_NAME = '2222';

update T_YW_SURVEY_TASK
set ACTINSTID = 242,
    ACTFLAG   = 300
where ID = 'f2b062b78b104cfca1c242324bdc1b6c';

select *
from EST_BASE.T_WORKFLOW_ACTINST
where TASKID = 'f2b062b78b104cfca1c242324bdc1b6c';

delete
from T_YW_SURVEY_FIELD_VALUE
where TASKID = 'f2b062b78b104cfca1c242324bdc1b6c';

select *
from T_WORKFLOW_ACTINST;

delete
from T_WORKFLOW_ACTINST
where TASKID in (select id
                 from T_YW_SURVEY_TASK
                 where TASK_NAME like '%测试%');

select *
from T_WORKFLOW_ACTINST
where TASKID = 'acf3941b7e3c498c961f209e374f9bef';

delete
from T_CHECK_GL_RULE
where CHECK_ID in (select ID
                   from T_YW_SURVEY_DATACHECK
                   where COMMUNITY_ID in (select COMMUNITY_ID
                                          from T_YW_SURVEY_TASK
                                          where TASK_NAME like '%测试%'));

select ID
from T_YW_SURVEY_DATACHECK
where COMMUNITY_ID in (select COMMUNITY_ID
                       from T_YW_SURVEY_TASK
                       where TASK_NAME like '%测试%');

select id
from T_YW_SURVEY_TASK
where TASK_NAME like '%测试%';

select ZL
from T_YW_SURVEYDATA_COMMUNITY;

-- 查看被锁住的表
SELECT object_name, machine, s.sid, s.serial#
FROM gv$locked_object l,
     dba_objects o,
     gv$session s
WHERE l.object_id　 = o.object_id
  AND l.session_id = s.sid;

-- 杀掉被锁住的表
ALTER system kill session '101, 65487';

select distinct id
from TESTTALE
order by id desc;

select *
from TESTTALE;

select *
from T_SCAN_TASK;

select *
from T_SCAN_SCOPE;

truncate table T_SCAN_SCOPE;


select lower(dt.table_name) as table_name,
       dtc.comments         as table_comment,
       uo.created           as create_time,
       uo.last_ddl_time     as update_time
from user_tables dt,
     user_tab_comments dtc,
     user_objects uo
where dt.table_name = dtc.table_name
  and dt.table_name = uo.object_name
  and uo.object_type = 'TABLE'
  AND dt.table_name NOT LIKE 'QRTZ_%'
  AND dt.table_name NOT LIKE 'GEN_%'
  AND dt.table_name NOT IN (select table_name from gen_table)
  and lower(dt.table_name) in ('T_SCAN_TASK');


select *
from T_YS_CHK_LIST;

select *
from T_YS_CHK_RULE;

update T_YS_CHK_RULE a
set table_name = (select TABLE_NAME
                  from T_YS_CHK_LIST b
                  where a.CHK_LIST_ID = b.ID)
where EXISTS(select 1
             from T_YS_CHK_LIST b
             where a.CHK_LIST_ID = b.ID);

select *
from T_YS_CHK_LIST;

select *
from T_YS_CHK_RULE where CHK_LIST_ID = 'd505c1d946134c41ac2c22dfe39949ef';

   select
        id,
               chk_list_id,
               xh,
               value_type,
               regular_expression,
               labeltype,
               field_name,
               field_declare,
               is_not_null,
               field_length,
               digits_length,
               table_name,
               repetition_chk,
               gl_rule,
               gl_rule_ori,
               gl_method,
               gl_field,
               enum_chk,
               constant_value,
               value_range,
               gl_shp,
               column_type,
               java_type,
               java_field,
               field_sort
    from
        t_ys_chk_rule where CHK_LIST_ID = 'd505c1d946134c41ac2c22dfe39949ef';


select *
from T_SCAN_TASK;

select distinct COMMUNITY_ID
from T_SCAN_SCOPE;

select count(0)
from T_SCAN_SCOPE;

select count(0)
from T_CHK_RECORD_INFO where CHK_ID = 'd505c1d946134c41ac2c22dfe39949ef';

delete
from T_CHK_RECORD_INFO where
 CHK_ID = 'd505c1d946134c41ac2c22dfe39949ef';

select *
from T_SCAN_SCOPE;

select *
from T_SCAN_TASK;

select *
from T_CHK_RECORD_INFO where CHK_ID = 'd505c1d946134c41ac2c22dfe39949ef' ;

select *
from T_SCAN_SCOPE;

select *
from T_CHK_RECORD_INFO;

select *
from T_YW_SURVEYDATA_COMMUNITY;

select *
from T_CHK_RECORD_INFO;

select *
from T_SCAN_SCOPE;

-- 查看路径
SELECT T.TABLESPACE_NAME,
       D.FILE_NAME,
       D.AUTOEXTENSIBLE,
       D.BYTES,
       D.MAXBYTES,
       D.STATUS
FROM DBA_TABLESPACES T,
     DBA_DATA_FILES D
WHERE T.TABLESPACE_NAME = D.TABLESPACE_NAME
ORDER BY TABLESPACE_NAME, FILE_NAME;

select FIELD_NAME,count(0)
from t_chk_record_info
WHERE chk_id = 'd505c1d946134c41ac2c22dfe39949ef' group by FIELD_NAME;

select *
from T_SCAN_TASK;

select *
from t_chk_record_info;
