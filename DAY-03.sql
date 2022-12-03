CREATE TABLE ogrenciler11
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
iNSERT INTO ogrenciler10 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler10 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler10 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler10 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler10 VALUES(127, 'Mustafa Bak', 'Ali', 99);


--ismi mustafa bak ve nesibe yilmaz olan kayitlari silelim

delete from ogrenciler10 where isim='Mustafa Bak' or isim='Nesibe Yilmaz'
select * from ogrenciler10;

delete from ogrenciler10 where veli_isim='Hasan';

-- TRUNCATE --
-- Bir tablodaki tüm verileri geri alamayacağımız şekilde siler. Şartlı silme yapmaz
TRUNCATE TABLE ogrenciler10



CREATE TABLE talebe
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not1
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not1 VALUES ('123','kimya',75);
INSERT INTO not1 VALUES ('124', 'fizik',65);
INSERT INTO not1 VALUES ('125', 'tarih',90);
INSERT INTO not1 VALUES ('126', 'Matematik',90);

SELECT * FROM TALEBE
SELECT * FROM NOT1

DELETE FROM TALEBE WHERE id='126'


CREATE TABLE student
(
id CHAR(3) primary key,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE not13
(
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES student(id)
on delete cascade
);

INSERT INTO student VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO student VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO student VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO student VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO student VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO not13 VALUES ('123','kimya',75);
INSERT INTO not13 VALUES ('124', 'fizik',65);
INSERT INTO not13 VALUES ('125', 'tarih',90);
INSERT INTO not13 VALUES ('126', 'Matematik',90);

select * from student
select * from not13

delete from student where id='124'

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/

--IN CONDITION