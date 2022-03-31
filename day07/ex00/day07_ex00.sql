SELECT person_id, COUNT(person_id)
FROM person_visits
GROUP BY 1
ORDER BY 2 DESC;

--wtf with data sample???