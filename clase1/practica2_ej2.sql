-- Evalúe el bloque PL/SQL que se da a continuación. Determine cada uno de los valores
-- siguientes de acuerdo a las reglas de alcance (considerando siempre el valor de la variable luego
-- de la sentencia de asignación).

CREATE OR REPLACE PROCEDURE guia2_ejercicio2 
IS
BEGIN
DECLARE
    v_peso NUMBER(3) := 600;
    v_mensaje VARCHAR2(255) := 'Producto 10012';
BEGIN
    DECLARE
        v_peso NUMBER(3) := 1;
        v_mensaje VARCHAR2(255) := 'Producto 11001';
        v_nueva_localidad VARCHAR2(50) := 'Europa';
    BEGIN
        v_peso := v_peso + 1;
       -- v_nueva_localidad := v_nueva_localidad || ' Oeste';
    END;
    v_peso := v_peso + 1;
    v_mensaje := v_mensaje || ' está en stock';
    --v_nueva_localidad := v_nueva_localidad || ' Oeste';
END;
END;



/*
a) El valor de v_peso dentro del sub-bloque: 1
b) El valor de v_nueva_localidad dentro del sub-bloque: 
c) El valor de v_peso dentro del bloque principal: 
d) El valor de v_mensaje dentro del bloque principal: 
e) El valor de v_nueva_localidad dentro del bloque principal: 
*/