--address, formula, avrage, comparison 
--“(Maximal Age - Minimal Age ) / Maximal Age” 

--в заданиии ожидаются вычисления по формуле без скобок, сделал без скобок

WITH t_max_age AS (
	SELECT address, MAX(age) AS max_age
	FROM person
	GROUP BY 1
	ORDER BY 1
), 
t_min_age AS (
	SELECT address, MIN(age) AS min_age
	FROM person
	GROUP BY 1
	ORDER BY 1
), 
t_avg_age AS (
	SELECT address, AVG(age) AS avg_age
	FROM person
	GROUP BY 1
	ORDER BY 1
)

SELECT DISTINCT address, 
ROUND(max_age - min_age/ CAST(max_age AS NUMERIC), 2) AS formula, 
ROUND(avg_age, 2) AS average,  
max_age - min_age/ CAST(max_age AS NUMERIC) > avg_age AS comparison
FROM person
NATURAL JOIN t_max_age
NATURAL JOIN t_avg_age
NATURAL JOIN t_min_age
ORDER BY 1;