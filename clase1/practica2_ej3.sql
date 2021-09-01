DECLARE
    porcentaje_comision CONSTANT NUMBER := 0.30;
    V_VENTAS NUMBER := 0;
    V_COMISION number := 0;
    V_VALIDO BOOLEAN;
    V_CONTADOR BINARY_INTEGER := 0;
    V_VENTAS_MENSUAL V_VENTAS%TYPE := 0;
    enviado BOOLEAN NOT NULL DEFAULT FALSE;    

    -- Almacenar la información del apellido, nombre y sexo de un nuevo vendedor en un registro PL/SQL.
    type persona IS RECORD
    (
        apellido VARCHAR2(30),
        nombre VARCHAR2(30),
        sexo SMALLINT DEFAULT 1
    );

    type tabla_personas IS TABLE OF persona INDEX BY BINARY_INTEGER;
    t_clientes tabla_personas;
    
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Porcentaje comision: ' || porcentaje_comision);
    
    -- a. Asignar el valor de ventas V_VENTAS al identificador de ventas mensuales V_VENTAS_MENSUAL.
    V_VENTAS_MENSUAL := V_VENTAS;
    
    -- b. Almacenar el apellido “Maduro” en la posición 3 de la tabla de apellidos TABLA_APELLIDOS.
    -- TABLA_APELLIDOS(3).apellido := 'Maduro';
    
    -- c. Asignar la comisión de la tabla VENDEDORES en la variable V_COMISION.
    SELECT SUM(COMISION) INTO V_COMISION FROM VENDEDORES;
    
    -- d. Escriba una sentencia de asignación para incrementar en uno el valor del contador de ciclo
    V_CONTADOR := V_CONTADOR + 1;
    
    -- e. Escriba una sentencia de asignación para cambiar el valor del indicador booleano
    -- V_IGUAL, dependiendo de la igualdad de los números V_N1 y V_N2.
    V_IGUAL := V_N1 = V_N2;
    
    -- f. Registrar en la variable V_VALIDO si la variable V_ID_VEND contiene un valor.
    IF V_ID_VEND IS NOT NULL THEN
        V_VALIDO := V_ID_VEND;
    END IF;
    
END;
