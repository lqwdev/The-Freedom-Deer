SELECT location_recode, COUNT(*)
FROM trr_trr
GROUP BY location_recode
ORDER BY COUNT(*) DESC;
