-- Use the database specified (the database name will be passed as an argument)
USE alx_book_store;

-- Query the information schema to get the table structure for the 'books' table
SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT, EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'alx_book_store' AND TABLE_NAME = 'books';

