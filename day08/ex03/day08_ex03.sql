BEGIN TRANSACTION; --1
select * from pizzeria; --3
select * from pizzeria; --6
commit work; --7
select * from pizzeria; --8


BEGIN TRANSACTION;--2
update pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut'; --4
commit work; --5
SELECT * FROM pizzeria; --9