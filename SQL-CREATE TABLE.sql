--1) Create – Tablo Oluşturma
create table univtalebe
(
tc char(11),
isim_soyisim varchar(50),
not_ort real,
kayit_tarihi date
);

--2) Var olan tablodan yeni tablo olusturmak

create table univ_ortalamalar
as select isim_soyisim,not_ort
from univtalebe;

select * from univtalebe
select * from univ_ortalamalar

--DML – Data Manupulation Language
--Insert-Update-Delete

-- INSERT INTO komutu, Postgre SQL’de tabloya bir veya birden fazla kayit 
--eklemek icin kullanilir.
--Olusturdugumuz ogrenciler tablosuna kayit ekleyelim

--1) Tum Field’lere data eklemek icin
INSERT INTO UNIVTALEBE VALUES (12345678901,'ALI CAN',72.50,NOW());
INSERT INTO UNIVTALEBE VALUES (12345678902,'VELI CAN',82.50,NOW());
INSERT INTO UNIVTALEBE VALUES (12345678903,'ALTAY CAN',92.50,NOW());

--2) Bazi Field’lere data eklemek icin
INSERT INTO UNIVTALEBE (tc,isim_soyisim,not_ort) values (23456789102,'azra acikmese',100);
INSERT INTO univ_ortalamalar (isim_soyisim,not_ort) values ('leyla acikmese',100.0) 



