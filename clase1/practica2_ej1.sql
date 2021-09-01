DECLARE
-- Declare una constante para el porcentaje de comisión, que no cambia a lo largo del bloque PL/SQL.
    porcentaje_comision CONSTANT NUMBER := 0.30;

-- Declare una variable para almacenar los códigos “débito” y “crédito” (‘DB’ o ‘CR’).
    db NUMBER;
    cr NUMBER;

-- Declare una variable para acumular las ventas totales de una oficina e inicialícela en 0.
    ventas_totales NUMBER := 0;

-- Declare una variable que señale si un pedido fue enviado o no, e inicialícela con el valor 
--  FALSE. No debe permitir valores nulos.
    enviado BOOLEAN NOT NULL DEFAULT FALSE;    

-- Declare una variable para almacenar la fecha estimada de entrega de un pedido, e
-- inicialícela a quince días desde la fecha actual.
    fecha_entrega DATE := SYSDATE + 15;

-- Declare una variable para contar el número de veces que aparece un caracter en una string
-- e inicialícela en 0.
    ocurrencias BINARY_INTEGER := 0;

-- Declare variables para almacenar el nombre y el apellido de un cliente.
    apellido VARCHAR2(30);
    nombre VARCHAR2(30);

-- Declare una variable para almacenar el monto total de ventas de un vendedor, que sea del
-- mismo tipo que la variable que almacena el monto total de ventas de una oficina, e inicialícela en cero.
    monto_total ventas_totales%TYPE;

-- Declare una tabla PL/SQL para almacenar los nombres y apellidos de los clientes.
    type registro IS RECORD
    (
     apellido VARCHAR2(30),
         nombre VARCHAR2(30)
    );

    type tabla2 IS TABLE OF registro INDEX BY BINARY_INTEGER;
    t_clientes tabla2;
    
    
BEGIN
    DBMS_OUTPUT.PUT_LINE('Porcentaje comision: ' || porcentaje_comision);
    for i in 1..5 loop
        t_clientes(i).apellido := 'sdsdsd';
        t_clientes(i).nombre := 'weewewewewewewwee';
        dbms_output.put_line(t_clientes(i).apellido);
    end loop;
END;