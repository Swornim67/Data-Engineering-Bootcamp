-- 4) Alternate key

-- >An alternate key is a candidate key that was NOT chosen to be the primary key.


-- Candidate keys: customer_id, email, phone
--                        ↓
--             pick ONE as primary key
--                        ↓
--         customer_id → chosen as PRIMARY KEY

-- email and phone → the leftover ones → these are now ALTERNATE KEYS


CREATE TABLE customer (
  customer_id INT PRIMARY KEY,   -- chosen primary key
  customer_name VARCHAR(50),
  email VARCHAR(50) UNIQUE,      -- alternate key, enforced with UNIQUE	
  phone VARCHAR(50) UNIQUE,      -- alternate key, enforced with UNIQUE
  city VARCHAR(50)
);