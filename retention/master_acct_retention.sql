--Access SQL
--use for monthly active db
SELECT
    COUNT(dist.master)
FROM
    (
        SELECT
            DISTINCT p2.[Master Account Number] AS master
        FROM
            [PayrollAcctSnapshot-Active-p2] AS p2
        GROUP BY
            p2.[Master Account Number]
    ) AS dist
;