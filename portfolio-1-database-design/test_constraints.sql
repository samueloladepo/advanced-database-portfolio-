
USE LibraryManagement;

-- Test 1: Invalid BorrowerID
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate)
VALUES
(999, 1, 1, '2026-11-12', '2026-11-19');

-- Test 2: Invalid BookID
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate)
VALUES
(1, 999, 1, '2026-11-12', '2026-11-19');

-- Test 3: Invalid StaffID
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate)
VALUES
(1, 1, 999, '2026-11-12', '2026-11-19');

-- Test 4: Zero payment
INSERT INTO FinePayment
(LoanID, AmountPaid, PaymentDate, PaymentMethod)
VALUES
(1, 0, '2026-11-12', 'Cash');

-- Test 5: Negative payment
INSERT INTO FinePayment
(LoanID, AmountPaid, PaymentDate, PaymentMethod)
VALUES
(1, -500, '2026-11-12', 'Cash');

-- Test 6: Duplicate staff email
INSERT INTO Staff
(FirstName, LastName, Email, PhoneNumber, Role, HireDate)
VALUES
('David', 'Adeyemi', 'emeka.nwosu@example.com',
 '08034567891', 'Assistant Librarian', '2025-06-10');

-- Test 7: NULL BookID
INSERT INTO Loan
(BorrowerID, BookID, StaffID, LoanDate, DueDate)
VALUES
(1, NULL, 1, '2026-11-12', '2026-11-19');
