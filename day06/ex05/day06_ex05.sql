COMMENT ON TABLE person_discounts IS 'List of personal discounts';
COMMENT ON COLUMN person_discounts.id IS 'primary key';
COMMENT ON COLUMN person_discounts.person_id IS 'personal id of a person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'personal id of a pizzeria';
COMMENT ON COLUMN person_discounts.discount IS 'discount in percent';