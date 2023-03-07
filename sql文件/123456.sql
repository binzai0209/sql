-- auto-generated definition
create table T_CHK_RECORD
(
    ID              NVARCHAR2(50) not null primary key,
    CHK_ID          VARCHAR2(38),
    CHK_TARGET      VARCHAR2(50),
    CHK_TYPE        VARCHAR2(50),
    CHK_RECORDE     VARCHAR2(2000),
    FIELD_NAME      VARCHAR2(100),
    FIELD_VALUE     VARCHAR2(500),
    BDCDYH          VARCHAR2(100),
    BDCDYID         VARCHAR2(50),
    LABEL_TYPE      VARCHAR2(50),
    ENUM_NAME       VARCHAR2(20),
    FIELD_NAME_DESC VARCHAR2(200),
    CREATE_BY       VARCHAR2(64),
    CREATE_TIME     DATE
)
/

comment on table T_CHK_RECORD is '检查结果详细信息'
/

comment on column T_CHK_RECORD.CHK_ID is '检查id'
/

comment on column T_CHK_RECORD.CHK_TARGET is '主体类型'
/

comment on column T_CHK_RECORD.CHK_TYPE is '检查类型'
/

comment on column T_CHK_RECORD.FIELD_NAME is '字段名称'
/

comment on column T_CHK_RECORD.FIELD_VALUE is '字段值'
/

comment on column T_CHK_RECORD.BDCDYH is '不动产单元号'
/

comment on column T_CHK_RECORD.BDCDYID is '不动产单元id'
/

comment on column T_CHK_RECORD.LABEL_TYPE is '标签类型'
/

comment on column T_CHK_RECORD.ENUM_NAME is '枚举名称'
/

comment on column T_CHK_RECORD.FIELD_NAME_DESC is '字段注释'
/
comment on column T_CHK_RECORD.CREATE_BY is '创建者'
/

comment on column T_CHK_RECORD.CREATE_TIME is '创建时间'
/


