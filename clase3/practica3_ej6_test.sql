DECLARE
    codPostAux NUMBER(2,0);
BEGIN
    -- TP3EJ6(1);
    codPostAux := CALCULAR_COD_POST_AUX(2241);
END;

-- SELECT l.cod_post, l.cod_post_aux FROM localidades l;