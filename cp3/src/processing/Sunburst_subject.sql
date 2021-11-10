SELECT subject_race   race,
           CASE
               WHEN subject_age < 12 THEN 'child'
               WHEN subject_age < 18 THEN 'teenager'
               WHEN subject_age < 40 THEN 'young'
               WHEN subject_age < 65 THEN 'middle-aged'
               WHEN subject_age >= 65 THEN 'senior'
               END AS     age,
           subject_gender gender,
           COUNT(*)
    From trr_trr
    WHERE subject_race IS NOT NULL
      AND subject_age IS NOT NULL
      AND subject_gender IS NOT NULL
    GROUP BY race, age, gender
    HAVING COUNT(*) > 50;

