import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Establish the connection to MySQL server
        connection = mysql.connector.connect(
            host='localhost',  # Update with your host, typically 'localhost'
            user='root',       # Update with your MySQL username
            password='password' # Update with your MySQL password
        )
        
        if connection.is_connected():
            # Create a cursor object to interact with MySQL server
            cursor = connection.cursor()
            
            # Create database if it doesn't already exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
            print("Database 'alx_book_store' created successfully!")
            
            # Close the cursor and connection after the operation is complete
            cursor.close()
            connection.close()

    except Error as e:
        # Handle any errors that occur during the connection or execution
        print(f"Error: {e}")
        if connection.is_connected():
            connection.close()

if __name__ == "__main__":
    create_database()

