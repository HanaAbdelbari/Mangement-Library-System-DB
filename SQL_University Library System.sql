
CREATE DATABASE LibraryManagment;
GO
USE LibraryManagment;
GO
CREATE TABLE [dbo].[Admin] (
    [AD_ID]       INT       NOT NULL,
    [AD_Name]     TEXT      NOT NULL,
    [AD_Passward] CHAR (50) NOT NULL,
    CONSTRAINT [PK_ADMIN] PRIMARY KEY CLUSTERED ([AD_ID] ASC)
);
CREATE TABLE [dbo].[Student] (
    [ST_ID]       INT       NOT NULL,
    
    [ST_Name]     TEXT      NOT NULL,
    [ST_passward] CHAR (50) NOT NULL,
    CONSTRAINT [PK_STUDENT] PRIMARY KEY CLUSTERED ([ST_ID] ASC)
);

CREATE TABLE [dbo].[Author] (
    [Author_ID]  INT  NOT NULL,
    [AuthorName] TEXT NULL,
    CONSTRAINT [PK_AUTHOR] PRIMARY KEY CLUSTERED ([Author_ID] ASC)
);

CREATE TABLE Book (
    BID INT PRIMARY KEY,
    ISBN VARCHAR(20),
    PublisherYear INT,
    BName VARCHAR(100),
    AD_ID INT,
    AuthorID INT,
    FOREIGN KEY (AD_ID) REFERENCES Admin(AD_ID),
    FOREIGN KEY (AuthorID) REFERENCES Author(Author_ID)
);
CREATE TABLE Copy (
    CopyID INT PRIMARY KEY,
    BookID INT,
    FOREIGN KEY (BookID) REFERENCES Book(BID)
);

CREATE TABLE BookAuthors (
    AuthorID INT,
    BookID INT,
    PRIMARY KEY (AuthorID, BookID),
    FOREIGN KEY (AuthorID) REFERENCES Author(Author_ID),
    FOREIGN KEY (BookID) REFERENCES Book(BID)
);

CREATE TABLE Borrowing (
    CopyID INT PRIMARY KEY,
    StudentID INT,
    BorrowDate DATE,
    Return_Date DATE,
    Status VARCHAR(50),
    FOREIGN KEY (CopyID) REFERENCES Copy(CopyID),
    FOREIGN KEY (StudentID) REFERENCES Student(St_ID)
);

CREATE TABLE Browsing_Ad (
    AdminID INT,
    BookID INT,
    PRIMARY KEY (BookID),
    FOREIGN KEY (AdminID) REFERENCES Admin(Ad_ID),
    FOREIGN KEY (BookID) REFERENCES Book(BID)
);
CREATE TABLE Browsing_ST (
    StudentID INT,
    BookID INT,
    PRIMARY KEY (StudentID, BookID),
    FOREIGN KEY (StudentID) REFERENCES Student(St_ID),
    FOREIGN KEY (BookID) REFERENCES Book(BID)
);



CREATE TABLE Edition (
    BookID INT,
    EditionNumber INT,
    PRIMARY KEY (BookID, EditionNumber),
    FOREIGN KEY (BookID) REFERENCES Book(BID)
);






