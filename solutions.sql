-- Challenge 1 - Who Have Published What At Where?

SELECT authors.au_id "AUTHOR ID", authors.au_lname "LAST NAME", authors.au_fname "FIRST NAME", titles.title "TITLE", publishers.pub_name "PUBLISHER"
FROM titleauthor AS ta
INNER JOIN authors ON ta.au_id = authors.au_id
INNER JOIN titles ON ta.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
ORDER BY ta.title_id ASC;

-- Challenge 2 - Who Have Published How Many At Where?


SELECT authors.au_id "AUTHOR ID", authors.au_lname "LAST NAME", authors.au_fname "FIRST NAME", publishers.pub_name "PUBLISHER", COUNT(titles.title_id) "TITLE COUNT"
FROM titleauthor AS ta
INNER JOIN authors ON ta.au_id = authors.au_id
INNER JOIN titles ON ta.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY ta.au_id, publishers.pub_id
ORDER BY ta.au_id DESC;


-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? Write a query to find out.

-- Requirements:

-- Your output should have the following columns:
-- AUTHOR ID - the ID of the author
-- LAST NAME - author last name
-- FIRST NAME - author first name
-- TOTAL - total number of titles sold from this author
-- Your output should be ordered based on TOTAL from high to low.
-- Only output the top 3 best selling authors.

SELECT authors.au_id "AUTHOR ID", authors.au_lname "LAST NAME", authors.au_fname "FIRST NAME", COUNT(titles.title_id) "TITLE COUNT"
FROM titleauthor AS ta
INNER JOIN authors ON ta.au_id = authors.au_id
INNER JOIN titles ON ta.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY ta.au_id
ORDER BY COUNT(titles.title_id) DESC
LIMIT 3;

-- Challenge 4-- 

SELECT authors.au_id "AUTHOR ID", authors.au_lname "LAST NAME", authors.au_fname "FIRST NAME", COALESCE(COUNT(titles.title_id),0) "TOTAL"
FROM titleauthor AS ta
INNER JOIN authors ON ta.au_id = authors.au_id
INNER JOIN titles ON ta.title_id = titles.title_id
INNER JOIN publishers ON titles.pub_id = publishers.pub_id
GROUP BY ta.au_id
ORDER BY COALESCE(COUNT(titles.title_id),0)  DESC;
