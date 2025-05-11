-- Sample data for User table
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role, created_at)
VALUES
    -- Hosts
    ('11111111-1111-1111-1111-111111111111', 'John', 'Smith', 'john.smith@email.com', '$2a$12$1234567890abcdefghijkl', '+1-555-123-4567', 'host', '2024-03-01 10:00:00'),
    ('22222222-2222-2222-2222-222222222222', 'Maria', 'Garcia', 'maria.garcia@email.com', '$2a$12$abcdefghijkl1234567890', '+1-555-234-5678', 'host', '2024-03-02 11:15:00'),
    ('33333333-3333-3333-3333-333333333333', 'David', 'Chen', 'david.chen@email.com', '$2a$12$ghijkl1234567890abcdef', '+1-555-345-6789', 'host', '2024-03-03 09:30:00'),
    
    -- Guests
    ('44444444-4444-4444-4444-444444444444', 'Sarah', 'Johnson', 'sarah.johnson@email.com', '$2a$12$567890abcdefghijkl1234', '+1-555-456-7890', 'guest', '2024-03-05 14:20:00'),
    ('55555555-5555-5555-5555-555555555555', 'Michael', 'Brown', 'michael.brown@email.com', '$2a$12$90abcdefghijkl12345678', '$2a$12$90abcdefghijkl12345678', 'guest', '2024-03-06 16:45:00'),
    ('66666666-6666-6666-6666-666666666666', 'Emily', 'Wilson', 'emily.wilson@email.com', '$2a$12$defghijkl1234567890abc', '+1-555-678-9012', 'guest', '2024-03-07 13:10:00'),
    ('77777777-7777-7777-7777-777777777777', 'James', 'Anderson', 'james.anderson@email.com', '$2a$12$hijkl1234567890abcdefg', '+1-555-789-0123', 'guest', '2024-03-08 11:50:00'),
    
    -- Admin
    ('88888888-8888-8888-8888-888888888888', 'Admin', 'User', 'admin@rentalapp.com', '$2a$12$jkl1234567890abcdefghi', '+1-555-890-1234', 'admin', '2024-03-01 08:00:00');

