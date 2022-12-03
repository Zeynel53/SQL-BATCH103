--CREATE - TABLO OLUSTURMA
CREATE TABLE talebeler
(
id char(5),
ad_soyad varchar(50),
not_ort real,
kayit_tarihi date
);
--VAR OLAN TABLODAN YENI TABLO OLUSTURMAK
CREATE TABLE talebe_ortalamalar
AS SELECT ad_soyad,not_ort
FROM talebeler;

--DML-DATA MANUPULATION LANG.
--INSERT-UPDATE-DELETE
--INSERT INTO komutu, Postgre SQL’de tabloya bir veya birden fazla kayit 
--eklemek icin kullanilir.

--1) Tum Field’lere data eklemek icin
INSERT INTO talebeler VALUES ('12345','ALI CAN',85.60,now());




