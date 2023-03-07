-- 菜单 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(2744, '自然幢-属性', '2705', '1', '/collect/zrzxz', 'C', '0', 'collect:zrzxz:view', '#', 'admin', sysdate, '', null, '自然幢-属性菜单');

-- 按钮 SQL
insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢-属性查询', 2744, '1',  '#',  'F', '0', 'collect:zrzxz:list',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢-属性新增', 2744, '2',  '#',  'F', '0', 'collect:zrzxz:add',          '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢-属性修改', 2744, '3',  '#',  'F', '0', 'collect:zrzxz:edit',         '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢-属性删除', 2744, '4',  '#',  'F', '0', 'collect:zrzxz:remove',       '#', 'admin', sysdate, '', null, '');

insert into sys_menu (menu_id, menu_name, parent_id, order_num, url, menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values(seq_sys_menu.nextval, '自然幢-属性导出', 2744, '5',  '#',  'F', '0', 'collect:zrzxz:export',       '#', 'admin', sysdate, '', null, '');

select createtime
from T_ZRZ_XZ;

select *
from GEN_TABLE;

select *
from GEN_TABLE_COLUMN where TABLE_ID = '390';

update GEN_TABLE_COLUMN
set IS_QUERY = 0
where TABLE_ID = '392';

-- t_region_desciption主键序列
create sequence seq_t_population
increment by 1
start with 10
nomaxvalue
nominvalue
cache 20;