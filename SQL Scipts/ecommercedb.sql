-- Create Database
create DATABASE ecommercedb;
use ecommercedb;

-- create customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- create address table
CREATE TABLE address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    address_line1 VARCHAR(255) NOT NULL,
    address_line2 VARCHAR(255),
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id)
);

--create order table
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) NOT NULL,
    shipping_method VARCHAR(100),
    payment_method VARCHAR(100),
    shipping_cost DECIMAL(10,2),
    shipping_address_id INT,
    amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (shipping_address_id) REFERENCES address(address_id)
);

-- create brand table
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    logo_url VARCHAR(255),
    description TEXT
);

-- create product_category table 
CREATE TABLE product_category (
    product_category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    category_description TEXT
);

-- create product table 

CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    brand_id INT,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    base_price DECIMAL(10,2) NOT NULL,
    category_id INT,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(product_category_id)
);

-- create size_category table 
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    description TEXT
);

-- create size_option table 
CREATE TABLE size_option (
    size_option_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT NOT NULL,
    label VARCHAR(50) NOT NULL,
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- create color table 
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    color_name VARCHAR(50) NOT NULL,
    hex_code VARCHAR(7) NOT NULL
);

-- create product_variation table 
CREATE TABLE product_variation (
    product_variation_id INT PRIMARY KEY AUTO_INCREMENT,
    size_option_id INT,
    product_id INT NOT NULL,
    color_id INT,
    FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id),
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id)
);

-- create product_item table 
CREATE TABLE product_item (
    product_item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    stock_quantity INT NOT NULL DEFAULT 0,
    variation_id INT,
    sku VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (variation_id) REFERENCES product_variation(product_variation_id)
);

-- create order_item table COMMENTCREATE TABLE order_item (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_item_id INT NOT NULL,
    order_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (product_item_id) REFERENCES product_item(product_item_id),
    FOREIGN KEY (order_id) REFERENCES `order`(order_id)
);

-- create product_image
CREATE TABLE product_image (
    product_image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    image_url VARCHAR(255) NOT NULL,
    description TEXT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- create product_attribute_category table
CREATE TABLE product_attribute_category (
    product_attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);


-- create product_attribute_type table
CREATE TABLE product_attribute_type (
    product_attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

-- create product_attribute table
CREATE TABLE product_attribute (
    product_attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    attribute_category_id INT,
    attribute_type_id INT,
    FOREIGN KEY (attribute_category_id) REFERENCES product_attribute_category(product_attribute_category_id),
    FOREIGN KEY (attribute_type_id) REFERENCES product_attribute_type(product_attribute_type_id)
);

--create product_attribute_value
CREATE TABLE product_attribute_value (
    product_attribute_value_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    attribute_id INT NOT NULL,
    value TEXT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES product(product_id),
    FOREIGN KEY (attribute_id) REFERENCES product_attribute(product_attribute_id)
);