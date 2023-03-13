# Pewlett-Hackard-Analysis

## Overview
In this analysis we are helping Pewlett Hackard, a large company with several thousand employees. Many are approaching retirement age and the company needs to be ready to fill the vacancies left behind in their wake. The main questions we will be looking at are, who will be retiring in the next few years, and how many positions will Pewlett Hackard need to fill? We will also look to see who and how many folks may be able to mentor new hires. We will build a data base using SQL with 6 CSV’s of varying lengths and then use them to filter, join and manipulate the data in order to find the information we seek.


### Resources

- Software: pgAdmin4(version 6.15)
- Starting Data
    - Departments [Data/Starting_Data/departments.csv](Data/Starting_Data/departments.csv)
    - Department Employees [Data/Starting_Data/dept_emp.csv](Data/Starting_Data/dept_emp.csv)
    - Department Managers [Data/Starting_Data/dept_manager.csv](Data/Starting_Data/dept_manager.csv)
    - Employees [Data/Starting_Data/employees.csv](Data/Starting_Data/employees.csv)
    - Salaries [Data/Starting_Data/salaries.csv](Data/Starting_Data/salaries.csv)
    - Titles [Data/Starting_Data/titles.csv](Data/Starting_Data/titles.csv)


# Results

## Generated Code 

- SQL Code Link [Queries/Employee_Database_challenge.sql](Queries/Employee_Database_challenge.sql)

## Summary of Findings 

#### Major Points from Analysis

1.	Retirement Titles: In this data query we show that 133,776 titles have been held over the years by the folks that are eligible for retirement. 
2.	Unique Titles: This list provides us with 72,458 retirement eligible employees with their most recent job titles. 
3.	Retiring Titles: A list of how many of each title will be retiring. It shows that; 25,916 Senior Engineers; 24,926 Senior Staff; 9,285 Engineers; 7,636 Staff; 3,603 Technique Leaders; 1,090 Assistant Engineers; and 2 Managers. 
4.	Mentorship Eligibility: with so many leaving a mentorship program would be a great thing to have with those leaving and those coming in. Here we show that there are 1,549 retirement eligible folks that could help with this. This is not enough metros for all the new folks we will need to hire, but it’s a great start. 


## Visualizations

### Employee Data Base Diagram  
- [Images/EmployeeDB.png](Images/EmployeeDB.png)

![Images/EmployeeDB.png](Images/EmployeeDB.png)

## CSV Link, Code Images, & Previews

### Retirement Titles
- CSV: [Data/Deliverable_Data/retirement_titles.csv](Data/Deliverable_Data/retirement_titles.csv)
- Image [Images/retirement_titles.png](Images/retirement_titles.png) 

![Images/retirement_titles.png](Images/retirement_titles.png)


### Unique Titles
- CSV: [Data/Deliverable_Data/unique_titles.csv](Data/Deliverable_Data/unique_titles.csv)
- Image [Images/unique_titles.png](Images/unique_titles.png)

![Images/unique_titles.png](Images/unique_titles.png)


### Retiring Titles Count
- CSV: [Data/Deliverable_Data/retiring_titles.csv](Data/Deliverable_Data/retiring_titles.csv) 
- Image [Images/retiring_titles.png](Images/retiring_titles.png)

![Images/retiring_titles.png](Images/retiring_titles.png)

### Mentorship Eligibility  
- CSV: [Data/Deliverable_Data/mentorship_eligibilty.csv](Data/Deliverable_Data/mentorship_eligibilty.csv)
- Image [Images/mentorship_eligibilty.png](Images/mentorship_eligibilty.png)

![Images/mentorship_eligibilty.png](Images/mentorship_eligibilty.png)

