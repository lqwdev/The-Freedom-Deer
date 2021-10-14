SELECT
    ROUND(
        /* cases where officer and victim are of different races */
        CAST(COUNT(*) AS DECIMAL(10,2)) / 
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    4)
FROM trr_trr trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
WHERE officer.race != subject_race;
