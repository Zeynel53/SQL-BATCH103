/*
IN CONDITION
IN Condition birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari
(Condition) tek komutla yazabilme imkani verir
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
OR (veya): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir.
*/

CREATE TABLE musteriler 
(
urun_id int, 
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange'); 
INSERT INTO musteriler VALUES (20, 'John', 'Apple'); 
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm'); 
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple'); 
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange'); 
INSERT INTO musteriler VALUES (40, 'John', 'Apricot'); 
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');

select * from musteriler
--musteriler tablosundan urun ismi orange,apple veya apricot olan tum verileri listeleyiniz

select * from musteriler where urun_isim='Orange' or urun_isim='Apple' or urun_isim='Apricot';
--IN CONDITION
select * from musteriler where urun_isim in ('Orange','Apple','Apricot');

--not in--secilen seyler disarisinda
select * from musteriler where urun_isim not in ('Orange','Apple','Apricot');

--between condition
select * from musteriler where urun_id between 20 and 40
select * from musteriler where urun_id>=20 and urun_id<=40  

--between condition
select * from musteriler where urun_id not between 20 and 40

--Practice 6
-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
-- D ile Y arasındaki personel bilgilerini listeleyiniz
--D ile Y arasında olmayan personel bilgilerini listeleyiniz
-- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz

CREATE table personel53
(
id char(4),
isim varchar(50),
maas int
);
insert into personel53 values('1001', 'Ali Can', 70000);
insert into personel53 values('1002', 'Veli Mert', 85000);
insert into personel53 values('1003', 'Ayşe Tan', 65000);
insert into personel53 values('1004', 'Derya Soylu', 95000);
insert into personel53 values('1005', 'Yavuz Bal', 80000);
insert into personel53 values('1006', 'Sena Beyaz', 100000);

select * from personel53 where id between '1003' and '1005';
select * from personel53 where isim between 'derya' and 'yavuz';
select * from personel53 where isim not between 'derya' and 'yavuz';
select * from personel53 where isim in ('Sena') or maas in ('70000');



