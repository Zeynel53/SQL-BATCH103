--DISTINCT
--DISTINCT clause, çağrılan terimlerden tekrarlı olanların sadece birincisini alır.
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

--musteri urun tablosundan urun isimlerini tekrarsiz(grup) listeleyiniz
select distinct(urun_isim) from musteri_urun 
--tabloda kac farkli meyve vardir
select urun_isim,count(distinct urun_isim) from musteri_urun
group by urun_isim
--group by cozumu
select urun_isim from musteri_urun
group by urun_isim
--FETCH NEXT (SAYI) ROW ONLY- OFFSET
--1) Tabloyu urun_id ye gore siralayiniz
select urun_id from musteri_urun order by urun_id

--2) Sirali tablodan ilk 3 kaydi listeleyin
select * from musteri_urun order by  urun_id limit 3;

--3) Sirali tablodan 4. kayittan 7.kayida kadar olan kayitlari listeleyin
select * from musteri_urun order by urun_id offset 3 limit 4

--ALTER TABLE STATEMENT
--ALTER TABLE statement tabloda add, Type(modify)/Set, Rename veya drop columns 
--islemleri icin kullanilir.
--ALTER TABLE statement tablolari yeniden isimlendirmek icin de kullanilir.
CREATE TABLE personel18 
(
id int,
isim varchar(50), 
sehir varchar(50), 
maas int, 
sirket varchar(20),
CONSTRAINT personel18_pk PRIMARY KEY (id)
);
INSERT INTO personel18 VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda'); 
INSERT INTO personel18 VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota'); 
INSERT INTO personel18 VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
INSERT INTO personel18 VALUES(456789012, 'Mehmet Ozturk', 'Izmir', 6000, 'Ford'); 
INSERT INTO personel18 VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas'); 
INSERT INTO personel18 VALUES(456715012, 'Veli Sahin', 'Ankara', 4500, 'Ford'); 
INSERT INTO personel18 VALUES(123456710, 'Hatice Sahin', 'Bursa', 4500, 'Honda');

select * from personel18

--1) ADD default deger ile tabloya bir field ekleme
alter table personel18
add ulke_isim varchar(20)
default 'Turkiye'

--2) Tabloya birden fazla field ekleme
alter table personel18
add cinsiyet varchar(50), add yas int;

--3) DROP tablodan sutun silme
alter table personel18
drop column yas

--cinsiyet sutununu siliniz
alter table personel18
drop column cinsiyet

--4) RENAME COLUMN sutun adi degistirme
alter table personel18
rename column sehir to city

alter table personel18
rename column ulke_isim to devlet_adi

--5) RENAME tablonun ismini degistirme
alter table personel18
rename to isciler

select * from isciler

--6) TYPE/SET(modify) sutunlarin ozelliklerini degistirme
alter table isciler 
alter column devlet_adi type varchar(50),
alter column devlet_adi set not null;

alter table isciler
alter column isim type varchar(100),
alter column isim set not null;

--Not: String data türünü numerik bir data türüne 
--dönüştürmek istersek;
alter column maas 
type varchar(30) using(maas::varchar(30))


CREATE TABLE ogrenciler2
(
id serial,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu real 
);
BEGIN;
INSERT INTO ogrenciler2 VALUES(default, 'Ali Can', 'Hasan',75.5);
INSERT INTO ogrenciler2 VALUES(default, 'Merve Gul', 'Ayse',85.3);
savepoint x;
INSERT INTO ogrenciler2 VALUES(default, 'Kemal Yasa', 'Hasan',85.6);
INSERT INTO ogrenciler2 VALUES(default, 'Nesibe Yilmaz', 'Ayse',95.3);
savepoint y;
INSERT INTO ogrenciler2 VALUES(default, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler2 VALUES(default, 'Can Bak', 'Ali', 67.5);
ROLLBACK to x;
COMMIT

delete from ogrenciler2
select * from ogrenciler2



