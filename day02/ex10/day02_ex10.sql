WITH t1 AS(
	SELECT name, address
	FROM person
),
t2 AS(
	SELECT name, address
	FROM person
)


SELECT t1.name as person_name1, t2.name as person_name2, t1.address as common_address
FROM t1, t2
WHERE (t1.name < t2.name AND t1.address = t2.address)
ORDER BY 1, 2, 3;