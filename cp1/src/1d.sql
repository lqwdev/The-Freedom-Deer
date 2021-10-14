SELECT
    ROUND(
        /* cases involving firearm usage */
        CAST(COUNT(*) AS DECIMAL(10,2)) / 
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    4)
FROM trr_trr
WHERE firearm_used = TRUE;
