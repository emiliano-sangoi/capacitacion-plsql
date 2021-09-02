/*
    Escriba una consulta que muestre el apellido y la fecha de ingreso 
    de cualquier vendedor de la misma oficina de Ventas que Migliazzo. 
    Excluya a Migliazzo
*/

SELECT apellidos, fecha_ingreso
FROM vendedores v 
WHERE id_oficina = (SELECT id_oficina 
                    FROM vendedores 
                    WHERE apellidos = 'Migliazzo');