\# Portfolio 2: Query Processing and Optimisation



\## 1. Introduction



This project focuses on SQL query processing and optimisation using the Library Management System database developed in Portfolio 1.



The objective was to retrieve useful information from multiple related tables, examine query execution plans and apply indexing to improve query processing.



\## 2. Query Implementation



Three SQL queries were developed and tested.



\### Query 1: Current Loans



This query retrieves books that have not been returned. It joins the Loan, Borrower and Book tables to display the borrower's name, book title, loan date and due date.



The condition `ReturnDate IS NULL` identifies active loans.



\### Query 2: Overdue Loans



This query identifies loans that have not been returned and whose due dates have passed.



The `DATEDIFF()` function calculates the number of days each loan is overdue.



\### Query 3: Outstanding Fines



This query calculates the total fine for each loan and subtracts payments already made.



The daily fine rate is retrieved from the FineRate table rather than being hardcoded.



The query uses:

\- LEFT JOIN to include loans without payment records.

\- COALESCE to treat missing payments as zero.

\- SUM to calculate total payments.

\- DATEDIFF to calculate overdue days.

\- GREATEST to prevent negative fine balances.



\## 3. Query Execution Plans



The MySQL EXPLAIN statement was used to examine how the database processes each query.



The execution plans were captured for:

\- Current loans.

\- Overdue loans before indexing.

\- Outstanding fines.

\- Overdue loans after indexing.



The EXPLAIN output was examined using the following columns:



| Column | Description |

|---|---|

| type | Indicates the table access method. |

| possible\_keys | Lists indexes MySQL could consider. |

| key | Shows the index selected by MySQL. |

| rows | Estimates the number of rows examined. |

| Extra | Provides additional execution information. |



\## 4. Indexing and Optimisation



A composite index was created on the Loan table:



`CREATE INDEX idx\_loan\_return\_due ON Loan (ReturnDate, DueDate);`



The index was designed to support the overdue-loan query, which filters records using ReturnDate and DueDate.



The execution plan was examined again after creating the index to determine whether MySQL selected the new index.



\## 5. Performance Comparison



\### Before Indexing



Insert the observations from the original overdue-loan EXPLAIN screenshot:



\- Access type:

\- Possible keys:

\- Selected key:

\- Estimated rows:

\- Extra information:



\### After Indexing



Insert the observations from the EXPLAIN screenshot after creating the index:



\- Access type:

\- Possible keys:

\- Selected key:

\- Estimated rows:

\- Extra information:



\### Analysis



The execution plans were compared to determine whether the new index changed how MySQL accessed the Loan table.



The comparison showed:



\[Write what actually changed based on your screenshots. If MySQL continued using a full table scan, explain that the table was small and the optimiser may have considered a scan more efficient.]



An index does not guarantee faster performance for every query. The MySQL optimiser chooses an execution plan based on the estimated cost of accessing the data.



\## 6. Conclusion



This project demonstrated the use of SQL joins, filtering conditions, aggregate functions and date calculations to retrieve information from a relational database.



The EXPLAIN command provided insight into query execution plans, while indexing demonstrated an important database optimisation technique.



The project improved my understanding of query processing, execution plans and the factors that influence database performance.



\## 7. Evidence



Screenshots of the query results, execution plans and index information are stored in the `explain\_results` folder.

