-- PORTFOLIO 2: QUERY PROCESSING AND OPTIMISATION
-- File: test_data.sql
-- Purpose: Add sample records for query testing.

USE LibraryManagement;

-- Add two borrowers
INSERT INTO Borrower
(FirstName, LastName, Email, PhoneNumber, Address, RegistrationDate)
VALUES
('Tunde', 'Adeyemi', 'tunde.adeyemi@example.com',
 '08034567891', 'Ibadan, Oyo State', '2026-10-15'),
('Zainab', 'Yusuf', 'zainab.yusuf@example.com',
 '08045678912', 'Lagos, Lagos State', '2026-10-20');

-- Add three books
INSERT INTO Book
(Title, Author, ISBN, Publisher, PublicationYear,
 Category, ShelfLocation, Status)
VALUES
('Database Management Systems', 'Raghu Ramakrishnan',
 '9780072465631', 'McGraw Hill', 2002,
 'Computing', 'Shelf C1', 'OnLoan'),
('Computer Networking', 'James Kurose',
 '9780133594140', 'Pearson', 2016,
 'Networking', 'Shelf C2', 'OnLoan'),
('Introduction to Algorithms', 'Thomas Cormen',
 '9780262033848', 'MIT Press', 2009,
 'Computing', 'Shelf C3', 'Available');

-- Add a current loan for Tunde
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate, ReturnDate)
SELECT br.BorrowerID, bk.BookID, st.StaffID,
       '2026-11-10', '2026-11-20', NULL
FROM Borrower br
JOIN Book bk ON bk.Title = 'Database Management Systems'
JOIN Staff st ON st.Email = 'emeka.nwosu@example.com'
WHERE br.Email = 'tunde.adeyemi@example.com';

-- Add an overdue loan for Zainab
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate, ReturnDate)
SELECT br.BorrowerID, bk.BookID, st.StaffID,
       '2026-10-25', '2026-11-05', NULL
FROM Borrower br
JOIN Book bk ON bk.Title = 'Computer Networking'
JOIN Staff st ON st.Email = 'emeka.nwosu@example.com'
WHERE br.Email = 'zainab.yusuf@example.com';

-- Add a returned loan for Tunde
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate, ReturnDate)
SELECT br.BorrowerID, bk.BookID, st.StaffID,
       '2026-10-15', '2026-10-25', '2026-10-23'
FROM Borrower br
JOIN Book bk ON bk.Title = 'Introduction to Algorithms'
JOIN Staff st ON st.Email = 'emeka.nwosu@example.com'
WHERE br.Email = 'tunde.adeyemi@example.com';

-- Add a partial payment against Zainab's overdue loan
INSERT INTO FinePayment
(LoanID, AmountPaid, PaymentDate, PaymentMethod)
SELECT LoanID, 1000.00, '2026-11-10', 'Cash'
FROM Loan
WHERE BorrowerID = (
    SELECT BorrowerID
    FROM Borrower
    WHERE Email = 'zainab.yusuf@example.com'
)
AND BookID = (
    SELECT BookID
    FROM Book
    WHERE Title = 'Computer Networking'
)
AND ReturnDate IS NULL;