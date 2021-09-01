
DECLARE
    res NUMBER;
BEGIN
   -- res := CALCULA_FUNC(5,2);
  --  DBMS_OUTPUT.PUT_LINE('El resultado es: ' || res);
    select CALCULA_FUNC(5,2) from dual;
    
    -- otra opcion
END;