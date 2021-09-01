create or replace PROCEDURE TP5_TEST(p_idPedido IN NUMBER) 
IS
    limite CONSTANT NUMBER := 7;
    monto NUMBER := 0;
    ape vendedores.apellidos%TYPE;
    
    CURSOR c1 IS (SELECT * FROM 
        (SELECT precio_unitario, cantidad FROM renglones_pdo WHERE id_pedido = p_idPedido 
        ORDER BY id_renglon) WHERE ROWNUM <= limite);
BEGIN
    --
   SELECT apellidos into ape FROM vendedores WHERE id_vend = 1;

    monto := 1;
END;