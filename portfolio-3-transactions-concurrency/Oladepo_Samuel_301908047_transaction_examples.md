\# Portfolio 3: Transactions and Concurrency



\## 1. Introduction



This portfolio demonstrates transaction management and concurrency control in the Library Management System using MySQL. It shows how database transactions can be committed or rolled back to maintain data consistency.



\## 2. Rollback Demonstration



\### Objective



To demonstrate how the ROLLBACK command reverses changes made during an active transaction.



\### Procedure



The Borrower table was used to test transaction rollback.



Autocommit was disabled using:



```sql

SET autocommit = 0;

```



A transaction was started, and a test borrower was inserted:



```sql

START TRANSACTION;



INSERT INTO Borrower

(FirstName, LastName, Email, RegistrationDate)

VALUES

('Test', 'Rollback', 'rollbacktest2@example.com', CURDATE());

```



The inserted borrower was checked using a SELECT statement. The borrower appeared because the transaction had not yet been rolled back.



The transaction was then reversed:



```sql

ROLLBACK;

```



A second SELECT statement was executed to check whether the borrower still existed:



```sql

SELECT \* FROM Borrower

WHERE Email = 'rollbacktest2@example.com';

```



\### Result



The first SELECT displayed the inserted borrower, while the second SELECT returned no matching record after ROLLBACK.



This confirmed that the transaction was successfully reversed.



\### Explanation



ROLLBACK cancels uncommitted changes made within the current transaction. It is useful when an operation fails or when changes need to be reversed before they are permanently saved.



The Borrower table uses the InnoDB storage engine, which supports transaction management.



\### Evidence



Insert a screenshot showing:

\- START TRANSACTION

\- The INSERT statement

\- The first SELECT result

\- ROLLBACK

\- The second SELECT result showing no matching borrower



Screenshot filename: `rollback\_test.png`



