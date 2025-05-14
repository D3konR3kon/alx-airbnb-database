--Getting all properties with rating greater than 4.0, using subquering 
SELECT p.*
FROM property AS p
WHERE (
    SELECT AVG(r.rating)
    FROM review AS r
    WHERE r.property_id = p.property_id
) > 4.0;

----Getting all user with bookings greater than 3, using subquering
SELECT *
FROM "User" AS u
WHERE (
    SELECT COUNT(*)
    FROM booking AS b
    WHERE b.user_id = u.user_id
) > 3;