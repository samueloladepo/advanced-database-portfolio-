-- PORTFOLIO 2: QUERY PROCESSING AND OPTIMISATION
-- File: queries.sql

USE LibraryManagement;

-- ==========================================
-- QUERY 1: CURRENT LOANS
-- Display all books that have not been returned.
-- ==========================================

SELECT
    Borrower.FirstName,
    Borrower.LastName,
    Book.Title,
    Loan.LoanDate,
    Loan.DueDate
FROM Loan
INNER JOIN Borrower
    ON Loan.BorrowerID = Borrower.BorrowerID
INNER JOIN Book
    ON Loan.BookID = Book.BookID
WHERE Loan.ReturnDate IS NULL;


-- EXPLAIN QUERY 1

EXPLAIN
SELECT
    Borrower.FirstName,
    Borrower.LastName,
    Book.Title,
    Loan.LoanDate,
    Loan.DueDate
FROM Loan
INNER JOIN Borrower
    ON Loan.BorrowerID = Borrower.BorrowerID
INNER JOIN Book
    ON Loan.BookID = Book.BookID
WHERE Loan.ReturnDate IS NULL;


-- ==========================================
-- QUERY 2: OVERDUE LOANS
-- Display loans that have passed their due date.
-- ==========================================

SELECT
    Borrower.FirstName,
    Borrower.LastName,
    Book.Title,
    Loan.LoanDate,
    Loan.DueDate,
    DATEDIFF(CURRENT_DATE, Loan.DueDate) AS DaysOverdue
FROM Loan
INNER JOIN Borrower
    ON Loan.BorrowerID = Borrower.BorrowerID
INNER JOIN Book
    ON Loan.BookID = Book.BookID
WHERE Loan.ReturnDate IS NULL
AND Loan.DueDate < CURRENT_DATE;


-- EXPLAIN QUERY 2 BEFORE INDEXING

EXPLAIN
SELECT
    Borrower.FirstName,
    Borrower.LastName,
    Book.Title,
    Loan.LoanDate,
    Loan.DueDate,
    DATEDIFF(CURRENT_DATE, Loan.DueDate) AS DaysOverdue
FROM Loan
INNER JOIN Borrower
    ON Loan.BorrowerID = Borrower.BorrowerID
INNER JOIN Book
    ON Loan.BookID = Book.BookID
WHERE Loan.ReturnDate IS NULL
AND Loan.DueDate < CURRENT_DATE;


-- ==========================================
-- QUERY 3: OUTSTANDING FINES
-- Calculate fines after deducting payments.
-- ==========================================

SELECT
    Loan.LoanID,
    Borrower.FirstName,
    Borrower.LastName,
    Book.Title,
    GREATEST(
        DATEDIFF(
            COALESCE(Loan.ReturnDate, CURRENT_DATE),
            Loan.DueDate
        ),
        0
    ) AS DaysOverdue,
    FineRate.DailyFineRate,
    GREATEST(
        DATEDIFF(
            COALESCE(Loan.ReturnDate, CURRENT_DATE),
            Loan.DueDate
        ),
        0
    ) * FineRate.DailyFineRate AS TotalFine,
    COALESCE(Payments.TotalPaid, 0) AS TotalPaid,
    GREATEST(
        GREATEST(
            DATEDIFF(
                COALESCE(Loan.ReturnDate, CURRENT_DATE),
                Loan.DueDate
            ),
            0
        ) * FineRate.DailyFineRate
        - COALESCE(Payments.TotalPaid, 0),
        0
    ) AS OutstandingBalance
FROM Loan
INNER JOIN Borrower
    ON Loan.BorrowerID = Borrower.BorrowerID
INNER JOIN Book
    ON Loan.BookID = Book.BookID
CROSS JOIN FineRate
LEFT JOIN (
    SELECT
        LoanID,
        SUM(AmountPaid) AS TotalPaid
    FROM FinePayment
    GROUP BY LoanID
) AS Payments
    ON Loan.LoanID = Payments.LoanID;


-- EXPLAIN QUERY 3

EXPLAIN
SELECT
    Loan.LoanID,
    Borrower.FirstName,
    Borrower.LastName,
    Book.Title,
    GREATEST(
        DATEDIFF(
            COALESCE(Loan.ReturnDate, CURRENT_DATE),
            Loan.DueDate
        ),
        0
    ) AS DaysOverdue,
    FineRate.DailyFineRate,
    GREATEST(
        DATEDIFF(
            COALESCE(Loan.ReturnDate, CURRENT_DATE),
            Loan.DueDate
        ),
        0
    ) * FineRate.DailyFineRate AS TotalFine,
    COALESCE(Payments.TotalPaid, 0) AS TotalPaid,
    GREATEST(
        GREATEST(
            DATEDIFF(
                COALESCE(Loan.ReturnDate, CURRENT_DATE),
                Loan.DueDate
            ),
            0
        ) * FineRate.DailyFineRate
        - COALESCE(Payments.TotalPaid, 0),
        0
    ) AS OutstandingBalance
FROM Loan
INNER JOIN Borrower
    ON Loan.BorrowerID = Borrower.BorrowerID
INNER JOIN Book
    ON Loan.BookID = Book.BookID
CROSS JOIN FineRate
LEFT JOIN (
    SELECT LoanID, SUM(AmountPaid) AS TotalPaid
    FROM FinePayment
    GROUP BY LoanID
) AS Payments
    ON Loan.LoanID = Payments.LoanID;


-- ==========================================
-- INDEXING AND OPTIMISATION
-- ==========================================

CREATE INDEX idx_loan_return_due
ON Loan (ReturnDate, DueDate);

-- Display indexes on the Loan table
SHOW INDEX FROM Loan;


-- EXPLAIN QUERY 2 AFTER INDEXING

EXPLAIN
SELECT
    Borrower.FirstName,
    Borrower.LastName,
    Book.Title,
    Loan.LoanDate,
    Loan.DueDate,
    DATEDIFF(CURRENT_DATE, Loan.DueDate) AS DaysOverdue
FROM Loan
INNER JOIN Borrower
    ON Loan.BorrowerID = Borrower.BorrowerID
INNER JOIN Book
    ON Loan.BookID = Book.BookID
WHERE Loan.ReturnDate IS NULL
AND Loan.DueDate < CURRENT_DATE;