-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2036, '网签信息出售方', '2000', '1', '/omp/csfxx', 'C', '0', 'omp:csfxx:view', '#', 'admin', sysdate, '', null,
        '网签信息出售方菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息出售方查询', 2036, '1', '#', 'F', '0', 'omp:csfxx:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息出售方新增', 2036, '2', '#', 'F', '0', 'omp:csfxx:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息出售方修改', 2036, '3', '#', 'F', '0', 'omp:csfxx:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息出售方删除', 2036, '4', '#', 'F', '0', 'omp:csfxx:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息出售方导出', 2036, '5', '#', 'F', '0', 'omp:csfxx:export', '#', 'admin', sysdate,
        '', null, '');

-- t_api_wqxx_csfxx主键序列
create sequence seq_t_api_wqxx_csfxx
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2045, '接口访问记录', '2000', '1', '/omp/api_record', 'C', '0', 'omp:api_record:view', '#', 'admin', sysdate,
        '', null, '接口访问记录菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '接口访问记录查询', 2045, '1', '#', 'F', '0', 'omp:api_record:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '接口访问记录新增', 2045, '2', '#', 'F', '0', 'omp:api_record:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '接口访问记录修改', 2045, '3', '#', 'F', '0', 'omp:api_record:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '接口访问记录删除', 2045, '4', '#', 'F', '0', 'omp:api_record:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '接口访问记录导出', 2045, '5', '#', 'F', '0', 'omp:api_record:export', '#', 'admin',
        sysdate, '', null, '');

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2049, '检查任务', '2000', '1', '/omp/check_task', 'C', '0', 'omp:check_task:view', '#', 'admin', sysdate, '',
        null, '检查任务菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查任务查询', 2049, '1', '#', 'F', '0', 'omp:check_task:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查任务新增', 2049, '2', '#', 'F', '0', 'omp:check_task:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查任务修改', 2049, '3', '#', 'F', '0', 'omp:check_task:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查任务删除', 2049, '4', '#', 'F', '0', 'omp:check_task:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查任务导出', 2049, '5', '#', 'F', '0', 'omp:check_task:export', '#', 'admin', sysdate,
        '', null, '');

-- t_check_task主键序列
create sequence seq_t_check_task
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2040, '楼盘价格修改历史', '2000', '1', '/omp/community_record', 'C', '0', 'omp:community_record:view', '#',
        'admin', sysdate, '', null, '楼盘价格修改历史菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘价格修改历史查询', 2040, '1', '#', 'F', '0', 'omp:community_record:list', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘价格修改历史新增', 2040, '2', '#', 'F', '0', 'omp:community_record:add', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘价格修改历史修改', 2040, '3', '#', 'F', '0', 'omp:community_record:edit', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘价格修改历史删除', 2040, '4', '#', 'F', '0', 'omp:community_record:remove', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘价格修改历史导出', 2040, '5', '#', 'F', '0', 'omp:community_record:export', '#',
        'admin', sysdate, '', null, '');

-- t_community_price_record主键序列
create sequence seq_t_community_price_record
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2044, '价格反馈记录', '3', '1', '/omp/feedback', 'C', '0', 'omp:feedback:view', '#', 'admin', sysdate, '', null,
        '价格反馈记录菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '价格反馈记录查询', 2044, '1', '#', 'F', '0', 'omp:feedback:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '价格反馈记录新增', 2044, '2', '#', 'F', '0', 'omp:feedback:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '价格反馈记录修改', 2044, '3', '#', 'F', '0', 'omp:feedback:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '价格反馈记录删除', 2044, '4', '#', 'F', '0', 'omp:feedback:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '价格反馈记录导出', 2044, '5', '#', 'F', '0', 'omp:feedback:export', '#', 'admin',
        sysdate, '', null, '');

