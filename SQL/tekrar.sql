create table memurlar
(
id int,
isim varchar(20),
soyisim varchar(25),
maas int,
sicil_notu int
);

insert into memurlar values(1,'Ali','Ozturk',50000,100);
insert into memurlar values(2,'Adem','Tan',40000,90);
insert into memurlar values(3,'Halit','Ozyıldızlı',35000,85);
insert into memurlar values(4,'Hasan','Oz',45000,95);
insert into memurlar values(5,'Recep','Cicek',30000,80);
insert into memurlar values(6,'Harun','Sever',20000,70);
insert into memurlar values(7,'Hatice','Tarkan',25000,75);
insert into memurlar values(8,'Poyraz','Yuzbası',10000,60);
insert into memurlar values(9,'Ayse','Karlı',15000,65);
select * from memurlar;

-- SORU1: memurlar tablosunda id'si 5'den buyuk olan,
-- ilk 2 veriyi listeleyiniz
select * from memurlar where id>5 limit 2;
select * from memurlar where id>5 fetch next 2 row only;

-- SORU2: memurlar tablosunda sicil_notu en yuksek 3 kisinin bilgilerini listeleyiniz
select * from memurlar order by sicil_notu desc limit 3;
select * from memurlar order by sicil_notu desc fetch next 3 row only;

-- SORU3: memurlar tablosunda maas'ı en dusuk 2 kisinin bilgilerini listeleyiniz
select * from memurlar order by maas limit 2;
select * from memurlar order by maas fetch next 2 row only;

-- SORU4: memurlar tablosunda sicil_notu en yuksek 3.4.5. kişilerin bilgilerini listeleyiniz
select * from memurlar order by sicil_notu desc offset 2 limit 3;

-- SORU5: memurlar tablosunda soyisim'i en uzun ilk 2 kisinin bilgilerini listeleyiniz
select * from memurlar order by length(soyisim) desc limit 2;

-- SORU6: memurlar tablosundaki tum verileri siliniz.
delete from memurlar;
truncate table memurlar;

-- NOT: truncate komutu tablonun icindeki tum verileri siler.
-- sartlı silme yapamaz.
select * from memurlar;
/*
=============================================================================
*/

CREATE TABLE calisanlar
(
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
isyeri VARCHAR(20)
);

INSERT INTO calisanlar VALUES('Ali Seker', 'Istanbul', 2500, 'Vakko');
INSERT INTO calisanlar VALUES('Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
INSERT INTO calisanlar VALUES('Veli Yilmaz', 'Ankara', 3000, 'Vakko');
INSERT INTO calisanlar VALUES('Veli Yilmaz', 'Ankara', 7000, 'Adidas');
INSERT INTO calisanlar VALUES('Nisa Can', 'Ankara', 1500, 'Pierre Cardin');
INSERT INTO calisanlar VALUES('Fatma Yasa', 'Bursa', 2500, 'Vakko');


CREATE TABLE markalar
(
marka_id int,
marka_isim VARCHAR(20),
calisan_sayisi int
);

INSERT INTO markalar VALUES(100, 'Vakko', 12000);
INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
INSERT INTO markalar VALUES(102, 'Adidas', 10000);
INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);

select * from calisanlar;

--SORU1 : marka id'si 101'den buyuk olan 'isyeri' lerini,
--calisanlarin 'isim' lerini, 'maas' larini ve 'sehir' lerini listeleyiniz
select isyeri, isim, maas, sehir from calisanlar where isyeri in('Adidas','LCWaikiki');

-- cevabı daha dinamik hale getirelim
select isyeri, isim, maas, sehir from calisanlar
where isyeri in(select marka_isim from markalar where marka_id>101);
('Adidas','LCWaikiki')==> select marka_isim from markalar where marka_id>101;

--SORU2: markalar tablosundaki marka_isim'ini, calisan_sayisi'ni
-- ve o markalara ait toplam maas'ı listeleyiniz
select marka_isim, calisan_sayisi,
(select sum(maas) from calisanlar where marka_isim=isyeri) as toplam_maas
from markalar;
()=> select sum(maas) from calisanlar where marka_isim=isyeri;

-- SORU3: markalar tablosundaki marka_isim'ini, calisan_sayisi'ni
-- ve o markalara ait max ve min maas'ı listeleyiniz
select marka_isim, calisan_sayisi,
(select max(maas) from calisanlar where marka_isim=isyeri) as max_maas,
(select min(maas) from calisanlar where marka_isim=isyeri) as min_maas
from markalar;
()==> select max(maas) from calisanlar where marka_isim=isyeri
()==> select min(maas) from calisanlar where marka_isim=isyeri

create table meslekler(
meslek_id int,
isim varchar(30),
maas int
);

insert into meslekler values (10, 'Avukat', 30000);
insert into meslekler values (20, 'Ogretmen', 25000);
insert into meslekler values (30, 'Doktor', 35000);
insert into meslekler values (40, 'Bankacı', 40000);
insert into meslekler values (50, 'Yazılımcı', 35000);
insert into meslekler values (60, 'Elektrikci', 20000);
insert into meslekler values (70, 'Emlakci', 15000);


