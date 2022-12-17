

CREATE TABLE personel 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20) );
INSERT INTO personel VALUES(123456789, 'Johnny Walk', 'New Hampshire', 2500, 'IBM');
INSERT INTO personel VALUES(234567891, 'Brian Pitt', 'Florida', 1500, 'LINUX');
INSERT INTO personel VALUES(245678901, 'Eddie Murphy', 'Texas', 3000, 'WELLS FARGO');
INSERT INTO personel VALUES(456789012, 'Teddy Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO personel VALUES(567890124, 'Eddie Murphy', 'Massachuset', 7000, 'MICROSOFT'); 
INSERT INTO personel VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'TD BANK');
INSERT INTO personel VALUES(123456719, 'Adem Stone', 'New Jersey', 2500, 'IBM');
CREATE TABLE isciler
(
id int, 
isim varchar(50),
sehir varchar(50),
maas int,
sirket varchar(20)
);
INSERT INTO isciler VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO isciler VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO isciler VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO isciler VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE'); 
INSERT INTO isciler VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT'); 
INSERT INTO isciler VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO isciler VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM')
select * from personel
--1)Her iki tablodaki ortak id’leri ve personel tablosunda
--bu id’ye sahip isimleri listeleyen query yaziniz

select isim,id from personel
where id in(select id from isciler where personel.id=isciler.id)

--2) Her iki tablodaki ortak id ve isme sahip kayitlari listeleyen query yaziniz
select id,isim from personel
intersect
select id,isim from isciler

--3) Personel tablosunda kac farkli sehirden personel var?

select count(distinct sehir) as sehir_sayisi from personel

--4) Personel tablosunda id’si cift sayi olan personel’in tum bilgilerini 
--listeleyen Query yaziniz
select * from personel where mod(id,2)=0;

--5) Personel tablosunda kac tane kayit oldugunu gosteren query yazin
select count(*) from personel
select count(id) as kayit_sayisi from personel

--6) Isciler tablosunda en yuksek maasi alan kisinin
--tum bilgilerini gosteren query yazin
;
SELECT * FROM ISCILER WHERE MAAS IN(select max(maas) as max_maas from isciler);

--7) Personel tablosunda en dusuk maasi alan kisinin tum bilgilerini gosteren query yazin
SELECT * FROM PERSONEL WHERE MAAS IN(SELECT MIN(MAAS) FROM PERSONEL )--1.YOL
SELECT * FROM PERSONEL ORDER BY MAAS LIMIT 1

--8) Isciler tablosunda ikinci en yuksek maasi maasi gosteren query yazin
SELECT MAAS FROM ISCILER ORDER BY MAAS DESC OFFSET 1 LIMIT 1
--9) PERSONEL tablosunda ikinci en yuksek maasi maasi gosteren query yazin
SELECT MAAS FROM PERSONEL ORDER BY MAAS DESC OFFSET 1 LIMIT 1

--9) Isciler tablosunda ikinci en dusuk maasi alan iscinin tum bilgilerini gosteren query yazin
SELECT * FROM ISCILER ORDER BY MAAS OFFSET 1 LIMIT 1

--10) Isciler tablosunda en yuksek maasi alan iscinin disindaki tum iscilerin, tum bilgilerini
--gosteren query yazin
SELECT *
FROM isciler
WHERE maas<>( SELECT MAX(maas)
FROM isciler) 
ORDER BY maas DESC

