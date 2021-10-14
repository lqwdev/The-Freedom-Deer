SELECT lighting_condition, COUNT(*)
FROM trr_trr
GROUP BY lighting_condition
ORDER BY COUNT(*) DESC;
