SELECT
        weather_condition,
        indoor_or_outdoor,
        lighting_condition,
        location_recode,
        COUNT(*)
FROM trr_trr
GROUP BY
        weather_condition,
        indoor_or_outdoor,
        lighting_condition,
        location_recode
ORDER BY COUNT(*) DESC;
