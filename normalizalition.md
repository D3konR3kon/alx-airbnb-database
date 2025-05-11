# Airbnb Database Normalization to 3NF 

## Normalization Process

1. **First Normal Form (1NF)**:
   - Tables must have a primary key
   - Each column contains atomic (indivisible) values
   - No repeating groups or arrays

2. **Second Normal Form (2NF)**:
   - Must satisfy 1NF
   - All non-key attributes must depend on the entire primary key

3. **Third Normal Form (3NF)**:
   - Must satisfy 2NF
   - No transitive dependencies (non-key attributes depending on other non-key attributes)

## Schema Analysis


### User Table
```
user_id: Primary Key, UUID, Indexed
first_name: VARCHAR, NOT NULL
last_name: VARCHAR, NOT NULL
email: VARCHAR, UNIQUE, NOT NULL
password_hash: VARCHAR, NOT NULL
phone_number: VARCHAR, NULL
role: ENUM (`guest`, `host`, `admin`), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
```


### Property Table (modified)
```
property_id: Primary Key, UUID, Indexed
host_id: Foreign Key, references User(user_id)
name: VARCHAR, NOT NULL
description: TEXT, NOT NULL
price_per_night: DECIMAL, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
updated_at: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP
```

### Booking Table 
```
booking_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
start_date: DATE, NOT NULL
end_date: DATE, NOT NULL
total_price: DECIMAL, NOT NULL  -- Calculated field (denormalized for performance)
status: ENUM (`pending`, `confirmed`, `canceled`), NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
```

### Payment Table
```
payment_id: Primary Key, UUID, Indexed
booking_id: Foreign Key, references Booking(booking_id)
amount: DECIMAL, NOT NULL
payment_date: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
payment_method: ENUM (`credit_card`, `paypal`, `stripe`), NOT NULL
```

### Review Table 
```
review_id: Primary Key, UUID, Indexed
property_id: Foreign Key, references Property(property_id)
user_id: Foreign Key, references User(user_id)
rating: INTEGER, CHECK: rating >= 1 AND rating <= 5, NOT NULL
comment: TEXT, NOT NULL
created_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
```

### Message Table
```
message_id: Primary Key, UUID, Indexed
sender_id: Foreign Key, references User(user_id)
recipient_id: Foreign Key, references User(user_id)
message_body: TEXT, NOT NULL
sent_at: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP
```

## Conclusion

With these adjustments, the database schema is now in Third Normal Form (3NF):
1. All tables have proper primary keys (1NF)
2. All non-key attributes depend on the entire primary key (2NF)
3. No transitive dependencies exist (3NF)

The only exception is the `total_price` field in the Booking table, which I've chosen to keep as a controlled denormalization for performance reasons. This is a common practice in real-world database design where strict adherence to normalization principles may be relaxed for performance optimization.

The database schema adheres to the principles of normalization and is in Third Normal Form (3NF). This ensures:
- Minimal redundancy.
- Optimal data integrity.
- Improved query performance.

## References
- Airbnb Database Specification
- Principles of Database Normalization
