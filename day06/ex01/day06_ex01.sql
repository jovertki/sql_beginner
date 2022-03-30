INSERT INTO person_discounts
SELECT ROW_NUMBER( ) OVER () AS id,
	person_id,
	pizzeria_id, 
CASE
	WHEN visits = 1 THEN 10.5
	WHEN visits = 2 THEN 22
	ELSE 30
END
	AS discount
FROM(
SELECT person_id, pizzeria_id, count( person_id) as visits
FROM person_order 
join menu ON menu.id = person_order.menu_id
GROUP BY person_id, pizzeria_id ORDER BY 1, 2) as t1;
