CREATE DATABASE Library

  CREATE TABLE Authors (
    Id INT PRIMARY KEY,
    Name NVARCHAR(50) NOT NULL,
    Surname NVARCHAR(50) NOT NULL
);
CREATE TABLE Books (
    Id INT PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL CHECK (LEN(Name) >= 2 AND LEN(Name) <= 100),
    AuthorId INT,
    PageCount INT CHECK (PageCount >= 10),
    FOREIGN KEY (AuthorId) REFERENCES Authors(Id)
);
CREATE VIEW BookAuthorsView AS
SELECT b.Id, b.Name, b.PageCount, CONCAT(a.Name, ' ', a.Surname) AS AuthorFullName
FROM Books b
JOIN Authors a ON b.AuthorId = a.Id;


CREATE VIEW AuthorsInfoView AS
SELECT a.Id, CONCAT(a.Name, ' ', a.Surname) AS FullName, COUNT(b.Id) AS BooksCount, MAX(b.PageCount) AS MaxPageCount
FROM Authors a
LEFT JOIN Books b ON a.Id = b.AuthorId
GROUP BY a.Id, CONCAT(a.Name, ' ', a.Surname);