-- t_yw_price_feedback主键序列
create sequence seq_t_yw_price_feedback
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2039, '户价格修改历史', '2000', '1', '/omp/h_record', 'C', '0', 'omp:h_record:view', '#', 'admin', sysdate, '',
        null, '户价格修改历史菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格修改历史查询', 2039, '1', '#', 'F', '0', 'omp:h_record:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格修改历史新增', 2039, '2', '#', 'F', '0', 'omp:h_record:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格修改历史修改', 2039, '3', '#', 'F', '0', 'omp:h_record:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格修改历史删除', 2039, '4', '#', 'F', '0', 'omp:h_record:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格修改历史导出', 2039, '5', '#', 'F', '0', 'omp:h_record:export', '#', 'admin',
        sysdate, '', null, '');

-- t_h_price_record主键序列
create sequence seq_t_h_price_record
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2043, '户基准价', '2000', '1', '/omp/jzh', 'C', '0', 'omp:jzh:view', '#', 'admin', sysdate, '', null,
        '户基准价菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户基准价查询', 2043, '1', '#', 'F', '0', 'omp:jzh:list', '#', 'admin', sysdate, '', null,
        '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户基准价新增', 2043, '2', '#', 'F', '0', 'omp:jzh:add', '#', 'admin', sysdate, '', null,
        '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户基准价修改', 2043, '3', '#', 'F', '0', 'omp:jzh:edit', '#', 'admin', sysdate, '', null,
        '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户基准价删除', 2043, '4', '#', 'F', '0', 'omp:jzh:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户基准价导出', 2043, '5', '#', 'F', '0', 'omp:jzh:export', '#', 'admin', sysdate, '',
        null, '');

-- t_price_jz_h主键序列
create sequence seq_t_price_jz_h
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2047, '检查规则', '2000', '1', '/omp/rule', 'C', '0', 'omp:rule:view', '#', 'admin', sysdate, '', null,
        '检查规则菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查规则查询', 2047, '1', '#', 'F', '0', 'omp:rule:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查规则新增', 2047, '2', '#', 'F', '0', 'omp:rule:add', '#', 'admin', sysdate, '', null,
        '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查规则修改', 2047, '3', '#', 'F', '0', 'omp:rule:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查规则删除', 2047, '4', '#', 'F', '0', 'omp:rule:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查规则导出', 2047, '5', '#', 'F', '0', 'omp:rule:export', '#', 'admin', sysdate, '',
        null, '');

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2048, '检查模板', '2000', '1', '/omp/template', 'C', '0', 'omp:template:view', '#', 'admin', sysdate, '', null,
        '检查模板菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查模板查询', 2048, '1', '#', 'F', '0', 'omp:template:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查模板新增', 2048, '2', '#', 'F', '0', 'omp:template:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查模板修改', 2048, '3', '#', 'F', '0', 'omp:template:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查模板删除', 2048, '4', '#', 'F', '0', 'omp:template:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查模板导出', 2048, '5', '#', 'F', '0', 'omp:template:export', '#', 'admin', sysdate,
        '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2038, '网签信息数据', '2000', '1', '/omp/wqxx', 'C', '0', 'omp:wqxx:view', '#', 'admin', sysdate, '', null,
        '网签信息数据菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息数据查询', 2038, '1', '#', 'F', '0', 'omp:wqxx:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息数据新增', 2038, '2', '#', 'F', '0', 'omp:wqxx:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息数据修改', 2038, '3', '#', 'F', '0', 'omp:wqxx:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息数据删除', 2038, '4', '#', 'F', '0', 'omp:wqxx:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息数据导出', 2038, '5', '#', 'F', '0', 'omp:wqxx:export', '#', 'admin', sysdate,
        '', null, '');

-- t_api_wqxx主键序列
create sequence seq_t_api_wqxx
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2046, '完税信息', '2000', '1', '/omp/wsxx', 'C', '0', 'omp:wsxx:view', '#', 'admin', sysdate, '', null,
        '完税信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '完税信息查询', 2046, '1', '#', 'F', '0', 'omp:wsxx:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '完税信息新增', 2046, '2', '#', 'F', '0', 'omp:wsxx:add', '#', 'admin', sysdate, '', null,
        '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '完税信息修改', 2046, '3', '#', 'F', '0', 'omp:wsxx:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '完税信息删除', 2046, '4', '#', 'F', '0', 'omp:wsxx:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '完税信息导出', 2046, '5', '#', 'F', '0', 'omp:wsxx:export', '#', 'admin', sysdate, '',
        null, '');

