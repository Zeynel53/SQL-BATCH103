--INTERSECT OPERATOR
--1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin

CREATE TABLE personel99
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel99_pk PRIMARY KEY (id)
)
INSERT INTO personel99 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel99 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel99 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel99 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel99 VALUES(456789019, 'Veli Sahin ', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel99 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');
INSERT INTO personel99 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');

CREATE TABLE personel_bilgi1 (
id int,
tel char(10) UNIQUE , 
cocuk_sayisi int,
CONSTRAINT personel_bilgi_fk FOREIGN KEY 
(id) REFERENCES personel99(id)
);
INSERT INTO personel_bilgi1 VALUES(123456789, '5302345678' , 5); 
INSERT INTO personel_bilgi1 VALUES(234567890, '5422345678', 4);
INSERT INTO personel_bilgi1 VALUES(345678901, '5354561245', 3);
INSERT INTO personel_bilgi1 VALUES(456789012, '5411452659', 3);
INSERT INTO personel_bilgi1 VALUES(567890123, '5551253698', 2);
INSERT INTO personel_bilgi1 VALUES(456789012, '5524578574', 2);
INSERT INTO personel_bilgi1 VALUES(123456710, '5537488585', 1);

select * from personel99
select * from personel_bilgi1

--1) Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--2) Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin
SELECT id from personel99 where sehir in('Istanbul','Ankara')
intersect
SELECT id from personel_bilgi1 where cocuk_sayisi in(2,3)

--1) Maasi 4800’den az olanlar veya 5000’den cok olanlarin id’lerini listeleyin
select id from personel99 where maas<4800 or maas>5000
intersect
SELECT id from personel_bilgi1 where cocuk_sayisi in(2,3)

--3) Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin
select isim from personel99 where sirket in ('Honda')
intersect
select isim from personel99 where sirket in ('Ford')
intersect
select isim from personel99 where sirket in ('Tofas')

--EXXCEPT OPERATOR
--1) 5000’den az maas alip Honda’da calismayanlari yazdirin
SELECT ISIM,SIRKET FROM PERSONEL99 WHERE MAAS<5000
EXCEPT
SELECT ISIM,SIRKET FROM PERSONEL99 WHERE SIRKET='Honda'

--2) Ismi Mehmet Ozturk olup Istanbul’da calismayanlarin isimlerini ve sehirlerini listeleyin
select isim,sehir from personel99 where isim='Mehmet Ozturk'
except
select isim,sehir from personel99 where sehir='Istanbul'


