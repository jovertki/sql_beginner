BEGIN TRANSACTION;--1
UPDATE person SET age = 1 WHERE id = 1;--3
UPDATE person SET age = 1 WHERE id = 2;--5
commit work;--7


BEGIN TRANSACTION;--2
UPDATE person SET age = 2 WHERE id = 2;--4
UPDATE person SET age = 2 WHERE id = 1;--6
commit work;--8