--HAVING CLAUSE
--HAVING, AGGREGATE FUNCTION’lar ile birlikte kullanilan FILTRELEME komutudur.
CREATE TABLE personel4
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20)
);
INSERT INTO personel4 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500,'Honda'); 
INSERT INTO personel4 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel4 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel4 VALUES(456789012, ' Mehmet Ozturk ', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel4 VALUES(567890123, ' Mehmet Ozturk ', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel4 VALUES(456789012, ' Veli Sahin ', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel4 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

--1) Her sirketin MIN maaslarini eger 2000’den buyukse goster
SELECT sirket,min(maas) as min_maas from personel4
group by  sirket
having min(maas)>2000

--2)Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi 
--ve toplam maasi gosteren sorgu yaziniz
SELECT isim, SUM (maas) AS toplam_maas 
FROM personel4
GROUP BY isim
HAVING SUM (maas) >10000;

select * from personel4

--3) Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz
SELECT sehir,count(isim) as top_pers_sayisi
from personel4
group by sehir
having count(isim)>1

--4) Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz
select sehir,max(maas)from personel4
group by sehir
having max(maas)<5000

select * from personel4



