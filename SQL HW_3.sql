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
values (1350);
--(2300),
--(2400),
--(2500);


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

--WH-3
--1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employees_name, salary.mountly_salary 
from employee_salary 
join employees on employee_id = employees.id 
join salary on salary_id = salary.id; 

--2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employees_name, salary.mountly_salary 
from employee_salary 
join employees on employee_id = employees.id 
join salary on salary_id = salary.id
where mountly_salary < 2000;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select mountly_salary from 
employee_salary es full join salary s 
on es.salary_id = s.id 
where employee_id is null;

select mountly_salary from
salary s left join employee_salary es 
on s.id = es.salary_id 
where es.employee_id is null;

-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. 
--(ЗП есть, но не понятно кто её получает.)
select mountly_salary from 
employee_salary es full join salary s 
on es.salary_id = s.id 
where employee_id is null and mountly_salary < 2000;

--5. Найти всех работников кому не начислена ЗП.
select employees_name 
from employee_salary es full join employees e
on es.employee_id = e.id
where salary_id is null;

--6. Вывести всех работников с названиями их должности.
select e.employees_name, r.role_name from roles_employee re 
join employees e on re.employee_id = e.id
join roles r on role_id = r.id; 

--7. Вывести имена и должность только Java разработчиков.
select employees_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id
where role_name like '%Java%';

--8. Вывести имена и должность только Python разработчиков.
select employees_name, role_name from roles_employee re
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where role_name like '%Python%';

--9. Вывести имена и должность всех QA инженеров.
select employees_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where role_name like '%QA%';

--10. Вывести имена и должность ручных QA инженеров.
select employees_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where role_name like '%Manual_QA%';

--11. Вывести имена и должность автоматизаторов QA
select employees_name, role_name from roles_employee re 
join employees e on re.employee_id = e.id 
join roles r on re.role_id = r.id 
where role_name like '%Automation_QA%'; 

--12. Вывести имена и зарплаты Junior специалистов
select * from roles_employee re  
join roles r on re.role_id = r.id 
join employee_salary es on re.employee_id = es.employee_id 
join salary s on re.id = s.id 
where role_name like '%Junior%';


