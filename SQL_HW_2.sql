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

--drop table employee_salary;

-- 6.��������� ������� employee_salary 40 ��������:
-- � 10 ����� �� 40 �������� �������������� employee_id
insert into employee_salary (employee_id, salary_id)
values (77, 8),
(78, 4),
(79, 1),
(80, 12);


-- 7.������� ������� roles
create table roles 
(id serial primary key,
role_name int not null unique);

select * from roles;

alter table roles
alter column role_name type int using role_name::integer;

-- 10.������� ������� roles_employee
create table roles_employee
(id serial primary key,
employee_id int not null unique,
role_id int not null,
foreign key (employee_id)
	references employees(id),
foreign key (role_id)
	references roles(id)
);

select * from roles_employee;

--drop table roles_employee;

insert into roles_employee (employee_id, role_id)
values (41, 21);
--(32, 12),
--(33, 13),
--(34, 14),
--(35, 15),
--(36, 16),
--(37, 17),
--(38, 18),
--(39, 19),
--(40, 20);
