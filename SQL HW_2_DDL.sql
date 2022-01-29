-- 1.������� ������� employees
create table employees
(id serial primary key, 
employees_name varchar(50) not null);

select * from employees;

-- 2.��������� ������� employee 70 ��������.
INSERT INTO employees(employees_name)
VALUES ('Yansenn'),
	('Calum'),
	('Yanis'),
	('Garik');


-- 3.������� ������� salary
create table salary
(id serial primary key,
mountly_salary int not null);

select * from salary;

-- 4.��������� ������� salary 15 ��������:
insert into salary (mountly_salary)
values (2200),
(2300),
(2400),
(2500);


-- 5.������� ������� employee_salary
create table employee_salary
(id serial primary key,
employee_id int not null unique,
salary_id int not null);

select * from employee_salary;

-- 6.��������� ������� employee_salary 40 ��������:
-- � 10 ����� �� 40 �������� �������������� employee_id
insert into employee_salary (employee_id, salary_id)
values (23, 1),
(35, 8);

-- 7.������� ������� roles
create table roles 
(id serial primary key,
role_name int not null unique);

select * from roles;

-- 8.�������� ��� ������ role_name � int �� varchar(30)
alter table roles
alter column role_name type varchar(30);

-- 9.��������� ������� roles 20 ��������:
insert into roles (role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');


-- 10.������� ������� roles_employee
create table roles_employee
(id serial primary key,
employee_id int not null unique,
role_id int not null);

select * from roles_employee;

-- 11.��������� ������� roles_employee 40 ��������:
insert into roles_employee (employee_id, role_id)
values (15, 13),
(50, 1),
(51, 12),
(30, 14),
(70, 11);