-- t_api_wsxx主键序列
create sequence seq_t_api_wsxx
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2037, '网签信息转让方', '2000', '1', '/omp/zrfxx', 'C', '0', 'omp:zrfxx:view', '#', 'admin', sysdate, '', null,
        '网签信息转让方菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息转让方查询', 2037, '1', '#', 'F', '0', 'omp:zrfxx:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息转让方新增', 2037, '2', '#', 'F', '0', 'omp:zrfxx:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息转让方修改', 2037, '3', '#', 'F', '0', 'omp:zrfxx:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息转让方删除', 2037, '4', '#', 'F', '0', 'omp:zrfxx:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '网签信息转让方导出', 2037, '5', '#', 'F', '0', 'omp:zrfxx:export', '#', 'admin', sysdate,
        '', null, '');

-- t_api_wqxx_zrfxx主键序列
create sequence seq_t_api_wqxx_zrfxx
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2042, '幢价格', '2000', '1', '/omp/zrz_price', 'C', '0', 'omp:zrz_price:view', '#', 'admin', sysdate, '', null,
        '幢价格菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格查询', 2042, '1', '#', 'F', '0', 'omp:zrz_price:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格新增', 2042, '2', '#', 'F', '0', 'omp:zrz_price:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格修改', 2042, '3', '#', 'F', '0', 'omp:zrz_price:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格删除', 2042, '4', '#', 'F', '0', 'omp:zrz_price:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格导出', 2042, '5', '#', 'F', '0', 'omp:zrz_price:export', '#', 'admin', sysdate, '',
        null, '');

-- t_price_jz_zrz主键序列
create sequence seq_t_price_jz_zrz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2041, '自然幢价格修改历史', '2000', '1', '/omp/zrz_record', 'C', '0', 'omp:zrz_record:view', '#', 'admin',
        sysdate, '', null, '自然幢价格修改历史菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢价格修改历史查询', 2041, '1', '#', 'F', '0', 'omp:zrz_record:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢价格修改历史新增', 2041, '2', '#', 'F', '0', 'omp:zrz_record:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢价格修改历史修改', 2041, '3', '#', 'F', '0', 'omp:zrz_record:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢价格修改历史删除', 2041, '4', '#', 'F', '0', 'omp:zrz_record:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢价格修改历史导出', 2041, '5', '#', 'F', '0', 'omp:zrz_record:export', '#', 'admin',
        sysdate, '', null, '');

-- t_zrz_price_record主键序列
create sequence seq_t_zrz_price_record
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2054, '楼盘自然幢关联关系', '2000', '1', '/omp/commubity_zrz', 'C', '0', 'omp:commubity_zrz:view', '#', 'admin',
        sysdate, '', null, '楼盘自然幢关联关系菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘自然幢关联关系查询', 2054, '1', '#', 'F', '0', 'omp:commubity_zrz:list', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘自然幢关联关系新增', 2054, '2', '#', 'F', '0', 'omp:commubity_zrz:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘自然幢关联关系修改', 2054, '3', '#', 'F', '0', 'omp:commubity_zrz:edit', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘自然幢关联关系删除', 2054, '4', '#', 'F', '0', 'omp:commubity_zrz:remove', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘自然幢关联关系导出', 2054, '5', '#', 'F', '0', 'omp:commubity_zrz:export', '#',
        'admin', sysdate, '', null, '');

