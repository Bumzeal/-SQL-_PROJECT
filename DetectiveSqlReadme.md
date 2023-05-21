(https://github.com/Bumzeal/-SQL-_PROJECT1/blob/main/week1_challenge_Danny_DinerReadme.md)
# Data Analytics Super League- Detective SQL

## PROBLEM STATEMENT
A crime has taken place and the detective needs your help. The detective gave you the crime scene report, but you somehow lost it. You vaguely remember that the crime was a murder that occurred sometime on Jan.15, 2018 and that it took place in SQL City. Start by retrieving the corresponding crime scene report from the police department’s database.

* Figure out who committed the crime with the details you remembered above
* Create a word or txt document that contains your thought process, narrative and SQLcodes written to arrive at the solution to the murder mystery
* Submit a Google Drive or OneDrive link to the word or text document

## DATASET
[See link to dataset](
https://drive.google.com/drive/folders/1SLlSSzIqhu9m4p8HmoJYjn5X_GTYdDsf?usp=share_link)


SOLUTION



I Checked for Records of people who attended the Facebook event on date the murder was carried out Date= 20180115 using the below Query.



Above query listed out 47 Record of people who were at the Facebook event on this Day,but A particular event with the Event Name =The Funky Grooves Tour was attended featured 3 person's knows about it ,Here are their ID’s 14887,16371,67318.



I checked to see the details of this 3 people present at this event on the Person’s Table,To see if this event in particular has something to do with the murder case.




Then I found out that they had a connection with the murder case,because these people were captured on interviewed Table, 
Meaning they have giving certain Information  about the murder Case.


At ti point,they have been  interviewed  and three of them gave informations helped discover the muderer.
Let starts with the first witness and use the information provided by him to fetch out the person.



1st witness - Morty Schapiro said “I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. 
The membership number on the bag started with "48Z". Only gold members“ so i filtered the get_fit_now_member with the details provided.



listed in the table Above are  2 people  who have a h membership_id start with 48Z (48Z7A,48Z55),
I then probe further to see who among this is  two is involve in the murder 
Act by checking who has the %H42W% included in His plate No .



The table above displayed 3 people whose plate number include "%H42W%" but name Bearer  Jeremy Bowers feature in both search l describe by the first witness.



afterward I details query out the get fit now check in table to confirm what the second witness shared - Annabel miller  
“I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th”.
so i filtered with the date and Jeremy Bowers to confirm if he was at the gym the said date.and Alas He was at the Gym



So finally  Jeromy is the third witness and the  His Confession stated that he was hired by a woman,
Let's checkout the woman using the details provided ,By using the details provided by Jeremy Brower 
“The I was hired by a woman with a lot of money. I don't know her name but I know she's around 5'5" (65") or 5'7" (67").
She has red hair and she drives a Tesla Model S. I know that she attended the SQL Symphony Concert 3 times in December 2017”.


