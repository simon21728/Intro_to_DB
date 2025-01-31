-- Use the alx_book_store database
USE alx_book_store;

-- Create the Authors table
CREATE TABLE IF NOT EXISTS authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each author
    author_name VARCHAR(215) NOT NULL  -- Name of the author
);

-- Create the Books table
CREATE TABLE IF NOT EXISTS books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each book
    title VARCHAR(130) NOT NULL,  -- Title of the book
    author_id INT,  -- Foreign key linking to authors table
    price DOUBLE NOT NULL,  -- Price of the book
    publication_date DATE,  -- Publication date of the book
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE SET NULL  -- Set author_id to NULL if the author is deleted
);

-- Create the Customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each customer
    customer_name VARCHAR(215) NOT NULL,  -- Name of the customer
    email VARCHAR(215) UNIQUE NOT NULL,  -- Email of the customer (unique constraint)
    address TEXT NOT NULL  -- Address of the customer
);

-- Create the Orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each order
    customer_id INT,  -- Foreign key linking to customers table
    order_date DATE NOT NULL,  -- Date when the order was placed
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE  -- Delete all orders for a customer if that customer is deleted
);

-- Create the Order_Details table
CREATE TABLE IF NOT EXISTS order_details (
    orderdetailid INT AUTO_INCREMENT PRIMARY KEY,  -- Unique identifier for each order detail entry
    order_id INT,  -- Foreign key linking to orders table
    book_id INT,  -- Foreign key linking to books table
    quantity DOUBLE NOT NULL,  -- Quantity of the book in the order
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,  -- Delete all order details if the order is deleted
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE  -- Delete the order detail if the book is deleted
);

