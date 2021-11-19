SELECT d1.officer_id src, d2.officer_id dst, COUNT(*) shifts_worked
FROM data_officerassignmentattendance d1
	JOIN data_officerassignmentattendance d2
	ON d1.start_timestamp = d2.start_timestamp
		AND d1.beat_id = d2.beat_id
		AND d1.officer_id < d2.officer_id
WHERE d1.present_for_duty AND d2.present_for_duty
GROUP BY d1.officer_id, d2.officer_id;
