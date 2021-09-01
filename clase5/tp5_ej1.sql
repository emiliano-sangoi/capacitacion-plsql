/*
Modifique el Ejercicio 3 de la Práctica “TP Control de Flujo” para determinar la cantidad de
filas actualizadas, a través del atributo %ROWCOUNT del cursor implícitamente creado por
ORACLE.
*/
CREATE OR REPLACE PROCEDURE TP5_EJ1
IS
    id_ofi INTEGER;
    nueva_cuota NUMBER;
    objetivo_actual NUMBER;
    row_count INTEGER;
BEGIN

    FOR id_ofi IN 1..5 LOOP
        row_count := 0;
        DBMS_OUTPUT.PUT_LINE('Oficina con ID ' || id_ofi);      
        
        IF MOD(id_ofi,2) = 0 THEN
            -- OFICINA PAR
            nueva_cuota := 5000;
        ELSE
            -- OFICINA IMPAR
            nueva_cuota := 6500;
        END IF;
        
        -- Actualizar vendedores:
        UPDATE VENDEDORES SET cuota_vtas = nueva_cuota
        WHERE id_oficina = id_ofi AND CARGO NOT IN ('GERENTE DE SEGMENTO', 'SUPERVISOR');
        
        row_count := SQL%ROWCOUNT;
        
        IF row_count < 3 THEN
            DBMS_OUTPUT.PUT_LINE('Menos de 3 vendedores se actualizaron en la oficina: ' || id_ofi);
        ELSE
            DBMS_OUTPUT.PUT_LINE(row_count || ' filas se actualizaron en la oficina ' || id_ofi);
        END IF;
        
    END LOOP;
END;