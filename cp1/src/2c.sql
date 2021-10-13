SELECT weather_condition, COUNT(*)
FROM trr_trr
GROUP BY weather_condition
ORDER BY COUNT(*) DESC;
