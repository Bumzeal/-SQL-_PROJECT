/* View Each Table*/
SELECT * FROM crime_scene_report
SELECT * FROM drivers_license
SELECT * FROM facebook_event_checkin
SELECT * FROM get_fit_now_check_in
SELECT * FROM get_fit_now_member
SELECT * FROM income
SELECT * FROM interview
SELECT * FROM person
SELECT * FROM solution

/*Query the Crime Scene Table */
SELECT * FROM crime_scene_report
/*Filter the Details Given ,City = "SQL city,Date =20180115, And type ="MURDER" */
SELECT * FROM crime_scene_report
WHERE city ="SQL City" AND date = 20180115 AND type ="murder"
/*Only one Record of murder was recorded At the SQL city and the stated Date */



/* Check for Records of people who attended the Facebook event on date = 20180115  */
SELECT * 
FROM facebook_event_checkin 
WHERE date = 20180115
/*There are 47 people that attended the Facebook event on the said Date,but A particular event was attended by 3 person's with the Event Name = The Funky Grooves Tour ,The person_id are 14887,16371,67318 */

/* Let's check the Details of this 3 people To know who they are */
SELECT * FROM person
WHERE id in (14887,16371,67318)
/*The Name of this 3 people is Morty Schapiro with licence 118009 ,Annabel Miller with licence 490173,Jeremy Bowers  with licence 423327  */

/* Does these guys exist on the interview table,Yes they Do */
SELECT * FROM interview
WHERE person_id in (14887,16371,67318)

/*Let's see their full details and the interview by joining the person's table to the interview */
SELECT name,address_number,address_street_name,transcript FROM person  p
Inner Join interview i
On I.person_id = p.id
WHERE id in(14887,16371,67318)

/* Query out the Delay provided by the first Witness */
SELECT * FROM get_fit_now_member
where id like "48Z%" AND membership_status = "gold"

/* Above Query listed out 2 people with membership_id(48Z7A,48Z55),
I need to probe further to see who among this is involve in this murder 
Act by checking who has the %H42W% included in His plate No */


SELECT * FROM drivers_license d
WHERE plate_number like "%H42W%"
/*This Query listed 3 people with following Licence id (183779,423327,664760)let's check their details */


 
/*This are details of the person whose plate number include "%H42W%"
 and the name jeromy Bowers has the Detail describe by the first member,Let's check the second witness */
SELECT * from person
WHERE license_id in(SELECT id FROM drivers_license
							WHERE plate_number like "%H42W%")
							
/*Let Check If Jeremy Bower went to gym on January 9th */
SELECT * FROM get_fit_now_check_in
 WHERE check_in_date = 20180109 AND membership_id ="48Z55"
/*this shows that Jeromy Bower was truly seen at the Gym on 09 jan as stated by the second witness */
 
/*Now Jeromy Interview reveal His Confession and stated he was hired a woman,
 Let's checkout the woman using the details provided */
SELECT name,
		address_street_name,
		age,
		height,
		eye_color,
		hair_color,
		gender plate_number,
		car_make,
		car_model
FROM person  p
JOIN drivers_license dl
ON p.license_id = dl.id
WHERE hair_color = "red" AND height in (65,67) AND car_model = "Model S"

/*The Query above filter out a Id  with no 78881,Name Red Korb and ssn =961388910,This means she's the one that Hired Jermoy,Let's confirm her Income base on Jeromy's Claim*/
SELECT * FROM income
WHERE ssn = 961388910
/*The anual Income earn By Red Korb is 278000,Let's confirm if she was at the Symphony Concert 3 times in Dec 2017*/

SELECT person_id,count(person_id),count(DATE) FROM facebook_event_checkin fe
WHERE CAST(date as date) BETWEEN "20171201" AND "20171230" AND fe.event_name = "SQL Symphony Concert" 
GROUP BY person_id


SELECT * FROM person 
WHERE name ="Red Korb"




SELECT * FROM person
WHERE id = 24556
99716


SELECT * FROM facebook_event_checkin 
WHERE date >= "20171201"
  AND date < "20171230"

symphony Concert 3 times in Dec 2017

SELECT *  FROM person
I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67"). She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017.
