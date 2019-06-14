prompt running: create table TTMP_DEV...
prompt ====================
prompt
DECLARE
  V_COUNT  INTEGER;
BEGIN
  --�жϱ��Ƿ����
  SELECT COUNT(1)
    INTO V_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'TTMP_DEV';
  
  --��������ڴ���
  IF V_COUNT = 0 THEN
    EXECUTE IMMEDIATE '
    create table TTMP_DEV
    (
      T_ID             VARCHAR2(30) not null,
      T_NAME           VARCHAR2(30) not null,
      T_AMOUNT         NUMBER not null,
      T_TIME           CHAR(19) default TO_CHAR(SYSDATE,''YYYY-MM-DD HH24:MI:SS'')
    )';

    EXECUTE IMMEDIATE 'comment on table TTMP_DEV is ''������ʱ��''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_ID is ''����ID''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_NAME is ''��������''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_AMOUNT is ''�������''';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_TIME is ''����ʱ��''';

    EXECUTE IMMEDIATE 'alter table TTMP_DEV
    add constraint PK_TTMP_DEV primary key (T_ID, T_NAME)
    using index';
  END IF;
END;
/

  
