SELECT location_recode, ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'BLACK') AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE subject_race = 'BLACK'
GROUP BY location_recode
ORDER BY COUNT(*) DESC;

SELECT location_recode, ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'WHITE') AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE subject_race = 'WHITE'
GROUP BY location_recode
ORDER BY COUNT(*) DESC;

SELECT location_recode, ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'HISPANIC') AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE subject_race = 'HISPANIC'
GROUP BY location_recode
ORDER BY COUNT(*) DESC;

SELECT location_recode, ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'ASIAN/PACIFIC ISLANDER') AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE subject_race = 'ASIAN/PACIFIC ISLANDER'
GROUP BY location_recode
ORDER BY COUNT(*) DESC;

SELECT location_recode, ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'NATIVE AMERICAN/ALASKAN NATIVE') AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE subject_race = 'NATIVE AMERICAN/ALASKAN NATIVE'
GROUP BY location_recode
ORDER BY COUNT(*) DESC;
