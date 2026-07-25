CREATE DATABASE IF NOT EXISTS EmployeeAnalyticsDashboard;
USE EmployeeAnalyticsDashboard;

-- creating an department table 
CREATE TABLE department(
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50),
manager_id  INT  -- references an employee (added after employees table)
);
DROP TABLE department;


-- creating an employee table
CREATE TABLE employee(
emp_id INT PRIMARY KEY,
name VARCHAR(50) NOT NULL,
email VARCHAR(100),
hire_date DATE,
status ENUM('active', 'resigned', 'terminated') DEFAULT 'active',
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department(dept_id)
); 

-- using foreign key to add manager id to department from employee
ALTER TABLE department
ADD CONSTRAINT fk_manager
FOREIGN KEY (manager_id) REFERENCES employee(emp_id);

-- creating performance review of the employees

CREATE TABLE performance_review(
review_id INT PRIMARY KEY,
emp_ID INT NOT NULL,
review_year INT NOT NULL,
score float,
reviewer VARCHAR(100),
FOREIGN KEY (emp_ID) REFERENCES employee(emp_id)
);


CREATE TABLE salary_history(
record_id INT PRIMARY KEY,
emp_id INT,
salary DECIMAL(10,2) NOT NULL,
effective_date DATE,
reason VARCHAR(1000),
FOREIGN KEY (emp_ID) REFERENCES employee(emp_id)
);

-- inserting data into the tables
INSERT INTO department (dept_name, location, dept_id) VALUES
    ('Engineering',       'Building A', 1 ),
    ('Sales',             'Building B', 2),
    ('Human Resources',   'Building A', 3),
    ('Marketing',         'Building C', 4),
    ('Finance',           'Building B', 5);
    
    

INSERT INTO employee (name, email, dept_id, hire_date, status, emp_id) VALUES
    ('Alice Johnson',   'alice@company.com',   1, '2018-03-15', 'active', 1),
    ('Bob Smith',       'bob@company.com',     2, '2019-07-01', 'active', 2),
    ('Carol White',     'carol@company.com',   2, '2020-01-10', 'active', 3),
    ('David Lee',       'david@company.com',   1, '2017-11-20', 'active', 4),
    ('Eve Martinez',    'eve@company.com',     3, '2021-05-03', 'active', 5),
    ('Frank Brown',     'frank@company.com',   1, '2020-09-14', 'active', 6),
    ('Grace Kim',       'grace@company.com',   4, '2019-02-28', 'active', 7),
    ('Henry Davis',     'henry@company.com',   5, '2018-06-11', 'active', 8),
    ('Irene Clark',     'irene@company.com',   4, '2022-03-07', 'active', 9),
    ('James Wilson',    'james@company.com',   2, '2021-11-15', 'resigned', 10),
    ('Karen Taylor',    'karen@company.com',   3, '2020-08-22', 'active', 11),
    ('Liam Anderson',   'liam@company.com',    1, '2023-01-09', 'active', 12);
    
-- assigning managers 
UPDATE department SET manager_id = 4 WHERE dept_id = 1;
UPDATE department SET manager_id = 2 WHERE dept_id = 2;
UPDATE department SET manager_id = 5 WHERE dept_id = 3;
UPDATE department SET manager_id = 7 WHERE dept_id = 4;
UPDATE department SET manager_id = 8 WHERE dept_id = 5;



-- Performance review (2021 - 2023)
INSERT INTO performance_review (emp_ID, review_year, score, reviewer, review_id) VALUES
    (1, 2021, 4.5, 'David Lee', 1),
    (1, 2022, 4.7, 'David Lee', 2),
    (1, 2023, 4.8, 'David Lee', 3),
    (2, 2021, 3.8, 'Alice Johnson', 4),
    (2, 2022, 4.0, 'Alice Johnson', 5),
    (2, 2023, 3.9, 'Alice Johnson', 6),
    (3, 2021, 4.2, 'Alice Johnson', 7),
    (3, 2022, 4.3, 'Alice Johnson', 8),
    (3, 2023, 4.5, 'Alice Johnson', 9),
    (4, 2021, 4.9, 'External', 10),
    (4, 2022, 4.8, 'External', 11),
    (4, 2023, 5.0, 'External', 12),
    (5, 2022, 3.5, 'Karen Taylor', 13),
    (5, 2023, 3.7, 'Karen Taylor', 14),
    (6, 2021, 3.9, 'David Lee', 15),
    (6, 2022, 4.1, 'David Lee', 16),
    (6, 2023, 4.4, 'David Lee', 17),
    (7, 2021, 4.6, 'External', 18),
    (7, 2022, 4.5, 'External', 19),
    (7, 2023, 4.7, 'External', 20),
    (8, 2021, 4.0, 'External', 21),
    (8, 2022, 4.2, 'External', 22),
    (8, 2023, 4.1, 'External', 23),
    (9, 2023, 3.8, 'Grace Kim', 24),
    (10,2021, 3.5, 'Bob Smith', 25),
    (10,2022, 3.2, 'Bob Smith', 26),
    (11,2022, 4.0, 'Eve Martinez', 27),
    (11,2023, 4.3, 'Eve Martinez', 28),
    (12,2023, 3.6, 'David Lee', 29);
    
