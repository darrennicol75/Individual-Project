DROP TABLE rentals;
DROP TABLE equipment;
DROP TABLE customers;

CREATE TABLE customers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  account_number INT8,
  shipping_info VARCHAR(255)
);

CREATE TABLE equipment
(
  id SERIAL8 primary key,
  model VARCHAR(255) not null,
  category VARCHAR(255) not null,
  quantity INT2,
  day_rate INT4
);

CREATE TABLE rentals
(
  id SERIAL8 primary key,
  customers_id INT8 references customers(id),
  equipment_id INT8 references equipment(id),
  hire_duration INT4,
  quantity INT2 
);
