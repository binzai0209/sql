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
from T_YS_CHK_RULE
where CHK_LIST_ID = 'd505c1d946134c41ac2c22dfe39949ef';

select id,
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
from t_ys_chk_rule
where CHK_LIST_ID = 'd505c1d946134c41ac2c22dfe39949ef';


select *
from T_SCAN_TASK;

select distinct COMMUNITY_ID
from T_SCAN_SCOPE;

select count(0)
from T_SCAN_SCOPE;

select count(0)
from T_CHK_RECORD_INFO
where CHK_ID = 'd505c1d946134c41ac2c22dfe39949ef';

delete
from T_CHK_RECORD_INFO
where CHK_ID = 'd505c1d946134c41ac2c22dfe39949ef';

select *
from T_SCAN_SCOPE;

select *
from T_SCAN_TASK;

select *
from T_CHK_RECORD_INFO
where CHK_ID = 'd505c1d946134c41ac2c22dfe39949ef';

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

select FIELD_NAME, count(0)
from t_chk_record_info
WHERE chk_id = 'd505c1d946134c41ac2c22dfe39949ef'
group by FIELD_NAME;

select *
from T_SCAN_TASK;

select *
from t_chk_record_info;

select *
from T_YW_SURVEY_TASK
where TASK_NAME like '%1214%';

select *
from T_YW_SURVEYDATA_H
where BDCDYID = '37329701';

select *
from t_ys_chk_rule;


select *
from T_CHK_RECORD_INFO
where BDCDYID = '51592564';

-- e58f15ef67fc410896d41e14a70136c1
select *
from T_CHK_RECORD_INFO
where CHK_ID = 'e58f15ef67fc410896d41e14a70136c1';

select *
from t_yw_check_rule;

select *
from T_YW_SURVEY_TASK
where TASK_NAME like '%1214%';

select *
from T_YW_SURVEYDATA_H
where BDCDYID = '51592564';

SELECT *
FROM (SELECT TMP_PAGE.*,
             ROWNUM PAGEHELPER_ROW_ID
      FROM (SELECT a.id,
                   a.hbdcdyid,
                   a.zrzbdcdyid,
                   a.zdbdcdyid,
                   a.community_id,
                   a.task_name,
                   a.object_type,
                   a.zl,
                   a.investigator_id,
                   a.investigator_name,
                   a.client,
                   a.client_idnum,
                   a.sfqlr,
                   a.result,
                   a.investigator_sign,
                   a.client_sign,
                   a.qlr_sign,
                   a.create_user,
                   a.create_time,
                   a.check_id,
                   a.task_desc,
                   a.actflag,
                   a.pub_time,
                   a.del_flag,
                   a.TASK_LEVEL,
                   a.ACTINSTID,
                   a.ACCEPT_TIME,
                   b.field_total,
                   a.PHONE,
                   a.TASK_TYPE,
                   a.DEP_ID,
                   a.TASK_YT,
                   a.smx,
                   a.smy,
                   a.HOMEOWNER
            FROM t_yw_survey_task a
                     LEFT JOIN
                 (SELECT taskid,
                         count(1) field_total
                  FROM T_YW_SURVEY_FIELD
                  GROUP BY taskid) b
                 ON a.ID = b.TASKID
            WHERE a.actflag = '200'
            order by create_time desc) TMP_PAGE)
WHERE PAGEHELPER_ROW_ID <= 10
  AND PAGEHELPER_ROW_ID > 0;



SELECT count(0)
FROM t_yw_survey_task a
         LEFT JOIN
     (SELECT taskid,
             count(1) field_total
      FROM T_YW_SURVEY_FIELD
      GROUP BY taskid) b
     ON a.ID = b.TASKID
WHERE a.actflag = '200';



