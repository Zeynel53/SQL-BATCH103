create table qa_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into qa_dersler values (101, 'Core Java', 40);
insert into qa_dersler values (102, 'Selenium', 30);
insert into qa_dersler values (103, 'API', 15);
insert into qa_dersler values (104, 'SQL', 10);
insert into qa_dersler values (105, 'SDLC', 10);
insert into qa_dersler values (106, 'LAMDA', 12);




create table developer_dersler
(
ders_id int,
ders_ismi varchar(30),
ders_saati varchar(30)
);

insert into developer_dersler values (101, 'Core Java', 40);
insert into developer_dersler values (103, 'API', 15);
insert into developer_dersler values (104, 'SQL', 10);
insert into developer_dersler values (105, 'SDLC', 10);
insert into developer_dersler values (106, 'LAMDA', 12);
insert into developer_dersler values (107, 'Spring Framework', 20);
insert into developer_dersler values (108, 'Micro Services', 12);

select * from qa_dersler
--SORU: join kullanarak ortak dersleri sorgulayınız ->INNER JOIN
select A.ders_id,A.ders_ismi,A.ders_saati from qa_dersler A
inner join developer_dersler B
ON A.ders_id=B.ders_id

--INTERSECT COZUMU
SELECT ders_id,ders_ismi,ders_saati from qa_dersler
intersect
SELECT ders_id,ders_ismi,ders_saati from developer_dersler

create table filmler
(film_id int,
film_ismi varchar(30),
kategori varchar(30)
);

insert into filmler values (1, 'Eyvah Eyvah', 'Komedi');
insert into filmler values (2, 'Kurtlar Vadisi', 'Aksiyon');
insert into filmler values (3, 'Eltilerin Savasi', 'Komedi');
insert into filmler values (4, 'Aile Arasinda', 'Komedi');
insert into filmler values (5, 'GORA', 'Bilim Kurgu');
insert into filmler values (6, 'Organize Isler', 'Komedi');
insert into filmler values (7, 'Babam ve Oglum', 'Dram');


create table aktorler
(id int,
aktor_ismi varchar(30),
film_id int
);

insert into aktorler values (1, 'Ata Demirer', 1);
insert into aktorler values (2, 'Necati Sasmaz', 2);
insert into aktorler values (3, 'Gupse Ozay', 3);
insert into aktorler values (4, 'Engin Gunaydin', 4);
insert into aktorler values (5, 'Cem Yilmaz', 5);
insert into aktorler values (7, 'Tarik Akan', 8);
insert into aktorler values (8, 'Turkan Soray', 9);

select * from filmler
-- SORU1: Tüm film_ismi'leri, kategori'lerini ve filmlerde oynayan aktor_ismi'leri listeleyiniz.
--essa tablom filmler--left join
select film_ismi,kategori,aktor_ismi  from filmler a
left join aktorler b
on a.film_id=b.film_id
--right join
select film_ismi,kategori,aktor_ismi  from aktorler b
right join  filmler a
on a.film_id=b.film_id

-- SORU2: Tüm aktor_ismi'leri ve 
--bu aktorlerin oynadıgı film_ismi'lerini listeleyiniz.
select aktor_ismi, film_ismi from aktorler a
left join filmler b
on a.film_id=b.film_id

--SORU3: Tüm film_ismi'lerini ve tüm aktor_ismi'lerini listeleyiniz
--Aktoru olmasa bile film, filmi olmasa bile aktor listelenmelidir,

select a.film_id,a.film_ismi,aktor_ismi from filmler a
full join aktorler b
on a.film_id=b.film_id

CREATE TABLE personel
(
id int,
isim varchar(20),
title varchar(60),
yonetici_id int
);

INSERT INTO personel VALUES(1, 'Ali Can', 'SDET', 2);
INSERT INTO personel VALUES(2, 'Veli Cem', 'QA', 3);
INSERT INTO personel VALUES(3, 'Ayse Gul', 'QA Lead', 4);
INSERT INTO personel VALUES(4, 'Fatma Can', 'CEO', 5);

--Her personelin yanina yonetici ismini yazdiran bir tablo olusturun
select P1.isim as personel_isim, P2.isim as mudur_ismi
from personel P1
inner join personel P2
on P1.yonetici_id=P2.id


