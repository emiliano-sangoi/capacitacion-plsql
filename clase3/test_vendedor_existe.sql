DECLARE 
    mensaje VARCHAR(60) DEFAULT '';
BEGIN    
    FOR i IN -5..25 LOOP
        
        mensaje := 'El vendedor con ID ' || i;
        IF(VENDEDOR_EXISTE(i)) THEN
            mensaje := mensaje || ' EXISTE';
        ELSE
            mensaje := mensaje || ' NO EXISTE';
        END IF;
        
        DBMS_OUTPUT.PUT_LINE(mensaje);
        
    END LOOP;
END;