create table fakulteler(
isim varchar(25),	
fakulte_id int
);

insert into fakulteler values ('Hukuk Fakultesi',10);
insert into fakulteler values ('Egitim Fakultesi',20);
insert into fakulteler values ('Tip Fakultesi',30);
insert into fakulteler values ('İsletme Fakultesi',40);
insert into fakulteler values ('Muhendislik Fakultesi',50);
insert into fakulteler values ('Orman Fakultesi',80);
insert into fakulteler values ('Su Urunleri Fakultesi',90);

select * from meslekler;

-- SORU1: Tüm meslek isim'lerini, tüm maas'larını
--ve bu mesleklere karsılık gelen fakulte isim'lerini listeleyiniz.
select M.isim as meslek_ismi, maas, F.isim as fakulte_ismi from meslekler as M
left join fakulteler as F
on meslek_id=fakulte_id;
select M.isim as meslek_ismi, maas, F.isim as fakulte_ismi from fakulteler as F
right join meslekler as M
on meslek_id=fakulte_id;

-- SORU2: Tüm fakulte isim'lerini
--ve bu fakultelere karsılık gelen meslek isim'lerini listeleyiniz.
select F.isim as fakulte_isim, M.isim as meslek_isim from fakulteler as F
left join meslekler as M
on meslek_id=fakulte_id

--SORU4: Tüm meslek isim'lerini ve fakulte isim'leri listeleyiniz
select F.isim as fakulte_isim, M.isim as meslek_isim from meslekler as M
right join fakulteler as F
on meslek_id=fakulte_id

--SORU3: meslek_id'si ve fakulte_id'si ortak olan verilerin
-- meslek isim'lerini ve fakulte isim'lerini listeleyiniz
select M.isim as meslek_isim, F.isim as fakulte_isim from fakulteler as F
inner join meslekler as M
on meslek_id=fakulte_id
select M.isim as meslek_isim, F.isim as fakulte_isim from meslekler as M
inner join fakulteler as F
on meslek_id=fakulte_id

--SORU4: Tüm meslek isim'lerini ve fakulte isim'leri listeleyiniz
select M.isim AS meslek_isim, F.isim as fakulte_isim from meslekler M
full join fakulteler F
on meslek_id = fakulte_id;

CREATE TABLE calisanlar2
(
id int PRIMARY KEY,
isim VARCHAR(50),
sehir VARCHAR(50),
maas int,
sirket VARCHAR(20)
);

INSERT INTO calisanlar2 VALUES(123456789, 'Ali Yildiz', 'Istanbul', 5500, 'Tefal');
INSERT INTO calisanlar2 VALUES(234567890, 'Ayse Sahin', 'Istanbul', 4500, 'Karaca');
INSERT INTO calisanlar2 VALUES(345678901, 'Hayriye Tekin', 'Ankara', 3500, 'Samsung');
INSERT INTO calisanlar2 VALUES(456789012, 'Feyza Sanli', 'Izmir', 6000, 'Arcelik');
INSERT INTO calisanlar2 VALUES(567890123, 'Deniz Yildirim', 'Ankara', 7000, 'Beko');
INSERT INTO calisanlar2 VALUES(456715012, 'Melek Metin', 'Ankara', 4500, 'Profilo');

--SORU1: calisanlar tablosundaki sirket sutununun adini firma olarak degistiriniz.
select*from calisanlar2
alter table calisanlar2 rename column sirket to firma;
select*from calisanlar2;

--soru 2: calisanlar2 tablosunun adini isciler olarak degistiriniz
alter table calisanlar2 rename to isciler;

-- SORU3: isciler tablosundaki sehir
--sutununun veri tipini VARCHAR(30) olarak değiştiriniz.
select*from isciler
alter table isciler alter column sehir type VARCHAR(30);
select*from isciler

-- SORU4: isciler tablosuna maas 3000 den kucuk olan degerler veri olarak girilemesin.
--kısıtlama ekleyelim ve kısıtlamaya check_maas ismini verelim
alter table isciler add constraint check_maas check(maas >= 3000);

--SORU5: isciler tablosundaki check_maas kısıtlamasını
--2000den az maas girilemeyecek seklinde guncelleyelim
select*from isciler

--SORU5: isciler tablosundaki check_maas kısıtlamasını
--2000den az maas girilemeyecek seklinde guncelleyelim
alter table isciler drop constraint check_maas,
add constraint check_maas check(maas >= 2000);

--SORU6: isciler tablosunun isim sutununa unique constrainti ekleyin
select*from isciler
alter table isciler add constraint isciler_isim_key unique (isim);

--2.yol
alter table isciler add unique (isim);

--SORU7: isciler tablosundaki unique kısıtlamasını kaldırın
alter table isciler drop constraint isciler_isim_key;

--SORU8: isciler tablosundaki tum verileri silin
delete from isciler;
truncate table isciler;
select*from isciler;

--soru9 : isciler tablosunu silin
drop table isciler;