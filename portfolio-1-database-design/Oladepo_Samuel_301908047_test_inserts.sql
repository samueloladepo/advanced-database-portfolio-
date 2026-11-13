
USE LibraryManagement;

-- Insert borrowers
INSERT INTO Borrower
(FirstName, LastName, Email, PhoneNumber, Address, RegistrationDate)
VALUES
('Chinedu', 'Okafor', 'chinedu.okafor@example.com',
 '08031234567', 'Ibadan, Oyo State', '2026-10-01'),
('Aisha', 'Bello', 'aisha.bello@example.com',
 '08069876543', 'Lagos, Lagos State', '2026-10-05');

-- Insert books
INSERT INTO Book
(Title, Author, ISBN, Publisher, PublicationYear,
 Category, ShelfLocation, Status)
VALUES
('Database Systems: A Practical Approach',
 'Thomas Connolly', '9780132943260', 'Pearson',
 2014, 'Computing', 'Shelf A1', 'Available'),
('Introduction to Computer Networks',
 'Andrew Tanenbaum', '9780132126953', 'Pearson',
 2010, 'Networking', 'Shelf B2', 'Available');

-- Insert staff
INSERT INTO Staff
(FirstName, LastName, Email, PhoneNumber, Role, HireDate)
VALUES
('Emeka', 'Nwosu', 'emeka.nwosu@example.com',
 '08056781234', 'Librarian', '2024-03-15');

-- Insert loans
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate, ReturnDate)
VALUES
(1, 1, 1, '2026-10-01', '2026-10-08', NULL),
(2, 2, 1, '2026-10-10', '2026-10-17', '2026-10-16');

-- Update book availability
UPDATE Book
SET Status = 'OnLoan'
WHERE BookID = 1;

-- Insert two payments for LoanID 1
INSERT INTO FinePayment
(LoanID, AmountPaid, PaymentDate, PaymentMethod)
VALUES
(1, 1000.00, '2026-11-10', 'Cash'),
(1, 1500.00, '2026-11-11', 'Bank Transfer');

-- Verify records
SELECT * FROM Borrower;
SELECT * FROM Book;
SELECT * FROM Staff;
SELECT * FROM Loan;
SELECT * FROM FinePayment;
SELECT * FROM FineRate;
