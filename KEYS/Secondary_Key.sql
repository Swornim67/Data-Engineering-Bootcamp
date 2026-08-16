-- 10)secondary key

-- it is a type of key which is used in any column indexed to make searching and filtering records faster but it's not a pk or fk.


-- for eg
create table if not exists bike_data(
bike_id int auto_increment primary key,
model varchar(50),
color varchar(50),

index id_model(model)
);

-- Insert multiple records into bike_data
INSERT INTO bike_data (model, color) VALUES
('Yamaha FZ', 'Black'),
('TVS Ronin', 'Orange'),
('Bajaj Pulsar N160', 'Red'),
('Suzuki Gixxer 150', 'Blue');

-- now normal lookup 
SELECT * FROM bike_data WHERE color = 'Black';   -- the duration is 0.00058 sec / 0.000013 sec


-- fast lookup 
SELECT * FROM bike_data WHERE model = 'Yamaha FZ';   -- the duration is 0.00057 sec / 0.000012 sec


-- not much difference due to volume of data.