-- t_community_zrz主键序列
create sequence seq_t_community_zrz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2056, '楼盘宗地关联', '2000', '1', '/omp/community_zd', 'C', '0', 'omp:community_zd:view', '#', 'admin',
        sysdate, '', null, '楼盘宗地关联菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘宗地关联查询', 2056, '1', '#', 'F', '0', 'omp:community_zd:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘宗地关联新增', 2056, '2', '#', 'F', '0', 'omp:community_zd:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘宗地关联修改', 2056, '3', '#', 'F', '0', 'omp:community_zd:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘宗地关联删除', 2056, '4', '#', 'F', '0', 'omp:community_zd:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘宗地关联导出', 2056, '5', '#', 'F', '0', 'omp:community_zd:export', '#', 'admin',
        sysdate, '', null, '');

-- t_community_zd主键序列
create sequence seq_t_community_zd
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2057, '楼盘信息', '2000', '1', '/omp/community', 'C', '0', 'omp:community:view', '#', 'admin', sysdate, '',
        null, '楼盘信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘信息查询', 2057, '1', '#', 'F', '0', 'omp:community:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘信息新增', 2057, '2', '#', 'F', '0', 'omp:community:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘信息修改', 2057, '3', '#', 'F', '0', 'omp:community:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘信息删除', 2057, '4', '#', 'F', '0', 'omp:community:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘信息导出', 2057, '5', '#', 'F', '0', 'omp:community:export', '#', 'admin', sysdate,
        '', null, '');

-- t_realestate_community主键序列
create sequence seq_t_realestate_community
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2051, '挂牌价历史', '2000', '1', '/omp/deal', 'C', '0', 'omp:deal:view', '#', 'admin', sysdate, '', null,
        '挂牌价历史菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史查询', 2051, '1', '#', 'F', '0', 'omp:deal:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史新增', 2051, '2', '#', 'F', '0', 'omp:deal:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史修改', 2051, '3', '#', 'F', '0', 'omp:deal:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史删除', 2051, '4', '#', 'F', '0', 'omp:deal:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史导出', 2051, '5', '#', 'F', '0', 'omp:deal:export', '#', 'admin', sysdate, '',
        null, '');

-- t_collect_deal主键序列
create sequence seq_t_collect_deal
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2053, '开发商、物业公司信息', '2000', '1', '/omp/enterprise', 'C', '0', 'omp:enterprise:view', '#', 'admin',
        sysdate, '', null, '开发商、物业公司信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '开发商、物业公司信息查询', 2053, '1', '#', 'F', '0', 'omp:enterprise:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '开发商、物业公司信息新增', 2053, '2', '#', 'F', '0', 'omp:enterprise:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '开发商、物业公司信息修改', 2053, '3', '#', 'F', '0', 'omp:enterprise:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '开发商、物业公司信息删除', 2053, '4', '#', 'F', '0', 'omp:enterprise:remove', '#',
        'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '开发商、物业公司信息导出', 2053, '5', '#', 'F', '0', 'omp:enterprise:export', '#',
        'admin', sysdate, '', null, '');

-- t_realestate_enterprise主键序列
create sequence seq_t_realestate_enterprise
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2058, '权利_现状', '2000', '1', '/omp/ql_xz', 'C', '0', 'omp:ql_xz:view', '#', 'admin', sysdate, '', null,
        '权利_现状菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利_现状查询', 2058, '1', '#', 'F', '0', 'omp:ql_xz:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利_现状新增', 2058, '2', '#', 'F', '0', 'omp:ql_xz:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利_现状修改', 2058, '3', '#', 'F', '0', 'omp:ql_xz:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利_现状删除', 2058, '4', '#', 'F', '0', 'omp:ql_xz:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利_现状导出', 2058, '5', '#', 'F', '0', 'omp:ql_xz:export', '#', 'admin', sysdate, '',
        null, '');

