/*
Cree un procedimiento para insertar una nueva localidad en la tabla LOCALIDADES.
    a) Cree par�metros para el c�digo postal, el nombre de la localidad y el c�digo de la
    provincia.
    
    b) El valor del c�digo postal auxiliar ser� �1�, si no hay otras localidades con el mismo
    c�digo postal; en cambio ser� el n�mero inmediato superior al �ltimo c�digo postal
    auxiliar, si existen en la base de datos otras localidades con el mismo c�digo postal.
    
    c). Muestre todos los datos de la nueva localidad creada. Para ello, defina un registro capaz de
    almacenar la fila de la tabla LOCALIDADES recientemente insertada, y muestre los
    valores de sus campos.
    
*/
CREATE OR REPLACE PROCEDURE TP3EJ6(codPostal IN NUMBER, nomLocalidad IN VARCHAR2, idProvincia IN VARCHAR2)
IS
    codPostAux NUMBER(2,0);
    fila LOCALIDADES%ROWTYPE;
BEGIN

    codPostAux := CALCULAR_COD_POST_AUX(codPostal, nomLocalidad, idProvincia);
    
    INSERT INTO LOCALIDADES(COD_POST, COD_POST_AUX, NOMBRE, ID_PROV)
    VALUES(codPostal, codPostAux, nomLocalidad, idProvincia);

    SELECT * INTO fila 
    FROM LOCALIDADES l 
    WHERE 
        l.cod_post = codPostal AND
        l.cod_post_aux = codPostAux;

    DBMS_OUTPUT.PUT_LINE('Codigo postal: ' || fila.cod_post);
    DBMS_OUTPUT.PUT_LINE('Codigo postal auxiliar: ' || fila.cod_post_aux);
    DBMS_OUTPUT.PUT_LINE('Nombre localidad: ' || fila.nombre);
    DBMS_OUTPUT.PUT_LINE('ID Provincia: ' || fila.id_prov);

END;