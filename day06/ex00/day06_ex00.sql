CREATE TABLE person_discounts (
	id BIGINT PRIMARY KEY,
	person_id BIGINT not null,
	pizzeria_id BIGINT not null,
	discount numeric,
	CONSTRAINT fk_person_discounts_person_id foreign key (person_id) references person(id),
	CONSTRAINT fk_person_discounts_pizzeria_id foreign key (pizzeria_id) references pizzeria(id)
);