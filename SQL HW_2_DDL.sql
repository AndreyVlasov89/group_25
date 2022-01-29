-- 1.Создать таблицу employees
create table employees
(id serial primary key, 
employees_name varchar(50) not null);

select * from employees;

-- 2.Наполнить таблицу employee 70 строками.
INSERT INTO employees(employees_name)
VALUES ('Yansenn'),
	('Calum'),
	('Yanis'),
	('Garik');


-- 3.Создать таблицу salary
create table salary
(id serial primary key,
mountly_salary int not null);

select * from salary;

-- 4.Наполнить таблицу salary 15 строками:
insert into salary (mountly_salary)
values (2200),
(2300),
(2400),
(2500);


-- 5.Создать таблицу employee_salary
create table employee_salary
(id serial primary key,
employee_id int not null unique,
salary_id int not null);

select * from employee_salary;

-- 6.Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (employee_id, salary_id)
values (23, 1),
(35, 8);

-- 7.Создать таблицу roles
create table roles 
(id serial primary key,
role_name int not null unique);

select * from roles;

-- 8.Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30);

-- 9.Наполнить таблицу roles 20 строками:
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


-- 10.Создать таблицу roles_employee
create table roles_employee
(id serial primary key,
employee_id int not null unique,
role_id int not null);

select * from roles_employee;

-- 11.Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (employee_id, role_id)
values (15, 13),
(50, 1),
(51, 12),
(30, 14),
(70, 11);

