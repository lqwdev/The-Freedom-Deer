SELECT foo.src, foo.dst, foo.trr_count, bar.shifts_worked, baz.id officer_id
FROM
(SELECT t1.officer_id src, t2.officer_id dst, COUNT(DISTINCT t1.event_id) trr_count
FROM trr_eventid t1 JOIN trr_eventid t2 ON t1.event_id = t2.event_id AND t1.officer_id < t2.officer_id
GROUP BY t1.officer_id, t2.officer_id
ORDER BY count(DISTINCT t1.event_id) DESC) AS foo
JOIN
(SELECT d1.officer_id src, d2.officer_id dst, COUNT(*) shifts_worked
FROM data_officerassignmentattendance d1 JOIN data_officerassignmentattendance d2 ON d1.start_timestamp = d2.start_timestamp AND d1.beat_id = d2.beat_id AND d1.officer_id < d2.officer_id
WHERE d1.present_for_duty AND d2.present_for_duty
GROUP BY d1.officer_id, d2.officer_id
ORDER BY shifts_worked DESC) AS bar
ON (foo.src = bar.src AND foo.dst = bar.dst) OR (foo.src = bar.dst AND foo.dst = bar.src)
JOIN (SELECT id FROM top_tri) AS baz
ON foo.src = id or foo.dst = id
WHERE foo.dst NOT IN (SELECT id FROM top_tri) OR foo.src NOT IN (SELECT id FROM top_tri);


-- get the result from the above sql and create a new table named as count_shift
-- count_shift.csv can be found in the

SELECT count(distinct officer_id)
FROM count_shift;

SELECT officer_id, count(officer_id)
FROM count_shift
GROUP BY officer_id
ORDER BY count(officer_id) DESC;

SELECT *, ROUND(trr_count/shift_worked, 2) ratio
FROM count_shift
WHERE officer_id = 2110;