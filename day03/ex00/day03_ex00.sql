SELECT pizza_name, price, pizzeria.name AS pizzeria_name, visit_date
FROM (SELECT id FROM person WHERE name = 'Kate') as kate
JOIN person_visits AS pv ON pv.person_id = kate.id
JOIN person_order AS po ON po.person_id = kate.id
JOIN menu AS m ON m.id = po.menu_id
JOIN pizzeria ON pizzeria.id = m.pizzeria_id