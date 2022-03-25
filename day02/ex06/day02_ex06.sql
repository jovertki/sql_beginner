WITH people AS (SELECT id, name FROM person WHERE name = 'Denis' OR name = 'Anna')

SELECT pizza_name, pizzeria.name
FROM menu JOIN pizzeria ON menu.pizzeria_id = pizzeria.id JOIN person_order ON menu_id = menu.id JOIN people ON person_id = people.id
ORDER BY 1, 2;
