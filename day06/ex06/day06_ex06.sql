CREATE SEQUENCE seq_person_discounts
	INCREMENT 1;

SELECT setval('seq_person_discounts', (SELECT MAX(id) FROM person_discounts));

ALTER TABLE person_discounts
ALTER COLUMN id set DEFAULT nextval('seq_person_discounts');

--for testing
INSERT INTO person_discounts(person_id, pizzeria_id, discount)
VALUES(1,2, 50);
