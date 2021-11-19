-- DROP TABLE top_tri;

CREATE TABLE top_tri (
  count NUMERIC,
  id SERIAL,
  name VARCHAR(50),
  trr_count NUMERIC,
  diff NUMERIC
);

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
