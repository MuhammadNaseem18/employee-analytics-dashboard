# Employee Analytics Dashboard

A MySQL database project for tracking employee records, performance reviews, salary 
history, and department turnover, with SQL queries for common HR analytics.

## What it does
Models a company's HR data and runs analytical queries to answer questions like:
- What's the average, min, and max salary by department?
- Who are the top performers (score ≥ 4.5) across departments and years?
- What's the average performance score per department for a given year?
- What's the employee turnover rate by department?

## Database schema
- **department** — dept_id, dept_name, location, manager_id
- **employee** — emp_id, name, email, hire_date, status, dept_id
- **performance_review** — review_id, emp_id, review_year, score, reviewer
- **salary_history** — record_id, emp_id, salary, effective_date, reason

Tables are linked with foreign keys: employees belong to departments, and 
performance reviews and salary history are tied to individual employees.

## Sample data
Includes 12 employees across 5 departments (Engineering, Sales, HR, Marketing, 
Finance), with performance reviews from 2021-2023 and full salary history 
including raises and promotions.

## Queries included
- Average salary by department (based on each employee's most recent salary)
- Top performers by department and review year
- Average performance score per department for 2023
- Department turnover rate
- Employee salary growth over time (in progress)

## How to run it
1. Clone the repo
2. Open `Project.sql` in MySQL Workbench (or run it via the MySQL CLI)
3. Execute the script to create the database, tables, and sample data
4. Run the queries at the bottom of the script to see the analytics output

## Status
Work in progress — the salary growth and turnover queries are still being refined.

## Author
Muhammad Hadi Naseem
