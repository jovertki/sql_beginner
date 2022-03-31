SELECT name, COUNT(person_id)
FROM person_visits JOIN person on person.id = person_visits.person_id
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;

--wtf with data sample???