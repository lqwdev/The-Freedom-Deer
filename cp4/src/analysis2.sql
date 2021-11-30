-- Analysis of off-shift TRR -------

-- DROP TABLE top_tri;
CREATE TABLE top_tri (
  count NUMERIC,
  id SERIAL,
  name VARCHAR(50),
  trr_count NUMERIC,
  diff NUMERIC
);

-- ~~~~~~ !Change to local file path! ~~~~~~~~~~
COPY top_tri(count, id, name, trr_count, diff)
FROM '/Users/TianchangLi/Fall 2021/DS Seminar/Project/The-Freedom-Deer/cp4/src/triangles.csv'
DELIMITER ','
CSV HEADER;

SELECT officer_id, on_shift_trr, trr_count total_trr, diff tri_count_diff, ROUND(CAST(on_shift_trr AS DECIMAL(10,5))
                 /
             CAST(trr_count AS DECIMAL(10,5)), 2) ratio FROM
(SELECT officer_id, count(*) on_shift_trr, trr_count, diff FROM
(SELECT officer_id, officer_on_duty, trr_count, diff FROM trr_trr
JOIN top_tri on officer_id = top_tri.id) AS foo
WHERE officer_on_duty = True
GROUP BY officer_id, trr_count, diff
ORDER BY diff DESC) AS temp1
ORDER BY ratio;


-- Analysis of the influence of high-triangle-count officers -------


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
