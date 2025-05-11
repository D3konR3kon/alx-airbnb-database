-- Create User table
CREATE TABLE "User" (
    user_id UUID PRIMARY KEY,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    email VARCHAR NOT NULL UNIQUE,
    password_hash VARCHAR NOT NULL,
    phone_number VARCHAR,
    role VARCHAR NOT NULL CHECK (role IN ('guest', 'host', 'admin')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create index on email for faster lookups during login
CREATE INDEX idx_user_email ON "User" (email);

-- Create Property table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,
    host_id UUID NOT NULL,
    name VARCHAR NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR NOT NULL,
    price_per_night DECIMAL(10, 2) NOT NULL CHECK (price_per_night > 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (host_id) REFERENCES "User" (user_id) ON DELETE CASCADE
);

-- Create index on host_id for faster property lookups by host
CREATE INDEX idx_property_host ON Property (host_id);

-- Create Booking table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL(10, 2) NOT NULL CHECK (total_price >= 0),
    status VARCHAR NOT NULL CHECK (status IN ('pending', 'confirmed', 'canceled')),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property (property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    CHECK (end_date > start_date)
);

-- Create indexes for faster booking lookups
CREATE INDEX idx_booking_property ON Booking (property_id);
CREATE INDEX idx_booking_user ON Booking (user_id);
CREATE INDEX idx_booking_dates ON Booking (start_date, end_date);

-- Create Payment table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,
    booking_id UUID NOT NULL,
    amount DECIMAL(10, 2) NOT NULL CHECK (amount > 0),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    payment_method VARCHAR NOT NULL CHECK (payment_method IN ('credit_card', 'paypal', 'stripe')),
    FOREIGN KEY (booking_id) REFERENCES Booking (booking_id) ON DELETE CASCADE
);

-- Create index on booking_id for faster payment lookups by booking
CREATE INDEX idx_payment_booking ON Payment (booking_id);

-- Create Review table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,
    property_id UUID NOT NULL,
    user_id UUID NOT NULL,
    rating INTEGER NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES Property (property_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES "User" (user_id) ON DELETE CASCADE
);

-- Create indexes for faster review lookups
CREATE INDEX idx_review_property ON Review (property_id);
CREATE INDEX idx_review_user ON Review (user_id);

-- Create Message table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,
    sender_id UUID NOT NULL,
    recipient_id UUID NOT NULL,
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (sender_id) REFERENCES "User" (user_id) ON DELETE CASCADE,
    FOREIGN KEY (recipient_id) REFERENCES "User" (user_id) ON DELETE CASCADE
);

-- Create indexes for faster message lookups
CREATE INDEX idx_message_sender ON Message (sender_id);
CREATE INDEX idx_message_recipient ON Message (recipient_id);
-- Create a composite index for conversation lookups
CREATE INDEX idx_message_conversation ON Message (sender_id, recipient_id);

-- Add a trigger function to update the 'updated_at' column for properties
CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create a trigger to automatically update the 'updated_at' column when a property is updated
CREATE TRIGGER update_property_modtime
BEFORE UPDATE ON Property
FOR EACH ROW
EXECUTE FUNCTION update_modified_column();