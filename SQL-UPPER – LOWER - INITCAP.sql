/*
UPPER – LOWER - INITCAP
Tablolari yazdirirken buyuk harf, kucuk harf veya ilk harfleri buyuk digerleri
kucuk harf yazdirmak icin kullaniriz
 */
 
 
 CREATE TABLE kelimeler11  (
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler11 VALUES (1001, 'hot', 3);
INSERT INTO kelimeler11 VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler11 VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler11 VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler11 VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler11 VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler11 VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler11 VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler11 VALUES (1009, 'hAt', 3);
 
--KELIMELER TABLOSUNDAKI kelime sutyunundaki verileri once hepsi buyuk harf sonra kucuk harf ve ilk harfleri
 --buyuk harf olacak seklinde yazdiralim 
 
select upper(kelime) as kelime from kelimeler11
select lower(kelime) as kelime from kelimeler11
select upper(isim) as kelime from musteriler5
--initcap istedigimiz sutundaki verilerin ilk harfini yazar  
select initcap(kelime) as kelime from kelimeler11
select initcap(isim) as kelime from musteriler5 
  