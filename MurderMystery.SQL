/*1) Reading the witness report*/
		SELECT*
		  FROM crime_scene_report
		  WHERE date='20180115' AND type='murder'

/*2) Finding the witness statements*/
		
		WITH interview_data AS(
		SELECT*
		  FROM interview a
		  INNER JOIN person b
		  ON a.person_id=b.id
		  WHERE b.address_street_name='Franklin Ave' AND b.name like '%Annabel%'
		  OR b.address_street_name='Northwestern Dr' AND address_number=4919
		  ORDER BY b.address_number
		  )
		
		SELECT*
		  FROM interview_data
		
/*3) Matching the witness description to the perpetrator*/
		
		 WITH check_in_data AS (
	  		SELECT *
	  		FROM get_fit_now_check_in i
	 		 INNER JOIN get_fit_now_member j
	 		 ON i.membership_id = j.id
			  INNER JOIN person k
			  ON j.person_id=k.id
			  INNER JOIN drivers_license l
			  ON k.license_id=l.id
			  WHERE l.plate_number LIKE '%H42W%'
								  )
	
			SELECT *
			FROM check_in_data; */


/*Finding the real murderer…*/

/*SELECT*
		   FROM interview
		   WHERE person_id='67318'*/
		   
	WITH suspect_list AS(	   
SELECT *
FROM drivers_license 
WHERE hair_color = 'red' 
  AND car_make = 'Tesla' 
  AND height BETWEEN 65 AND 67 
  AND gender = 'female'
	  )
	  
	  SELECT*
	  FROM suspect_list s
	  INNER JOIN person p
	  ON p.license_id=s.id
	  INNER JOIN facebook_event_checkin f
	  ON f.person_id=p.id
