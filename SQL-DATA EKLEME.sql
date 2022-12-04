1) Create Table
/*Practice1:
“tedarikciler” isminde bir tablo olusturun ve “tedarikci_id”, “tedarikci_ismi”, “tedarikci_adres”
ve “ulasim_tarihi” field’lari olsun.
*/

create table toptanci
(
toptanci_id char(4),
toptanci_isim varchar(30),
toptanci_adres varchar(30),
ulasim_tarihi date
);

--2) Var olan tablodan yeni tablo olusturmak
create table toptanci_ziyaret
as select toptanci_isim,ulasim_tarihi
from toptanci

select * from toptanci
select * from toptanci_ziyaret

insert into toptanci values (1012,'aslanhurkus','ucel sanayi',now());
insert into toptanci values (1013,'aslanhurkus1','ucel sanayi1',now());
insert into toptanci values (1014,'aslanhurkus2','ucel sanayi2',now());

insert into toptanci_ziyaret values ('koska',now())
insert into toptanci_ziyaret values ('nuga',now())
insert into toptanci_ziyaret values ('sarelle',now())
insert into toptanci_ziyaret values ('azra','21/07/15')

select toptanci_isim from toptanci

create table teachers
(
kimlikno char(11),
isim varchar(30),
brans varchar(30),
cinsiyet varchar(20)
);

insert into teachers values (12312312320,'ahmet','fizik','erkek');
insert into teachers values (56759762421,'ahmethan');
select * from teachers

--DQL – Data Query Language SELECT KOMUTU
--Tablodaki Tum Field’lari Cagirma
select isim from teachers

