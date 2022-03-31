WITH t1 as (
	SELECT pizzeria.name, COUNT(pizzeria_id), 'order' AS action
	FROM pizzeria join menu on pizzeria.id = menu.pizzeria_id
	JOIN person_order AS po on po.menu_id = menu.id
	GROUP BY pizzeria.name
	ORDER BY 3, 2 DESC
	LIMIT 3),
t2 AS (SELECT pizzeria.name, COUNT(pizzeria_id), 'visit' AS action
FROM pizzeria
JOIN person_visits AS pv ON pv.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
ORDER BY 3, 2 DESC
LIMIT 3)

SELECT * FROM(
	SELECT * FROM t1
	Union
	SELECT * FROM t2
) as t3
ORDER BY 3, 2 DESC;