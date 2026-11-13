\# Portfolio 4: NoSQL and Advanced Data Models



\## 1. Introduction



This portfolio demonstrates the implementation of a NoSQL database using MongoDB for the Library Management System case study.



Unlike the relational database implemented in Portfolio 1, MongoDB uses a document-oriented data model. Information is stored in flexible BSON documents organised into collections.



\## 2. Selected NoSQL Database



\*\*Database:\*\* MongoDB Community Server



\*\*Model:\*\* Document-oriented NoSQL database



\*\*Interface:\*\* MongoDB Compass



MongoDB was selected because it supports flexible document structures, embedded data and efficient retrieval of records. These features are useful for representing library borrowers, books and loan histories.



\## 3. Database Design



The MongoDB database is named `LibraryManagement`.



It contains two collections:



\### 3.1 Borrowers Collection



The Borrowers collection stores borrower information and embeds loan records within each borrower document.



Example document:



```json

{

&#x20; "borrowerId": 1,

&#x20; "firstName": "Tunde",

&#x20; "lastName": "Adeyemi",

&#x20; "email": "tunde.adeyemi@example.com",

&#x20; "phoneNumber": "08012345678",

&#x20; "registrationDate": "2026-01-15",

&#x20; "loans": \[

&#x20;   {

&#x20;     "bookTitle": "Database Management Systems",

&#x20;     "loanDate": "2026-11-01",

&#x20;     "dueDate": "2026-11-20",

&#x20;     "returnDate": null,

&#x20;     "status": "OnLoan"

&#x20;   }

&#x20; ]

}

```



The embedded loans array allows loan information to be stored alongside the borrower who made the transaction.



\### 3.2 Books Collection



The Books collection stores information about library books, including their titles, authors, categories, publishers, publication years and availability status.



Three sample book documents were inserted.



\## 4. Implementation and Query Testing



The database and collections were created using MongoDB Compass. Two borrower documents and three book documents were inserted successfully.



The following queries were executed and returned the expected results.



\### Query 1: Retrieve all borrowers



```json

{}

```



Result: Retrieved all borrower documents.



\### Query 2: Find a borrower by first name



```json

{

&#x20; "firstName": "Tunde"

}

```



Result: Retrieved Tunde Adeyemi's document.



\### Query 3: Find borrowers with overdue loans



```json

{

&#x20; "loans.status": "Overdue"

}

```



Result: Retrieved Zainab Yusuf's document.



\### Query 4: Find borrowers with books currently on loan



```json

{

&#x20; "loans.status": "OnLoan"

}

```



Result: Retrieved Tunde Adeyemi's document.



\### Query 5: Find available books



```json

{

&#x20; "status": "Available"

}

```



Result: Retrieved the Introduction to Algorithms book document.



All five queries returned the expected results.



\## 5. Suitability of the Document Model



The document-oriented model is suitable for this library system for several reasons:



\- \*\*Flexible structure:\*\* Different documents can contain different fields where necessary.

\- \*\*Embedded records:\*\* Borrower loan histories can be stored within borrower documents.

\- \*\*Efficient retrieval:\*\* Related borrower and loan information can be retrieved together without requiring a relational JOIN.

\- \*\*Scalability:\*\* MongoDB supports horizontal scaling through sharding when an application grows.

\- \*\*Developer flexibility:\*\* JSON-like documents are convenient for applications that exchange data using JSON.



\## 6. Comparison with the Relational Database



The MySQL implementation stores borrowers, books and loans in separate related tables connected through primary and foreign keys.



The MongoDB implementation uses collections and documents, with loan records embedded inside borrower documents.



This demonstrates two different approaches to modelling the same library management system.



\## 7. Limitations



Despite its flexibility, the document model has some limitations:



\- Embedded loan histories can become large as borrowers make more transactions.

\- Repeated book information across borrower documents may create data duplication.

\- Relationships between documents require additional application logic or queries.

\- Data consistency and validation rules must be designed carefully.



\## 8. Conclusion



The MongoDB implementation successfully demonstrated a document-oriented NoSQL model for the Library Management System.



The database was created, collections were populated with sample records, and five queries were executed successfully.



The exercise demonstrated how NoSQL databases provide an alternative to relational databases, particularly where flexible data structures and embedded records are useful.



\## 9. Tools Used



\- MongoDB Community Server

\- MongoDB Compass

\- JSON/BSON document structure



\## 10. Evidence



Screenshots of the database, collections, inserted documents and query results are included in the screenshots folder.



