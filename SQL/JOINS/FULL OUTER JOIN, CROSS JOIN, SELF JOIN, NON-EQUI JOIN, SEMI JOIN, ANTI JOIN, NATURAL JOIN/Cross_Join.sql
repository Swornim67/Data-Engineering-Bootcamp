-- Cross Join

-- > ALL THE PERMUTATION AND COMBINATION A TABLE CAN GET WILL BE GIVEN AS A OUTPUT.

-- > In simple words give me all the possible combinations between 2 tables 

-- "Show me every product in every store."  basic analogy to keep in mind for this join.

-- Also know as Expensive query and the least worst case scenario used in the production queries.

-- IMPORTANT THING = THE "KEY" AND "ON" CONDITION AREN'T REQUIRED IN THE CROSS JOIN.

-- Example 

-- Show me every product with every store.

select * from products;
select * from stores;

select 
p.product_id,p.product_name,s.store_id,s.store_name
from products p 
cross join stores s 





