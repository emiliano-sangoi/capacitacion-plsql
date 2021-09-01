/*
Cree un procedimiento que incluya un bloque anidado, como se muestra a continuación. Declare
dos variables, v_vendedor y v_ventas dentro del bloque principal. Declare también dos variables
v_vendedor y v_apellidos en el bloque anidado.
*/
CREATE OR REPLACE PROCEDURE GUIA2_EJERCICIO4 IS
    v_vendedor NUMBER(3);
    v_ventas NUMBER(8,2);
BEGIN
    v_vendedor := 13;
    SELECT
        ventas
    INTO
        v_ventas
    FROM
        vendedores
    WHERE id_vend = v_vendedor;

    DECLARE
        v_vendedor NUMBER(3);
        v_apellidos VARCHAR2(25);
    BEGIN
        SELECT
            id_vend, apellidos
        INTO
            v_vendedor, v_apellidos
        FROM
            vendedores
        WHERE id_vend = (SELECT id_vend FROM oficinas_vtas WHERE id_oficina = 1);

        SELECT
            ventas
        INTO
            v_ventas
        FROM
            vendedores
        WHERE id_vend = v_vendedor;
        
    END;
END;

/*

a) El valor de v_vendedor dentro del bloque anidado: NULL
b) El valor de v_apellidos dentro del bloque anidado: Maccagno
c) El valor de v_ventas dentro del bloque anidado: NULL
d) El valor de v_vendedor dentro del bloque principal: 13
e) El valor de v_apellidos dentro del bloque principal: NO EXISTE
f) El valor de v_ventas dentro del bloque principal, antes del sub-bloque: 1620
g) El valor de v_ventas dentro del bloque principal, después del sub-bloque: 

*/