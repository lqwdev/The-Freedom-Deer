SELECT
    weather_condition as weather,
    indoor_or_outdoor as indoor_outdoor,
    lighting_condition as lighting,
    location_recode as location,
    ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'BLACK') AS DECIMAL(10,2)),
    4) as pct
FROM trr_trr
WHERE subject_race = 'BLACK'
GROUP BY
    weather_condition,
    indoor_or_outdoor,
    lighting_condition,
    location_recode
ORDER BY COUNT(*) DESC
LIMIT 10;


SELECT
    weather_condition as weather,
    indoor_or_outdoor as indoor_outdoor,
    lighting_condition as lighting,
    location_recode as location,
    ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'WHITE') AS DECIMAL(10,2)),
    4) as pct
FROM trr_trr
WHERE subject_race = 'WHITE'
GROUP BY
    weather_condition,
    indoor_or_outdoor,
    lighting_condition,
    location_recode
ORDER BY COUNT(*) DESC
LIMIT 10;


SELECT
    weather_condition as weather,
    indoor_or_outdoor as indoor_outdoor,
    lighting_condition as lighting,
    location_recode as location,
    ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'HISPANIC') AS DECIMAL(10,2)),
    4) as pct
FROM trr_trr
WHERE subject_race = 'HISPANIC'
GROUP BY
    weather_condition,
    indoor_or_outdoor,
    lighting_condition,
    location_recode
ORDER BY COUNT(*) DESC
LIMIT 10;


SELECT
    weather_condition as weather,
    indoor_or_outdoor as indoor_outdoor,
    lighting_condition as lighting,
    location_recode as location,
    ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'ASIAN/PACIFIC ISLANDER') AS DECIMAL(10,2)),
    4) as pct
FROM trr_trr
WHERE subject_race = 'ASIAN/PACIFIC ISLANDER'
GROUP BY
    weather_condition,
    indoor_or_outdoor,
    lighting_condition,
    location_recode
ORDER BY COUNT(*) DESC
LIMIT 10;


SELECT
    weather_condition as weather,
    indoor_or_outdoor as indoor_outdoor,
    lighting_condition as lighting,
    location_recode as location,
    ROUND(
        CAST((COUNT(*)) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE subject_race = 'NATIVE AMERICAN/ALASKAN NATIVE') AS DECIMAL(10,2)),
    4) as pct
FROM trr_trr
WHERE subject_race = 'NATIVE AMERICAN/ALASKAN NATIVE'
GROUP BY
    weather_condition,
    indoor_or_outdoor,
    lighting_condition,
    location_recode
ORDER BY COUNT(*) DESC
LIMIT 10;
