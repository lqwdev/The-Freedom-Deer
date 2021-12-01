WITH t_officer AS(
    SELECT allegation_id, category, allegation_name, allegation_category_id, race officer_race
    FROM data_officer
             JOIN
         (SELECT officer_id, allegation_id, category, allegation_name, allegation_category_id
          FROM data_officerallegation oa
                   JOIN data_allegationcategory ac ON oa.allegation_category_id = ac.id
          WHERE oa.allegation_category_id = 98 OR oa.allegation_category_id = 204) AS temp
         ON temp.officer_id = data_officer.id
),

t_victim AS(
    SELECT crid, race subject_race, cr_text
    FROM data_allegation
    JOIN data_victim ON data_allegation.crid = data_victim.allegation_id
)

SELECT crid, category, allegation_name, allegation_category_id, officer_race, subject_race, cr_text
FROM t_officer o
JOIN t_victim t ON o.allegation_id = t.crid
WHERE subject_race <> '' AND cr_text <> '';

