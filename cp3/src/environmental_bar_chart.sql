-- lighting condition (all, firearm used, no firearm used)
SELECT lighting_condition, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE not firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE not firearm_used
GROUP BY lighting_condition
ORDER BY COUNT(*) DESC;

SELECT lighting_condition, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE firearm_used
GROUP BY lighting_condition
ORDER BY COUNT(*) DESC;

SELECT lighting_condition, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
GROUP BY lighting_condition
ORDER BY COUNT(*) DESC;

-- indoor or outdoor
SELECT indoor_or_outdoor, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE firearm_used
GROUP BY indoor_or_outdoor
ORDER BY COUNT(*) DESC;

SELECT indoor_or_outdoor, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE not firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE not firearm_used
GROUP BY indoor_or_outdoor
ORDER BY COUNT(*) DESC;

SELECT indoor_or_outdoor, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
GROUP BY indoor_or_outdoor
ORDER BY COUNT(*) DESC;

-- weather
SELECT weather_condition, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE firearm_used
GROUP BY weather_condition
ORDER BY COUNT(*) DESC;

SELECT weather_condition, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE not firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE not firearm_used
GROUP BY weather_condition
ORDER BY COUNT(*) DESC;

SELECT weather_condition, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
GROUP BY weather_condition
ORDER BY COUNT(*) DESC;

-- location
SELECT location_recode, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
GROUP BY location_recode
ORDER BY COUNT(*) DESC;

SELECT location_recode, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE firearm_used
GROUP BY location_recode
ORDER BY COUNT(*) DESC;

SELECT location_recode, ROUND(
        CAST(COUNT(*) AS DECIMAL(10,2)) /
        CAST((SELECT COUNT(*) FROM trr_trr WHERE not firearm_used) AS DECIMAL(10,2)),
    6) as percentage
FROM trr_trr
WHERE not firearm_used
GROUP BY location_recode
ORDER BY COUNT(*) DESC;