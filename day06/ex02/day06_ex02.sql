SELECT name, pizza_name, price, CAST(price * (1 - discount / 100) AS BIGINT) AS discount_price
FROM person JOIN person_order as po ON po.person_id = person.id
JOIN menu ON menu.id = po.menu_id
JOIN person_discounts AS pd ON pd.person_id = po.person_id
ORDER BY 1, 2;