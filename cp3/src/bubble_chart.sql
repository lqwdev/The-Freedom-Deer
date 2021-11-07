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

WITH trr as (
    SELECT * FROM trr_trr
        WHERE extract(year FROM trr_datetime) = '2004' or
        extract(year FROM trr_datetime) = '2005' or
        extract(year FROM trr_datetime) = '2006'
)
SELECT
    ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr) AS DECIMAL(10,2)),
    6) as percentage,
    REPLACE(INITCAP(officer.race), 'Asian/Pacific', 'Asian/Pacific Islander')
        as officer_race,
    INITCAP(subject_race) as subject_race
FROM trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer_race, subject_race
ORDER BY percentage DESC;

WITH trr as (
    SELECT * FROM trr_trr
        WHERE extract(year FROM trr_datetime) = '2007' or
        extract(year FROM trr_datetime) = '2008' or
        extract(year FROM trr_datetime) = '2009'
)
SELECT
    ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr) AS DECIMAL(10,2)),
    6) as percentage,
    REPLACE(INITCAP(officer.race), 'Asian/Pacific', 'Asian/Pacific Islander')
        as officer_race,
    INITCAP(subject_race) as subject_race
FROM trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer_race, subject_race
ORDER BY percentage DESC;

WITH trr as (
    SELECT * FROM trr_trr
        WHERE extract(year FROM trr_datetime) = '2010' or
        extract(year FROM trr_datetime) = '2011' or
        extract(year FROM trr_datetime) = '2012'
)
SELECT
    ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr) AS DECIMAL(10,2)),
    6) as percentage,
    REPLACE(INITCAP(officer.race), 'Asian/Pacific', 'Asian/Pacific Islander')
        as officer_race,
    INITCAP(subject_race) as subject_race
FROM trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer_race, subject_race
ORDER BY percentage DESC;

WITH trr as (
    SELECT * FROM trr_trr
        WHERE extract(year FROM trr_datetime) = '2013' or
        extract(year FROM trr_datetime) = '2014' or
        extract(year FROM trr_datetime) = '2015' or
        extract(year FROM trr_datetime) = '2016'
)
SELECT
    ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        /* total use of force cases */
        CAST((SELECT COUNT(*) FROM trr) AS DECIMAL(10,2)),
    6) as percentage,
    REPLACE(INITCAP(officer.race), 'Asian/Pacific', 'Asian/Pacific Islander')
        as officer_race,
    INITCAP(subject_race) as subject_race
FROM trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer_race, subject_race
ORDER BY percentage DESC;