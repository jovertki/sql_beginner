SELECT address, p.name, COUNT(p.name) as count_of_orders
FROM person
JOIN person_order AS po ON po.person_id = person.id
JOIN menu as m ON po.menu_id = m.id
JOIN pizzeria AS p on p.id = m.pizzeria_id
GROUP BY 1,2
ORDER BY 1,2; 