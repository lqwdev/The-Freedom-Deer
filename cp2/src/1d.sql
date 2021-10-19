WITH top_areas AS (
    SELECT
        area_id AS area,
        race,
        SUM(count) AS pop
    FROM data_racepopulation
    WHERE area_id IN (
        SELECT area_id
        FROM data_racepopulation
        GROUP BY area_id
        ORDER BY SUM(count) DESC
        LIMIT 10
    )
    GROUP BY area_id, race
)
SELECT
    area,
    race,
    pop as population,
    ROUND(
        (0.0+pop) / (SUM(pop) OVER (PARTITION BY area)),
    4) as percentage
FROM top_areas
ORDER BY area, percentage DESC;