-- Salary History
INSERT INTO salary_history (emp_id, salary, effective_date, reason, record_id) VALUES
    -- Alice
    (1,  82000,  '2018-03-15', 'initial', 1),
    (1,  88000,  '2020-01-01', 'annual_raise', 2),
    (1,  95000,  '2022-06-01', 'promotion', 3),
    -- Bob
    (2,  55000,  '2019-07-01', 'initial', 4),
    (2,  58000,  '2021-01-01', 'annual_raise', 5),
    (2,  62000,  '2023-01-01', 'annual_raise', 6),
    -- Carol
    (3,  60000,  '2020-01-10', 'initial', 7),
    (3,  65000,  '2022-01-01', 'annual_raise', 8),
    (3,  68000,  '2023-06-01', 'promotion', 9),
    -- David
    (4,  100000, '2017-11-20', 'initial', 10),
    (4,  108000, '2020-01-01', 'annual_raise', 11),
    (4,  115000, '2023-01-01', 'promotion', 12),
    -- Eve
    (5,  54000,  '2021-05-03', 'initial', 13),
    (5,  58000,  '2023-01-01', 'annual_raise', 14),
    -- Frank
    (6,  78000,  '2020-09-14', 'initial', 15),
    (6,  83000,  '2022-01-01', 'annual_raise',16),
    (6,  88000,  '2023-06-01', 'promotion', 17),
    -- Grace
    (7,  90000,  '2019-02-28', 'initial', 18),
    (7,  98000,  '2021-06-01', 'promotion', 19),
    (7,  105000, '2023-01-01', 'annual_raise', 20),
    -- Henry
    (8,  92000,  '2018-06-11', 'initial', 21),
    (8,  99000,  '2021-01-01', 'annual_raise', 22),
    (8,  107000, '2023-06-01', 'promotion', 23),
    -- Irene
    (9,  61000,  '2022-03-07', 'initial', 24),
    (9,  65000,  '2023-06-01', 'annual_raise', 25),
    -- James (resigned)
    (10, 57000,  '2021-11-15', 'initial', 26),
    -- Karen
    (11, 56000,  '2020-08-22', 'initial', 27),
    (11, 60000,  '2022-01-01', 'annual_raise', 28),
    -- Liam
    (12, 72000,  '2023-01-09', 'initial', 29);
    

    
    -- QUERIES 
    
    -- Average salaries by department
    SELECT d.dept_name as department,ROUND(AVG(salary)) AS average, COUNT(e.emp_id) AS headcount, ROUND(MIN(s.salary)) AS min_salary , ROUND(MAX(s.salary)) AS max_salary
    FROM department as d
    JOIN employee as e
    ON d.dept_id = e.dept_id
    JOIN salary_history as s
    ON e.emp_id = s.emp_id
    WHERE e.status = 'active' AND
    s.effective_date = (
		SELECT MAX(s2.effective_date)
        FROM salary_history s2
        WHERE s2.emp_id = e.emp_id
	)
    GROUP BY d.dept_name
    ORDER BY AVG(salary) DESC;
    
    -- Top performers from each departments (score >= 4.5)
    SELECT e.name AS Name, d.dept_name, p.review_year, p.score
    FROM department as d
    JOIN employee as e
    ON d.dept_id = e.dept_id
    JOIN performance_review as p
    On e.emp_id = p.emp_id
    WHERE score >= 4.5
    ORDER BY p.review_year DESC, p.score DESC;
    
    -- Average performance score per department (2023)
    SELECT d.dept_name as Department ,ROUND(AVG(p.score) , 3) as average_score_2023 , COUNT(p.review_id) as review_count
    FROM department as d
    JOIN employee as e
    ON d.dept_id = e.dept_id
    JOIN performance_review as p
    ON e.emp_id = p.emp_id
    WHERE review_year = 2023
    GROUP BY d.dept_name
    ORDER BY AVG(p.score) DESC;
    
    -- salary growth of an employee (WORK ON THIS AS THIS IS NOT PRODUCING CORRECT OUTPUT)
    
    SELECT e.name AS NAME, d.dept_name, s.reason = 'initial' AS starting_salary, s.reason = 'promotion' AS current_salary
    FROM department as d
    JOIN employee as e
    ON d.dept_id = e.dept_id
    JOIN salary_history as s
    ON e.emp_id = s.emp_id;
    
    -- Turnover rate of employers
    
    SELECT d.dept_name as department , COUNT(e.dept_id) as total_employees, SUM(IF(e.status = 'resigned' OR e.status = 'terminated', 1, 0 )) as departed, ROUND(SUM(IF(e.status = 'resigned' OR 'terminated', 1, 0 ))/ COUNT(e.dept_id) * 100, 2) as turnover_pct
    FROM department as d
    JOIN employee as e
    ON d.dept_id = e.dept_id
    GROUP BY d.dept_name
    ORDER BY turnover_pct DESC;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

	
    










	





    




    


 