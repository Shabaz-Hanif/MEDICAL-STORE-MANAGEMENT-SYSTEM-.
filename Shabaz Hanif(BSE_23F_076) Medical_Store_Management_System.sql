Create Database Medical_Store_Management_System;
use Medical_Store_Management_System;
CREATE TABLE Medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100),
    manufacturer VARCHAR(100),
    expiry_date DATE,
    unit_price DECIMAL(10, 2),
    quantity_in_stock INT
);
CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100),
    contact_person VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100),
    phone_number VARCHAR(15),
    email VARCHAR(100),
    address VARCHAR(200)
);
CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    sale_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Sale_Items (
    sale_item_id INT AUTO_INCREMENT PRIMARY KEY,
    sale_id INT,
    medicine_id INT,
    quantity_sold INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (sale_id) REFERENCES Sales(sale_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
CREATE TABLE Purchase (
    purchase_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_id INT,
    purchase_date DATETIME,
    total_amount DECIMAL(10, 2),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);
CREATE TABLE Purchase_Items (
    purchase_item_id INT AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT,
    medicine_id INT,
    quantity_purchased INT,
    unit_price DECIMAL(10, 2),
    FOREIGN KEY (purchase_id) REFERENCES Purchase(purchase_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
CREATE TABLE Stock_Adjustment (
    adjustment_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    adjustment_date DATETIME,
    adjustment_type ENUM('Addition', 'Subtraction'),
    quantity_adjusted INT,
    reason VARCHAR(200),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id)
);
CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100)
);
CREATE TABLE Medicine_Categories (
    medicine_category_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_id INT,
    category_id INT,
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id),
    FOREIGN KEY (category_id) REFERENCES Categories(category_id)
);