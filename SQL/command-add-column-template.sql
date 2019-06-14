prompt running: add column TTMP_DEV...
prompt ====================
prompt
DECLARE
  V_COUNT  INTEGER;
BEGIN
  -- 判断列是否存在
  SELECT COUNT(1)
  INTO   V_COUNT
  FROM   USER_TAB_COLUMNS
  WHERE  TABLE_NAME = 'TTMP_DEV' AND COLUMN_NAME = 'T_NICKNAME';

  -- 如果不存在则添加
  IF V_COUNT = 0 THEN
    EXECUTE IMMEDIATE 'alter table TTMP_DEV add T_NICKNAME VARCHAR2(30)';
    EXECUTE IMMEDIATE 'comment on column TTMP_DEV.T_NICKNAME is ''开发昵称''';
  END IF;
END;
/
