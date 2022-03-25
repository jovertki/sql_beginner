WITH females AS (
	SELECT id, name
	FROM person
	WHERE gender = 'female'
),

pepperoni AS (
	SELECT name
	FROM person 
	JOIN person_order ON person_order.person_id = person.id
	JOIN menu ON person_order.menu_id = menu.id
	WHERE pizza_name = 'pepperoni pizza'
),

cheese AS (
	SELECT name
	FROM person 
	JOIN person_order ON person_order.person_id = person.id
	JOIN menu ON person_order.menu_id = menu.id
	WHERE pizza_name = 'cheese pizza'
)

SELECT DISTINCT cheese.name
FROM cheese NATURAL INNER JOIN pepperoni NATURAL INNER JOIN females
ORDER BY 1;

--Please find the names of all females who orders both pepperoni 
--and cheese pizzas (at any time and any pizzerias). 
--Make sure that the result is ordered by person name. 