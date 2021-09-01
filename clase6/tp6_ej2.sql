/*
Ejercicio 2
==========================================================
Escriba otro procedimiento para actualizar el monto de ventas efectuadas
por una oficina.
a) El identificador de la oficina y el monto vendido deben ser parámetros
de entrada al procedimiento.
b) Una vez que el monto fue actualizado, imprima la siguiente oración en 
la pantalla: “Las ventas efectuadas por la oficina Y ascienden a 
$ 9.999.990,00.-”, donde Y representa el número de oficina y
$ 9.999.990,00.- es el formato a establecer para el monto.
*/
create or replace PROCEDURE TP6_EJ2(idOfi IN NUMBER, monto IN NUMBER) 
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