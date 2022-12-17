CREATE TABLE companies1
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies1 VALUES(100, 'IBM', 12000);
INSERT INTO companies1 VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies1 VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies1 VALUES(103, 'APPLE', 21000);
SELECT * FROM companies1;

--1. Örnek: companies tablosundan en yüksek ikinci number_of_employees değeri olan 
--company ve number_of_employees değerlerini çağırın.

select company,number_of_employees from companies1 order by number_of_employees desc offset 1 limit 1;


-- //2.yol::subquery kullanarak
select max(number_of_employees) from companies1
where number_of_employees<(select max(number_of_employees) from companies1)

--//1. Örnek: number_of_employees değeri ortalama çalışan sayısından az olan
--number_of_employees değerlerini 16000 olarak UPDATE edin.-
update companies1 set number_of_employees=16000 where number_of_employees <(select avg(number_of_employees) from companies1);

