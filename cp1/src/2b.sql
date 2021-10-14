SELECT indoor_or_outdoor, COUNT(*)
FROM trr_trr
GROUP BY indoor_or_outdoor
ORDER BY COUNT(*) DESC;
