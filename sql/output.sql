
WITH temp_product (product_id, product_name, price, quantity) AS (
VALUES 
(1, 'Mug A', 25.0, 10),
(2, 'Mug B', 30.0, 15),
(3, 'Mug C', 20.0, 8),
(4, 'Bottle X', 50.0, 12),
(5, 'Bottle Y', 45.0, 20),
(6, 'Plate Alpha', 60.0, 5),
(7, 'Plate Beta', 55.0, 7),
(8, 'Cup 1', 35.0, 18),
(9, 'Cup 2', 40.0, 22),
(10, 'Coffee Maker A', 20.0, 30)
)
SELECT * FROM temp_product tp
    