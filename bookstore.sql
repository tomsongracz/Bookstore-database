CREATE TABLE books (
ID INT GENERATED AS IDENTITY PRIMARY KEY,
Title VARCHAR(255),
Author VARCHAR(255),
Genre VARCHAR(100),
Year INT,
Shelf INT, 
Available NUMBER(1) NOT NULL
);

ALTER TABLE books RENAME COLUMN ID TO BOOKID;

CREATE TABLE members (
MEMBERID INT GENERATED AS IDENTITY PRIMARY KEY,
Name VARCHAR(255),
Email VARCHAR(255),
Age INT,
JoinDate DATE
);

CREATE TABLE loans (
LOANID INT GENERATED AS IDENTITY PRIMARY KEY,
BOOKID INT,
MEMBERID INT,
LoanDate DATE,
ReturnDate DATE,
FOREIGN KEY (BOOKID) REFERENCES books(BOOKID),
FOREIGN KEY (MEMBERID) REFERENCES members(MEMBERID)
);

INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Sztuka czytania w myślach', 'Henrik Fexeus', 'Psychologia', 2007, 1, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Przyjaciółka', 'B.A. Paris', 'Thriller', 2020, 1, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Co robić, gdy po raz pierwszy zostajesz managerem', 'Theodor Tyssen', 'Zarządzanie', 2006, 1, 0);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('24 metody motywowania pracowników', 'Anne Bruce', 'Motywacja', 2001, 1, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Polska i świat w XX wieku', 'Witold Pronobis', 'Historia', 1995, 1, 1);

INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Pragmatyczny programista', 'David Thomas, Andrew Hunt', 'Programowanie', 1999, 2, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Sukces firmy', 'Iwona Majewska-Opiełka', 'Biznes', 2005, 2, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Finanse z arkuszem kalkulacyjnym', 'Błażej Podgórski', 'Finanse', NULL, 2, 0);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Management – zarys zarządzania małą firmą', 'Lesław Haber', 'Zarządzanie', 2000, 2, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Zasady zarządzania', 'Andrzej K. Koźmiński, Dariusz Jemielniak, Dominika Latusek-Jurczak', 'Zarządzanie', 2004, 2, 1);

INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Nawyki warte miliony. Jak nauczyć się zachowań przynoszących bogactwo', 'Brian Tracy', 'Rozwój osobisty', 2004, 3, 0);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Antykruchosc. Jak żyć w świecie, którego nie rozumiemy', 'Nassim Nicholas Taleb', 'Ekonomia', 2012, 3, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Czarny Łabędź. Jak nieprzewidziane zdarzenia rządzą naszym życiem', 'Nassim Nicholas Taleb', 'Ekonomia', 2007, 3, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Winning znaczy zwyciężać', 'Jack Welch, Suzy Welch', 'Biznes', 2005, 3, 1);


INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Zwiedzeni przez przypadek. Tajemnicza rola losowości w życiu i rynkowej grze', 'Nassim Nicholas Taleb', 'Ekonomia', 2001, 4, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Bogaty ojciec, biedny ojciec', 'Robert Toru Kiyosaki, Sharon L. Lechter', 'Finanse', 1997, 4, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Pułapki myślenia. O myśleniu szybkim i wolnym', 'Daniel Kahneman', 'Psychologia', 2011, 4, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('4-godzinny tydzień pracy', 'Timothy Ferriss', 'Rozwój osobisty', 2007, 4, 1);
INSERT INTO books (Title, Author, Genre, Year, Shelf, Available) VALUES ('Grosz do grosza. Jak wydawać mądrze i unikać pułapek finansowych', 'Dan Ariely, Jeff Kreisler', 'Psychologia', 2019, 4, 1);

INSERT INTO members (Name, Email, Age, JoinDate) VALUES ('Marek Kowalski', 'marekkowalski@onet.pl', 35, TO_DATE('2023-05-01', 'YYYY-MM-DD'));
INSERT INTO members (Name, Email, Age, JoinDate) VALUES ('Piotr Nowak', 'piotrnowak@wp.pl', 42, TO_DATE('2023-06-15', 'YYYY-MM-DD'));
INSERT INTO members (Name, Email, Age, JoinDate) VALUES('Agnieszka Kot', 'agnieszkakot@wp.pl', 29, TO_DATE('2023-07-10', 'YYYY-MM-DD'));
INSERT INTO members (Name, Email, Age, JoinDate) VALUES('Anna Zając', 'annazajac@onet.pl', 31, TO_DATE('2024-02-11', 'YYYY-MM-DD'));
INSERT INTO members (Name, Email, Age, JoinDate) VALUES('Mieczysław Nowacki', 'mieczyslawnowacki@interia.pl', 57, TO_DATE('2022-01-20', 'YYYY-MM-DD'));
INSERT INTO members (Name, Email, Age, JoinDate) VALUES('Bożena Kowal', 'bozenakowal@o2.pl', 46, TO_DATE('2021-07-30', 'YYYY-MM-DD'));


INSERT INTO loans (BOOKID, MEMBERID, LoanDate, ReturnDate) VALUES (1, 1, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE(null, 'YYYY-MM-DD'));  
INSERT INTO loans (BOOKID, MEMBERID, LoanDate, ReturnDate) VALUES (2, 2, TO_DATE('2023-07-01', 'YYYY-MM-DD'), TO_DATE(null, 'YYYY-MM-DD'));  
INSERT INTO loans (BOOKID, MEMBERID, LoanDate, ReturnDate) VALUES (3, 3, TO_DATE('2023-08-01', 'YYYY-MM-DD'), TO_DATE(null, 'YYYY-MM-DD'));  

/*

Przykładowe funkcjonalności:

1. Lista wypożyczonych książek

SELECT * FROM books WHERE available = 0;

2. Lista dostępnych książek
SELECT * FROM books WHERE available = 1;

3. Historia wypożyczeń danego użytkownika (np. Marka Kowalskiego)

SELECT loans.LoanID, books.Title, loans.LoanDate, loans.ReturnDate
FROM loans
JOIN Members ON loans.memberID = members.memberID
JOIN Books ON loans.bookID = books.bookID
WHERE members.Name = 'Marek Kowalski';

4. Książki aktualnie wypożyczone

SELECT books.Title, members.Name, loans.LoanDate
FROM loans
JOIN books ON loans.bookID = books.bookID
JOIN Members ON loans.MemberID = members.memberID
WHERE loans.ReturnDate IS NULL;

5. Suma wieku wszystkich członków księgarni

SELECT SUM(age) as ilewszyscyrazemmajalat FROM members;

6. Ilość wypożyczeń książek w historii mojej księgarni

SELECT COUNT(loandate) as wypozyczenia FROM loans;

7. Liczba książek w każdym gatunku posortowana malejąco

SELECT Genre, COUNT(Genre) AS iloscksiazek
FROM books
GROUP BY Genre
ORDER BY iloscksiazek DESC;

*/
