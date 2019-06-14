-- 判断表是否存在，存在则删除
-- 注意：如果表中主外键被引用则删除会报错
-- 注意：在实际开发过程中不要随便使用，表中存放的数据会丢失
PROMPT running: drop table TTMP_DEV...
DECLARE
  V_COUNT  INTEGER;
BEGIN
  --判断表是否存在
  SELECT COUNT(1)
    INTO V_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'TTMP_DEV';
  
  --如果存在，则删除表
  IF V_COUNT <> 0 THEN
    EXECUTE IMMEDIATE 'drop table TTMP_DEV';
  END IF;
END;
/
