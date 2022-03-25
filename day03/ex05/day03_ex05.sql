WITH avisit AS (
	SELECT pizzeria.name
	FROM pizzeria
	JOIN person_visits AS pv ON pizzeria.id = pv.pizzeria_id
	JOIN (SELECT id FROM person WHERE name = 'Andrey') as person on person.id = pv.person_id
),
aorder AS (
	SELECT pizzeria.name
	FROM pizzeria
	JOIN menu ON pizzeria.id = menu.pizzeria_id
	JOIN person_order AS po ON menu.id = po.menu_id
	JOIN (SELECT id FROM person WHERE name = 'Andrey') as person on person.id = po.person_id
)

SELECT name as pizzeria_name
FROM avisit
EXCEPT
SELECT name as pizzeria_name
FROM aorder