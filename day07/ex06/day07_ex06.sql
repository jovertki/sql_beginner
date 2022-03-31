WITH menu_g AS (
SELECT menu_id, COUNT(menu_id) as orders, SUM(price) AS summ, MAX(price)as price
FROM person_order  AS po JOIN menu ON po.menu_id = menu.id 
GROUP BY 1),

t2 AS (
SELECT pizzeria.name, SUM(orders) AS count_of_orders, 
SUM(summ) AS summm, 
MAX(menu_g.price) AS max_price, 
MIN(menu_g.price) AS min_price
FROM menu join menu_g on menu_g.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name)

SELECT name, count_of_orders, ROUND(summm/count_of_orders, 2) AS average_price, max_price, min_price
FROM t2
ORDER BY 1;






