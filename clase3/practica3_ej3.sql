/*
Ejercicio 3
-----------------------------------------------------------------------------

Escriba un procedimiento que haga un ciclo entre los números de oficinas (1 a 5) para actualizar
la cuota de ventas de todos los vendedores. No ejecute un COMMIT.

a) Para todos los vendedores, cuyos cargos no son ni ‘GERENTE DE SEGMENTO’ ni ‘SUPERVISOR’: si el número 
de la oficina es par, cambie la cuota de ventas de los vendedores de esa oficina a 5.000;
en caso contrario cámbielo a 6.500.

b) Una vez que las filas fueron actualizadas, averigüe cuántas filas se modificaron. Imprima
las siguientes oraciones en la pantalla basado en la cantidad de líneas actualizadas.
    i. Si se actualizaron menos de 3 líneas, la oración debe ser “Menos de 3 vendedores 
    se actualizaron en la oficina X” donde X representa el número de oficina.
    ii. En otro caso, la oración debe ser “Y filas se actualizaron en la oficina X”, donde
    Y es la cantidad de filas modificadas y X es el número de oficina.

c) Deshaga los cambios (ROLLBACK). Coloque un punto de corte en la sentencia
condicional donde se verifica la cantidad de filas actualizadas. Ejecute el procedimiento.
Consulte el nodo Pila para controlar los valores de las variables a medida que avanza por
las sentencias del ciclo.
*/
CREATE OR REPLACE PROCEDURE CAMBIAR_CUOTA_VENTAS
IS
    id_ofi INTEGER;
    nueva_cuota NUMBER;
    objetivo_actual NUMBER;
    row_count INTEGER;
BEGIN

    FOR id_ofi IN 1..5 LOOP
        row_count := 0;
        DBMS_OUTPUT.PUT_LINE('Oficina con ID ' || id_ofi);      
        
        IF id_ofi%2 = 0 THEN
            -- OFICINA PAR
            nueva_cuota := 5000;
        ELSE
            -- OFICINA IMPAR
            nueva_cuota := 6500;
        END IF;
        
        -- Actualizar vendedores:
        UPDATE VENDEDORES
        SET cuota_vtas := nueva_cuota
        WHERE id_oficina = id_ofi AND CARGO NOT IN ('GERENTE DE SEGMENTO', 'SUPERVISOR');
        
        -- Cantidad de filas actualizadas
        SELECT %ROW_COUNT INTO row_count FROM dual;
        
        IF row_count < 3 THEN
            DBMS_OUTPUT.PUT_LINE('Menos de 3 vendedores se actualizaron en la oficina: ' || id_ofi);
        ELSIF
            DBMS_OUTPUT.PUT_LINE(row_count || ' filas se actualizaron en la oficina ' || id_ofi);
        END IF;
        
    END LOOP;
END;