create table if not exists nodes
(
    node1 varchar not null,
    node2 varchar not null,
    cost integer not null default 0
);
insert into nodes values ('A', 'B', 10);
insert into nodes values ('B', 'A', 10);
insert into nodes values ('A', 'D', 20);
insert into nodes values ('D', 'A', 20);
insert into nodes values ('A', 'C', 15);
insert into nodes values ('C', 'A', 15);
insert into nodes values ('B', 'C', 35);
insert into nodes values ('C', 'B', 35);
insert into nodes values ('D', 'B', 25);
insert into nodes values ('B', 'D', 25);
insert into nodes values ('D', 'C', 30);
insert into nodes values ('C', 'D', 30);

WITH RECURSIVE a_traces AS (
    SELECT
        node1 as tour,
        node1,
        node2,
        cost
    FROM
        nodes
    WHERE
            node1 = 'A'
    UNION ALL
    SELECT
            parrent.tour || ',' || child.node1 as trace,
            child.node1,
            child.node2,
            parrent.cost + child.cost
    FROM
        nodes as child
            INNER JOIN a_traces as parrent ON child.node1 = parrent.node2
    where tour not like '%' || child.node1 || '%'
)

SELECT
    cost AS total_cost, '{' || tour || ',A}' AS tour
FROM
    a_traces where node2 = 'A' and length(tour) = 7 AND cost=(
	SELECT MIN(cost) FROM a_traces where node2 = 'A' and length(tour) = 7 ) ORDER BY total_cost, tour;