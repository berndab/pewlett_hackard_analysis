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

The company is currently facing a significant reduction in employees due to scheduled retirement. Analysis required was to provide management with the total number of employees retiring, the count of employees retiring by title, and the list of titles of the employees retiring. In addition, the analysis was required to identify employees who would be eligible to participate in a mentorship program that will be used to prepare and train current staff to replace retiring personnel.

## Retiring Employees Analysis Methodology
The following queries were used to generate information on the retiring employees, [analysis.retiring_employees.queries.sql](https://github.com/berndab/pewlett_hackard_analysis/blob/master/analysis.retiring_employees.queries.sql)

The query developed to generated the data set of retiring employees including their title and salary and used the birth date of employees to determine those that would be retiring. Since employees usually have had more than one title, an inner query that used the row number function was used to retrieve the most recent title for each retiring employee. This data set of retiring employees was stored in a table. This table was used to generate by the query using a group by clause that calculated the count of employees retiring by title. The title column of this query result provided the unique list of the titles of the retiring employees.

## Retiring Employees Analysis Results
The analysis shows that number of retiring employees from the company is 90,389. The count of titles of the retiring employees is

| Title               | Count |
|---------------------|-------|
| Manager             | 2     |
| Assistant Engineer  | 1761  |
| Technique Leader    | 4502  |
| Staff               | 12242 |
| Engineer            | 14222 |
| Senior Staff        | 28255 |
| Senior Engineer     | 29414 |

## Limitations and Further Analysis

The analysis does not look at the percentage of the company workforce that is retiring nor does it look at the percentage of each department that had members retiring. For instance, there are only two managers retiring while there are 29,414 senior engineers that will be retiring. Two managers retiring seems like it would have minimum impact on the company or any department while 29,414 senior engineers retiring can have a major impact of at least some departments. Knowing what departments would be most affected by retirement by calculating the percentage of each department’s employees who will retire would give critical information to management.  Management then could prioritize the implementation of the mentoring program for these department first to minimize the effects on company productivity of losing the retiring employees. 

## Mentorship Program Analysis Methodology

The query developed to generate the data set of employee candidates for the mentorship program included employees title and department information and used the birth date of employees to determine those that would be eligible. The from_date for the title table and the department table was set to '9999-01-01' so the query data would include the employee’s current title and department. 

## Mentorship Program Analysis Res

The analysis showed that only 1549 employees were eligible for the mentorship program.

## Limitations and Further Analysis

1549 employees in the mentorship program are not nearly enough since over 90,389 employees are due to retire. The mentorship program eligibility needs to be rethought to include many more remaining employees if the program is going to be successful in replacing the productivity and skills that will be lost to the company due to the retiring employees




