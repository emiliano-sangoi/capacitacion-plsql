create or replace PROCEDURE TP5_EJ2_FETCH(p_idPedido IN NUMBER) 
IS
    limite CONSTANT NUMBER := 7;
    monto NUMBER := 0;
    pu renglones_pdo.precio_unitario%TYPE;
    cant renglones_pdo.cantidad%TYPE;
    row_count NUMBER := 0;
    CURSOR c1 IS (SELECT * FROM 
        (SELECT precio_unitario, cantidad FROM renglones_pdo WHERE id_pedido = p_idPedido 
        ORDER BY id_renglon) WHERE ROWNUM <= limite);
BEGIN
    OPEN c1;
    
    LOOP
    FETCH c1 INTO pu, cant;
        row_count := c1%ROWCOUNT;
        monto := monto + (pu * cant);
        DBMS_OUTPUT.PUT_LINE('pu: ' || pu || ' | cant: ' || cant || ' | monto: ' || monto || ' | row count: ' || row_count);
        EXIT WHEN c1%NOTFOUND OR c1%NOTFOUND IS NULL;        
    END LOOP;
    
    CLOSE c1;
    
 --   SELECT * FROM 
 --       (SELECT precio_unitario, cantidad, precio_unitario*cantidad  FROM renglones_pdo WHERE id_pedido = 102 
 --       ORDER BY id_renglon) WHERE ROWNUM <= 7

  --  DBMS_OUTPUT.PUT_LINE(c1%ROWCOUNT);
    IF row_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El pedido ' || p_idPedido || ' no existe o no tiene renglones');
    ELSIF row_count < limite THEN
        DBMS_OUTPUT.PUT_LINE('Hay menos de ' || limite || ' renglones en el pedido ' || p_idPedido);
    ELSE        
        DBMS_OUTPUT.PUT_LINE('El monto promedio de los primeros siete renglones es: ' || monto/row_count);
    END IF;

END;