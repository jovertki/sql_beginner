CREATE INDEX idx_person_name ON person(name);

SET enable_seqscan = OFF;

EXPLAIN ANALYZE
SELECT * FROM person
WHERE UPPER(name) = 'Denis';