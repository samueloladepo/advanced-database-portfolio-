
CREATE DATABASE IF NOT EXISTS LibraryManagement;
USE LibraryManagement;

-- 1. Borrower table
CREATE TABLE Borrower (
    BorrowerID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20),
    Address VARCHAR(200),
    RegistrationDate DATE NOT NULL
);

-- 2. Book table
CREATE TABLE Book (
    BookID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20),
    Publisher VARCHAR(100),
    PublicationYear INT,
    Category VARCHAR(60),
    ShelfLocation VARCHAR(50),
    Status VARCHAR(20) NOT NULL DEFAULT 'Available',
    CHECK (Status IN ('Available', 'OnLoan', 'Lost'))
);

-- 3. Staff table
CREATE TABLE Staff (
    StaffID INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(20),
    Role VARCHAR(50) NOT NULL,
    HireDate DATE NOT NULL
);

-- 4. Loan table
CREATE TABLE Loan (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    BorrowerID INT NOT NULL,
    BookID INT NOT NULL,
    StaffID INT NOT NULL,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BorrowerID) REFERENCES Borrower(BorrowerID),
    FOREIGN KEY (BookID) REFERENCES Book(BookID),
    FOREIGN KEY (StaffID) REFERENCES Staff(StaffID),
    CHECK (DueDate >= LoanDate),
    CHECK (ReturnDate IS NULL OR ReturnDate >= LoanDate)
);

-- 5. FinePayment table
CREATE TABLE FinePayment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    LoanID INT NOT NULL,
    AmountPaid DECIMAL(10,2) NOT NULL,
    PaymentDate DATE NOT NULL,
    PaymentMethod VARCHAR(30),
    FOREIGN KEY (LoanID) REFERENCES Loan(LoanID),
    CHECK (AmountPaid > 0)
);

-- 6. FineRate table
CREATE TABLE FineRate (
    FineRateID INT AUTO_INCREMENT PRIMARY KEY,
    DailyFineRate DECIMAL(10,2) NOT NULL,
    CHECK (DailyFineRate >= 0)
);

-- Insert default daily fine rate
INSERT INTO FineRate (DailyFineRate)
SELECT 500.00
WHERE NOT EXISTS (
    SELECT 1 FROM FineRate
);
