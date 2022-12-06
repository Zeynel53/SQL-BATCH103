/*
SUBQUERIES
AGGREGATE METOT KULLANIMI
- Aggregate Metotlari (SUM,COUNT, MIN, MAX, AVG) Subquery içinde 
kullanilabilir.
Ancak, Sorgu tek bir değer döndürüyor olmalidir.
SYNTAX: sum() şeklinde olmalı sum ile () arasında boşluk olmamalı
*/
CREATE TABLE calisanlar22 
(
id int, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
isyeri VARCHAR(20)
);
CREATE TABLE markalar22
(
marka_id int, 
marka_isim VARCHAR(20), 
calisan_sayisi int
);
INSERT INTO markalar22 VALUES(100, 'Vakko', 12000);
INSERT INTO markalar22 VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar22 VALUES(102, 'Adidas', 10000);
INSERT INTO markalar22 VALUES(103, 'LCWaikiki', 21000);

INSERT INTO calisanlar22 VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar22 VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar22 VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar22 VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
INSERT INTO calisanlar22 VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar22 VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar22 VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');

SELECT AVG(MAAS) FROM CALISANLAR22
SELECT ROUND(AVG(MAAS),2) FROM CALISANLAR22
SELECT SUM(maas) from CALiSANLAR22
select count(maas) from calisanlar22
select count(maas) as maas_sayisi from calisanlar22

-- Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
select marka_id,marka_isim,
(select count(sehir) as sehir_sayisi from calisanlar22 where marka_isim=isyeri) 
from markalar22;

2

-- Çalisan sayisi 15.000’den cok olan markalarin isimlerini ve
 --bu markada calisanlarin isimlerini ve maaşlarini listeleyin.
select isim,maas,isyeri from calisanlar22
where isyeri in(select marka_isim from markalar22 where calisan_sayisi>15000);
-- marka_id’si 101’den büyük olan marka çalişanlarinin 
--isim, maaş ve şehirlerini listeleyiniz.
select isim,maas,sehir from calisanlar22
where isyeri in(select marka_isim from markalar22 where marka_id>101);

-- Ankara’da calisani olan markalarin marka id'lerini ve
--calisan sayilarini liste
select marka_id,calisan_sayisi from markalar22
where marka_isim in(select isyeri  from calisanlar22 where sehir='Ankara')

-- Her markanin ismini, calisan sayisini ve
--o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,
(select min(maas) from calisanlar22 where isyeri=marka_isim)  from markalar22

--in ile exist arasinadki fark 1)in deki fieldlar farkli idi head lari
--2)exist te ise fildlarin headlari ayni
CREATE TABLE mart
(
urun_id int,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
CREATE TABLE nisan 
(
urun_id int ,
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO mart VALUES (10, 'Mark', 'Honda');
INSERT INTO mart VALUES (20, 'John', 'Toyota');
INSERT INTO mart VALUES (30, 'Amy', 'Ford');
INSERT INTO mart VALUES (20, 'Mark', 'Toyota');
INSERT INTO mart VALUES (10, 'Adam', 'Honda');
INSERT INTO mart VALUES (40, 'John', 'Hyundai');
INSERT INTO mart VALUES (20, 'Eddie', 'Toyota');

INSERT INTO nisan VALUES (10, 'Hasan', 'Honda');
INSERT INTO nisan VALUES (10, 'Kemal', 'Honda');
INSERT INTO nisan VALUES (20, 'Ayse', 'Toyota');
INSERT INTO nisan VALUES (50, 'Yasar', 'Volvo');
INSERT INTO nisan VALUES (20, 'Mine', 'Toyota');

--MART VE NİSAN aylarında aynı URUN_ID ile satılan ürünlerin
--URUN_ID’lerini listeleyen ve aynı zamanda bu ürünleri MART ayında alan
--MUSTERI_ISIM 'lerini listeleyen bir sorgu yazınız. 
select urun_id,musteri_isim from mart
where exists (select urun_id from nisan where mart.urun_id=nisan.urun_id);
--Her iki ayda birden satılan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where exists(select urun_isim from mart where nisan.urun_isim=mart.urun_isim);

--Her iki ayda ortak satilmayan ürünlerin URUN_ISIM'lerini ve bu ürünleri
--NİSAN ayında satın alan MUSTERI_ISIM'lerini listeleyen bir sorgu yazınız.
select urun_isim,musteri_isim from nisan
where exists(select urun_isim from mart where nisan.musteri_isim=mart.musteri_isim);




