SELECT race, COUNT(race)
FROM data_victim victim
INNER JOIN trr_trr trr
    ON trr.subject_id = victim.id
GROUP BY race
ORDER BY COUNT(race) DESC;
