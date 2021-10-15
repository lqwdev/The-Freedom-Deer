SELECT lighting_condition, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
GROUP BY lighting_condition
ORDER BY COUNT(*) DESC;
