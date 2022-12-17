--UNION OPERATOR
--Iki farkli sorgulamanin sonucunu birlestiren islemdir. Secilen Field SAYISI ve DATA TYPE’i ayni olmalidir.

CREATE TABLE personel0
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
)
INSERT INTO personel0 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel0 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel0 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel0 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel0 VALUES(456789012, 'Veli Sahin ', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel0 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO personel0 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');

select * from personel0

-- 1) Maasi 4000’den cok olan isci isimlerini ve 5000 liradan fazla maas alinan sehirleri gosteren sorguyu yaziniz.
select isim,MAAS from personel0 where maas>4000
UNION
select sehir,MAAS from personel0 where maas>5000

--2) Mehmet Ozturk ismindeki kisilerin aldigi maaslari ve Istanbul’daki personelin maaslarini
--bir tabloda gosteren sorgu yaziniz

SELECT isim,maas from personel0 where isim='Mehmet Ozturk'
union
select sehir,maas from personel0 where sehir='Istanbul'

--NOT : 2.sorgunun sonuna ORDER BY komutunu kullanirsaniz tum tabloyu istediginiz 
--siralamaya gore siralar
SELECT isim,maas from personel0 where isim='Mehmet Ozturk'
union
select sehir,maas from personel0 where sehir='Istanbul'
order by maas desc

--3) Sehirlerden odenen ucret 3000’den fazla olanlari ve personelden ucreti 5000’den az
--olanlari bir tabloda maas miktarina gore sirali olarak gosteren sorguyu yaziniz

select sehir as sehir_veya_isim,maas from personel0 where maas>3000 
union
select isim,maas from personel0 where maas<5000
order by maas

--                 UNION OPERATOR
--2 Tablodan Data Birlestirme
--Personel isminde bir tablo olusturun.Icinde id,isim,sehir,maas ve sirket field’lari olsun. 

CREATE TABLE personel9
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel_pk PRIMARY KEY (id)
)
INSERT INTO personel9 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel9 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel9 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel9 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel9 VALUES(456789019, 'Veli Sahin ', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel9 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO personel9 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');

CREATE TABLE personel_bilgi (
id int,
tel char(10) UNIQUE , 
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY 
(id) REFERENCES personel9(id)
);
INSERT INTO personel_bilgi VALUES(123456789, '5302345678' , 5); 
INSERT INTO personel_bilgi VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi VALUES(123456710, '5537488585', 1);

select * from personel9
select * from personel_bilgi

--id’si 12345678 olan personelin Personel tablosundan sehir ve maasini, personel_bilgi 
--tablosundan da tel ve cocuk sayisini yazdirin
select sehir as sehir_veya_tel,maas as maas_veya_cocuksayisi from personel9 where id=123456789
union
select tel,cocuk_sayisi from personel_bilgi where id=123456789

--NOT : Union islemi yaparken
--1)Her 2 QUERY’den elde edeceginiz tablolarin sutun sayilari esit olmali
--2)Alt alta gelecek sutunlarin data type’lari ayni olmali

--UNION ALL OPERATOR
--1) Personel tablosundada maasi 5000’den az olan tum isimleri ve maaslari bulunuz
SELECT sehir,maas 
FROM personel9 
WHERE maas<5000
UNION
SELECT sehir,maas 
FROM personel9
WHERE maas<5000;

--UNION ALL OPERATOR
--1) Tabloda personel maasi 4000’den cok olan tum sehirleri ve maaslari yazdirin
SELECT sehir as sehir_veya_isim,maas from personel9 where maas>4000
union all
select isim,maas from personel9 where maas<5000
--2) Tabloda personel maasi 5000’den az olan tum isimleri ve maaslari yazdirin





