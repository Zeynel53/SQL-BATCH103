--ON DELETE CASCADE
-- Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE
--silme özelliğini aktif hale getirebiliriz.
--Bunun için FK olan satırın en sonuna ON DELETE CASCADE komutunu yazmak yeterli

CREATE TABLE talebeler
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE notlar( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler(id)
on delete cascade
);
-- on delete cascade sayesinde parent taki silinen bir kayıt ile ilişkili olan tüm 
--child kayıtlarını silebiliriz
-- cascade yoksa önce child temizlenir sonra parent
INSERT INTO talebeler VALUES(123, 'Ali 
Can', 'Hasan',75);
INSERT INTO talebeler VALUES(124, 
'Merve Gul', 'Ayse',85);
INSERT INTO talebeler VALUES(125, 
'Kemal Yasa', 'Hasan',85);
INSERT INTO talebeler VALUES(126, 
'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebeler VALUES(127, 
'Mustafa Bak', 'Can',99);

INSERT INTO notlar VALUES ('123','kimya',75);
INSERT INTO notlar VALUES ('124', 'fizik',65);
INSERT INTO notlar VALUES ('125', 'tarih',90);
INSERT INTO notlar VALUES ('126', 'Matematik',90); 

select * from talebeler
select * from notlar

DELETE from notlar where talebe_id='123';
-- child tablodaki veriyi sildiğimiz zaman sadece child'daki veri 
--silinir. parent taki veri silinmez.
delete from talebeler where id='126';
-- parent tablodaki veriyi sildiğimiz zaman child'daki veride 
--silinir.
--DELETE FROM talebeler; -- Parent tablo ile birlikte child tablo 
--daki verileride siler
--DROP TABLE talebeler CASCADE; -- İlişkili tablolardan parent 
--olan talebeler tablosunu siler

CREATE TABLE talebeler53
(
id CHAR(3) primary key, 
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);
CREATE TABLE notlar53( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar53_fk FOREIGN KEY (talebe_id) 
REFERENCES talebeler53(id)
on delete cascade
);

INSERT INTO talebeler53 VALUES(123, 'Ali 
Can', 'Hasan',75);
INSERT INTO talebeler53 VALUES(124, 
'Merve Gul', 'Ayse',85);
INSERT INTO  talebeler53 VALUES(125, 
'Kemal Yasa', 'Hasan',85);
INSERT INTO  talebeler53 VALUES(126, 
'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO  talebeler53 VALUES(127, 
'Mustafa Bak', 'Can',99);

INSERT INTO notlar53 VALUES ('123','kimya',75);
INSERT INTO notlar53 VALUES ('124', 'fizik',65);
INSERT INTO notlar53 VALUES ('125', 'tarih',90);
INSERT INTO notlar53 VALUES ('126', 'Matematik',90); 







