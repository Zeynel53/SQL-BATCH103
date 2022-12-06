--ALIASES
CREATE TABLE calisanlars 
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50) );

INSERT INTO calisanlars VALUES(123456789, 'Ali Can', 'Istanbul'); 
INSERT INTO calisanlars VALUES(234567890, 'Veli Cem', 'Ankara'); 
INSERT INTO calisanlars VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlars

--eger iki sutunun verilerini birlestirmek istersek concat sembolu || kullaniriz

select calisan_id as id, calisan_isim||' '||calisan_dogdugu_sehir as calisan_bilgisi from calisanlars
select calisan_id as id, concat(calisan_isim,calisan_dogdugu_sehir) as calisan_bilgisi from calisanlars

create table personel2
(
id char(9),
isim varchar(20),	
soyisim varchar(20),
email varchar(30),
ise_baslama_tarihi date,
is_unvani varchar(30),
maas int
);
insert into personel2 values(123456789,'ALI','CAN','ALICAN@GMAIL.COM','10-APR-10','ISCI',5000);
insert into personel2 values(123456788,'VELI','CEM','VELICEM@GMAIL.COM','10-JAN-12','ISCI',5500);
insert into personel2 values(123456787,'AYSE','GUL','AYSEGUL@GMAIL.COM','01-MAY-14','MUHASEBECI',5000);
insert into personel2 values(123456789,'FATMA','YASA','FATMAYASA@GMAIL.COM','10-APR-09','MUHENDIS',5000);



--Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
SELECT isim from personel2 where maas<5000 or is_unvani='ISCI' ;
select * from personel2
select is_unvani,maas from personel2 where soyisim='CAN' OR soyisim='CEM' OR soyisim='GUL';
SELECT email,ise_baslama_tarihi from personel2 where maas>5000;
select * from personel2 where maas>5000 or maas<7000;

