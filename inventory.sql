/*
This script uses MySql version 8.x
The script contains sql commands to create and polulate tables in an 'inventory' database.
The tables are 'categories' and 'products' and are related in a one-to-many relationship.
Assumptions:
1. The database is already created.
2. The user has the necessary permissions to create tables and insert data.
*/

-- Set the current database to 'inventory'
USE inventory;

-- Create the 'categories' table only if it does not exist
CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    status ENUM('active', 'inactive') DEFAULT 'active',
    -- add a column for the created_at timestamp
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- add a column for the updated_at timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create the 'products' table only if it does not exist
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    -- add a column for the created_at timestamp
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    -- add a column for the updated_at timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- drop the 'products' regardless of whether it exists or not
DROP TABLE IF EXISTS products;

-- drop the 'categories' regardless of whether it exists or not
DROP TABLE IF EXISTS categories;

-- Insert data into the 'categories' table
INSERT INTO categories (name, description, status) VALUES
('Electronics', 'Electronic devices and accessories', 'active'),
('Clothing', 'Clothing items and accessories', 'active'),
('Books', 'Books and reading materials', 'active');

-- Insert data into the 'products' table
INSERT INTO products (name, description, price, category_id) VALUES
('Laptop', 'High-performance laptop with 16GB RAM', 1200.00, 1),
('Smartphone', 'Latest smartphone with 5G capabilities', 800.00, 1),
('T-shirt', 'Cotton t-shirt with logo design', 20.00, 2),
('Jeans', 'Slim-fit jeans', 50.00, 2),
('Novel', 'Best-selling novel by a popular author', 15.00, 3),
('Textbook', 'Textbook for a college course', 80.00, 3);

-- display the contents of the 'categories' table
SELECT * FROM categories;

-- show the highest price of products in all categories
SELECT MAX(price) AS highest_price FROM products;