SELECT *
FROM (SELECT TMP_PAGE.*,
             ROWNUM PAGEHELPER_ROW_ID
      FROM (SELECT a.id,
                   a.hbdcdyid,
                   a.zrzbdcdyid,
                   a.zdbdcdyid,
                   a.community_id,
                   a.task_name,
                   a.object_type,
                   a.zl,
                   a.investigator_id,
                   a.investigator_name,
                   a.client,
                   a.client_idnum,
                   a.sfqlr,
                   a.result,
                   a.investigator_sign,
                   a.client_sign,
                   a.qlr_sign,
                   a.create_user,
                   a.create_time,
                   a.check_id,
                   a.task_desc,
                   a.actflag,
                   a.pub_time,
                   a.del_flag,
                   a.TASK_LEVEL,
                   a.ACTINSTID,
                   a.ACCEPT_TIME,
                   b.field_total,
                   a.PHONE,
                   a.TASK_TYPE,
                   a.DEP_ID,
                   a.TASK_YT,
                   a.smx,
                   a.smy,
                   a.HOMEOWNER
            FROM t_yw_survey_task a
                     LEFT JOIN
                 (SELECT taskid,
                         count(1) field_total
                  FROM T_YW_SURVEY_FIELD
                  GROUP BY taskid) b
                 ON a.ID = b.TASKID
            WHERE a.actflag = '200'
            order by create_time desc) TMP_PAGE)
WHERE PAGEHELPER_ROW_ID <= 10
  AND PAGEHELPER_ROW_ID > 0;


select *
from T_YW_SURVEY_TASK;

select *
from T_PRICE_ZRZ
where ZZFSYT is not null;

select *
from T_PRICE_ZRZ
where PRICE is null;

select ZL
from T_BASE_ZRZ_XZ
where BDCDYID = 'aa32941d-4567-46a3-b977-64e791d7902a';

select *
from H_PRICE_20221207;

-- h_price主键序列
create sequence seq_h_price
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- zrz_price主键序列
create sequence seq_zrz_price
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- e0027d4a0db94dec833c8648227fd6f4

select *
from T_YS_CHK_LIST;

insert into T_YS_CHK_RULE (id, chk_list_id, xh, field_name, field_declare, is_not_null, field_length, digits_length,
                           repetition_chk, gl_field, gl_method, gl_rule_ori, gl_rule, enum_chk, constant_value,
                           value_range, gl_shp, column_type, java_type, java_field, labeltype, field_sort, table_name,
                           value_type, regular_expression)
select id,
       'e0027d4a0db94dec833c8648227fd6f4',
       xh,
       field_name,
       field_declare,
       is_not_null,
       field_length,
       digits_length,
       repetition_chk,
       gl_field,
       gl_method,
       gl_rule_ori,
       gl_rule,
       enum_chk,
       constant_value,
       value_range,
       gl_shp,
       column_type,
       java_type,
       java_field,
       labeltype,
       field_sort,
       table_name,
       value_type,
       regular_expression
from T_YS_CHK_RULE
where CHK_LIST_ID in ('1', '2', '3', '4');
select distinct TABLE_NAME
from T_YS_CHK_RULE
where CHK_LIST_ID in ('1', '2', '3', '4');

select *
from T_YW_CHECK_RULE
where CHECK_ID = '068a815ca9104f798865718d5329c276';

select *
from T_YW_SURVEY_TASK
where HBDCDYId = '51592564';

select *
from T_YW_SURVEY_TASK
where CHECK_ID = 'd17403f2647f4bb4b0f4d0043e4debc3';
select *
from T_YW_SURVEY_TEMPLATE;

select *
from T_YW_SURVEY_FIELD
where OBJECT_TYPE in ('h', 'community', 'zrz', 'zd');

truncate table T_YW_SURVEY_RULE;

select *
from T_YW_SURVEY_RULE
where SURVEY_TEMPLATE_ID = 11;

insert into T_YW_SURVEY_RULE (id, survey_template_id, field_name, field_desc, table_name)
select sys_guid(), 11, FIELD_NAME, FIELD_NAME_DESC, OBJECT_TYPE
from T_YW_SURVEY_FIELD_OPTION
where OBJECT_TYPE in ('h', 'zrz', 'zd', 'community');


