/*
Ejercicio 2
Cree un procedimiento para cambiar el objetivo de ventas de una oficina dada, basándose en el
total de pedidos recibidos en dicha oficina. Tenga en cuenta los siguientes puntos:
    a) El número de la oficina debe ser un parámetro de entrada al procedimiento.
    b) Halle la cantidad de pedidos recibidos en dicha oficina.
    c) Si la cantidad es menor a 5, cambie el objetivo de la oficina a 5.000.
    d) Si la cantidad se encuentra entre 5 y 9 inclusive, cambie el objetivo de la oficina a 10.000.
    e) Si la cantidad supera los 9, cambie el objetivo de la oficina a 15.000.
    f) Si la oficina no ha recibido pedidos aún, establézcale un objetivo de 3.000.
    g) Confirme los cambios.
    h) Ejecute el procedimiento y vea los cambios.
Nota: para poder comparar los cambios que producirá la ejecución del procedimiento, es
recomendable que antes de la ejecución consulte y tome nota de los valores de los datos que
se verán afectados por el procedimiento.
*/
CREATE OR REPLACE PROCEDURE CAMBIAR_OBJETIVO_VENTAS(p_ofi_id IN NUMBER)
IS
    cantidad_pedidos INTEGER;
    nuevo_objetivo NUMBER;
    objetivo_actual NUMBER;
    aux INTEGER := 0;
    -- DEFINE una transaccion autonoma, los commits en este procedimiento no afectan la
    -- transaccion
    PRAGMA AUTONOMOUS_TRANSACTION;
BEGIN

    SELECT 1 into aux FROM oficinas_vtas WHERE ID_OFICINA = nvl(p_ofi_id, -1);
    IF aux = 0 THEN
        DBMS_OUTPUT.PUT_LINE('La oficina con ID ' || p_ofi_id || ' NO existe.');
        return;
    END IF;
    
    SELECT COUNT(1) INTO cantidad_pedidos FROM pedidos p
    INNER JOIN vendedores v 
        ON p.id_vend = v.id_vend
  --  INNER JOIN oficinas_vtas o
  --      ON v.id_oficina = o.id_oficina
    WHERE v.id_oficina = nvl(p_ofi_id, -1);
    -- GROUP BY o.id_oficina;
    
    DBMS_OUTPUT.PUT_LINE('La oficina con ID ' || p_ofi_id || ' posee ' || cantidad_pedidos || ' pedidos.');
    
    IF cantidad_pedidos = 0 THEN
        nuevo_objetivo := 3000;
    ELSIF cantidad_pedidos < 5 THEN
        nuevo_objetivo := 5000;
    ELSIF cantidad_pedidos >= 5 AND cantidad_pedidos <=9 THEN
        nuevo_objetivo := 10000;
    ELSE
        nuevo_objetivo := 15000;
    END IF;
    /*
    UPDATE oficinas_vtas 
        SET objetivo_vtas = nuevo_objetivo 
    WHERE id_oficina = p_ofi_id; */
    SELECT objetivo_vtas INTO objetivo_actual 
    FROM oficinas_vtas 
    WHERE id_oficina = p_ofi_id;
    
    -- COMMIT;
    
    DBMS_OUTPUT.PUT_LINE(
    'Voy a reemplazar ' 
    || objetivo_actual || ' por ' 
    || nuevo_objetivo || ' en la oficina con id: ' 
    || p_ofi_id);
    
END;
