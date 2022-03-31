with t1 AS (
SELECT pizzeria.name, COUNT(pizzeria_id) as ccount, 'order' AS action
FROM pizzeria join menu on pizzeria.id = menu.pizzeria_id
JOIN person_order AS po on po.menu_id = menu.id
GROUP BY pizzeria.name),
t2 AS (
SELECT pizzeria.name, COUNT(pizzeria_id) as ccount, 'visit' AS action
FROM pizzeria
JOIN person_visits AS pv ON pv.pizzeria_id = pizzeria.id
GROUP BY pizzeria.name
),

result AS (
	SELECT t1.name, (t1.ccount + t2.ccount) AS total_count
	FROM t1 JOIN t2 on t1.name = t2.name
)

SELECT pizzeria.name, 
CASE
	WHEN total_count IS NULL THEN 0
	ELSE total_count
END
FROM pizzeria FULL JOIN result on pizzeria.name = result.name
ORDER BY 2 DESC;