DROP TABLE rentals;
DROP TABLE equipment;
DROP TABLE customers;

CREATE TABLE customers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  account_number INT8,
  shipping_info VARCHAR(255),
  img VARCHAR(255)
);

CREATE TABLE equipment
(
  id SERIAL8 primary key,
  model VARCHAR(255) not null,
  category VARCHAR(255) not null,
  quantity INT2,
  day_rate INT4,
  img VARCHAR(255)
);

CREATE TABLE rentals
(
  id SERIAL8 primary key,
  customer_id INT8 references customers(id) ON DELETE CASCADE,
  equipment_id INT8 references equipment(id) ON DELETE CASCADE,
  hire_duration INT4,
  quantity INT2
);
