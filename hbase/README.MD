**Lab 9**

**HBase- Basics**

Q1. Consider a university database where the following queries are to be executed:

Query 1: Find all employees and their details based on title

Query 2: Find all employees and their details for a given department id

Query 3: Find all employees and their details for a given department name

Query 4: Find all employees and their details for a given department name and title

Employee details contain id, first name, last name, title, email ids, address, phone numbers. Department details contain full name and abbreviated name.

For each build a HBase data model clearly identifying the rowKey, columnfamilies.

Q2. Create a table in HBase for Query4.

Q3. Insert details of two employees each having varying number of phone numbers.

Q4. Write queries for the following:

1. Display all the data in the table
2. Display all the row keys in the table
3. Does the employee id e2 exist in the table?
4. Find all employees who are Professors
5. Find all the email ids of all employees
6. Find all employees whose department name starts with CS
7. Find all employees whose title has professor in it
8. Find all the email ids and telephone numbers of all employees
9. Get the first two key –value pairs for each row
10. Alter the table to add a new column family course taught
11. Update the email id of any employee
12. Find all the employees with columns greater than address
