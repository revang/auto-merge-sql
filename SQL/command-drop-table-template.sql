-- �жϱ��Ƿ���ڣ�������ɾ��
-- ע�⣺��������������������ɾ���ᱨ��
-- ע�⣺��ʵ�ʿ��������в�Ҫ���ʹ�ã����д�ŵ����ݻᶪʧ
PROMPT running: drop table TTMP_DEV...
DECLARE
  V_COUNT  INTEGER;
BEGIN
  --�жϱ��Ƿ����
  SELECT COUNT(1)
    INTO V_COUNT
    FROM USER_TABLES
   WHERE TABLE_NAME = 'TTMP_DEV';
  
  --������ڣ���ɾ����
  IF V_COUNT <> 0 THEN
    EXECUTE IMMEDIATE 'drop table TTMP_DEV';
  END IF;
END;
/
