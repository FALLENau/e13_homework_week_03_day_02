DROP TABLE IF EXISTS pizza_order;

CREATE TABLE pizza_orders (
  id SERIAL2 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  toppping VARCHAR(255),
  quantity INT2
);
