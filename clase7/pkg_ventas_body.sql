/*
el orden de compilacion de cabecera o body no existe.
*/
CREATE OR REPLACE PACKAGE BODY pkg_ventas AS

    PROCEDURE TP6_EJ2(idOfi IN NUMBER, monto IN NUMBER) 
    IS
        c NUMBER := 0;
        v NUMBER;
    BEGIN

        --SELECT 1, ventas INTO c, v FROM oficinas_vtas WHERE id_oficina = idOfi;        
        
        UPDATE oficinas_vtas
        SET ventas = nvl(ventas, 0) + nvl(monto,0)
        WHERE id_oficina = idOfi;
        
        IF SQL%FOUND THEN
            COMMIT;
            dbms_output.put_line('Las ventas efectuadas por la
            oficina ' || idOfi || ' y ascienden a ' 
            || TO_CHAR(monto, 'FM$9G999G990D00') );
        ELSE
            dbms_output.put_line('no existe la oficina: ' || idOfi );
        END IF;   
    END;    
    
    
    
    PROCEDURE TP6_EJ3(idVendedor IN NUMBER, monto IN NUMBER) IS
        c NUMBER;
        v NUMBER;
        nuevo_monto_oficina NUMBER;
        idOfi vendedores.id_oficina%TYPE;
    BEGIN

        SELECT 1,id_oficina, ventas 
        INTO c, idOfi, v FROM vendedores 
        WHERE id_vend = idVendedor;
    
        UPDATE vendedores
        SET ventas = nvl(ventas, 0) + nvl(monto,0)
        WHERE id_vend = idVendedor;        
    
        -- Actualizar oficina:
        pkg_ventas.TP6_EJ2(idOfi, monto);
        
        dbms_output.put_line('El vendedor ' || idVendedor || ' efectuo ventas por un total de ' 
            || TO_CHAR(nvl(v,0)+nvl(monto,0), 'FM$9G999G990D00') );            
        
        COMMIT;    
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('no existe el vendedor: ' || idVendedor);
            ROLLBACK;
    END;
    
    
    FUNCTION CALCULA_FUNC(p_a IN NUMBER DEFAULT 0, p_b IN NUMBER DEFAULT 0) RETURN NUMBER 
    IS
    resultado NUMBER := 0;
    BEGIN
        IF P_B = 0 THEN 
          DBMS_OUTPUT.PUT_LINE('EL SEGUNDO ARGUMENTO NO PUEDE SER 0');
          RETURN NULL;
        END IF;
    
        resultado :=  (p_a / p_b) + p_b;
        DBMS_OUTPUT.PUT_LINE('El resultado es: ' || resultado);
    
        RETURN resultado;
    END CALCULA_FUNC;
    
BEGIN
    NULL;
END;