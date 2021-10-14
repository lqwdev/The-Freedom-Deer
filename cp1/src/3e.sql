SELECT
	weather_condition,
	indoor_or_outdoor,
	lighting_condition,
	location_recode,
	COUNT(*)
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
	weather_condition,
	indoor_or_outdoor,
	lighting_condition,
	location_recode,
	COUNT(*)
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
	weather_condition,
	indoor_or_outdoor,
	lighting_condition,
	location_recode,
	COUNT(*)
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
	weather_condition,
	indoor_or_outdoor,
	lighting_condition,
	location_recode,
	COUNT(*)
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
	weather_condition,
	indoor_or_outdoor,
	lighting_condition,
	location_recode,
	COUNT(*)
FROM trr_trr
WHERE subject_race = 'NATIVE AMERICAN/ALASKAN NATIVE'
GROUP BY
	weather_condition,
	indoor_or_outdoor,
	lighting_condition,
	location_recode
ORDER BY COUNT(*) DESC
LIMIT 10;