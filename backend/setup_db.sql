CREATE DATABASE IF NOT EXISTS flask_store;

USE flask_store;

CREATE TABLE IF NOT EXISTS customers (
    customer_id INT  NOT NULL AUTOINCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL,
    dob DATE NOT NULL,
    PRIMARY KEY (customer_id),
);

CREATE TABLE IF NOT EXISTS units (
    unit_id INT NOT NULL AUTOINCREMENT,
    unit_name VARCHAR(20) NOT NULL,
    PRIMARY KEY (unit_id)
);

CREATE TABLE IF NOT EXISTS products (
    product_id INT  NOT NULL AUTOINCREMENT,
    product_name VARCHAR(200) NOT NULL,
    unit_id INT NOT NULL DEFAULT 1,
    price DECIMAL(20, 2) NOT NULL,
    PRIMARY KEY (product_id),
    FOREIGN KEY (unit_id) REFERENCES units(unit_id)
);

CREATE TABLE IF NOT EXISTS orders (
    order_id INT NOT NULL AUTOINCREMENT,
    order_date DATE NOT NULL,
    customer_id INT NOT NULL,
    PRIMARY KEY (order_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE IF NOT EXISTS order_items (
    item_id INT  NOT NULL AUTOINCREMENT,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity DECIMAL (12,4) NOT NULL,
    PRIMARY KEY (item_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES productomers(product_id)
);

