--  actualizar el monto vendido por un ejecutivo de cuentas
create or replace PROCEDURE TP6_EJ4(idVendedor IN NUMBER, monto IN NUMBER) 
IS
    c NUMBER;
    v NUMBER;
    nuevo_monto_oficina NUMBER;
    idOfi vendedores.id_oficina%TYPE;
    v_error NUMBER;
BEGIN

    v_error := 2;
    
    SELECT 1,id_oficina, ventas 
    INTO c, idOfi, v FROM vendedores 
    WHERE id_vend = idVendedor;

    UPDATE vendedores
    SET ventas = nvl(ventas, 0) + nvl(monto,0)
    WHERE id_vend = idVendedor;   
    
    IF SQL%NOTFOUND THEN
        dbms_output.put_line('Registro modificado correctamente.');
        v_error := 1;
        RAISE NO_DATA_FOUND;
    END IF;
    
    -- Actualizar oficina:
    TP6_EJ2(idOfi, monto);
    
    dbms_output.put_line('El vendedor ' || idVendedor || ' efectuo ventas por un total de ' 
        || TO_CHAR(nvl(v,0)+nvl(monto,0), 'FM$9G999G990D00') );            
    
    COMMIT;    
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
    
        IF v_error = 1 THEN
            dbms_output.put_line('No se ha podido actualizar las ventas del vendedor: ' || idVendedor);            
        ELSE
            dbms_output.put_line('No se encontro el vendedor: ' || idVendedor);
        END IF;
        
        ROLLBACK;
        
        --select id_vend, id_oficina, ventas from vendedores where id_vend = 1;
        
        --RETURN;
END;