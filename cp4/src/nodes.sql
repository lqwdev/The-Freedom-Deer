SELECT  id, first_name || ' ' || last_name "name", trr_count
FROM data_officer
WHERE id IN (SELECT DISTINCT  officer_id FROM trr_trr);
