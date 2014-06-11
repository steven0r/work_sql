--Access SQL
--use for monthly active db
--pull count of distinct master account items from active db
--damn it ms why doesn't COUNT(DISTINCT ...) work?
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

--use for activity db
SELECT
    paa.Year,
    paa.Month,
    paa.Status,
    COUNT(paa.Status)
FROM
    [Payroll Account Activity] AS paa
WHERE
    (
        paa.[Group Number] IN
            (
            SELECT
                [Master Account Number]
            FROM
                [Payroll Account Activity]
            )
    AND
       (
        [Status Chg Date] BETWEEN "5/28/2011" AND "5/23/2014"
        )       
    )
GROUP BY
    paa.Year,
    paa.Month,
    paa.Status
;