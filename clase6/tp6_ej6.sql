/*
Modifique el Ejercicio 2 de la Práctica de Cursores para que algunos 
de los mensajes se traten como excepciones.

a) Defina dos excepciones.
b) Si el pedido no existe o no tiene renglones genere una de las excepciones
antes definida. El manejador de la excepción deberá mostrar un mensaje 
adecuado y cerrar el cursor.

c) Si el pedido tiene menos de siete períodos de servicios, genere 
la otra excepción definida. El manejador de la excepción deberá
mostrar un mensaje adecuado y cerrar el cursor.

d) Si el pedido tiene siete renglones o más, muestre el mensaje original, pero no trate la
situación como una excepción.
*/
create or replace PROCEDURE TP6_EJ6 (p_a IN NUMBER DEFAULT 0, p_b IN NUMBER DEFAULT 0) 
IS 
    resultado NUMBER;
BEGIN   
    resultado :=  (p_a / p_b) + p_b;

    DBMS_OUTPUT.PUT_LINE('El resultado es: ' || resultado);    

EXCEPTION
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Error: division por 0');  

END;