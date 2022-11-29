select *
from SYS_USER;

select *
from SYS_DEPT;

select *
from sys_menu where MENU_NAME like '%楼盘采集%';

select *
from SYS_DICT_DATA where DICT_TYPE = 'est_data_source' ;

select *
from SYS_DEPT;


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
  AND dt.table_name NOT IN (select table_name
                            from gen_table)
  and lower(dt.table_name) in (
    't_bev_result_record'
    );



create table T_FILE_PATH_REALESTATE
(
    ID               NUMBER(32) not null
        primary key,
    RE_TYPE          VARCHAR2(10),
    YW_ID            VARCHAR2(100),
    FILE_ORIGINNAME  VARCHAR2(600),
    FILE_NAME        VARCHAR2(300),
    FILE_FORMAT      VARCHAR2(100),
    FILE_PATH        VARCHAR2(500),
    FILE_SIZE        NUMBER(32),
    FILE_DESC        VARCHAR2(600),
    XH               NUMBER(3),
    FILE_UPLOAD_DATE DATE,
    FILE_UPLOAD_USER VARCHAR2(100)
)
/

comment on table T_FILE_PATH_REALESTATE is '不动产单元相关文件表'
/

comment on column T_FILE_PATH_REALESTATE.ID is '主键'
/

comment on column T_FILE_PATH_REALESTATE.RE_TYPE is '不动产单元类型:H,ZRZ;ZD;COMMUNITY'
/

comment on column T_FILE_PATH_REALESTATE.FILE_ORIGINNAME is '文件原始名'
/

comment on column T_FILE_PATH_REALESTATE.FILE_NAME is '文件存储名'
/

comment on column T_FILE_PATH_REALESTATE.FILE_FORMAT is '文件类型(后缀)'
/

comment on column T_FILE_PATH_REALESTATE.FILE_PATH is '文件存储路径'
/

comment on column T_FILE_PATH_REALESTATE.FILE_SIZE is '文件大小'
/

comment on column T_FILE_PATH_REALESTATE.FILE_DESC is '文件描述'
/

comment on column T_FILE_PATH_REALESTATE.XH is '序号'
/

comment on column T_FILE_PATH_REALESTATE.FILE_UPLOAD_DATE is '文件上传人'
/





-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2605, '不动产单元相关文件', '2005', '1', '/datamanagerplate/realestate', 'C', '0', 'datamanagerplate:realestate:view', '#', 'admin', sysdate, '', null, '不动产单元相关文件菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '不动产单元相关文件查询', 2605, '1',  '#',  'F', '0', 'datamanagerplate:realestate:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '不动产单元相关文件新增', 2605, '2',  '#',  'F', '0', 'datamanagerplate:realestate:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '不动产单元相关文件修改', 2605, '3',  '#',  'F', '0', 'datamanagerplate:realestate:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '不动产单元相关文件删除', 2605, '4',  '#',  'F', '0', 'datamanagerplate:realestate:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '不动产单元相关文件导出', 2605, '5',  '#',  'F', '0', 'datamanagerplate:realestate:export',       '#', 'admin', sysdate, '', null, '');

-- t_file_path_realestate主键序列
create sequence seq_t_file_path_realestate
increment by 1
start with 10
nomaxvalue
nominvalue
cache 20;



-- auto-generated definition
create table T_DATA_TQJG_ZRZ
(
    BDCDYID       NVARCHAR2(50) not null,
    XMMC          NVARCHAR2(255),
    BDCDYH        NVARCHAR2(50),
    XMBH          NVARCHAR2(50),
    ZDDM          NVARCHAR2(19),
    ZDBDCDYID     NVARCHAR2(50),
    ZRZH          NVARCHAR2(50),
    ZL            NVARCHAR2(200),
    JGRQ          DATE,
    ZCS           NUMBER(38),
    DSCS          NUMBER(38),
    DXCS          NUMBER(38),
    GHYT          NVARCHAR2(10),
    FWJG          NVARCHAR2(10),
    ZTS           NUMBER(38),
    QXDM          NVARCHAR2(6),
    QXMC          NVARCHAR2(200),
    BDCDYH_NEW    VARCHAR2(50),
    BDCDYH_OLD    VARCHAR2(50),
    ZDBDCDYID_NEW VARCHAR2(50),
    JZJG          NVARCHAR2(26),
    TQZH          VARCHAR2(50),
    FWYT1         VARCHAR2(100),
    FWYT2         VARCHAR2(100),
    FWYT3         VARCHAR2(100),
    FWYT4         VARCHAR2(100),
    FWYT5         VARCHAR2(100),
    CLZT          VARCHAR2(2),
    QSZT          VARCHAR2(2),
    ID            VARCHAR2(32),
    SFWQ          VARCHAR2(2),
    DEL_FLAG      VARCHAR2(10),
    UPDATE_FLAG   VARCHAR2(2)
)
/
-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2621, '自然幢用途', '2005', '1', '/datamanagerplate/zrzyt', 'C', '0', 'datamanagerplate:zrzyt:view', '#', 'admin', sysdate, '', null, '自然幢用途菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢用途查询', 2621, '1',  '#',  'F', '0', 'datamanagerplate:zrzyt:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢用途新增', 2621, '2',  '#',  'F', '0', 'datamanagerplate:zrzyt:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢用途修改', 2621, '3',  '#',  'F', '0', 'datamanagerplate:zrzyt:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢用途删除', 2621, '4',  '#',  'F', '0', 'datamanagerplate:zrzyt:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢用途导出', 2621, '5',  '#',  'F', '0', 'datamanagerplate:zrzyt:export',       '#', 'admin', sysdate, '', null, '');



