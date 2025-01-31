-- The database name will be passed as an argument, so we don't need to hardcode it.
-- The script queries the INFORMATION_SCHEMA to get column details for the 'books' table.

SELECT COLUMN_NAME, COLUMN_TYPE, IS_NULLABLE, COLUMN_DEFAULT, EXTRA
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'books';

