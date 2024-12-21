# library-management-system-mysql


## Overview
A comprehensive MySQL-based Library Management System that manages books, members, transactions, and inventory. This system is designed to handle various aspects of library operations including book management, member tracking, transaction processing, and inventory control.

## Database Structure
The system consists of 12 main tables:
1. Author - Stores author information
2. Genre - Manages book categories
3. Book - Contains book details
4. Member - Tracks library members
5. Staff - Manages library staff information
6. Transaction - Records book borrowing transactions
7. Payment - Tracks financial transactions
8. Reservation - Handles book reservations
9. Publisher - Stores publisher information
10. Supplier - Manages book suppliers
11. BookStock - Tracks book inventory
12. BookCopy - Manages individual book copies

## Features
- Complete book management system
- Member tracking and management
- Transaction processing
- Fine calculation system
- Reservation handling
- Inventory management
- Staff management
- Publisher and supplier tracking

## Views
The system includes 4 custom views:
- BookDetailsView - Comprehensive book information
- MemberTransactionHistory - Member borrowing history
- BookAvailabilityView - Real-time book availability status
- MemberPaymentSummary - Financial tracking for members

## Technical Details
- Database: MySQL
- SQL Features: Views, Foreign Keys, JOIN operations
- Data Types: INT, VARCHAR, DATE, DECIMAL, TEXT

## Installation
1. Install MySQL on your system
2. Run the SQL script to create the database and tables
3. Initial sample data is included in the script

## Usage
Execute the SQL queries to:
- Add/modify books
- Register new members
- Process transactions
- Track inventory
- Generate reports

## Contributing
Feel free to fork this project and submit pull requests for any improvements.

