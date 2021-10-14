SELECT weather_condition, indoor_or_outdoor, lighting_condition, COUNT(*)
FROM trr_trr
GROUP BY weather_condition, indoor_or_outdoor, lighting_condition
ORDER BY COUNT(*) DESC;
