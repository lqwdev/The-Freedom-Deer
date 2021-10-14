SELECT officer.race as officer_race, COUNT(officer.race)
FROM trr_trr trr
INNER JOIN data_officer officer
    ON trr.officer_id = officer.id
GROUP BY officer.race
ORDER BY COUNT(officer.race) DESC;
