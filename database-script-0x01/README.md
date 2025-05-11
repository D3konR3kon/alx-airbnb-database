### Features of this SQL schema:

## Data Types and Constraints

1. Primary Keys: 
  - All tables use UUID as primary keys
2. Foreign Keys: 
  - Properly defined with ON DELETE CASCADE to maintain referential integrity
3. Check Constraints:
  - Role validation in User table (guest, host, admin)
  - Status validation in Booking table (pending, confirmed, canceled)
  - Payment method validation (credit_card, paypal, stripe)
  - Rating range check (1-5) in Review table
  - Price validation (greater than 0)
  - Date validation (end_date > start_date)

## Indexes for Performance

1. User Table:
  - Index on email for faster login operations

2. Property Table:
  - Index on host_id for quicker property lookup by host

3. Booking Table:
  - Indexes on property_id and user_id
  - Composite index on start_date and end_date for date range queries

4. Payment Table:
  - Index on booking_id for faster payment lookups

5. Review Table:
  - Indexes on property_id and user_id for faster review lookups

6. Message Table:
  - Indexes on sender_id and recipient_id
  - Composite index on (sender_id, recipient_id) for conversation lookups

### Additional Features

1. Automatic Timestamps:
  - created_at defaults to CURRENT_TIMESTAMP
  - A trigger to automatically update updated_at field for Property table

2. Quote Handling:
  - Used double quotes around "User" table name as it's a reserved keyword in most SQL databases
