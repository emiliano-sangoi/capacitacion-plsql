/*
Cree un procedimiento que seleccione el apellido, la fecha de ingreso y la comisi�n de un
vendedor, basado en un n�mero de vendedor pasado como par�metro. Imprima un mensaje en la
pantalla basado en cualquier combinaci�n de los siguientes criterios. Pruebe con los vendedores
cuyas identificaciones son: 1, 4, 7, 8, 9, 10 y 14.
Criterio                                Mensaje
La comisi�n es mayor al 15%             �Apellido� tiene una comisi�n mayor al 15%
El apellido contiene �R�                El apellido contiene R
La fecha de ingreso fue en marzo        �Apellido� comenz� en Marzo
Ninguno de los anteriores               �Apellido� no cumple ning�n criterio
*/
CREATE OR REPLACE PROCEDURE TP3EJ5(p_id_vend IN INTEGER)
IS
    v_apellidos VARCHAR2(25);
    v_fecha_ingreso DATE;
    v_comision NUMBER(5,2);
    c1 BOOLEAN := FALSE;
    c2 BOOLEAN := FALSE;
    c3 BOOLEAN := FALSE;
BEGIN

    IF NOT VENDEDOR_EXISTE(p_id_vend) THEN
        DBMS_OUTPUT.PUT_LINE('El vendedor con ID ' || p_id_vend || ' NO existe.' );
        RETURN;
    END IF;

    SELECT 
        apellidos, fecha_ingreso, comision INTO
        v_apellidos, v_fecha_ingreso, v_comision
    FROM vendedores WHERE id_vend = p_id_vend;
    
    -- Criterios:
    c1 := nvl(v_comision, 0) > 15;
    c2 := INSTR(v_apellidos, 'R') > 15;
    c3 := TO_CHAR(v_fecha_ingreso, 'MM') = '03';
    
    IF c1 THEN
        DBMS_OUTPUT.PUT_LINE(v_apellidos || ' tiene una comisi�n mayor al 15%');        
    END IF;
    
    IF c2 THEN
        DBMS_OUTPUT.PUT_LINE('El apellido contiene R.');        
    END IF;
    
    IF c3 THEN
        DBMS_OUTPUT.PUT_LINE(v_apellidos || ' comenzo en marzo.');        
    END IF;

    IF not c1 and not c2 and not c3 THEN
        DBMS_OUTPUT.PUT_LINE(v_apellidos || ' no cumple ning�n criterio.');        
    END IF;
    
END;