-- Sample data for Property table
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night, created_at, updated_at)
VALUES
    -- John's properties
    ('aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '11111111-1111-1111-1111-111111111111', 'Beachfront Villa', 'Luxurious villa with direct beach access and stunning ocean views.', 'Miami Beach, FL', 350.00, '2024-03-10 09:00:00', '2024-03-10 09:00:00'),
    ('bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '11111111-1111-1111-1111-111111111111', 'Downtown Loft', 'Modern loft in the heart of the city, walking distance to attractions.', 'New York, NY', 275.00, '2024-03-11 10:30:00', '2024-03-12 15:45:00'),
    
    -- Maria's properties
    ('cccccccc-cccc-cccc-cccc-cccccccccccc', '22222222-2222-2222-2222-222222222222', 'Mountain Cabin', 'Cozy cabin with fireplace and mountain views.', 'Aspen, CO', 225.00, '2024-03-12 11:15:00', '2024-03-12 11:15:00'),
    ('dddddddd-dddd-dddd-dddd-dddddddddddd', '22222222-2222-2222-2222-222222222222', 'Lakeside Cottage', 'Peaceful cottage with private dock and lake access.', 'Lake Tahoe, CA', 195.00, '2024-03-13 14:20:00', '2024-03-14 09:10:00'),
    
    -- David's properties
    ('eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '33333333-3333-3333-3333-333333333333', 'Desert Oasis', 'Modern home with private pool and desert views.', 'Scottsdale, AZ', 285.00, '2024-03-14 16:30:00', '2024-03-14 16:30:00'),
    ('ffffffff-ffff-ffff-ffff-ffffffffffff', '33333333-3333-3333-3333-333333333333', 'City Apartment', 'Centrally located apartment with city skyline views.', 'Chicago, IL', 175.00, '2024-03-15 13:45:00', '2024-03-16 10:20:00');

-- Sample data for Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status, created_at)
VALUES
    -- Sarah's bookings
    ('12121212-1212-1212-1212-121212121212', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', '2024-06-15', '2024-06-20', 1750.00, 'confirmed', '2024-04-01 09:30:00'),
    ('23232323-2323-2323-2323-232323232323', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '44444444-4444-4444-4444-444444444444', '2024-07-10', '2024-07-15', 1125.00, 'confirmed', '2024-04-05 14:20:00'),
    
    -- Michael's bookings
    ('34343434-3434-3434-3434-343434343434', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '55555555-5555-5555-5555-555555555555', '2024-06-01', '2024-06-05', 1140.00, 'confirmed', '2024-04-02 10:15:00'),
    ('45454545-4545-4545-4545-454545454545', 'bbbbbbbb-bbbb-bbbb-bbbb-bbbbbbbbbbbb', '55555555-5555-5555-5555-555555555555', '2024-08-20', '2024-08-25', 1375.00, 'pending', '2024-04-10 16:45:00'),
    
    -- Emily's bookings
    ('56565656-5656-5656-5656-565656565656', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '66666666-6666-6666-6666-666666666666', '2024-07-01', '2024-07-08', 1365.00, 'confirmed', '2024-04-03 11:30:00'),
    ('67676767-6767-6767-6767-676767676767', 'ffffffff-ffff-ffff-ffff-ffffffffffff', '66666666-6666-6666-6666-666666666666', '2024-09-10', '2024-09-15', 875.00, 'cancelled', '2024-04-07 09:15:00'),
    
    -- James's bookings
    ('78787878-7878-7878-7878-787878787878', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '77777777-7777-7777-7777-777777777777', '2024-10-05', '2024-10-10', 1750.00, 'confirmed', '2024-04-15 13:25:00'),
    ('89898989-8989-8989-8989-898989898989', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '77777777-7777-7777-7777-777777777777', '2024-11-15', '2024-11-20', 1425.00, 'pending', '2024-04-20 15:40:00');

-- Sample data for Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
    -- Payments for confirmed bookings
    ('a1a1a1a1-a1a1-a1a1-a1a1-a1a1a1a1a1a1', '12121212-1212-1212-1212-121212121212', 1750.00, '2024-04-01 09:35:00', 'credit_card'),
    ('b2b2b2b2-b2b2-b2b2-b2b2-b2b2b2b2b2b2', '23232323-2323-2323-2323-232323232323', 1125.00, '2024-04-05 14:25:00', 'paypal'),
    ('c3c3c3c3-c3c3-c3c3-c3c3-c3c3c3c3c3c3', '34343434-3434-3434-3434-343434343434', 1140.00, '2024-04-02 10:20:00', 'credit_card'),
    ('d4d4d4d4-d4d4-d4d4-d4d4-d4d4d4d4d4d4', '56565656-5656-5656-5656-565656565656', 1365.00, '2024-04-03 11:35:00', 'stripe'),
    ('e5e5e5e5-e5e5-e5e5-e5e5-e5e5e5e5e5e5', '78787878-7878-7878-7878-787878787878', 1750.00, '2024-04-15 13:30:00', 'credit_card');

-- Sample data for Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment, created_at)
VALUES
    -- Reviews for Beachfront Villa
    ('abcd1234-abcd-1234-abcd-1234abcd1234', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '44444444-4444-4444-4444-444444444444', 5, 'Absolutely stunning property! The beach access was perfect and the views were even better than the pictures. Will definitely return!', '2024-06-21 18:30:00'),
    ('bcde2345-bcde-2345-bcde-2345bcde2345', 'aaaaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '77777777-7777-7777-7777-777777777777', 4, 'Beautiful property with amazing views. The only minor issue was that the WiFi was a bit slow, but otherwise it was perfect.', '2024-10-11 19:15:00'),
    
    -- Reviews for Mountain Cabin
    ('cdef3456-cdef-3456-cdef-3456cdef3456', 'cccccccc-cccc-cccc-cccc-cccccccccccc', '44444444-4444-4444-4444-444444444444', 5, 'The cabin was cozy and the mountain views were breathtaking. Perfect for our family getaway!', '2024-07-16 20:00:00'),
    
    -- Reviews for Desert Oasis
    ('defg4567-defg-4567-defg-4567defg4567', 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee', '55555555-5555-5555-5555-555555555555', 4, 'Great property with a beautiful pool. The desert views were amazing, especially at sunset.', '2024-06-06 17:45:00'),
    
    -- Reviews for Lakeside Cottage
    ('efgh5678-efgh-5678-efgh-5678efgh5678', 'dddddddd-dddd-dddd-dddd-dddddddddddd', '66666666-6666-6666-6666-666666666666', 5, 'Perfect lakeside retreat! The private dock was wonderful for fishing and the cottage had everything we needed.', '2024-07-09 21:10:00');

-- Sample data for Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body, sent_at)
VALUES
    -- Conversation between Sarah and John (about Beachfront Villa)
    ('msg11111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 'Hi John, I''m interested in your Beachfront Villa. Is it available for the dates I selected?', '2024-03-30 14:20:00'),
    ('msg22222-2222-2222-2222-222222222222', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', 'Hello Sarah! Yes, those dates are available. Let me know if you have any questions about the property.', '2024-03-30 15:05:00'),
    ('msg33333-3333-3333-3333-333333333333', '44444444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', 'Great! Is the beach private or public access?', '2024-03-30 15:30:00'),
    ('msg44444-4444-4444-4444-444444444444', '11111111-1111-1111-1111-111111111111', '44444444-4444-4444-4444-444444444444', 'It''s a private beach shared only with a few neighboring properties. Very quiet and peaceful!', '2024-03-30 16:15:00'),
    
    -- Conversation between Michael and David (about Desert Oasis)
    ('msg55555-5555-5555-5555-555555555555', '55555555-5555-5555-5555-555555555555', '33333333-3333-3333-3333-333333333333', 'Hi David, is the pool heated at your Desert Oasis property?', '2024-04-01 10:30:00'),
    ('msg66666-6666-6666-6666-666666666666', '33333333-3333-3333-3333-333333333333', '55555555-5555-5555-5555-555555555555', 'Hello Michael! Yes, the pool is heated and can be adjusted to your preferred temperature.', '2024-04-01 11:45:00'),
    ('msg77777-7777-7777-7777-777777777777', '55555555-5555-5555-5555-555555555555', '33333333-3333-3333-3333-333333333333', 'Perfect! I just made the booking. Looking forward to our stay!', '2024-04-02 09:20:00'),
    
    -- Conversation between Emily and Maria (about Lakeside Cottage)
    ('msg88888-8888-8888-8888-888888888888', '66666666-6666-6666-6666-666666666666', '22222222-2222-2222-2222-222222222222', 'Hi Maria, does the cottage have kayaks or canoes available for guests?', '2024-04-02 13:10:00'),
    ('msg99999-9999-9999-9999-999999999999', '22222222-2222-2222-2222-222222222222', '66666666-6666-6666-6666-666666666666', 'Hello Emily! Yes, we provide two kayaks and one canoe for guests to use. Life jackets are included.', '2024-04-02 14:25:00'),
    ('msgaaaaa-aaaa-aaaa-aaaa-aaaaaaaaaaaa', '66666666-6666-6666-6666-666666666666', '22222222-2222-2222-2222-222222222222', 'That sounds wonderful! Can''t wait for our lake vacation.', '2024-04-02 15:40:00');