-- t_realestate_ql_xz主键序列
create sequence seq_t_realestate_ql_xz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2059, '权利人_现状', '2000', '1', '/omp/qlr_xz', 'C', '0', 'omp:qlr_xz:view', '#', 'admin', sysdate, '', null,
        '权利人_现状菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利人_现状查询', 2059, '1', '#', 'F', '0', 'omp:qlr_xz:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利人_现状新增', 2059, '2', '#', 'F', '0', 'omp:qlr_xz:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利人_现状修改', 2059, '3', '#', 'F', '0', 'omp:qlr_xz:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利人_现状删除', 2059, '4', '#', 'F', '0', 'omp:qlr_xz:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '权利人_现状导出', 2059, '5', '#', 'F', '0', 'omp:qlr_xz:export', '#', 'admin', sysdate,
        '', null, '');

-- t_realestate_qlr_xz主键序列
create sequence seq_t_realestate_qlr_xz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2052, '挂牌价历史', '2000', '1', '/omp/quoted', 'C', '0', 'omp:quoted:view', '#', 'admin', sysdate, '', null,
        '挂牌价历史菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史查询', 2052, '1', '#', 'F', '0', 'omp:quoted:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史新增', 2052, '2', '#', 'F', '0', 'omp:quoted:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史修改', 2052, '3', '#', 'F', '0', 'omp:quoted:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史删除', 2052, '4', '#', 'F', '0', 'omp:quoted:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '挂牌价历史导出', 2052, '5', '#', 'F', '0', 'omp:quoted:export', '#', 'admin', sysdate,
        '', null, '');

-- t_collect_quoted主键序列
create sequence seq_t_collect_quoted
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2055, '采集楼盘租金历史', '2000', '1', '/omp/rent', 'C', '0', 'omp:rent:view', '#', 'admin', sysdate, '', null,
        '采集楼盘租金历史菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金历史查询', 2055, '1', '#', 'F', '0', 'omp:rent:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金历史新增', 2055, '2', '#', 'F', '0', 'omp:rent:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金历史修改', 2055, '3', '#', 'F', '0', 'omp:rent:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金历史删除', 2055, '4', '#', 'F', '0', 'omp:rent:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金历史导出', 2055, '5', '#', 'F', '0', 'omp:rent:export', '#', 'admin',
        sysdate, '', null, '');

-- t_collect_rent主键序列
create sequence seq_t_collect_rent
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2050, '任务数据关联', '2000', '1', '/omp/scope', 'C', '0', 'omp:scope:view', '#', 'admin', sysdate, '', null,
        '任务数据关联菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '任务数据关联查询', 2050, '1', '#', 'F', '0', 'omp:scope:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '任务数据关联新增', 2050, '2', '#', 'F', '0', 'omp:scope:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '任务数据关联修改', 2050, '3', '#', 'F', '0', 'omp:scope:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '任务数据关联删除', 2050, '4', '#', 'F', '0', 'omp:scope:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '任务数据关联导出', 2050, '5', '#', 'F', '0', 'omp:scope:export', '#', 'admin', sysdate,
        '', null, '');

-- t_check_scope主键序列
create sequence seq_t_check_scope
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2060, '宗地历史信息', '2000', '1', '/omp/zd_ls', 'C', '0', 'omp:zd_ls:view', '#', 'admin', sysdate, '', null,
        '宗地历史信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地历史信息查询', 2060, '1', '#', 'F', '0', 'omp:zd_ls:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地历史信息新增', 2060, '2', '#', 'F', '0', 'omp:zd_ls:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地历史信息修改', 2060, '3', '#', 'F', '0', 'omp:zd_ls:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地历史信息删除', 2060, '4', '#', 'F', '0', 'omp:zd_ls:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地历史信息导出', 2060, '5', '#', 'F', '0', 'omp:zd_ls:export', '#', 'admin', sysdate,
        '', null, '');

-- t_realestate_zd_ls主键序列
create sequence seq_t_realestate_zd_ls
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2062, '检查结果详细信息', '2000', '1', '/omp/chk_record', 'C', '0', 'omp:chk_record:view', '#', 'admin',
        sysdate, '', null, '检查结果详细信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查结果详细信息查询', 2062, '1', '#', 'F', '0', 'omp:chk_record:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查结果详细信息新增', 2062, '2', '#', 'F', '0', 'omp:chk_record:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查结果详细信息修改', 2062, '3', '#', 'F', '0', 'omp:chk_record:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查结果详细信息删除', 2062, '4', '#', 'F', '0', 'omp:chk_record:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '检查结果详细信息导出', 2062, '5', '#', 'F', '0', 'omp:chk_record:export', '#', 'admin',
        sysdate, '', null, '');

