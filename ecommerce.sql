-- CREATE THE ECOMMERCE DATABASE
CREATE DATABASE ecommerce;

-- CREATING TABLES

use ecommerce;

-- BRAND TABLE 
CREATE TABLE brand(
brand_id INT PRIMARY KEY AUTO_INCREMENT,
name varchar(100),
description TEXT
);

-- PROCUCT CATEGORY TABLE 
CREATE TABLE productCategory(
category_id INT PRIMARY KEY AUTO_INCREMENT,
name varchar(100),
description TEXT
);

-- PRODUCT TABLE 
CREATE TABLE product(
product_id INT PRIMARY KEY AUTO_INCREMENT,
productName varchar(200),
brand_id INT, 
category_id INT,
FOREIGN KEY(brand_id) REFERENCES brand(brand_id),
FOREIGN KEY(category_id) REFEReNCES productCategory(category_id),
productPrice Decimal(10,2),
description TEXT
); 

-- PRODUCT IMAGE TABLE 
CREATE TABLE productImage(
image_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
FOREIGN KEY(product_id) REFERENCES product(product_id),
url varchar(2000),
altText varchar(300)
); 

-- COLOR TABLE
CREATE TABLE color(
color_id INT PRIMARY KEY AUTO_INCREMENT,
colorName varchar(300),
colorCode varchar(10)
); 

-- SIZE CATEGORY
CREATE TABLE sizeCategory(
sizeCategory_id INT PRIMARY KEY AUTO_INCREMENT,
sizeCategory_name varchar(200),
description TEXT
); 

-- SIZE OPTION
CREATE TABLE sizeOption(
sizeOption_id INT PRIMARY KEY AUTO_INCREMENT,
sizeCategory_id INT,
FOREIGN KEY(sizeCategory_id) REFERENCES sizeCategory(sizeCategory_id),
sizeCode varchar(50)
); 

-- PRODUCT ITEM
CREATE TABLE productItem(
productItem_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
sizeOption_id INT,
color_id INT,
FOREIGN KEY(product_id) REFERENCES product(product_id),
FOREIGN KEY(sizeOption_id) REFERENCES sizeOption(sizeOption_id),
FOREIGN KEY(color_id) REFERENCES color(color_id),
itemCode varchar(10),
quantity_inStock INT,
price DECIMAL(10,2)
); 

-- PRODUCT VARIATION
CREATE TABLE productVariation(
productVariation_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT,
color_id INT,
sizeOption_id INT,
FOREIGN KEY(product_id) REFERENCES product(product_id),
FOREIGN KEY(color_id) REFERENCES color(color_id),
FOREIGN KEY(sizeOption_id) REFERENCES sizeOption(sizeOption_id)
); 

-- ATTRIBUTE CATEGORY TABLE
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);
-- ATTRIBUTE TYPE TABLE
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- PRODUCT ATTRIBUTE TABLE
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    attribute_category_id INT,
    attribute_type_id INT,
    value TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);


-- POPULATING THE TABLES

INSERT INTO brand (name, description) 
VALUES ('Nike', 'Sportswear and shoes'),
('Apple', 'Consumer electronics and software');

INSERT INTO productCategory(name, description) 
VALUES ('Shoes', 'All types of footwear'),
('Electronics', 'Tech gadgets and devices');

INSERT INTO color (colorName, colorCode)
VALUES ('Red', '#FF0000'),
('Black', '#000000'),
('White', '#FFFFFF');

INSERT INTO sizeCategory (sizeCategory_name, description) 
VALUES ('Clothing Sizes', 'Standard clothing sizes');

INSERT INTO sizeOption (sizeCategory_id, sizeCode) 
VALUES (1, 'S'),
(1, 'M'),
(1, 'L');

INSERT INTO product (productName, brand_id, category_id, productPrice, description) 
VALUES ('Air Max 90', 1, 1, 199.99, 'Classic Nike Air Max sneakers'),
('iPhone 14', 2, 2, 999.99, 'Latest Apple smartphone');

INSERT INTO productImage (product_id, url, altText) 
VALUES (1, 'https://example.com/airmax.jpg', 'Nike Air Max 90 Shoe'),
(2, 'https://example.com/iphone14.jpg', 'Apple iPhone 14');

INSERT INTO productItem (product_id, sizeOption_id, color_id, itemCode, quantity_inStock, price) 
VALUES (1, 2, 1, 'AM90-M-RED', 25, 199.99),
(2, NULL, 2, 'IP14-BLK', 50, 999.99);
 
