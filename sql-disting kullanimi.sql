-- DISTINCT
-- DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.

CREATE TABLE musteri_urun 
(
urun_id int, 
musteri_isim varchar(50),
urun_isim varchar(50) 
);
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (10, 'Ali', 'Portakal'); 
INSERT INTO musteri_urun VALUES (20, 'Veli', 'Elma'); 
INSERT INTO musteri_urun VALUES (30, 'Ayse', 'Armut'); 
INSERT INTO musteri_urun VALUES (20, 'Ali', 'Elma'); 
INSERT INTO musteri_urun VALUES (10, 'Adem', 'Portakal'); 
INSERT INTO musteri_urun VALUES (40, 'Veli', 'Kaysi'); 
INSERT INTO musteri_urun VALUES (20, 'Elif', 'Elma');

select * from musteri_urun
-- Musteri urun tablosundan urun isimlerini tekrarsız(grup) listeleyiniz
select distinct urun_isim from musteri_urun

--group by cozumu
select urun_isim from musteri_urun
group by urun_isim

-- Tabloda kac farkli meyve vardir ?
select urun_isim, count (urun_isim) as meyve_cesitleri from musteri_urun
group by urun_isim

-- FETCH NEXT (SAYI) ROW ONLY- OFFSET
--1) Tabloyu urun_id ye gore siralayiniz
--2) Sirali tablodan ilk 3 kaydi listeleyin
--3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin

select * from musteri_urun order by urun_id
fetch next 3 row only
--limit cozumu
select * from musteri_urun order by urun_id
limit 3;

--musteri urun tablosundan ilk kaydi listeleyiniz
select * from musteri_urun order by urun_id
limit 1;

--musteri urun tablusandan son uc kaydi listeleyin
select * from musteri_urun order by urun_id desc
limit 3

CREATE TABLE maas 
(
id int, 
musteri_isim varchar(50),
maas int 
);
INSERT INTO maas VALUES (10, 'Ali', 5000); 
INSERT INTO maas VALUES (10, 'Ali', 7500); 
INSERT INTO maas VALUES (20, 'Veli', 10000); 
INSERT INTO maas VALUES (30, 'Ayse', 9000); 
INSERT INTO maas VALUES (20, 'Ali', 6500); 
INSERT INTO maas VALUES (10, 'Adem', 8000); 
INSERT INTO maas VALUES (40, 'Veli', 8500); 
INSERT INTO maas VALUES (20, 'Elif', 5500);

--en yuksek maasi getiriniz
select * from maas order by maas desc limit 1

--en yuksek 2.maasi getiriniz
select * from maas order by maas desc limit 1 offset 1

--OFFSET-->SATIR ATLAMAK ISTEDIGIMIZDE BU KOMUTU KULLANIRIZ
--en yuksek 2.maasi getiriniz
select * from maas order by maas desc
OFFSET 1 ROW
FETCH NEXT 1 ROW ONLY

--MAAS tablosundan en dusuk 4. maasi aliniz
select * from maas order by maas offset 3 limit 1

