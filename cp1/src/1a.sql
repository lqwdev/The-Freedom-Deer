SELECT
    ROUND(
        /* victims of use of force cases */
        CAST(COUNT(victim.id) AS DECIMAL(10,2)) /
        /* all victims */
        CAST((SELECT COUNT(*) FROM data_victim) AS DECIMAL(10,2)),
    4)
FROM data_victim victim
INNER JOIN trr_trr trr
    ON trr.subject_id = victim.id;
