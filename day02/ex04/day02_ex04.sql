SELECT pizza_name, pizzeria.name, price
FROM menu JOIN pizzeria ON pizzeria_id = pizzeria.id
WHERE pizza_name = 'mushroom pizza' OR pizza_name = 'pepperoni pizza'
ORDER BY 1,2;