SELECT INITCAP(subject_race) as subject_race, COUNT(subject_race)
FROM trr_trr
GROUP BY subject_race
ORDER BY COUNT(subject_race) DESC;
