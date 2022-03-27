CREATE VIEW v_price_with_discount 
AS
(SELECT person.name, menu.pizza_name, menu.price, (menu.price * 0.9)::bigint as discount_price
FROM person 
JOIN person_order as po on person.id = po.person_id
JOIN menu on po.menu_id = menu.id
ORDER BY 1, 2);