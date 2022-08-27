select *
from SYS_USER;

select *
from SYS_DEPT;

-- auto-generated definition
create table T_CHECK_GL_RULE
(
    ID        NUMBER not null
        constraint T_CHECK_GL_RULE_PK
            primary key,
    CHECK_ID  VARCHAR2(50),
    H         VARCHAR2(10),
    ZRZ       VARCHAR2(10),
    ZD        VARCHAR2(10),
    COMMUNITY VARCHAR2(20)
)
/

comment on table T_CHECK_GL_RULE is '检查关联规则表'
/

comment on column T_CHECK_GL_RULE.CHECK_ID is '检查id'
/

comment on column T_CHECK_GL_RULE.H is '户规则'
/

comment on column T_CHECK_GL_RULE.ZRZ is '自然幢id'
/

comment on column T_CHECK_GL_RULE.ZD is '宗地规则'
/

comment on column T_CHECK_GL_RULE.COMMUNITY is '楼盘规则'
/



-- auto-generated definition
create table T_BASE_PQ
(
    ID          VARCHAR2(32) not null
        primary key,
    SSJWH       VARCHAR2(255),
    FBSJ        DATE,
    PQMC        VARCHAR2(255),
    PQDZ        VARCHAR2(255),
    PQXZ        VARCHAR2(255),
    PQNZ        VARCHAR2(255),
    PQBZ        VARCHAR2(255),
    ZYDMJ       NUMBER(20, 2),
    JSYDMJ      NUMBER(20, 2),
    JSYDZB      VARCHAR2(255),
    FJSYDMJ     NUMBER(20, 2),
    FJSYDZB     VARCHAR2(255),
    PQZDGN      VARCHAR2(4000),
    SSFQ        VARCHAR2(200),
    BADW        VARCHAR2(200),
    XMFZR       VARCHAR2(200),
    RKRY        VARCHAR2(200),
    RKSJ        DATE,
    CREATE_USER VARCHAR2(200),
    CREATE_TIME DATE,
    UPDATE_USER VARCHAR2(200),
    UPDATE_TIME DATE,
    PQDJ        VARCHAR2(20)
)
/

comment on column T_BASE_PQ.ID is '主键'
/

comment on column T_BASE_PQ.SSJWH is '所属居委会'
/

comment on column T_BASE_PQ.FBSJ is '发布时间'
/

comment on column T_BASE_PQ.PQMC is '片区名称'
/

comment on column T_BASE_PQ.PQDZ is '片区东至'
/

comment on column T_BASE_PQ.PQXZ is '片区西至'
/

comment on column T_BASE_PQ.PQNZ is '片区南至'
/

comment on column T_BASE_PQ.PQBZ is '片区北至'
/

comment on column T_BASE_PQ.ZYDMJ is '总用地面积'
/

comment on column T_BASE_PQ.JSYDMJ is '建设用地面积'
/

comment on column T_BASE_PQ.JSYDZB is '建设用地占比'
/

comment on column T_BASE_PQ.FJSYDMJ is '非建设用地面积'
/

comment on column T_BASE_PQ.FJSYDZB is '非建设用地占比'
/

comment on column T_BASE_PQ.PQZDGN is '片区主导功能'
/

comment on column T_BASE_PQ.SSFQ is '所属商圈
'
/

comment on column T_BASE_PQ.BZDW is '标注单位'
/

comment on column T_BASE_PQ.XMFZR is '项目负责人'
/

comment on column T_BASE_PQ.RKRY is '入库人员'
/

comment on column T_BASE_PQ.RKSJ is '入库时间'
/

comment on column T_BASE_PQ.CREATE_USER is '创建人'
/

comment on column T_BASE_PQ.CREATE_TIME is '创建时间'
/

comment on column T_BASE_PQ.UPDATE_USER is '更新人'
/

comment on column T_BASE_PQ.UPDATE_TIME is '更新时间'
/

comment on column T_BASE_PQ.PQDJ is '片区等级'
/



-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2412, '片区', '2005', '1', '/datamanagerplate/pq', 'C', '0', 'datamanagerplate:pq:view', '#', 'admin', sysdate, '', null, '片区菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '片区查询', 2412, '1',  '#',  'F', '0', 'datamanagerplate:pq:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '片区新增', 2412, '2',  '#',  'F', '0', 'datamanagerplate:pq:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '片区修改', 2412, '3',  '#',  'F', '0', 'datamanagerplate:pq:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '片区删除', 2412, '4',  '#',  'F', '0', 'datamanagerplate:pq:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '片区导出', 2412, '5',  '#',  'F', '0', 'datamanagerplate:pq:export',       '#', 'admin', sysdate, '', null, '');