insert into T_YW_SURVEY_RULE (id, survey_template_id, field_name, field_desc, table_name)
select sys_guid(), 10, FIELD_NAME, FIELD_NAME_DESC, OBJECT_TYPE
from T_YW_SURVEY_FIELD_OPTION
where OBJECT_TYPE in ('h', 'zrz', 'zd', 'community');

select *
from T_YW_SURVEY_FIELD
where OBJECT_TYPE = 'h';


-- t_yw_survey_template主键序列
create sequence seq_t_yw_survey_template
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- t_yw_survey_rule主键序列
create sequence seq_t_yw_survey_rule
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


select id,
       bdcdyid,
       object_type,
       type,
       enumname,
       fieldname,
       fieldnamedesc,
       chkrules,
       chkrulesdesc,
       check_id,
       taskid,
       create_time,
       create_by,
       update_time,
       update_by,
       field_sort,
       DEFAULT_VALUE
from t_yw_survey_field a
         left join
     (select DICT_SORT,
             DICT_VALUE,
             DICT_LABEL
      from EST_FRAMEWORK.SYS_DICT_DATA
      where DICT_TYPE = 'est_obj_lower') b
     on a.object_type = b.dict_value
order by b.dict_sort,
         a.field_sort;

select *
from t_yw_data_review;

select *
from T_YW_SURVEY_TASK
order by CREATE_TIME desc;

select *
from DICT;

select *
from T_YW_SURVEY_TASK;

select *
from T_BASE_SQ;

select *
from t_yw_check_rule;

select *
from t_ys_chk_rule;

select *
from T_YW_SURVEY_TASK
where TASK_NAME = '145测试';
select *
from (select a.*, row_number() over (partition by TASKID, ACTNAME order by STARTTIME desc ) r
      from T_WORKFLOW_ACTINST a)
where r = 1
  and TASKID = '8f4eee50e96043ce932ca653f0cbfc86';

select *
from T_YW_SURVEY_TASK
where id = '8f4eee50e96043ce932ca653f0cbfc86';

select id
from T_YW_SURVEY_TASK
where TASK_NAME = '勘察鲁商国奥城';

select *
from t_yw_survey_field
where TASKID = '3d0372ed57b645a6a4ba39fd0582df27';

select *
from T_YW_SURVEY_FILE;

select id, count(0)
from T_YS_CHK_RULE
group by ID
having count(0) > 1;

select *
from T_YS_CHK_RULE
where ID = '6676f031a83c4941a7a0453d98470933';

select *
from t_base_index;

truncate table T_BASE_INDEX;

select *
from T_SCAN_SCOPE;

select *
from t_yw_survey_rule
where TABLE_NAME in (null, 'h', 'zrz');

select *
from t_yw_survey_task;


select a.id,
       a.hbdcdyid,
       a.zrzbdcdyid,
       a.zdbdcdyid,
       a.community_id,
       a.task_name,
       a.object_type,
       a.zl,
       a.investigator_id,
       a.investigator_name,
       a.client,
       a.client_idnum,
       a.sfqlr,
       a.result,
       a.investigator_sign,
       a.client_sign,
       a.qlr_sign,
       a.create_user,
       a.create_time,
       a.check_id,
       a.task_desc,
       a.actflag,
       a.pub_time,
       a.del_flag,
       a.TASK_LEVEL,
       a.ACTINSTID,
       a.ACCEPT_TIME,
       b.field_total,
       a.PHONE,
       a.TASK_TYPE,
       a.DEP_ID,
       a.TASK_YT,
       a.smx,
       a.smy,
       a.HOMEOWNER
from t_yw_survey_task a
         left join (select taskid, count(1) field_total from T_YW_SURVEY_FIELD group by taskid) b on a.ID = b.TASKID
WHERE a.actflag in ('410', '420')
  and TASK_TYPE = '1'
order by a.create_time desc
