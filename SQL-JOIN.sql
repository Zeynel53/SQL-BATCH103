-- 							JOINS
/*
2 Tablodaki datalari Birlestirmek icin kullanilir.
Su ana kadar gordugumuz Union,Intersect ve Minus sorgu sonuclari icin kullanilir
Tablolar icin ise JOIN kullanilir
5 Cesit Join vardir
1) INNER JOIN iki Tablodaki ortak datalari gosterir
2) LEFT JOIN Ilk datada olan tum recordlari gosterir
3) RIGHT JOIN Ikinci tabloda olan tum recordlari gosterir
4) FULL JOIN Iki tablodaki tum recordlari gosterir
5) SELF JOIN Bir tablonun kendi icinde Join edilmesi ile olusur
*/

CREATE TABLE sirketler  (
sirket_id int,  
sirket_isim varchar(20)
);
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda');
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');


CREATE TABLE siparisler  (
siparis_id int, 
sirket_id int,
siparis_tarihi date
);
INSERT INTO siparisler VALUES(11, 101, '2020-04-17'); 
INSERT INTO siparisler VALUES(22, 102, ' 2020-04-18'); 
INSERT INTO siparisler VALUES(33, 103, ' 2020-04-19'); 
INSERT INTO siparisler VALUES(44, 104, ' 2020-04-20'); 
INSERT INTO siparisler VALUES(55,  105, ' 2020-04-21');

select * from sirketler
select * from siparisler

 --SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler inner join siparisler
on sirketler.sirket_id=siparisler.sirket_id

/*
	NOT :
	1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
	2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
	3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmali
 */
 
--left join

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--       siparis_tarihleri ile yeni bir tablo olusturun
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler left join siparisler
on sirketler.sirket_id=siparisler.sirket_id
 
 /*
	NOT :
	1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
	2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
	ancak ortak olmayan datalar icin o kisimlar bos kalir
 */
 
--RIGHT JOIN
 select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler RIGHT join siparisler
on sirketler.sirket_id=siparisler.sirket_id

--ORNEK
SELECT sirket_id from sirketler
intersect
select sirket_id from siparisler

--FULL JOIN
/*
	NOT :
	1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
	2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/
select sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler full join siparisler
on sirketler.sirket_id=siparisler.sirket_id

--SELF JOIN

CREATE TABLE personel4 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);
INSERT INTO personel4 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel4 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel4 VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel4 VALUES(4, 'Fatma Can', 'CEO', 5);

select * from personel4

-- Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
SELECT p1.isim as personel_isim,p2.isim as yonetici_isim from personel4 
p1 inner join personel4 p2 
on p1.yonetici_id=p2.id



