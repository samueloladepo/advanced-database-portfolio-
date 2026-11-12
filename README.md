

\# Advanced Database Portfolio



\## About This Portfolio



This repository contains my database development portfolio.

It demonstrates my understanding of relational database design,

SQL implementation, database constraints, relationships,

normalisation and database testing.



The portfolio contains five database projects, developed

progressively to demonstrate my database knowledge and practical skills.



\---



\# Portfolio 1: Library Management System



\## Project Overview



The Library Management System is designed to help a library

manage its books, borrowers, staff, loans and fine payments.



The database provides a structured way to record book borrowing

activities, monitor loan dates, track returns and calculate

outstanding fines.



\## Database Tables



The project contains six tables:



1\. Borrower - stores borrower information.

2\. Book - stores book and physical copy information.

3\. Staff - stores library staff information.

4\. Loan - records book borrowing transactions.

5\. FinePayment - records payments made against overdue loans.

6\. FineRate - stores the daily fine rate.



\## Relationships



\- One borrower can have many loans.

\- One physical book can appear in many loans over time.

\- One staff member can process many loans.

\- One loan can have multiple fine payments.

\- FineRate is a standalone settings table.



\## Design Decisions



\- LoanID is the primary key of the Loan table because each

&#x20; borrowing transaction needs its own unique identifier.

\- FinePayment is a separate table to preserve payment history

&#x20; and support multiple payments against one loan.

\- Loan status is derived from the return date and due date.

\- Fine amounts are calculated using overdue days and the daily

&#x20; fine rate instead of storing a duplicated fine amount.

\- Foreign keys maintain referential integrity between related tables.



\## Database Constraints Tested



The following constraints were tested:



\- Primary key

\- Foreign key

\- NOT NULL

\- UNIQUE

\- CHECK



Invalid records were deliberately submitted to confirm that

the database rejected them.



\## Sample Fine Calculation



The test data uses a daily fine rate of ₦500.



For LoanID 1:



\- Total fine: ₦17,500

\- Total payments: ₦2,500

\- Outstanding balance: ₦15,000



\## Project Files



| File | Description |

|---|---|

| schema.sql | Database and table creation statements |

| test\_inserts.sql | Valid sample data |

| test\_constraints.sql | Invalid data used for constraint testing |

| ER\_diagram.md | Entity Relationship Diagram |

| screenshots/ | Evidence of database implementation and testing |



\## Technologies Used



\- MySQL Server

\- MySQL Workbench

\- SQL

\- GitHub



\## AI Use Declaration



AI assistance was used to support database design discussions,

SQL development, explanations of relationships and constraints,

and troubleshooting.



The SQL statements were implemented and tested in MySQL Workbench.

The database results and constraint errors were checked to verify

that the implementation behaved as expected.



\---



\## Author's Note



This portfolio is being developed progressively.

Each project will demonstrate practical database design,

implementation, testing and documentation skills.



