UPDATE menu
SET price = CAST(price*0.9 AS integer)
WHERE pizza_name = 'greek pizza'