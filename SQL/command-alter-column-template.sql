prompt running: alter column TTMP_DEV...
prompt ====================
prompt

DECLARE
  V_COUNT  INTEGER;
BEGIN
  EXECUTE IMMEDIATE 'alter table TTMP_DEV modify (T_AMOUNT NUMBER(15,10))';
END;
/
