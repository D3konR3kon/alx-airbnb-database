--Getting total number of bookings for each user
SELECT  u.user_id, u.first_name, COUNT(b.booking_id) AS bookings
FROM "User" AS u
INNER JOIN booking AS b
ON u.user_id = b.user_id
GROUP BY u.user_id;

--Ranking properties based on bookings using RANK()
SELECT p.property_id, 
		p.name, 
		COUNT(b.booking_id) AS bookings, 
		RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property AS p
LEFT JOIN booking AS b
ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;

--Ranking properties based on bookings using ROW_NUMBER()
SELECT p.property_id, 
		p.name, 
		COUNT(b.booking_id) AS bookings, 
		ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id) DESC) AS booking_rank
FROM property AS p
LEFT JOIN booking AS b
ON p.property_id = b.property_id
GROUP BY p.property_id, p.name;