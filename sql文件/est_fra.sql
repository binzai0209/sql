select *
from SYS_USER;

select *
from SYS_DEPT;

select *
from sys_menu
where MENU_NAME like '%楼盘采集%';

select *
from SYS_DICT_DATA
where DICT_TYPE = 'est_data_source';

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


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2642, '户价格', '2005', '1', '/datamanagerplate/h_price', 'C', '0', 'datamanagerplate:h_price:view', '#',
        'admin', sysdate, '', null, '户价格菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格查询', 2642, '1', '#', 'F', '0', 'datamanagerplate:h_price:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格新增', 2642, '2', '#', 'F', '0', 'datamanagerplate:h_price:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格修改', 2642, '3', '#', 'F', '0', 'datamanagerplate:h_price:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格删除', 2642, '4', '#', 'F', '0', 'datamanagerplate:h_price:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '户价格导出', 2642, '5', '#', 'F', '0', 'datamanagerplate:h_price:export', '#', 'admin',
        sysdate, '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2643, '幢价格', '2005', '1', '/datamanagerplate/zrz_price', 'C', '0', 'datamanagerplate:zrz_price:view', '#',
        'admin', sysdate, '', null, '幢价格菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格查询', 2643, '1', '#', 'F', '0', 'datamanagerplate:zrz_price:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格新增', 2643, '2', '#', 'F', '0', 'datamanagerplate:zrz_price:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格修改', 2643, '3', '#', 'F', '0', 'datamanagerplate:zrz_price:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格删除', 2643, '4', '#', 'F', '0', 'datamanagerplate:zrz_price:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '幢价格导出', 2643, '5', '#', 'F', '0', 'datamanagerplate:zrz_price:export', '#', 'admin',
        sysdate, '', null, '');


-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (2666, '勘查字段模板', '2200', '1', '/survey/template', 'C', '0', 'survey:template:view', '#', 'admin', sysdate,
        '', null, '勘查字段模板菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '勘查字段模板查询', 2666, '1', '#', 'F', '0', 'survey:template:list', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '勘查字段模板新增', 2666, '2', '#', 'F', '0', 'survey:template:add', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '勘查字段模板修改', 2666, '3', '#', 'F', '0', 'survey:template:edit', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '勘查字段模板删除', 2666, '4', '#', 'F', '0', 'survey:template:remove', '#', 'admin',
        sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by,
                      create_time, update_by, update_time, remark)
values (seq_sys_menu.nextval, '勘查字段模板导出', 2666, '5', '#', 'F', '0', 'survey:template:export', '#', 'admin',
        sysdate, '', null, '');


select *
from SYS_DICT_TYPE
where DICT_ID = '100';

select dict_code,
       dict_sort,
       dict_label,
       dict_value,
       dict_type,
       css_class,
       list_class,
       is_default,
       status,
       create_by,
       create_time,
       update_by,
       update_time,
       remark
from SYS_DICT_DATA
where DICT_TYPE = 'estimate_qxmc';

