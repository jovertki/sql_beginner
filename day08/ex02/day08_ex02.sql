--session 1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM pizzeria;
update pizzeria SET rating = 4 WHERE name = 'Pizza Hut';
COMMIT WORK;
SELECT * FROM pizzeria;

--session 2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;
SELECT * FROM pizzeria;
update pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';
COMMIT WORK;
SELECT * FROM pizzeria;