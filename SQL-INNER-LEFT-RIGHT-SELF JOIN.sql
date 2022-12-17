/*JOINS
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

--INNER JOINS
CREATE TABLE sirketler 
(
sirket_id int, 
sirket_isim varchar(20)
);
CREATE TABLE siparisler 
(
siparis_id int, 
sirket_id int, 
siparis_tarihi date
);
INSERT INTO sirketler VALUES(100, 'Toyota'); 
INSERT INTO sirketler VALUES(101, 'Honda'); 
INSERT INTO sirketler VALUES(102, 'Ford'); 
INSERT INTO sirketler VALUES(103, 'Hyundai');

INSERT INTO siparisler VALUES(11, 101,'17-Apr-2020');
INSERT INTO siparisler VALUES(22, 102,'18-Apr-2020');
INSERT INTO siparisler VALUES(33, 103,'19-Apr-2020');
INSERT INTO siparisler VALUES(44, 104,'20-Apr-2020');
INSERT INTO siparisler VALUES(55, 105,'21-Apr-2020');

--SORU) Iki Tabloda sirket_id’si ayni olanlarin sirket_ismi, siparis_id ve
--siparis_tarihleri ile yeni bir tablo olusturun
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler inner join siparisler
on sirketler.sirket_id=siparisler.sirket_id

/*NOT :
1) Select’ten sonra tabloda gormek istediginiz sutunlari yazarken Tablo_adi.field_adi seklinde yazin
2) From’dan sonra tablo ismi yazarken 1.Tablo ismi + INNER JOIN + 2.Tablo ismi yazmaliyiz
3) Join’i hangi kurala gore yapacaginizi belirtmelisiniz. Bunun icin ON+ kuralimiz yazilmalI
*/
--LEFT JOIN
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler LEFT JOIN siparisler
on sirketler.sirket_id=siparisler.sirket_id

--RIGHT JOIN
/*NOT :
1)Right Join’de ikinci tablodaki tum record’lar gosterilir.
2)Ikinci tablodaki datalara 1.tablodan gelen ek datalar varsa bu ek datalar ortak datalar icin gosterilir
ancak ortak olmayan datalar icin o kisimlar bos kalir
*/
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler RIGHT JOIN siparisler
on sirketler.sirket_id=siparisler.sirket_id

--FULL JOINS
/*NOT :
1) FULL Join’de iki tabloda var olan tum record’lar gosterilir.
2) Bir tabloda olup otekinde olmayan data’lar bos kalir
*/
SELECT sirketler.sirket_isim,siparisler.siparis_id,siparisler.siparis_tarihi
from sirketler FULL JOIN siparisler
on sirketler.sirket_id=siparisler.sirket_id

--SELF JOINS
CREATE TABLE personel12 
(
id int,
isim varchar(20), 
title varchar(60), 
yonetici_id int
);
INSERT INTO personel12 VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel12 VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel12 VALUES(3, 'Ayse Gul', 'QA Lead', 4); 
INSERT INTO personel12 VALUES(4, 'Fatma Can', 'CEO', 5);
SELECT * FROM PERSONEL12

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
SELECT P1.ISIM AS PERSONEL_ISIM,P2.ISIM AS YONETICI_ISMI
FROM PERSONEL12 P1 INNER JOIN PERSONEL12 P2
ON P1.YONETICI_ID=P2.ID


