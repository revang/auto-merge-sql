prompt running: create table TTMP_DEV...
prompt ====================
prompt
DECLARE
  V_COUNT  INTEGER;
BEGIN
  --判断表是否存在
  SELECT COUNT(1)
    INTO V_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'TTMP_DEV';
  
  --如果不存在创建
  IF V_COUNT = 0 THEN
    EXECUTE IMMEDIATE '
    create table TTMP_DEV
    (
      T_ID             VARCHAR2(30) not null,
      T_NAME           VARCHAR2(30) not null,
      T_AMOUNT         NUMBER not null,
      T_TIME           CHAR(19) default TO_CHAR(SYSDATE,''YYYY-MM-DD HH24:MI:SS'')
    )';

    EXECUTE IMMEDIATE 'comment on table TTMP_DEV is ''开发临时表''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_ID is ''开发ID''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_NAME is ''开发名称''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_AMOUNT is ''开发金额''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_TIME is ''开发时间''';

    EXECUTE IMMEDIATE 'alter table TTMP_DEV
    add constraint PK_TTMP_DEV primary key (T_ID, T_NAME)
    using index';
  END IF;
END;
/

  
