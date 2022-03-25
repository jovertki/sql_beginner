WITH males_ms AS (
	SELECT name, id
	FROM person
	WHERE gender ='male' AND (address = 'Moscow' OR address = 'Samara'))

SELECT males_ms.name
FROM males_ms 
JOIN person_order ON person_id = males_ms.id
JOIN menu ON person_order.menu_id = menu.id
WHERE pizza_name = 'pepperoni pizza' OR pizza_name = 'mushroom pizza'
ORDER BY 1 DESC;