--CONSTRAINT
/*
UNIQUE - Bir sütundaki tüm değerlerin BENZERSİZ/TEKRARSIZ yani tek olmasını sağlar. 
NOT NULL - Bir Sütunun NULL içermemesini yani boş olmamasını sağlar.
NOT NULL kısıtlaması için constraint ismi tanımlanmaz. Bu kısıtlama veri türünden 
hemen sonra yerleştirilir 
PRIMARY KEY - Bir sütünün NULL içermemesini ve sütundaki verilerin
BENZERSİZ olmasını sağlar. (NOT NULL ve UNIQUE)
FOREIGN KEY - Başka bir tablodaki Primary Key’i referans göstermek için kullanılır. 
Böylelikle, tablolar arasında ilişki kurulmuş olur.
Check - Bir sütuna yerleştirilebilecek değer aralığını sınırlamak için kullan
*/

--Bir field’in “tekrarsiz” deger almasi nasil saglanir?
--“id” field’ini “tekrarsiz” yapmak icin , id field’inda Data Type’dan sonra “UNIQUE” YAZMAK GEREKIR

CREATE TABLE OGRENCILER11
(
id char(4) unique,
isim varchar(50),
not_ortalamasi real,
adres varchar(100),
kayit_tarihi date
);

select * from ogrenciler11

--Bir field’in “NULL” deger almamasi nasil saglanir?
CREATE TABLE ogrenciler3 
(
id char(4) UNIQUE,
isim varchar(50) NOT NULL, 
not_ortalamasi real, 
adres varchar(100), 
kayit_tarihi date
);
create table personel11
(
id char(6),
isim varchar(20) not null,
soyisim varchar(20),
email varchar(30),
ise_baslama_tarihi date,
maas int
);
insert into personel11  (id,isim,soyisim )values(123456,'azra','acikmese')
select * from personel11

