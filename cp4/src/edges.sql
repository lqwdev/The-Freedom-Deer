SELECT t1.officer_id src, t2.officer_id dst, COUNT(DISTINCT t1.event_id)
FROM trr_trr t1
	JOIN trr_trr t2 ON t1.event_id = t2.event_id AND t1.officer_id < t2.officer_id
GROUP BY t1.officer_id, t2.officer_id
ORDER BY count(DISTINCT t1.event_id) DESC;
