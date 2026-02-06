/*
id	title																	author						year			genre
1	10-Day Green Smoothie Cleanse											JJ Smith					2016			Non Fiction
2	11/22/63: A Novel														Stephen King				2011			Fiction
3	12 Rules for Life: An Antidote to Chaos	Jordan 							B. Peterson					2018			Non Fiction
4	1984 (Signet Classics)													George Orwell				2017			Fiction
5	5,000 Awesome Facts (About Everything!) (National Geographic Kids)		National Geographic Kids	2019			Non Fiction
6	A Dance with Dragons (A Song of Ice and Fire)							George R. R. Martin			2011			Fiction

*/

--Select the title from the books table to view all book titles.
SELECT title 
FROM books;


-- Select title and author from the books table
SELECT title, author
FROM books;


-- Select all fields from the books table
SELECT * 
FROM books;


-- Select unique authors from the books table
SELECT DISTINCT author
FROM books;


-- Select unique authors and genre combinations from the books table
SELECT DISTINCT author, genre
FROM books;


-- Alias author so that it becomes unique_author
SELECT DISTINCT author AS unique_author
FROM books;


-- Your code to create the view:
CREATE VIEW library_authors AS
SELECT DISTINCT author AS unique_author
FROM books;


-- Select all columns from library_authors
SELECT *
FROM library_authors;


-- Select the first 10 genres from books using PostgreSQL
SELECT genre 
FROM books
LIMIT 10;