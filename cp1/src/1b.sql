SELECT
    ROUND(
        /* cases where officer and victim are of different races */
        CAST(COUNT(*) AS DECIMAL(10,2)) / 
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    6) as cross_race_percentage
FROM trr_trr trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
WHERE 
    REPLACE(INITCAP(officer.race), 'Asian/Pacific', 'Asian/Pacific Islander') != 
    INITCAP(subject_race);

SELECT
    ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) / 
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    6) as percentage,
    REPLACE(INITCAP(officer.race), 'Asian/Pacific', 'Asian/Pacific Islander')
        as officer_race,
    INITCAP(subject_race) as subject_race
FROM trr_trr trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer_race, subject_race
ORDER BY percentage DESC;
