-- Supabase Schema & Seed Data for Dashboard

-- Drop existing tables to allow re-running the script cleanly
DROP TABLE IF EXISTS usage CASCADE;
DROP TABLE IF EXISTS fleet CASCADE;
DROP TABLE IF EXISTS tickets CASCADE;
DROP TABLE IF EXISTS customers CASCADE;

-- 1. Create Customers Table
CREATE TABLE customers (
    id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    status TEXT NOT NULL,
    tier TEXT NOT NULL,
    mrr NUMERIC NOT NULL,
    csm TEXT NOT NULL,
    latitude NUMERIC,
    longitude NUMERIC
);

-- 2. Create Tickets Table
CREATE TABLE tickets (
    id TEXT PRIMARY KEY,
    customer_id TEXT REFERENCES customers(id),
    priority TEXT NOT NULL,
    status TEXT NOT NULL,
    age_days NUMERIC NOT NULL,
    csat NUMERIC NOT NULL,
    channel TEXT NOT NULL
);

-- 3. Create Fleet Table
CREATE TABLE fleet (
    customer_id TEXT PRIMARY KEY REFERENCES customers(id),
    telematics_provider TEXT NOT NULL,
    fleet_size NUMERIC NOT NULL,
    avg_vehicle_age NUMERIC NOT NULL,
    vehicle_types JSONB NOT NULL
);

-- 4. Create Usage Table
CREATE TABLE usage (
    customer_id TEXT PRIMARY KEY REFERENCES customers(id),
    active_drivers NUMERIC NOT NULL,
    damage_rate NUMERIC NOT NULL,
    inspections_trend JSONB NOT NULL,
    api_usage JSONB NOT NULL
);

-- 5. Enable Row Level Security (RLS)
ALTER TABLE customers ENABLE ROW LEVEL SECURITY;
ALTER TABLE tickets ENABLE ROW LEVEL SECURITY;
ALTER TABLE fleet ENABLE ROW LEVEL SECURITY;
ALTER TABLE usage ENABLE ROW LEVEL SECURITY;

-- 6. Create RLS Policies
-- Note: Since the dashboard currently does not have user authentication implemented, 
-- these policies allow public read access so the application can still fetch data.
CREATE POLICY "Allow public read access on customers" ON customers FOR SELECT USING (true);
CREATE POLICY "Allow public read access on tickets" ON tickets FOR SELECT USING (true);
CREATE POLICY "Allow public read access on fleet" ON fleet FOR SELECT USING (true);
CREATE POLICY "Allow public read access on usage" ON usage FOR SELECT USING (true);

-- 7. Insert Data into Customers
INSERT INTO customers (id, name, status, tier, mrr, csm, latitude, longitude) VALUES
('C1', 'Acme Logistics', 'Healthy', 'Enterprise', 5000, 'Sarah', 37.7749, -122.4194),
('C2', 'Fast Freight', 'At Risk', 'Pro', 2000, 'Mike', 40.7128, -74.0060),
('C3', 'Global Delivery', 'Healthy', 'Enterprise', 8500, 'Sarah', 41.8781, -87.6298),
('C4', 'City Couriers', 'Churned', 'Basic', 500, 'Mike', 30.2672, -97.7431);

-- 8. Insert Data into Tickets
INSERT INTO tickets (id, customer_id, priority, status, age_days, csat, channel) VALUES
('T101', 'C2', 'High', 'Open', 12, 2, 'Email'),
('T102', 'C1', 'Medium', 'Closed', 1, 5, 'Phone'),
('T103', 'C4', 'Low', 'Open', 45, 1, 'Portal'),
('T104', 'C2', 'High', 'Open', 8, 3, 'Email'),
('T105', 'C3', 'Low', 'Closed', 3, 5, 'Phone');

-- 9. Insert Data into Fleet
INSERT INTO fleet (customer_id, telematics_provider, fleet_size, avg_vehicle_age, vehicle_types) VALUES
('C1', 'Geotab', 150, 3.2, '[{"type": "Vans", "count": 100}, {"type": "Trucks", "count": 50}]'),
('C2', 'Samsara', 50, 6.5, '[{"type": "Vans", "count": 30}, {"type": "Sedans", "count": 20}]'),
('C3', 'Motive', 400, 2.5, '[{"type": "Trucks", "count": 350}, {"type": "Vans", "count": 50}]');

-- 10. Insert Data into Usage
INSERT INTO usage (customer_id, active_drivers, damage_rate, inspections_trend, api_usage) VALUES
('C1', 120, 2.1, '[{"month": "Jan", "count": 1100}, {"month": "Feb", "count": 1200}, {"month": "Mar", "count": 1250}]', '[{"endpoint": "/trips", "calls": 50000}, {"endpoint": "/vehicles", "calls": 20000}]'),
('C2', 45, 8.5, '[{"month": "Jan", "count": 400}, {"month": "Feb", "count": 250}, {"month": "Mar", "count": 150}]', '[{"endpoint": "/trips", "calls": 12000}, {"endpoint": "/vehicles", "calls": 5000}]'),
('C3', 300, 1.2, '[{"month": "Jan", "count": 2000}, {"month": "Feb", "count": 2100}, {"month": "Mar", "count": 2300}]', '[{"endpoint": "/trips", "calls": 150000}, {"endpoint": "/vehicles", "calls": 45000}]');
