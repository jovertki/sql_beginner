SELECT p.name as person_name, pizza_name, piz.name AS pizzeria_name
FROM person AS p
JOIN person_order AS po ON p.id = po.person_id
JOIN menu AS m ON po.menu_id = m.id
JOIN pizzeria AS piz ON m.pizzeria_id = piz.id
ORDER BY person_name, pizza_name, pizzeria_name;