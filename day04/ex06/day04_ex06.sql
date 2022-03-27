CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats 
AS
(SELECT name
FROM (SELECT pizzeria.name AS name, pizzeria.id AS id
FROM pizzeria 
JOIN person_visits ON pizzeria_id = pizzeria.id
JOIN person ON person_id = person.id
WHERE person.name = 'Dmitriy' AND visit_date = '2022-01-08') AS dmitry_pizzerias
JOIN menu ON pizzeria_id = dmitry_pizzerias.id
WHERE price <= 800)