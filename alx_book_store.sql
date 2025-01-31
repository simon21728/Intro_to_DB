-- Create the database
CREATE DATABASE alx_book_store;

-- Switch to the newly created database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(215) NOT NULL
);

-- Create the Books table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(130) NOT NULL,
    author_id INT,
    price DOUBLE NOT NULL,
    publication_date DATE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE SET NULL
);

-- Create the Customers table
CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(215) NOT NULL,
    email VARCHAR(215) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

-- Create the Orders table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

-- Create the Order_Details table
CREATE TABLE Order_Details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity DOUBLE NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Add some sample data to test the schema
-- Inserting authors
INSERT INTO Authors (author_name) VALUES 
('J.K. Rowling'),
('George Orwell'),
('J.R.R. Tolkien');

-- Inserting books
INSERT INTO Books (title, author_id, price, publication_date) VALUES 
('Harry Potter and the Philosopher\'s Stone', 1, 19.99, '1997-06-26'),
('1984', 2, 15.99, '1949-06-08'),
('The Hobbit', 3, 14.99, '1937-09-21');

-- Inserting customers
INSERT INTO Customers (customer_name, email, address) VALUES 
('Alice Smith', 'alice.smith@example.com', '123 Maple St, Springfield'),
('Bob Johnson', 'bob.johnson@example.com', '456 Oak St, Shelbyville');

-- Inserting orders
INSERT INTO Orders (customer_id, order_date) VALUES 
(1, '2025-01-25'),
(2, '2025-01-26');

-- Inserting order details
INSERT INTO Order_Details (order_id, book_id, quantity) VALUES 
(1, 1, 2),  -- Alice ordered 2 copies of "Harry Potter and the Philosopher's Stone"
(1, 2, 1),  -- Alice ordered 1 copy of "1984"
(2, 3, 3);  -- Bob ordered 3 copies of "The Hobbit"

