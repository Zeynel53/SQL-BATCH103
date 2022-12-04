--Bir Tabloya “Primary Key” Nasil Eklenir
/*
1) Primary Key bir record’u tanimlayan bir field veya birden fazla field’in kombinasyonudur.
2) Primary Key Unique’dir
3) Bir tabloda en fazla bir Primary Key Olabilir
4) Primary Key field’inda hic bir data NULL olamaz
*/

--“id” field’ini “primary key” yapmak icin 2 yol var
--1) Data Type’dan sonra “PRIMARY KEY” yazarak.

CREATE TABLE student2
(
id char(4) primary key,
isim varchar(50) not null,
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);

--primary key olusturmanin 2.yolu
CREATE TABLE student33
(
id char(4),
isim varchar(50),
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date,
constraint ogr primary key (not_ortalamasi)
);
--Bir Tabloya “Primary Key” Nasil Eklenir

CREATE TABLE SEHIRLER
(
ALAN_CODU CHAR(5) PRIMARY KEY,
ISIM VARCHAR(10) NOT NULL,
NUFUS_YERI VARCHAR(20)
);



