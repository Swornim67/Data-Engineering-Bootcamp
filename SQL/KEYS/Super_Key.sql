-- 6) Super key

-- super key is combination of multiple columns in a table which uniquely identifies a single row in a table.


-- using the customer_unique table

select * from customer_unique;

-- in this table we got customer_id,customer_name,email,phone,city 

-- as told it identifies them uniquely

-- customer_id -> unique as single customer got their own id not duplicates in it.
-- customer_name -> multiple customer name can be same so it's not a super key.
-- email -> impossible for people to have the same email so it's super key.
-- phone -> impossible for people to have the same phone number as others so it's super key.
-- city -> multiple people can stay in the same city so it's not a super key.

-- as previously told it's a combination of multiple columns which uniquely identifies itself so 

-- customer_id+customer_name -> super key as it's unique.
-- email+phone -> super key as it's unique.
-- phone+city -> super key as phone are unique but the city where multiple people can live in the same city 


-- simple rule is UNIQUE COLUMN + ANY OTHER COLUMN = SUPER KEY.