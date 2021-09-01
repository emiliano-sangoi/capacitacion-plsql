/*
    Cree un procedimiento para realizar la copia mensual de las ventas 
    realizadas por los vendedores.
    
    a) Cree un cursor con los vendedores que no son ni “GERENTE DE SEGMENTO”
    ni “SUPERVISOR”.
    b) Escriba un loop FOR de cursor para leer los datos requeridos por la 
    tabla HISTORIA_VTAS.
    c) Utilice la función SYSDATE para indicar la fecha de la copia.
*/
create or replace PROCEDURE TP5_EJ3(p_idPedido IN NUMBER) 
IS
    limite CONSTANT NUMBER := 7;
    monto NUMBER := 0;
    row_count NUMBER := 0;
    CURSOR c1 IS (SELECT * FROM 
        (SELECT precio_unitario, cantidad FROM renglones_pdo WHERE id_pedido = p_idPedido 
        ORDER BY id_renglon) WHERE ROWNUM <= limite);
BEGIN
    FOR reg IN c1 LOOP
        monto := monto + (reg.precio_unitario * reg.cantidad);
        row_count := c1%ROWCOUNT;
    END LOOP;
    
    IF row_count = 0 THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: El pedido ' || p_idPedido || ' no existe o no tiene renglones');
    ELSIF row_count < limite THEN
        DBMS_OUTPUT.PUT_LINE('Hay menos de ' || limite || ' renglones en el pedido ' || p_idPedido);
    ELSE        
        DBMS_OUTPUT.PUT_LINE('El monto promedio de los primeros siete renglones es: ' || monto/row_count);
    END IF;

END;