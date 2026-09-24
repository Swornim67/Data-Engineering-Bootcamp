-- 9) surrogate key
-- artificial key created by the database or by the system.
-- we dont have to put the numbers if surrogate key is used.


-- for eg 
create table if not exists vehicle_data(
vehicle_id int auto_increment primary key,
model varchar(50),
color varchar(50)
-- auto_increment=101;                             -- starts from 101 and continues. if 101 is deleted then wont be reused and 
--                                                 if error occurs while inserting the records suppose in the 101 so it will skip it and start from 102.

);

-- inserting records
insert into vehicle_data (model,color) values
('Tesla Model 3','Red'),
('Ford Mustang ','Blue');

-- seeing the records now 
select * from vehicle_data;