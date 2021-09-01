BEGIN
    CAMBIAR_OBJETIVO_VENTAS(1); -- 10 pedidos / objetivos 10000 -> 15000
    CAMBIAR_OBJETIVO_VENTAS(2); -- 2 pedidos / objetivos 2500 -> 5000
    CAMBIAR_OBJETIVO_VENTAS(3); -- 6 pedidos / objetivos 4000 -> 10000
    CAMBIAR_OBJETIVO_VENTAS(4); -- 4 pedidos / objetivos 10000 -> 5000
    CAMBIAR_OBJETIVO_VENTAS(5); -- 4 pedidos / objetivos 5500 -> 5000
    CAMBIAR_OBJETIVO_VENTAS(6); -- No existe la oficina
    CAMBIAR_OBJETIVO_VENTAS(-4); -- No existe la oficina
    CAMBIAR_OBJETIVO_VENTAS(NULL); -- 
    
    -- COMMIT;
    -- ROLLBACK NO AFECTA A LA SECUENCIA
    -- TO_DATE('08/09/1990', 'DD/MM/YYYY')
    
END;