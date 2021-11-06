
--1) Name
--2) Explain
--3) SQL Code example
--4) Test to verify + Result

--Name: NOT NULL
--Explanation: Column will not have null values.
--Code: 
GO
CREATE TABLE States
(StateID INT IDENTITY PRIMARY KEY NOT NULL,
StateName VARCHAR(50));
GO
--Name: UNIQUE
--Explanation: All values in column will be unique
--Code: See CREATE INDEX
GO
CREATE TABLE Books
(BookID INT IDENTITY PRIMARY KEY, --Primary key is an unique INT. Redundant, but it explains the idea.
BookName VARCHAR(MAX) NOT NULL, 
BookDescription VARCHAR(MAX) DEFAULT 'Banned by the government in at least 150 states',
NoPages INT NULL, 
CHECK(NoPages>=0)); --CHECK Pages can't be negative
GO
--Name: PRIMARY KEY
--Explanation: The purpose is to set a column as primary key, an unique identifier for each object in the table.
--Code: See previous examples

--Name: FOREIGN KEY
--Explanation: Column is primary key in another table. Purpose is to signify this.
--Code: See previous example

--Name: CHECK
--Explanation: Limit column according to some rule. In our example, books can't have negative pages.
--Code: See previous example

--Name: DEFAULT
--Explanation: Sets column to some standard value
--Code:

--Name: CREATE INDEX
--Explanation: Creates an index, that is, a pointer to data used to speed up SELECT and WHERE clauses
--Code:
GO
CREATE UNIQUE INDEX idx_fastbook
on Books (BookName);
DROP INDEX index_name ON Books;
GO
--Name: STORED PROCEDURE
--Explanation: Create procedure 
--Code:
GO --Avoid "Must be only statement in batch
CREATE PROCEDURE getPages AS
SELECT NoPages FROM Books ORDER BY Len();
GO;
--Name: TRANSACTIONS
--Explanation: One unit of communication with the database. Exactly like a try-catch statement in java.
--Code:

--Name: CASCADE UPDATE
--Explanation: Recursively update keys if foreign
--Code:
DROP TABLE Library;
CREATE TABLE Library(
 LibraryID INT IDENTITY(1,1) PRIMARY KEY,
 BookID INT CONSTRAINT fk_bookone
  FOREIGN KEY (BookID)
   REFERENCES Books ON DELETE CASCADE
);
--Name: CASCADE DELETE
--Explanation: Recursively delete keys if foreign
--Code: See Above, but O