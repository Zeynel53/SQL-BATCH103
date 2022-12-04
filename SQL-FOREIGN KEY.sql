/*Tabloya “Foreign Key” Nasil Eklenir ?

 Foreign Key iki tablo arasinda Relation olusturmak icin kullanilir.
 Foreign Key baska bir tablonun Primary Key’ine baglidir.
 Referenced table (baglanilan tablo, Primary Key’in oldugu Tablo) parent table olarak 
adlandirilir. Foreign Key’in oldugu tablo ise child table olarak adlandirilir.
 Bir Tabloda birden fazla Foreign Key olabilir
 Foreign Key NULL degeri alabilir

Note 1: “Parent Table” olmayan bir id’ye sahip datayi “Child Table”’a ekleyemezsiniz
Note 2: Child Table’i silmeden Parent Table’i silemezsiniz. Once “Child Table” silinir, sonra 
“Parent Table” silinir
*/

--Tabloya “Foreign Key” Nasil Eklenir ?
/*
“tedarikciler33” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”, 
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/
CREATE TABLE TEDARIKCI34
(
TEDARIKCI_ID CHAR(5) PRIMARY KEY,
TEDARIKCI_ISMI VARCHAR(30),
ILETISIM_ISIM VARCHAR(30)
);
/*
Tabloya “Foreign Key” Nasil Eklenir ?
Practice 5:
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”
, 
“ise_baslama” field’lari 
olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın.
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”
,
“sokak”
, 
“cadde” ve “sehir”
fieldlari olsun. “adres_id” field‘i ile Foreign Key oluşturun.

*/

create table calisanlar
(
id char(5) primary key,
isim varchar(20) unique,
maas int not null,
ise_baslama date
);

create table adres
(
adres_id char(5),
sokak varchar(20),
cadde varchar(20),
sehir varchar(20),
FOREIGN KEY (adres_id) references calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10010', Mehmet Yılmaz, 5000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); 
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); 
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14');
INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14');

INSERT INTO adres VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adres VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adres VALUES('10002','Ağa Sok', '30.Cad.','Antep');

-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

--DQL --WHERE KULLANIMI

SELECT * FROM CALISANLAR;
SELECT ISIM FROM CALISANLAR;

--CALISANALAR TABLOSUNDAN MAASI 5000 DEN BUYUK OLAN ISIMLERI LISTELEYINIZ
SELECT ISIM,MAAS FROM CALISANLAR WHERE MAAS>5000;

--CALISANALAR TABLOSUNDAN  ISMI VELI HAN OLAN TUM VERILERI LISTELEYINIZ
SELECT *  FROM CALISANLAR WHERE isim='Veli Han';

--CALISANALAR TABLOSUNDAN MAASI 5000 e ESIT OLAN ISIMLERI LISTELEYINIZ
SELECT * FROM CALISANLAR WHERE MAAS=5000;
SELECT ADRESLER FROM ADRESLER WHERE SEHIR='Ankara';

--DML --DELETE KOMUTU
/*
* DELETE FROM tablo_adı; Tablonun tüm içerğini siler.
- Veriyi seçerek silmek için WHERE komutu kullanılır
* DELETE FROM tablo_adı WHERE sutun_adi = veri; 
Tabloda istediğiniz veriyi siler.

*/
DELETE FROM CALISANLAR;--EGER PARENT TABLO BASKA BIR CHILD TABLO ILE ILISKILI ISE ILK ONCE CHILD TABLE SILINMELIDIR
DELETE FROM ADRESLER;
SELECT * FROM ADRESLER

--ADRESLER TABLOSUNDAN SEHIR ANTEP OLANI SILINIZ
DELETE FROM ADRESLER WHERE SEHIR='Antep';

-- id'si 124 olan ogrenciyi siliniz.
-- ismi Kemal Yasa olan satırını siliniz

CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
)
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);

delete from ogrenciler6 where id=124
select * from ogrenciler6
delete from ogrenciler6 where isim='Kemal Yasa'

-- ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
delete from ogrenciler6 where isim='Nesibe Yilmaz' or isim='Mustafa Bak'

-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
-- id 'si 126'dan büyük olan kayıtları silelim.
-- id'si 123, 125 veya 126 olanları silelim.
delete from ogrenciler6 where isim='Ali Can' or id=123
delete from ogrenciler6 where id>126
delete from ogrenciler6 where id=123 or id=125 or id=126


