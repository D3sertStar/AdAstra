-- Ran these successfully on https://sqliteonline.com/#urldb=https://raw.githubusercontent.com/kamrik/IntroText/refs/heads/main/examples/sql/t177.db:

-- Pro tip: found out that any additional commands run all together [i.e., must clar previous commands]

SELECT *
FROM courses

SELECT * FROM assignments
LIMIT 10; 

SELECT count(*) FROM courses

SELECT min(due_date) FROM assignments;

SELECT *
from courses
WHERE course_name LIKE 'Intro%';

SELECT *
from assignments
WHERE status != 'completed'
ORDER BY due_date

SELECT course_id, title, status, due_date
FROM assignments
WHERE status != 'Completed'
	and course_id LIKE 'COMM%'
    	and due_date < '2024-12-31'
ORDER BY due_date


-- 1 Assignments for a Specific Course: Write a query to display the title and due_date of assignments for the course COMP1234.
SELECT title, due_date
FROM assignments
WHERE course_id LIKE 'COMP1234'

-- 2 Earliest Assignment Due Date: Write a query to find the earliest assignment due date in the assignments table. Hint: use SELECT min()
SELECT title, min(due_date) FROM assignments;

-- 3 Latest Assignment Due Date: Write a query to find the latest assignment due date in the assignments table.
SELECT title, max(due_date) FROM assignments;

-- 4 Assignments Due on a Specific Date: Write a query to find the title and course_id of assignments due on 2024-10-08.
SELECT title, course_id
FROM assignments
WHERE due_date LIKE '2024-10-08'
    
-- 5 Find All Assignments Due in October: Write a query to display the title and due_date of assignments due in October 2024. Hint: use LIKE '2024-10%'
SELECT title, due_date
FROM assignments
WHERE due_date LIKE '2024-10%'

-- 6 Find the Most Recent Completed Assignment: Write a query to find the most recent due_date of assignments with a status of "Completed".
-- Pro tip: semi-colon does not belong in the middle of a query
SELECT title, max(due_date) 
FROM assignments
WHERE status = 'Completed'


*Optional tasks*

-- 1 Count of "Not Started" Assignments: Write a query to find the total number of assignments with a status of "Not Started". Remember to use single quotes for strings in SQL.
SELECT count(*)
from assignments
WHERE status = 'Not Started'

-- 2 Find Courses with Labs on Tuesday: Write a query to find the course_id and course_name of courses that have lab sessions on Tuesday. Hint: use LIKE 'Tue%
SELECT course_id, course_name
FROM courses
WHERE lab_time LIKE 'Tue%'

