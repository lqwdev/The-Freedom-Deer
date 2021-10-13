SELECT officer.race, COUNT(officer.race)
FROM data_victim victim
INNER JOIN trr_trr trr
    ON trr.subject_id = victim.id
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer.race
ORDER BY COUNT(officer.race) DESC;
