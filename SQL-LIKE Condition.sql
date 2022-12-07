- 								LIKE Condition
/*
	LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
	statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma
	imkani verir.
*/

CREATE TABLE musteriler5  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler5 (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler5 (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler5 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler5 (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler5 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler5 (id, isim, gelir) VALUES (1006, 'ahmet', 82000); 

-- 1) % => 0 veya birden fazla karakter belirtir
-- SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
--like kullaniminda buyuk harf kucuk harf gozetmemek istersek ILIKE kullaniriz
--like yerine sembolleri kullanabiliriz(~~).ILIKE yerine ise(~~*)kullanabiliriz
SELECT * FROM MUSTERILER5  WHERE ISIM iLIKE 'A%' 
SELECT * FROM MUSTERILER5  WHERE ISIM ~~*'A%' 

--SORU : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler5
where isim like '%e'

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler5 where isim like '%er'

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler5 where isim ~~'_atma'

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler5 where isim like '_a%'

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler5 where isim ~~'__s%'

-- LIKE Condition
/*
	3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
	veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
	(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/

CREATE TABLE kelimeler1  (
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler1 VALUES (1001, 'hot', 3);
INSERT INTO kelimeler1 VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler1 VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler1 VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler1 VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler1 VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler1 VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler1 VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler1 VALUES (1009, 'hAt', 3);
--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran
--       QUERY yazin

SELECT * FROM kelimeler1 where kelime ~* 'h[ai]t'

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin
--tum bilgilerini  yazdiran QUERY yazin
SELECT * FROM kelimeler where kelime ~* 'h[a-k]t'

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~* '^[as]'

--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler where kelime ~* '[mf]$'

/*
							LIKE Condition
LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir.
LIKE = ~~
ILIKE = ~~*
NOT LIKE = !~~
NOT ILIKE = !~~*
NOT REGEXP_LIKE = !~*
NOT REGEXP_LIKE = !~
 */


