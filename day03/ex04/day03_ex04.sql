WITH males AS(
	SELECT id
	FROM person
	WHERE gender = 'male'
),
females AS (
	SELECT id
	FROM person
	WHERE gender = 'female'
),
female_orders AS(
	SELECT pizzeria.name
	FROM pizzeria
	JOIN menu ON pizzeria.id = menu.pizzeria_id
	JOIN person_order AS pv on menu.id = pv.menu_id
	JOIN females on females.id = pv.person_id
),
male_orders AS(
	SELECT pizzeria.name
	FROM pizzeria
	JOIN menu ON pizzeria.id = menu.pizzeria_id
	JOIN person_order AS pv on menu.id = pv.menu_id
	JOIN males on males.id = pv.person_id
),

only_male AS (
	SELECT name
	FROM male_orders
	EXCEPT
	SELECT name
	FROM female_orders
),
only_female AS (
	SELECT name
	FROM female_orders
	EXCEPT
	SELECT name
	FROM male_orders
)

SELECT name
FROM only_male 
UNION 
SELECT name
FROM only_female 
ORDER BY 1;