WITH cte_pv AS (SELECT DISTINCT visit_date
		FROM person_visits 
		WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10')), 
	
		cte_pv3 AS (SELECT pv2.visit_date, pv2.id
     		FROM (SELECT visit_date, id, person_id
        	FROM person_visits
        	WHERE person_id = 1 OR person_id = 2) as pv2)

SELECT DISTINCT cte_pv.visit_date AS missing_date, cte_pv3.id
FROM cte_pv	
LEFT JOIN cte_pv3 ON cte_pv.visit_date = cte_pv3.visit_date
WHERE cte_pv3.id is null
ORDER BY 1;