-- auto-generated definition
create table T_BASE_SQ
(
    ID        VARCHAR2(35) not null
        primary key,
    SQMC      VARCHAR2(255),
    SQDZ      VARCHAR2(255),
    SQXZ      VARCHAR2(255),
    SQNZ      VARCHAR2(255),
    SQBZ      VARCHAR2(255),
    PRICE     VARCHAR2(20),
    PRICEUNIT VARCHAR2(20),
    DJ        VARCHAR2(20)
)
/

comment on table T_BASE_SQ is '商圈表'
/

comment on column T_BASE_SQ.ID is '主键'
/

comment on column T_BASE_SQ.SQMC is '商圈名称'
/

comment on column T_BASE_SQ.SQDZ is '商圈东至'
/

comment on column T_BASE_SQ.SQXZ is '商圈西至'
/

comment on column T_BASE_SQ.SQNZ is '商圈南至'
/

comment on column T_BASE_SQ.SQBZ is '商圈北至'
/

comment on column T_BASE_SQ.PRICE is '商圈均价'
/

comment on column T_BASE_SQ.PRICEUNIT is '价格单位'
/

comment on column T_BASE_SQ.DJ is '商圈等级'
/



-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2421, '商圈', '2005', '1', '/datamanagerplate/sq', 'C', '0', 'datamanagerplate:sq:view', '#', 'admin', sysdate, '', null, '商圈菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '商圈查询', 2421, '1',  '#',  'F', '0', 'datamanagerplate:sq:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '商圈新增', 2421, '2',  '#',  'F', '0', 'datamanagerplate:sq:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '商圈修改', 2421, '3',  '#',  'F', '0', 'datamanagerplate:sq:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '商圈删除', 2421, '4',  '#',  'F', '0', 'datamanagerplate:sq:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '商圈导出', 2421, '5',  '#',  'F', '0', 'datamanagerplate:sq:export',       '#', 'admin', sysdate, '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2428, '楼盘', '2005', '1', '/datamanagerplate/community', 'C', '0', 'datamanagerplate:community:view', '#', 'admin', sysdate, '', null, '楼盘菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘查询', 2428, '1',  '#',  'F', '0', 'datamanagerplate:community:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘新增', 2428, '2',  '#',  'F', '0', 'datamanagerplate:community:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘修改', 2428, '3',  '#',  'F', '0', 'datamanagerplate:community:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘删除', 2428, '4',  '#',  'F', '0', 'datamanagerplate:community:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘导出', 2428, '5',  '#',  'F', '0', 'datamanagerplate:community:export',       '#', 'admin', sysdate, '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2441, '楼盘采集任务', '2005', '1', '/datamanagerplate/comm_task', 'C', '0', 'datamanagerplate:comm_task:view', '#', 'admin', sysdate, '', null, '楼盘采集任务菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务查询', 2441, '1',  '#',  'F', '0', 'datamanagerplate:comm_task:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务新增', 2441, '2',  '#',  'F', '0', 'datamanagerplate:comm_task:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务修改', 2441, '3',  '#',  'F', '0', 'datamanagerplate:comm_task:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务删除', 2441, '4',  '#',  'F', '0', 'datamanagerplate:comm_task:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务导出', 2441, '5',  '#',  'F', '0', 'datamanagerplate:comm_task:export',       '#', 'admin', sysdate, '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2428, '楼盘', '2005', '1', '/datamanagerplate/community', 'C', '0', 'datamanagerplate:community:view', '#', 'admin', sysdate, '', null, '楼盘菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘查询', 2428, '1',  '#',  'F', '0', 'datamanagerplate:community:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘新增', 2428, '2',  '#',  'F', '0', 'datamanagerplate:community:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘修改', 2428, '3',  '#',  'F', '0', 'datamanagerplate:community:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘删除', 2428, '4',  '#',  'F', '0', 'datamanagerplate:community:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘导出', 2428, '5',  '#',  'F', '0', 'datamanagerplate:community:export',       '#', 'admin', sysdate, '', null, '');

select *
from sys_menu where MENU_NAME like '%楼盘采集%';

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2482, '楼盘采集任务', '2005', '1', '/datamanagerplate/task', 'C', '0', 'datamanagerplate:task:view', '#', 'admin', sysdate, '', null, '楼盘采集任务菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务查询', 2482, '1',  '#',  'F', '0', 'datamanagerplate:task:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务新增', 2482, '2',  '#',  'F', '0', 'datamanagerplate:task:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务修改', 2482, '3',  '#',  'F', '0', 'datamanagerplate:task:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务删除', 2482, '4',  '#',  'F', '0', 'datamanagerplate:task:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '楼盘采集任务导出', 2482, '5',  '#',  'F', '0', 'datamanagerplate:task:export',       '#', 'admin', sysdate, '', null, '');

select *
from SYS_DICT_DATA where DICT_TYPE = 'est_data_source' ;
