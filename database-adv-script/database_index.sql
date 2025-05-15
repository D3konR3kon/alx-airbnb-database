-- Indexes for users
CREATE INDEX idx_user_user_id ON "User"(user_id);
CREATE INDEX idx_user_email ON "User" (email);

-- Booking table indexes
CREATE INDEX idx_booking_user_id ON booking(booking_id);
CREATE INDEX idx_booking_user_id ON booking(user_id);
CREATE INDEX idx_booking_property_id ON booking(property_id);
CREATE INDEX idx_booking_status ON booking(status);
CREATE INDEX idx_booking_created_at ON booking(created_at);

-- Property table indexes
CREATE INDEX idx_property_property_id ON property(property_id);
CREATE INDEX idx_property_location ON property(location);
CREATE INDEX idx_property_price ON property(price);
CREATE INDEX idx_property_name ON property(name);
CREATE INDEX idx_property_host_id ON property(host_id);

