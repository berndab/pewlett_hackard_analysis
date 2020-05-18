# Pewlett Hackard Analysis

## Project Files

|      Type              |             Name         |             Description                       | 
------------------------ |--------------------------|-----------------------------------------------|
| SQL Database           | PostgreSQL 11            |                                               |
| Program Language       | PostgreSQL 11 SQL        |                                               |
| Database ERD           | EmployeeDB.ERD.png       | Employee Database Entity Relationship Diagram |
| Database Schema Script | EmployeeDB.Schema.sql    | Employee Database Create Script               |
| Database Source Data   | departments.csv          |                                               |
|                        | dept_emp.csv             |                                               |
|                        | dept_manager.csv         |                                               |
|                        | employees.csv            |                                               |
|                        | salaries.csv             |                                               |
|                        | titles.csv               |                                               |
| Retiring Employee Analysis Script| analysis.retiring_employees.queries.sql | Generates datasets of information about retriring employees|
| Retiring Employee Analysis Data Results | analysis.retiring_employees.csv                | set of retiring employees      |
|                                         | analysis.retiring_employees_count_by_title.csv | count of retiring employees by title      |
|                                         | analysis.retiring_employees_titles.csv         | unique list of titles of the retiring employees |
|                                         | analysis.employee_mentorship_candidates.csv    | List of employees eligible for the mentorship program|


## Database Entity Relationship Diagram

<img src="https://github.com/berndab/pewlett_hackard_analysis/blob/master/EmployeeDB.ERD.png" />

The employee database schema was created but the script [Employee.DB.Schema.sql](https://github.com/berndab/pewlett_hackard_analysis/blob/master/EmployeeDB.Schema.sql)

## Required Analysis

The company is currenly facing a significant reduction in employees due to retirement. Analysis queries were developed to analyized data in the employee database to provide manament with the the total number of employees per title who will be retiring. Additional queries were developed to identify employees who are eligible to participate in a mentorship program that will be used to prepare and train current staff to take over the positions that will be vacated by the retiring personel.

The following queries were used to generate information on the retiring employees, [analysis.retiring_employees.queries.sql](https://github.com/berndab/pewlett_hackard_analysis/blob/master/analysis.retiring_employees.queries.sql)

The first query developed generated the data set of retiring employees including their title and salary. Since employees usually have had more that one title, an  inner query that used the row number function was used to retrieve the most recent title for each retriring employee
