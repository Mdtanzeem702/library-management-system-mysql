
-- Create the Library Management System Database
CREATE DATABASE Library_Management_System;
USE Library_Management_System;


-- 1. Author Table
DROP TABLE IF EXISTS Author;
CREATE TABLE Author (
    AuthorID INT PRIMARY KEY AUTO_INCREMENT,
    AuthorName VARCHAR(100) NOT NULL,
    DateOfBirth DATE,
    Nationality VARCHAR(50)
);

-- Insert values into Author Table
INSERT INTO Author (AuthorName, DateOfBirth, Nationality)
VALUES 
('J.K. Rowling', '1965-07-31', 'British'),
('George Orwell', '1903-06-25', 'British'),
('J.R.R. Tolkien', '1892-01-03', 'British'),
('Mark Twain', '1835-11-30', 'American'),
('Ernest Hemingway', '1899-07-21', 'American');

SELECT 
    *
FROM
    Author;

-- 2. Genre Table
DROP TABLE IF EXISTS Genre;
CREATE TABLE Genre (
    GenreID INT PRIMARY KEY AUTO_INCREMENT,
    GenreName VARCHAR(100) NOT NULL
);

-- Insert values into Genre Table
INSERT INTO Genre (GenreName)
VALUES 
('Fantasy'),
('Science Fiction'),
('Adventure'),
('Fiction'),
('Mystery');

SELECT 
    *
FROM Genre;

-- 3. Book Table
DROP TABLE IF EXISTS Book;
CREATE TABLE Book (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100) NOT NULL,
    AuthorID INT,
    GenreID INT,
    Price DECIMAL(10 , 2 ),
    ISBN VARCHAR(20),
    FOREIGN KEY (AuthorID)
        REFERENCES Author (AuthorID),
    FOREIGN KEY (GenreID)
        REFERENCES Genre (GenreID)
);

-- Insert values into Book Table
INSERT INTO Book (Title, AuthorID, GenreID, Price, ISBN)
VALUES 
('Harry Potter and the Sorcerer\'s Stone', 1, 1, 19.99, '9780439708180'),
('1984', 2, 2, 15.99, '9780451524935'),
('The Hobbit', 3, 1, 12.99, '9780618968633'),
('Adventures of Huckleberry Finn', 4, 3, 9.99, '9780451530301'),
('The Old Man and the Sea', 5, 4, 10.99, '9780684830490');

SELECT 
    *
FROM Book;

-- 4. Member Table
DROP TABLE IF EXISTS Member;
CREATE TABLE Member (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    DateOfBirth DATE,
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

-- Insert values into Member Table
INSERT INTO Member (FirstName, LastName, DateOfBirth, Email, Phone)
VALUES 
('John', 'Doe', '1990-05-12', 'johndoe@example.com', '1234567890'),
('Jane', 'Smith', '1985-09-23', 'janesmith@example.com', '0987654321'),
('Alice', 'Johnson', '2000-02-14', 'alicej@example.com', '1122334455'),
('Bob', 'Brown', '1992-11-05', 'bobbrown@example.com', '2233445566'),
('Charlie', 'Davis', '1988-03-18', 'charliedavis@example.com', '3344556677');

SELECT 
    *
FROM Member;

-- 5. Staff Table
DROP TABLE IF EXISTS Staff;
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Salary DECIMAL(10 , 2 )
);

-- Insert values into Staff Table
INSERT INTO Staff (Name, Position, Salary)
VALUES 
('Alice White', 'Manager', 45000.00),
('Bob Green', 'Assistant', 35000.00),
('Charlie Brown', 'Librarian', 40000.00),
('David Black', 'Clerk', 25000.00),
('Eve Blue', 'Assistant Manager', 38000.00);

SELECT 
    *
FROM staff;

-- 6. Transaction Table
DROP TABLE IF EXISTS Transaction;
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    BorrowDate DATE,
    ReturnDate DATE,
    Fine DECIMAL(10 , 2 ),
    FOREIGN KEY (MemberID)
        REFERENCES Member (MemberID),
    FOREIGN KEY (BookID)
        REFERENCES Book (BookID)
);

-- Insert values into Transaction Table
INSERT INTO Transaction (MemberID, BookID, BorrowDate, ReturnDate, Fine)
VALUES 
(1, 1, '2024-12-01', '2024-12-10', 0.00),
(2, 2, '2024-12-02', '2024-12-15', 2.00),
(3, 3, '2024-12-03', '2024-12-12', 0.00),
(4, 4, '2024-12-04', '2024-12-13', 1.50),
(5, 5, '2024-12-05', '2024-12-14', 0.00);

SELECT 
    *
FROM Transaction;

-- 7. Payment Table
DROP TABLE IF EXISTS Payment;
CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT NOT NULL,
    Amount DECIMAL(10 , 2 ),
    PaymentDate DATE,
    FOREIGN KEY (MemberID)
        REFERENCES Member (MemberID)
);

-- Insert 5 sample values into Payment Table
INSERT INTO Payment (MemberID, Amount, PaymentDate)
VALUES 
(1, 5.00, '2024-12-01'),
(2, 10.00, '2024-12-02'),
(3, 15.00, '2024-12-03'),
(4, 7.50, '2024-12-04'),
(5, 20.00, '2024-12-05');

select * from Transaction;

