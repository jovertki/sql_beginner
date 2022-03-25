SELECT COALESCE(person.name, '-') as person_name, pv.visit_date, COALESCE(pizzeria.name, '-') as pizzeria_name
FROM person 
FULL OUTER JOIN (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-03') as pv ON person.id = pv.person_id 
FULL JOIN pizzeria ON pizzeria.id = pv.pizzeria_id
ORDER BY 1, 2, 3;