-- t_chk_record主键序列
create sequence seq_t_chk_record
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2066, '户历史信息', '2000', '1', '/omp/h_ls', 'C', '0', 'omp:h_ls:view', '#', 'admin', sysdate, '', null,
        '户历史信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户历史信息查询', 2066, '1', '#', 'F', '0', 'omp:h_ls:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户历史信息新增', 2066, '2', '#', 'F', '0', 'omp:h_ls:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户历史信息修改', 2066, '3', '#', 'F', '0', 'omp:h_ls:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户历史信息删除', 2066, '4', '#', 'F', '0', 'omp:h_ls:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户历史信息导出', 2066, '5', '#', 'F', '0', 'omp:h_ls:export', '#', 'admin', sysdate, '',
        null, '');


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2068, '户现状信息', '2000', '1', '/omp/h_xz', 'C', '0', 'omp:h_xz:view', '#', 'admin', sysdate, '', null,
        '户现状信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状信息查询', 2068, '1', '#', 'F', '0', 'omp:h_xz:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状信息新增', 2068, '2', '#', 'F', '0', 'omp:h_xz:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状信息修改', 2068, '3', '#', 'F', '0', 'omp:h_xz:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状信息删除', 2068, '4', '#', 'F', '0', 'omp:h_xz:remove', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状信息导出', 2068, '5', '#', 'F', '0', 'omp:h_xz:export', '#', 'admin', sysdate, '',
        null, '');

-- t_realestate_h_xz主键序列
create sequence seq_t_realestate_h_xz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2067, '户现状预测信息', '2000', '1', '/omp/h_xzy', 'C', '0', 'omp:h_xzy:view', '#', 'admin', sysdate, '', null,
        '户现状预测信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状预测信息查询', 2067, '1', '#', 'F', '0', 'omp:h_xzy:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状预测信息新增', 2067, '2', '#', 'F', '0', 'omp:h_xzy:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状预测信息修改', 2067, '3', '#', 'F', '0', 'omp:h_xzy:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状预测信息删除', 2067, '4', '#', 'F', '0', 'omp:h_xzy:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户现状预测信息导出', 2067, '5', '#', 'F', '0', 'omp:h_xzy:export', '#', 'admin', sysdate,
        '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2061, '宗地现状信息', '2000', '1', '/omp/zd_xz', 'C', '0', 'omp:zd_xz:view', '#', 'admin', sysdate, '', null,
        '宗地现状信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地现状信息查询', 2061, '1', '#', 'F', '0', 'omp:zd_xz:list', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地现状信息新增', 2061, '2', '#', 'F', '0', 'omp:zd_xz:add', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地现状信息修改', 2061, '3', '#', 'F', '0', 'omp:zd_xz:edit', '#', 'admin', sysdate, '',
        null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地现状信息删除', 2061, '4', '#', 'F', '0', 'omp:zd_xz:remove', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '宗地现状信息导出', 2061, '5', '#', 'F', '0', 'omp:zd_xz:export', '#', 'admin', sysdate,
        '', null, '');

-- t_realestate_zd_xz主键序列
create sequence seq_t_realestate_zd_xz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2063, '自然幢历史信息', '2000', '1', '/omp/zrz_ls', 'C', '0', 'omp:zrz_ls:view', '#', 'admin', sysdate, '',
        null, '自然幢历史信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢历史信息查询', 2063, '1', '#', 'F', '0', 'omp:zrz_ls:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢历史信息新增', 2063, '2', '#', 'F', '0', 'omp:zrz_ls:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢历史信息修改', 2063, '3', '#', 'F', '0', 'omp:zrz_ls:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢历史信息删除', 2063, '4', '#', 'F', '0', 'omp:zrz_ls:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢历史信息导出', 2063, '5', '#', 'F', '0', 'omp:zrz_ls:export', '#', 'admin',
        sysdate, '', null, '');

