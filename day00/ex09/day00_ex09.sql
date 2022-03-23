SELECT (SELECT name FROM person WHERE person.id = t1.person_id) AS person_name ,  -- this is an internal query in a main SELECT clause
        (SELECT name FROM pizzeria WHERE pizzeria.id = t1.pizzeria_id) AS pizzeria_name  -- this is an internal query in a main SELECT clause
FROM (SELECT * FROM person_visits WHERE visit_date BETWEEN '2022-01-07' AND '2022-01-09') AS t1 -- this is an internal query in a main FROM clause
ORDER BY person_name ASC, pizzeria_name DESC;