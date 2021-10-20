WITH subject_race AS (
    SELECT initcap(subject_race) subject_race, COUNT(*) trr_subjects
    FROM trr_trr
    GROUP BY subject_race
),
     subject_race_clean AS (SELECT
                                   CASE WHEN subject_race = 'Asian/Pacific Islander' THEN 'Asian'
                                     WHEN subject_race='Native American/Alaskan Native' THEN 'Other'
                                    ELSE subject_race END subject_race
                                     , trr_subjects
        FROM subject_race ),
     total_trr_subjects AS (SELECT COUNT(subject_race) all_subjects FROM trr_trr),
     subject_race_pct AS (
     SELECT  subject_race, trr_subjects::float / all_subjects subjects_pct
     FROM subject_race_clean, total_trr_subjects
    ),
     population_race AS (
         SELECT race,  SUM(count) population_race
         FROM data_racepopulation JOIN data_area da on data_racepopulation.area_id = da.id
         WHERE area_type = 'community'
         GROUP BY race
     ),
     total_population AS (SELECT sum(count) total_population FROM data_racepopulation JOIN data_area d on data_racepopulation.area_id = d.id WHERE area_type = 'community'),
     population_race_pct AS (SELECT race, population_race::float / total_population population_pct
         FROM population_race, total_population
         )
SELECT race, subjects_pct*100.0 trr_subject_pct, population_pct*100.0 population_percent
FROM subject_race_pct JOIN population_race_pct ON subject_race = race;
