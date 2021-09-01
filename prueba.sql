create or replace PROCEDURE PRUEBA(p_idPedido IN NUMBER) 
IS
    limite CONSTANT NUMBER := 7;
    monto NUMBER := 0;
    pu renglones_pdo.precio_unitario%TYPE;
    cant renglones_pdo.cantidad%TYPE;
    reg vendedores%TYPE;
    CURSOR c1 IS SELECT * FROM vendedores;
BEGIN
    OPEN c1;
    
    LOOP
        FETCH c1 INTO reg;
        EXIT WHEN emp_cur%NOTFOUND;
    END LOOP;

END;