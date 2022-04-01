BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ; --1
select SUM(rating) from pizzeria; --3
select SUM(rating) from pizzeria; --6
commit work; --7
select SUM(rating) from pizzeria; --8


BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;--2
update pizzeria SET rating = 5 WHERE name = 'Pizza Hut'; --4
commit work; --5
select SUM(rating) from pizzeria; --9