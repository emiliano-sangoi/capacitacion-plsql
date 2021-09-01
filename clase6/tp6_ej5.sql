/*
Modifique el Ejercicio 1 de la Pr�ctica de Procedimientos y Funciones 
para tratar la excepci�n que se producir�a al intentar dividir por cero.

Cree y ejecute un procedimiento que acepte dos n�meros a trav�s de 
par�metros. El primer n�mero debe ser dividido por el segundo, y al
resultado se le debe sumar el segundo n�mero. El resultado final de
este c�lculo debe ser almacenado en una variable PL/SQL e impreso 
por pantalla.
*/
CREATE OR REPLACE PROCEDURE TP6_EJ5_CALCULA (p_a IN NUMBER DEFAULT 0, p_b IN NUMBER DEFAULT 0) 
IS 
    resultado NUMBER;
BEGIN   
    resultado :=  (p_a / p_b) + p_b;
      
    DBMS_OUTPUT.PUT_LINE('El resultado es: ' || resultado);    

EXCEPTION
    WHEN ZERO_DIVIDE THEN
    DBMS_OUTPUT.PUT_LINE('Error: division por 0');  
    
END;