-- t_realestate_zrz_ls主键序列
create sequence seq_t_realestate_zrz_ls
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2065, '自然幢现状信息', '2000', '1', '/omp/zrz_xz', 'C', '0', 'omp:zrz_xz:view', '#', 'admin', sysdate, '',
        null, '自然幢现状信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢现状信息查询', 2065, '1', '#', 'F', '0', 'omp:zrz_xz:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢现状信息新增', 2065, '2', '#', 'F', '0', 'omp:zrz_xz:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢现状信息修改', 2065, '3', '#', 'F', '0', 'omp:zrz_xz:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢现状信息删除', 2065, '4', '#', 'F', '0', 'omp:zrz_xz:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢现状信息导出', 2065, '5', '#', 'F', '0', 'omp:zrz_xz:export', '#', 'admin',
        sysdate, '', null, '');

-- t_realestate_zrz_xz主键序列
create sequence seq_t_realestate_zrz_xz
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2064, '自然幢预测信息', '2000', '1', '/omp/zrz_xzy', 'C', '0', 'omp:zrz_xzy:view', '#', 'admin', sysdate, '',
        null, '自然幢预测信息菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢预测信息查询', 2064, '1', '#', 'F', '0', 'omp:zrz_xzy:list', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢预测信息新增', 2064, '2', '#', 'F', '0', 'omp:zrz_xzy:add', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢预测信息修改', 2064, '3', '#', 'F', '0', 'omp:zrz_xzy:edit', '#', 'admin', sysdate,
        '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢预测信息删除', 2064, '4', '#', 'F', '0', 'omp:zrz_xzy:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '自然幢预测信息导出', 2064, '5', '#', 'F', '0', 'omp:zrz_xzy:export', '#', 'admin',
        sysdate, '', null, '');

-- t_realestate_zrz_xzy主键序列
create sequence seq_t_realestate_zrz_xzy
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;

-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2069, '楼盘采集价格', '2000', '1', '/omp/community_price', 'C', '0', 'omp:community_price:view', '#', 'admin',
        sysdate, '', null, '楼盘采集价格菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘采集价格查询', 2069, '1', '#', 'F', '0', 'omp:community_price:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘采集价格新增', 2069, '2', '#', 'F', '0', 'omp:community_price:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘采集价格修改', 2069, '3', '#', 'F', '0', 'omp:community_price:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘采集价格删除', 2069, '4', '#', 'F', '0', 'omp:community_price:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '楼盘采集价格导出', 2069, '5', '#', 'F', '0', 'omp:community_price:export', '#', 'admin',
        sysdate, '', null, '');

-- t_collect_community_price主键序列
create sequence seq_t_collect_community_price
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2070, '采集楼盘租金', '2000', '1', '/omp/community_zj', 'C', '0', 'omp:community_zj:view', '#', 'admin',
        sysdate, '', null, '采集楼盘租金菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金查询', 2070, '1', '#', 'F', '0', 'omp:community_zj:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金新增', 2070, '2', '#', 'F', '0', 'omp:community_zj:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金修改', 2070, '3', '#', 'F', '0', 'omp:community_zj:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金删除', 2070, '4', '#', 'F', '0', 'omp:community_zj:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '采集楼盘租金导出', 2070, '5', '#', 'F', '0', 'omp:community_zj:export', '#', 'admin',
        sysdate, '', null, '');

-- t_collect_community_zj主键序列
create sequence seq_t_collect_community_zj
    increment by 1
    start with 10
    nomaxvalue
    nominvalue
    cache 20;


select *
from sys_role_menu;


select *
from EST_DATAOMP.T_YW_PRICE_FEEDBACK;

SELECT count(0) FROM t_yw_price_feedback union all ;