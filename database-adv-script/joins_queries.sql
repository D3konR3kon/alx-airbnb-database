--Getting users and their bookings usings INNER JOIN
SELECT *
FROM "User" AS u
INNER JOIN booking
ON u.user_id = booking.user_id;

--Getting properties and their review usings LEFT JOIN
SELECT *
FROM property AS p
LEFT JOIN review AS r
ON p.property_id = r.property_id;
ORDER BY name;

--Getting users and their bookings usings FULL OUTER JOIN
SELECT *
FROM "User" AS u
FULL OUTER JOIN booking AS b
ON u.user_id = b.user_id;
