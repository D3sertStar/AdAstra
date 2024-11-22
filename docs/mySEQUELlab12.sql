-- Ran these successfully on https://sqliteonline.com/#urldb=https://raw.githubusercontent.com/kamrik/IntroText/refs/heads/main/examples/sql/t177.db:

-- Add an assignment with NULL due_date
INSERT INTO assignments (course_id, title, status) 
VALUES ('COMP1238', 'Assignment with no date', 'Not Started');
-- no due date was entered, therefore that field is null

SELECT * FROM assignments
LIMIT 10;

SELECT count(*) FROM courses;
-- total: 35

SELECT min(due_date) FROM assignments;

SELECT *
FROM courses
WHERE course_name LIKE 'Intro%';

SELECT sqlite_version();
-- DB version

SELECT upper('ABCxyz');
-- The UPPER() function converts a string to upper-case.

SELECT length('abcde');
-- count the characters in the string

SELECT 7*5;
-- multiply

SELECT concat('ABC', '-', 'xyz');
-- concatenates with a - as a joiner

SELECT date();

SELECT strftime('%Y', due_date) AS Year, *
FROM assignments
-- result: 25 assignments, the last one is the one I added as the first task today. This seems to order the list by due_date/year
-- SELECT count(*) FROM assignments returns exactly 25

SELECT DISTINCT SUBSTRING(course_id, 1, 4)
FROM courses
-- Unique course prefixes, up to 4 charactes

SELECT DISTINCT SUBSTRING(course_id, 1, 4) AS prefix, count(*)
FROM courses
GROUP BY prefix;
-- 29 COMP

SELECT *
FROM  assignments
WHERE status != 'Completed'
ORDER BY due_date;
-- null due date at top

SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'
	AND course_id LIKE 'COMM%'
    AND due_date < '2024-12-31'
ORDER BY due_date;
-- 2 COMM2000 results




-- Exercise Questions

-- 1 Concatenate Course Name and Semester: Write a query to list all courses, concatenating the course_name and semester fields with a hyphen between them. Like this: "IT Essentials - 2024-3"
SELECT concat(course_name, ' - ', semester)
FROM courses;

-- 2 Find Courses with Labs on Fridays: Write a query to find all courses that have a lab session scheduled on Friday. Include only the course_id, course_name, and lab_time in the result.
SELECT course_id, course_name, lab_time
FROM courses
WHERE lab_time LIKE 'Fri%';

-- 3 Upcoming Assignments: Write a query to list all assignments with a due date after the current date.
SELECT course_id, title, status, due_date
FROM assignments
WHERE due_date > '2024-11-21';

-- 4 Count Assignments by Status: Write a query to count the number of assignments for each status (e.g., "Not Started", "In Progress", "Completed").  Hint: GROUP BY
SELECT DISTINCT status, count(*) 
from assignments
GROUP BY status;
    
-- 5 Longest Course Name: Write a query to find the course with the longest course_name. Use the length() function to compare the lengths. Hint: either use ORDER BY ... DESC or do it in two steps - first find the length, then the course.
SELECT max(length (course_name)), course_name
from courses
ORDER BY length (course_name);

-- 6 Uppercase Course Names: Write a query to return a list of all course names in uppercase. 
SELECT upper(course_name)
from courses
order by course_name

-- 7 Assignments Due in September: Write a query to list the titles of all assignments that are due in September, regardless of year. Use the LIKE operator to filter due_date.
SELECT title, course_id, due_date
FROM assignments
WHERE due_date LIKE '%-09-%';

-- 8 Assignments with Missing Due Dates: Write a query to find all assignments where the due_date is missing. Note, there are no assignments with NULL due_dates initially, but one was added if you ran the INSERT statement in the examples above. Hint: due_date IS NULL
SELECT title, course_id, due_date
FROM assignments
WHERE due_date IS NULL;




>> One screenshot with one query you liked the most, or found the most challenging. Add a comment with your name above the query. >>
