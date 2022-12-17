--LIKE Condition
CREATE TABLE musteriler13 
(
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);
INSERT INTO musteriler13 (id, isim, gelir) VALUES (1001, 'Ali', 62000); 
INSERT INTO musteriler13 (id, isim, gelir) VALUES (1002, 'Ayse', 57500); 
INSERT INTO musteriler13 (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler13 (id, isim, gelir) VALUES (1004, 'Fatma', 42000); 
INSERT INTO musteriler13 (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler13 (id, isim, gelir) VALUES (1006, 'ahmet', 54000);

--LIKE condition WHERE ile kullanilarak SELECT, INSERT, UPDATE, veya DELETE
--statement ile calisan wildcards’a(özel sembol) izin verir.. Ve bize pattern matching yapma 
--imkani verir.

--SORU : Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler13 where isim ilike 'A%'

--SORU : Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler13 where isim LIKE '%e'

--SORU : Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
select isim,gelir from musteriler13 where isim like'%er%'

--SORU : Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler13 where isim like '_atma%'

--SORU : Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from  musteriler13 where isim ~~'_a%'

--SORU : Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler13 where isim ~~'__s%'

--SORU : Ucuncu harfi s olan ismi 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler13 where isim ~~'__s_'

--SORU : Ilk harfi F olan en az 4 harfli musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler13 where isim ~~'F___%'

--SORU : Ikinci harfi a,4.harfi m olan musterilerin tum bilgilerini yazdiran QUERY yazin
select * from musteriler13 where isim ~~'_a_m%'

--LIKE Condition
/*3) REGEXP_LIKE =>Daha karmaşık sorgular için herhangi bir kod, metin icerisinde istenilen yazi
veya kod parcasinin aranip bulunmasini saglayan kendine ait soz dizimi olan bir yapidir.
(REGEXP_LIKE) PostgreSQL de ‘’ ~ ‘’ karekteri ile kullanilir
*/
CREATE TABLE kelimeler 
(
id int UNIQUE,
kelime varchar(50) NOT NULL, 
Harf_sayisi int
);
INSERT INTO kelimeler VALUES (1001, 'hot', 3); 
INSERT INTO kelimeler VALUES (1002, 'hat', 3); 
INSERT INTO kelimeler VALUES (1003, 'hit', 3); 
INSERT INTO kelimeler VALUES (1004, 'hbt', 3); 
INSERT INTO kelimeler VALUES (1008, 'hct', 3); 
INSERT INTO kelimeler VALUES (1005, 'adem', 4); 
INSERT INTO kelimeler VALUES (1006, 'selim', 5); 
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);

--SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime~'h[ai]t'

--SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin tum bilgilerini
select * from kelimeler where kelime ~*'h[a-k]t'

--SORU : Icinde m veya i olan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~*'[mi]'

--SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~*'^[as]'

--SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime ~*'[mf]$'

--NOT LIKE Condition
--SORU 1 : ilk harfi h olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like 'h%'

--SORU 2 : a harfi icermeyen kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like '%a%'

--SORU 3 : ikinci ve ucuncu harfi ‘de’ olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime not like '_de%'

--SORU 4 : 2. harfi e,i veya o olmayan kelimelerin tum bilgilerini yazdiran QUERY yazin
select * from kelimeler where kelime !~'[e,i,o]'

/*LIKE Condition
LIKE: Sorgulama yaparken belirli patternleri(KAlıp ifadelerle sorgu) kullanabilmezi sağlar
ILIKE: Sorgulama yaparken büyük/küçük harfe duyarsız olarak eşleştirir.
LIKE = ~~
ILIKE = ~~*
NOT LIKE = !~~
NOT ILIKE = !~~*
NOT REGEXP_LIKE = !~*
*/


