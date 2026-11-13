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



* \- MySQL Server
* \- MySQL Workbench
* \- SQL
* Mongo DB
* \- GitHub







\# Portfolio 2: Query Processing and Optimisation



\## Overview

This portfolio demonstrates SQL query processing and optimisation using the Library Management System database implemented in MySQL.



The exercise focuses on retrieving useful library information, analysing query execution plans and investigating how indexes can improve database performance.



\## Objectives

\- Write SQL queries using JOIN operations and filtering conditions.

\- Retrieve current loans and overdue loans.

\- Calculate outstanding fines.

\- Analyse query execution plans using EXPLAIN.

\- Create and evaluate indexes for query optimisation.



\## Tools Used

\- MySQL Server

\- MySQL Workbench



\## Files and Folders

\- `test\_data.sql` – Contains additional test data for query testing.

\- `queries.sql` – Contains SQL queries for current loans, overdue loans and outstanding fines, together with EXPLAIN and indexing statements.

\- `performance\_analysis.md` – Documents query performance observations and analysis.

\- `explain\_results/` – Contains screenshots of query results, execution plans and index information.



\## Practical Implementation

Three main queries were implemented:

1\. Current loans – retrieves books that have not yet been returned.

2\. Overdue loans – identifies loans whose due dates have passed and calculates the number of overdue days.

3\. Outstanding fines – calculates the remaining fine balance after recorded payments.



The EXPLAIN command was used to examine query execution plans. A composite index was created on the Loan table using the ReturnDate and DueDate columns to investigate its effect on query processing.



\## Conclusion

This portfolio provided practical experience in SQL query development, execution plan analysis and indexing. It demonstrated how database optimisation techniques can help improve query performance.







\# Portfolio 3: Transactions and Concurrency



\## Overview

This portfolio explores transaction management and concurrency control using the Library Management System database in MySQL.



It demonstrates how database transactions maintain data integrity and how concurrency mechanisms help manage simultaneous database operations.



\## Objectives

\- Understand database transaction processing.

\- Demonstrate COMMIT and ROLLBACK operations.

\- Explore transaction isolation levels.

\- Demonstrate a concurrency issue or control mechanism.

\- Verify transaction behaviour through SQL execution and screenshots.



\## Tools Used

\- MySQL Server

\- MySQL Workbench



\## Files and Folders

\- `transaction\_examples.md` – Contains explanations and SQL examples of transaction operations.

\- `screenshots/` – Contains screenshots and execution evidence from the transaction and concurrency tests.



\## Practical Implementation

The portfolio includes practical transaction demonstrations using MySQL.



COMMIT was used to permanently save changes made within a transaction, while ROLLBACK was used to cancel uncommitted changes.



Transaction isolation and concurrency control were also examined to understand how MySQL manages simultaneous database operations and protects data consistency.



The tests were carried out using transactional database tables, and screenshots were captured to document the results.



\## Conclusion

This portfolio improved my understanding of transaction processing, rollback behaviour, isolation and concurrency control. It demonstrated the importance of transactions in maintaining reliable database operations.





\# Portfolio 4: NoSQL and Advanced Data Models



\## Overview

This portfolio demonstrates the implementation of a NoSQL database using MongoDB for the Library Management System.



Unlike the relational database implemented in MySQL, MongoDB stores information in flexible, JSON-like documents.



\## Objectives

\- Create a MongoDB database and collections.

\- Store borrower and book information as documents.

\- Implement embedded documents and arrays.

\- Execute MongoDB queries using MongoDB Compass.

\- Compare relational and document-oriented database models.



\## Tools Used

\- MongoDB Community Server

\- MongoDB Compass



\## Database Structure

Database name: `LibraryManagement`



Collections:

\- `Borrowers`

\- `Books`



The Borrowers collection contains borrower information and embedded loan details. The Books collection stores book information, including titles, authors, categories and availability status.



\## Practical Implementation

The following MongoDB operations were performed:



1\. Retrieved all borrower documents.

2\. Searched for a specific borrower.

3\. Identified borrowers with overdue loans.

4\. Retrieved borrowers with current loans.

5\. Retrieved books with Available status.



The queries were executed using the Filter feature in MongoDB Compass, and screenshots were captured to provide implementation evidence.



\## Files and Folders

\- `nosql\_model.md` – Explains the MongoDB document model, collections, queries and comparison with relational databases.

\- `screenshots/` – Contains screenshots of the borrower documents, book documents and query results.



\## Conclusion

This portfolio provided practical experience with MongoDB and document-oriented data modelling. It demonstrated the flexibility of NoSQL databases and how embedded documents can represent related information.





\# Portfolio 5: Distributed and Cloud Database Exercise



\## Overview

This portfolio explores cloud database deployment, replication, consistency and distributed database architecture using MongoDB Atlas.



The Library Management System database was deployed to a cloud-hosted MongoDB environment to demonstrate how database services can be accessed beyond a local computer.



\## Objectives

\- Create and configure a MongoDB Atlas cluster.

\- Deploy a cloud-hosted database.

\- Create and populate cloud database collections.

\- Examine replica-set information.

\- Perform a consistency test using majority write concern.

\- Understand sharding and distributed database architecture.



\## Tools Used

\- MongoDB Atlas

\- MongoDB Compass

\- MongoDB Shell



\## Cloud Database Structure

Database name: `LibraryManagementCloud`



Collections:

\- `Borrowers`

\- `Books`



Sample borrower and book documents were added to the cloud database based on the NoSQL implementation from Portfolio 4.



\## Practical Implementation



\### 1. Cloud Database Deployment

A MongoDB Atlas cluster was created and connected to MongoDB Compass. The `LibraryManagementCloud` database was populated with Borrowers and Books collections.



\### 2. Replication and High Availability

The `db.hello()` command was executed to inspect the replica-set configuration.



The output identified three replica-set hosts and showed the current primary member through the `isWritablePrimary` field.



\### 3. Consistency Testing

A test document was inserted into the `ConsistencyTest` collection using majority write concern.



The document was subsequently retrieved successfully using `findOne()`, demonstrating a successful majority-acknowledged write and read-back.



\### 4. Sharding Architecture

A proposed sharding architecture was documented to explain how a larger library database could distribute data across multiple shards.



Sharding was discussed conceptually and was not configured on the deployed cluster.



\## Files and Folders

\- `distributed\_database\_report.md` – Documents cloud deployment, replica-set observations, consistency testing and the proposed sharding architecture.

\- `screenshots/` – Contains screenshots of the cloud database, replica-set information and consistency test.



\## Conclusion

This portfolio provided practical experience with cloud database deployment and distributed database concepts. It demonstrated how MongoDB Atlas supports cloud-hosted database access and replica-set functionality, while introducing the role of consistency and sharding in distributed database systems.



\## AI Use Declaration



AI assistance was used to support database design discussions,

SQL development, explanations of relationships and constraints,

and troubleshooting.



The SQL statements were implemented and tested in MySQL Workbench.

The database results and constraint errors were checked to verify

that the implementation behaved as expected.





