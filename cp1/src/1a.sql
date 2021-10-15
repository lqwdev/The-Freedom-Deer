SELECT INITCAP(subject_race) as subject_race, COUNT(subject_race)
FROM trr_trr
GROUP BY subject_race
ORDER BY COUNT(subject_race) DESC;

SELECT officer.race as officer_race, COUNT(officer.race)
FROM trr_trr trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer.race
ORDER BY COUNT(officer.race) DESC;
