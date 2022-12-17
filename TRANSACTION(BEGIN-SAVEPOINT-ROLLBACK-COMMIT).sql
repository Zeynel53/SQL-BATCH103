
-- DDL --> ALTER TABLE
drop table personel -- Tabloyu ortadan kaldırmak için kullanılır


CREATE TABLE personel33  (
id int,
isim varchar(50),  sehir varchar(50),  maas int,  
sirket varchar(20),
CONSTRAINT personel33_pk PRIMARY KEY (id)
);
INSERT INTO personel33 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');  
INSERT INTO personel33 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');  
INSERT INTO personel33 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda');  
INSERT INTO personel33 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford');  
INSERT INTO personel33 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');  
INSERT INTO personel33 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford');  
INSERT INTO personel33 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

SELECT * FROM personel
-- 1) ADD default deger ile tabloya bir field ekleme
ALTER TABLE personel33
add zipcode varchar(30)
ALTER TABLE personel33
ADD adres varchar(50) DEFAULT 'Turkiye' -- DEFAULT yazarsak oluşturduğumuz sütüna belirttiğimiz veriyi tüm satırlara girer

select * from personel33

alter table personel33
drop column zipcode

--iki sutun birden silindi
alter table personel33
drop adres,drop sirket

-- 4) RENAME COLUMN sutun adi degistirme
alter table personel33
rename column sehir to il

--RENAME tablonun ismini degistirme
alter table personel33
rename to isci

select * from isci

--TYPE/SET(modify) sutunlarin ozelliklerini degistirme

alter table isci 
alter column il type varchar(30),
alter column maas set not null;
--eger numarik data turune sahip bir sutunun data turune string bir data turu atmak istersek 
--type varchar(30)  using(maas::varchar(30) bu formati kullaniriz
alter column maas 
type varchar(30) using(maas::varchar(30))

--TRANSACTION(BEGIN-SAVEPOINT-ROLLBACK-COMMIT)
--Transaction 
CREATE TABLE ogrenciler2
(
id serial,--serial data turu otomatik olarak 1 den baslayarak sirali olarak sayi atamasi yapar
		--
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real       
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to y;
COMMIT;

select * from ogrenciler2
delete from ogrenciler2


