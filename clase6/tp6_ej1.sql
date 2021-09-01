/*
Escriba un procedimiento para actualizar el monto vendido por un ejecutivo
de cuentas.
    a) El identificador del vendedor y el monto vendido deben ser parámetros
    de entrada al procedimiento.
    b) Una vez que el monto fue actualizado, imprima la siguiente oración
    en la pantalla: “El vendedor Y efectuó ventas por un total de $ 
    9.999.990,00.-”, donde Y representa el número de vendedor y $ 9.999.990,00.
    - es el formato a establecer para el monto.

Se debe tratar la excepción que se genera cuando el parámetro que determina
la identificación del vendedor, no corresponde a un vendedor existente en
la base de datos. En el caso que se produzca la excepción, muestre un
mensaje adecuado que informe del hecho ocurrido, y deje los objetos de
la base de datos en el estado anterior a la ejecución del proceso.
¿Cuál de las sentencias DML genera la excepción?
*/
create or replace PROCEDURE TP6_EJ1(idVendedor IN NUMBER, monto IN NUMBER) 
IS
    c NUMBER;
    v NUMBER;
BEGIN

    SELECT 1, ventas INTO c,v FROM vendedores WHERE id_vend = idVendedor;
    
    UPDATE vendedores
    SET ventas = nvl(ventas,0) + nvl(monto,0)
    WHERE id_vend = idVendedor;
    
    dbms_output.put_line('El vendedor ' || idVendedor || ' efectuo ventas por un total de ' 
        || TO_CHAR(v+monto, 'FM$9G999G990D00') );
        
    COMMIT;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('no existe el vendedor: ' || idVendedor);
        ROLLBACK;
END;