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

--drop table employee_salary;

-- 6.Наполнить таблицу employee_salary 40 строками:
-- в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary (employee_id, salary_id)
values (77, 8),
(78, 4),
(79, 1),
(80, 12);


-- 7.Создать таблицу roles
create table roles 
(id serial primary key,
role_name int not null unique);

select * from roles;

alter table roles
alter column role_name type int using role_name::integer;

-- 10.Создать таблицу roles_employee
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
