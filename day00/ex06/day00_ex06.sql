SELECT name, 
	CASE
		WHEN name='Denis' THEN 'true'
		WHEN name<>'Denis' THEN 'false' 
	END	
		AS check_name
FROM person 
WHERE id = ANY 
	(SELECT person_id 
	FROM person_order 
	WHERE menu_id=13 
	OR menu_id=14 
	OR menu_id=18 
	OR order_date='2022-01-07');