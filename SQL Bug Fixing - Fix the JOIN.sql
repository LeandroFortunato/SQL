-- Description of the task below the query
----------------------------------------------

SELECT j.job_title, 
       CAST(CAST(sum(j.salary)/count(j.people_id) as numeric(16,2)) AS float) AS average_salary,
       count(j.people_id) AS total_people,
       CAST(CAST(sum(j.salary) as numeric(16,2)) AS float)  AS total_salary

 FROM job j JOIN people p ON j.people_id = p.id 

 GROUP BY j.job_title

 ORDER BY average_salary desc


-----------------------------------------------------------------------------------------------------------------
Task

Timmy works for a statistical analysis company and has been given a task of calculating the highest average salary for a given job, the sample is compiled of 100 applicants each with a job and a salary. Timmy must display each unique job, the total average salary, the total people and the total salary and order by highest average salary. Timmy has some bugs in his query, help Timmy fix his query so he can keep his job!

people table schema
id
name
job table schema
id
people_id
job_title
salary
resultant table schema
job_title (unique)
average_salary (float, 2 dp)
total_people (int)
total_salary (float, 2 dp)



Source: https://www.codewars.com/kata/580fb94e12b34dd1c40001f0