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
    tt.cost AS total_cost, '{' || tt.tour || ',A}' AS tour
FROM
    (SELECT
         *
     FROM
         a_traces where node2 = 'A' and length(tour) = 7 AND cost=(
        SELECT MIN(cost) FROM a_traces where node2 = 'A' and length(tour) = 7 )
     UNION
     (SELECT
          *
      FROM
          a_traces where node2 = 'A' and length(tour) = 7 AND cost=(
         SELECT MAX(cost) FROM a_traces where node2 = 'A' and length(tour) = 7 ))) tt
ORDER BY total_cost, tour;