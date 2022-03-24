SELECT pizzeria.name, person_visits.pizzeria_id
FROM pizzeria LEFT JOIN person_visits ON person_visits.pizzeria_id = pizzeria.id
WHERE person_visits.pizzeria_id is null;