-- 8. Reservation Table
DROP TABLE IF EXISTS Reservation;
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY AUTO_INCREMENT,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    ReservationDate DATE,
    Status VARCHAR(50),
    FOREIGN KEY (MemberID)
        REFERENCES Member (MemberID),
    FOREIGN KEY (BookID)
        REFERENCES Book (BookID)
);

-- Insert 5 sample values into Reservation Table
INSERT INTO Reservation (MemberID, BookID, ReservationDate, Status)
VALUES 
(1, 1, '2024-12-01', 'Reserved'),
(2, 2, '2024-12-02', 'Pending'),
(3, 3, '2024-12-03', 'Completed'),
(4, 4, '2024-12-04', 'Reserved'),
(5, 5, '2024-12-05', 'Pending');


select * from Reservation;


-- 9. Publisher Table
DROP TABLE IF EXISTS Publisher;
CREATE TABLE Publisher (
    PublisherID INT PRIMARY KEY AUTO_INCREMENT,
    PublisherName VARCHAR(100) NOT NULL,
    Address TEXT,
    Phone VARCHAR(20)
);

-- Insert 5 sample values into Publisher Table
INSERT INTO Publisher (PublisherName, Address, Phone)
VALUES 
('Bloomsbury', 'London, UK', '020-1234567'),
('Secker & Warburg', 'London, UK', '020-7654321'),
('HarperCollins', 'New York, USA', '212-5551212'),
('Penguin Random House', 'New York, USA', '212-5553434'),
('Macmillan', 'London, UK', '020-2345678');

select * from Publisher;

-- 10. Supplier Table
DROP TABLE IF EXISTS Supplier;
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(100),
    Address TEXT
);

-- Insert 5 sample values into Supplier Table
INSERT INTO Supplier (SupplierName, ContactInfo, Address)
VALUES 
('ABC Books', 'contact@abcbooks.com', '123 Book St, NY'),
('XYZ Distributors', 'info@xyzbooks.com', '456 Paper Rd, London'),
('Book Supply Co', 'sales@booksupply.com', '789 Ink Ave, LA'),
('Global Publishing', 'global@publishers.com', '101 Global St, London'),
('FastBooks', 'support@fastbooks.com', '202 Quick Rd, NY');

select * from Supplier;

-- 11. BookStock Table
DROP TABLE IF EXISTS BookStock;
CREATE TABLE BookStock (
    BookID INT PRIMARY KEY,
    StockQuantity INT,
    FOREIGN KEY (BookID)
        REFERENCES Book (BookID)
);

-- Insert 5 sample values into BookStock Table
INSERT INTO BookStock (BookID, StockQuantity)
VALUES 
(1, 100),
(2, 150),
(3, 200),
(4, 250),
(5, 300);

select * from BookStock;

-- 12. BookCopy Table
DROP TABLE IF EXISTS BookCopy;
CREATE TABLE BookCopy (
    CopyID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT NOT NULL,
    CopyNumber INT,
    FOREIGN KEY (BookID)
        REFERENCES Book (BookID)
);

-- Insert 5 sample values into BookCopy Table
INSERT INTO BookCopy (BookID, CopyNumber)
VALUES 
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 1);

Select * from BookCopy;

-- 1. View to show book details with author and genre information
CREATE OR REPLACE VIEW BookDetailsView AS
SELECT 
    b.BookID,
    b.Title,
    a.AuthorName,
    g.GenreName,
    b.Price,
    b.ISBN,
    bs.StockQuantity
FROM 
    Book b
JOIN 
    Author a ON b.AuthorID = a.AuthorID
JOIN 
    Genre g ON b.GenreID = g.GenreID
JOIN 
    BookStock bs ON b.BookID = bs.BookID;
    
SELECT * FROM BookDetailsView;

-- 2. View to show member transaction history
CREATE OR REPLACE VIEW MemberTransactionHistory AS
SELECT 
    m.MemberID,
    m.FirstName,
    m.LastName,
    b.Title,
    t.BorrowDate,
    t.ReturnDate,
    t.Fine
FROM 
    Transaction t
JOIN 
    Member m ON t.MemberID = m.MemberID
JOIN 
    Book b ON t.BookID = b.BookID;
    
SELECT * FROM MemberTransactionHistory;

-- 3. View to show book availability and reservations
CREATE OR REPLACE VIEW BookAvailabilityView AS
SELECT 
    b.BookID,
    b.Title,
    bs.StockQuantity,
    COUNT(r.ReservationID) AS ReservationCount,
    CASE 
        WHEN bs.StockQuantity > COUNT(r.ReservationID) THEN 'Available'
        ELSE 'Fully Reserved'
    END AS AvailabilityStatus
FROM 
    Book b
JOIN 
    BookStock bs ON b.BookID = bs.BookID
LEFT JOIN 
    Reservation r ON b.BookID = r.BookID
GROUP BY 
    b.BookID, b.Title, bs.StockQuantity;
    
SELECT * FROM BookAvailabilityView;
-- 4. View to show payment summary for members
CREATE OR REPLACE VIEW MemberPaymentSummary AS
SELECT 
    m.MemberID,
    m.FirstName,
    m.LastName,
    COUNT(p.PaymentID) AS TotalPayments,
    SUM(p.Amount) AS TotalAmountPaid,
    AVG(p.Amount) AS AveragePayment
FROM 
    Member m
LEFT JOIN 
    Payment p ON m.MemberID = p.MemberID
GROUP BY 
    m.MemberID, m.FirstName, m.LastName;

SELECT * FROM MemberPaymentSummary;



