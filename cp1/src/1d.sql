SELECT
    ROUND(
        /* cases where officer and victim are of different races */
        CAST(COUNT(*) AS DECIMAL(10,2)) / 
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    4)
FROM data_victim victim
INNER JOIN trr_trr trr
    ON trr.subject_id = victim.id
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
WHERE officer.race != victim.race;
