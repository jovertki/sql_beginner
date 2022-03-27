WITH R AS (SELECT person_id FROM person_visits WHERE visit_date <= '2022-01-02'),
S AS (SELECT person_id FROM person_visits WHERE visit_date <= '2022-01-06'),
ids AS (
SELECT * 
FROM
  (SELECT *
  FROM R
  EXCEPT
  SELECT *
  FROM S) as t1
UNION
SELECT *
FROM
(SELECT *
  FROM S
  EXCEPT
  SELECT *
  FROM R) as t2)

SELECT person.id, person.name, person.gender, person.address
FROM person JOIN ids on person.id = ids.person_id
ORDER BY 1;

--not sure