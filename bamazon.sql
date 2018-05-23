DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE products(
  item_id INT NOT NULL AUTO_INCREMENT,
  product_name VARCHAR(100) NOT NULL,
  department_name VARCHAR(100) default NULL,
  price FLOAT(12,2) default 0,
  stock_quantity INT(10) default 0,
  PRIMARY KEY (item_id)
);

INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Premium Dog Food", "Pets", 69.99, 1000);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Nerf Gun", "Toys", 49.95, 500);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Kid's Bike", "Toys", 100.00, 100);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Fish Food", "Pets", 49.99, 200);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Dog Chew Toy", "Pets", 14.95, 1000);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("10 Pack of Pencils", "Stationary", 8.99, 10000);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("3 Pack of Erasers", "Stationary", 4.95, 10000);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Premium Cat Food", "Pets", 69.99, 1000);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Barbie Doll House", "Toys", 259.99, 1000);
INSERT INTO products(product_name,department_name,price,stock_quantity)
VALUES ("Rubber Chicken", "Toys", 7.95, 40000);