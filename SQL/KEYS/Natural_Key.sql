-- 8) Natural Key
-- it is a column which should exist and should be unique in the real world to identify the records.alter

-- for example As my name is Swornim regmi, so multiple people got the name as swornim regmi 
-- but my citizenship number is unique and given to me so not everyone can get the same citizenship number as my.



-- for example 

create table if not exists vehicle(
vehicle_identification_number varchar(17) primary key,    -- this is natural key.
model varchar(50),
owner_name varchar(50)
);