--IS NULL CONDITION
--Arama yapilan field’da NULL degeri almis kayitlari getirir.
CREATE TABLE insanlar
(
ssn char(9),
isim varchar(50), 
adres varchar(50)
);
INSERT INTO insanlar VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO insanlar VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO insanlar VALUES(345678901, 'Mine Bulut', 'Izmir'); 
INSERT INTO insanlar (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar (ssn, adres) VALUES(567890123, 'Denizli');
SELECT *
FROM insanlar
WHERE isim IS NULL;
UPDATE insanlar
SET isim = 'Isim Girilmemis' 
WHERE isim IS NULL;
SELECT *
FROM insanlar
WHERE isim IS NOT NULL;


--ORDER BY CLAUSE
CREATE TABLE insanlar1
(
ssn char(9),
isim varchar(50),
soyisim varchar(50), adres
varchar(50)
);
--ORDER BY komutu belli bir field’a gore NATURAL ORDER olarak siralama
--yapmak icin kullanilir
--ORDER BY komutu sadece SELECT komutu Ile kullanilir

INSERT INTO insanlar1 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar1 VALUES(234567890, 'Veli','Cem', 'Ankara'); 
INSERT INTO insanlar1 VALUES(345678901, 'Mine','Bulut', 'Ankara'); 
INSERT INTO insanlar1 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar1 VALUES (344678901, 'Mine','Yasa', 'Ankara'); 
INSERT INTO insanlar1 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

--Insanlar tablosundaki datalari adres’e gore siralayin 
SELECT *
FROM insanlar
ORDER BY adres;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT *
FROM insanlar1 
WHERE isim='Mine' 
ORDER BY ssn;

--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin 
SELECT *
FROM insanlar1 
WHERE soyisim='Bulut' 
ORDER BY 2

--ORDER BY field_name DESC CLAUSE
--Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT *
FROM insanlar1
ORDER BY ssn DESC;

--Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT *
FROM insanlar1
ORDER BY isim ASC, soyisim DESC;


--ORDER BY field_name DESC CLAUSE
--İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
SELECT isim, soyisim
FROM insanlar1
ORDER BY LENGTH (soyisim)DESC;

--Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayın
SELECT CONCAT (isim, ' ' , soyisim) AS isim_soyisim
FROM insanlar1
ORDER BY LENGTH(isim)+LENGTH(soyisim);

--GROUP BY CLAUSE
CREATE TABLE manav
(
isim varchar(50), 
Urun_adi varchar(50), 
Urun_miktar int
);
--Group By komutu sonuçları bir veya daha fazla sütuna göre gruplamak için SELECT 
--komutuyla birlikte kullanılır
INSERT INTO manav VALUES( 'Ali', 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 'Elma', 2); 
INSERT INTO manav VALUES( 'Hasan', 'Uzum', 4); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Ayse', 'Elma', 3); 
INSERT INTO manav VALUES( 'Veli', 'Uzum', 5); 
INSERT INTO manav VALUES( 'Ali', 'Armut', 2); 
INSERT INTO manav VALUES( 'Veli', 'Elma', 3); 
INSERT INTO manav VALUES( 'Ayse', 'Uzum', 2);

--1) Isme gore alinan toplam urunleri bulun
SELECT isim,sum(urun_miktar) as toplam_urun_miktari from manav
group by isim
order by toplam_urun_miktari desc

--2) Urun ismine gore urunu alan toplam kisi sayisi
select urun_adi,count(isim) as urunu_alan_kisi_sayisi from manav
group by urun_adi

--3) Alinan kilo miktarina gore musteri sayisi
select urun_miktar,count(isim) as mus_sayisi from manav
group by urun_miktar

CREATE TABLE personel15 
(
id int,
ad varchar(150), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO personel15 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel15 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel15 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel15 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel15 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel15 VALUES(456789012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel15 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1) Isme gore toplam maaslari bulun

select ad,sum(maas) as toplam_maas from personel15
group by ad

--2) sehre gore toplam personel sayisini bulun
select sehir,count(ad) as top_pers_sayisi from personel15
group by sehir

--3) Sirketlere gore maasi 5000 liradan fazla olan personel sayisini bulun
select sirket,count(*) as per_say from personel15
where maas>5000 
group by sirket

--4) Her sirket icin Min ve Max maasi bulun
select sirket,min(maas) as min_maas,max(maas) as max_maas from personel15
group by sirket 


