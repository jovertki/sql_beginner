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
female_pizza AS(
	SELECT pizzeria.name
	FROM pizzeria 
	JOIN person_visits AS pv on pizzeria.id = pv.pizzeria_id
	JOIN females on females.id = pv.person_id
),
male_pizza AS(
	SELECT pizzeria.name
	FROM pizzeria 
	JOIN person_visits AS pv on pizzeria.id = pv.pizzeria_id
	JOIN males on males.id = pv.person_id
),

only_male AS (
	SELECT name
	FROM male_pizza
	EXCEPT ALL
	SELECT name
	FROM female_pizza
),
only_female AS (
	SELECT name
	FROM female_pizza
	EXCEPT ALL
	SELECT name
	FROM male_pizza
)

SELECT name
FROM only_male 
UNION ALL 
SELECT name
FROM only_female 
ORDER BY 1;