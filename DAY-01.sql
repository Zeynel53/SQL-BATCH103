-- DATABASE(VeriTabani)Olusturma
Create dataBase zeynel;

--DDL - DATA DEFINITION LANG
--CREATE - TABLO OLUSTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
isim varchar(20),
soyisim varchar(25),
not_ort real,--ondalikli sayilar icin kullanilir(double gibi)
kayit_tarih date
);

--VAROLAN TABLODAN YENI BIR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS -- Benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo oluşturmak için
--normal tablo oluştururken ki parantezler yerine AS kullanıp Select komutuyla almak istediğimiz verileri alırız
SELECT isim,soyisim,not_ort FROM ogrenciler2;

--DML - DATA MANIPULATION LANG.
--INSERT (Database'e veri ekleme)

INSERT INTO ogrenciler2 VALUES('1234567','ZEYNEL', 'ACIKMESE',85.5,now());
INSERT INTO ogrenciler2 VALUES('1234567','ZEYNEL', 'ACIKMESE',85.5,'2022-12-11');

--BIR TABLOYA PARCALI VERI EKLEMEK ISTERSEK
INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('ZEYNEL','ACIKMESE')

--DQL - DATA QUERY LANG.
--SELECT
select * FROM ogrenciler2;








