CREATE TABLE employees (
	emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR(20) NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);

SELECT employees.emp_no,
    employees.first_name,
    employees.last_name,
    titles.title,
	titles.from_date,
	titles.to_date
INTO retirement_titles
FROM employees 
LEFT JOIN titles 
ON (employees.emp_no = titles.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY employees.emp_no;
SELECT * FROM retirement_titles;

SELECT DISTINCT ON (retirement_titles.emp_no)retirement_titles.emp_no,
       retirement_titles.first_name,
	   retirement_titles.last_name,
	   retirement_titles.title
INTO Unique_Titles
FROM retirement_titles
ORDER BY retirement_titles.emp_no, retirement_titles.to_date DESC;
SELECT * FROM Unique_Titles;

SELECT Unique_Titles.title, COUNT (Unique_Titles.title)
INTO Retiring_Titles
FROM Unique_Titles
GROUP BY Unique_Titles.title
ORDER BY COUNT desc;
SELECT * FROM Retiring_Titles;

-- Deliverable 2