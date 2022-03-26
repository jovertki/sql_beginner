WITH max_po as (SELECT MAX(id) AS id FROM person_order),
max_p AS (SELECT MAX(id) AS id FROM person)

INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (CAST(generate_series((SELECT id FROM max_po) + 1, (SELECT id FROM max_po) + (SELECT id FROM max_p) + 1) AS integer), 
        generate_series(1, (SELECT MAX(id) FROM person)), 
        (SELECT id FROM menu WHERE pizza_name='greek pizza'),
        '2022-02-25')


INSERT INTO person_order(id, person_id, menu_id, order_date)
SELECT (SELECT * FROM generate_series(MAX(po.id) + 1, MAX(po.id) + MAX(p.id) + 1)),
		(SELECT * FROM generate_series(1, MAX(p.id))),
		(SELECT id FROM menu WHERE pizza_name='greek pizza'),
		'2022-02-25'
		FROM person_order as po, person as p