

\# Portfolio 1: Library Management System



\## Entity Relationship Diagram



```mermaid

erDiagram

&#x20;   BORROWER ||--o{ LOAN : borrows

&#x20;   BOOK ||--o{ LOAN : appears\_in

&#x20;   STAFF ||--o{ LOAN : processes

&#x20;   LOAN ||--o{ FINE\_PAYMENT : receives



&#x20;   BORROWER {

&#x20;       INT BorrowerID PK

&#x20;       VARCHAR FirstName

&#x20;       VARCHAR LastName

&#x20;       VARCHAR Email UK

&#x20;       VARCHAR PhoneNumber

&#x20;       VARCHAR Address

&#x20;       DATE RegistrationDate

&#x20;   }



&#x20;   BOOK {

&#x20;       INT BookID PK

&#x20;       VARCHAR Title

&#x20;       VARCHAR Author

&#x20;       VARCHAR ISBN

&#x20;       VARCHAR Publisher

&#x20;       INT PublicationYear

&#x20;       VARCHAR Category

&#x20;       VARCHAR ShelfLocation

&#x20;       VARCHAR Status

&#x20;   }



&#x20;   STAFF {

&#x20;       INT StaffID PK

&#x20;       VARCHAR FirstName

&#x20;       VARCHAR LastName

&#x20;       VARCHAR Email UK

&#x20;       VARCHAR PhoneNumber

&#x20;       VARCHAR Role

&#x20;       DATE HireDate

&#x20;   }



&#x20;   LOAN {

&#x20;       INT LoanID PK

&#x20;       INT BorrowerID FK

&#x20;       INT BookID FK

&#x20;       INT StaffID FK

&#x20;       DATE LoanDate

&#x20;       DATE DueDate

&#x20;       DATE ReturnDate

&#x20;   }



&#x20;   FINE\_PAYMENT {

&#x20;       INT PaymentID PK

&#x20;       INT LoanID FK

&#x20;       DECIMAL AmountPaid

&#x20;       DATE PaymentDate

&#x20;       VARCHAR PaymentMethod

&#x20;   }



&#x20;   FINE\_RATE {

&#x20;       INT FineRateID PK

&#x20;       DECIMAL DailyFineRate

&#x20;   }

```



\## Relationships



1\. One borrower can have many loans.

2\. One physical book can appear in many loans over time.

3\. One staff member can process many loans.

4\. One loan can have multiple fine payments.

5\. FineRate stores the daily fine rate.



\## Key



\- PK = Primary Key

\- FK = Foreign Key

\- UK = Unique Key



\## Design decisions



\- LoanID uniquely identifies each loan transaction.

\- FinePayment is separate to preserve payment history.

\- Loan status is derived from ReturnDate and DueDate.

\- Fine amount is calculated using overdue days and the daily fine rate.

\- FineRate stores the daily fine rate.



