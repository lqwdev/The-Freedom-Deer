SELECT race Race,
CASE
    WHEN age < 40 THEN 'young adult'
    WHEN age >= 40 THEN 'middle-aged'
END AS Age, gender Gender, status Status, COUNT(*) count
From trr_trr
JOIN trr_trrstatus tts on trr_trr.id = tts.trr_id
JOIN data_officer d on trr_trr.officer_id = d.id
WHERE Race IS NOT NULL AND Age IS NOT NULL AND Gender IS NOT NULL AND Status IS NOT NULL
GROUP BY Race, Age, Gender, Status
HAVING count(*) > 400;

