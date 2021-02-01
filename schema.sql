-- create table departments 
DROP TABLE IF EXISTS departments CASCADE;
CREATE TABLE departments
(
	dept_no VARCHAR(4) PRIMARY KEY,
	dept_name VARCHAR(20) NOT NULL
);

-- create table titles
DROP TABLE IF EXISTS titles CASCADE;
CREATE TABLE titles
(
    title_id VARCHAR(5) PRIMARY KEY,
    title VARCHAR(20) NOT NULL
);

-- create table employees
DROP TABLE IF EXISTS employees CASCADE;
CREATE TABLE employees (
	emp_no INTEGER PRIMARY KEY,
	emp_title VARCHAR(5),
	birth_date DATE NOT NULL,
	first_name VARCHAR(20) NOT NULL,
	last_name VARCHAR(20) NOT NULL,
	sex VARCHAR(1) NOT NULL,
	hire_date DATE NOT NULL,
	CONSTRAINT fk_title
		FOREIGN KEY(emp_title)
		REFERENCES titles(title_id)
		ON DELETE SET NULL
);

-- create table dept_emp
DROP TABLE IF EXISTS dept_emp;
CREATE TABLE dept_emp (
    emp_no INTEGER NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
    CONSTRAINT fk_department
		FOREIGN KEY(dept_no)
		REFERENCES departments(dept_no)
		ON DELETE CASCADE,
	CONSTRAINT fk_employee
		FOREIGN KEY(emp_no)
		REFERENCES employees(emp_no)
		ON DELETE CASCADE
);

-- create table dept_manager
DROP TABLE IF EXISTS dept_manager;
CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INTEGER NOT NULL,
    CONSTRAINT fk_department
		FOREIGN KEY(dept_no)
		REFERENCES departments(dept_no)
		ON DELETE CASCADE,
	CONSTRAINT fk_employee
		FOREIGN KEY(emp_no)
		REFERENCES employees(emp_no)
		ON DELETE CASCADE
);

-- create table salaries
DROP TABLE IF EXISTS salaries;
CREATE TABLE salaries (
	emp_no INTEGER NOT NULL,
	salary INTEGER NOT NULL,
	CONSTRAINT fk_employee
		FOREIGN KEY(emp_no)
		REFERENCES employees(emp_no)
		ON DELETE CASCADE
);