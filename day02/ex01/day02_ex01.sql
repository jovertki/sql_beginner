SELECT DISTINCT pv.visit_date AS missing_date
FROM (SELECT visit_date, id
		FROM person_visits 
		WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10')) as pv
		RIGHT JOIN  (SELECT visit_date, id
		FROM person_visits 
		WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10') AND person_id>2) as pv2 on pv.id = pv2.id
		
ORDER BY 1;

ПОЧЕМУ НИЖНЕЕ РАБОТАЕТ, А ВЕРХНЕЕ НЕТ?

SELECT DISTINCT pv.visit_date AS missing_date, pv3.id
FROM 
	(SELECT DISTINCT visit_date
		FROM person_visits 
		WHERE (visit_date BETWEEN '2022-01-01' AND '2022-01-10') ) as pv
	LEFT JOIN 
   	(SELECT pv2.visit_date, pv2.id
     FROM (SELECT visit_date, id, person_id
           FROM person_visits
           WHERE person_id = 1 OR person_id = 2) as pv2) as pv3 on pv.visit_date = pv3.visit_date
WHERE pv3.id is null
ORDER BY 1;