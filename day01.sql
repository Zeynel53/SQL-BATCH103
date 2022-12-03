--DATABASE (VERI TABANI) OLUSTURMA
CREATE DATABASE ZEYNEL;

--DDL - DATA DEFINITION LANG.
--CREATE - TABLO OLUSTURMA
create table ogrenciler1
(
id char(4),
isim varchar(50),
soyisim varchar(25),
not_ort real,
kayit_tarih date
);
--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_ortalamalar
AS SELECT isim,soyisim,not_ort
FROM ogrenciler;

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS --benzer tablodaki basliklarla ve data tiplari ile yeni bir tablo olusturmak icin
--normal tablo olustururken ki ()yerine as kullanarak SELECT komutuyla almak istedigimiz verileri aliriz
select isim,soyisim,not_ort FROM ogrenciler1;

--DML - DATA MANUPULATION LANG.
--INSERT-UPDATE-DELETE

INSERT INTO ogrenciler1 VALUES ('1234','ZEYNEL','ACIKMESE',85.5,now());
INSERT INTO ogrenciler1 VALUES ('1234','ZEYNEL','ACIKMESE',85.5,'2022-12-01');

--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK
INSERT INTO ogrenciler1 (isim,soyisim) VALUES ('AZRA','ACIKMESE');

--DQG - DATA QUERY LANG.

SELECT * FROM ogrenciler1;



