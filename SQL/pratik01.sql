--ogrenciler isminde bir tablo olusturalım
--ogr_id int
--isim varchar(50)
--adres varchar(100)
--sinav_notu int ... 

create table ogrenciler(
    ogr_id int,
    isim varchar(50),
    adres varchar(100),
    sinav_notu int
);

--dml komutları : insert, update, delete
--id:120, isim:Ali Can, adres: Ankara, not:70

insert into ogrenciler values(120,'Ali Can','Ankara',70);
select * from ogrenciler;
INSERT INTO ogrenciler VALUES(121,'Vali Han','Trabzon',75);
INSERT INTO OGRENCILER VALUES(122,'Ayse An','Bursa',85);
insert into OGRENCILER values(123,'Kemal Kan','Istanbul',95);
INSERT INTO ogrenciler VALUES(124,'Tarik Tan','Ankara',90);
insert into ogrenciler values(125,'Cemil Can','Hatay',95);
insert into ogrenciler values(126,'Salih San','Izmir',100);

-- ogrenciler tablosundaki adres sütununu listeleyiniz.

select adres from ogrenciler;

--ogrenciler tablosundaki ogr_id ve isim sütunlarını listeleyiniz.
select ogr_id, isim from ogrenciler;

--ogrenciler tablosundaki notu 85 üzeri olan öğrenci bilgilerinin tamamını listeleyiniz.
select * from ogrenciler where sinav_notu >85;

--ogrenciler tablosundaki adresi Ankara olan öğrencilerin isimlerini listeleyiniz
select ISIM from ogrenciler where adres='Ankara';

--String datalarda buyuk kucuk harf duyarlılıgı vardır
--ogrenciler tablosundaki notu 85 üzeri ve adresi Ankara olan öğrenci isim, adres ve sinav_not'larini listeleyiniz.
select isim, adres, sinav_notu from ogrenciler where sinav_notu>85 and adres='Ankara';

--sinav_notu 95 veya 70 olan üğrencilerin tüm bilgilerini listeleyiniz.
--1.yol
select * from ogrenciler where sinav_notu=95 or sinav_notu=70;

--2.yol -->in
select * from ogrenciler where sinav_notu in(70,95);

--sinav_notu 75 ve 95 arasında olan öğrencilerin isim ve sinav_notlarini listeleyiniz.
--not 75 ve 95 dahil olmasın
--1.yol
select isim, sinav_notu from ogrenciler 
where sinav_notu>75 and sinav_notu<95;

--2.yol -->between kullanımı
select isim, sinav_notu from ogrenciler
where sinav_notu between 76 and 94;--sınırlar dahil

-- id'si 122 ve 125 arasında olmayan öğrencilerin adreslerini listeleyiniz.
--1.yol
select adres from ogrenciler
where ogr_id<122 or ogr_id>125;

--2.yol not between
select adres from ogrenciler
where ogr_id not between 122 and 125; --sınırlar hariç


/*=================================================
ogrenci_info adında bir table oluşturunuz.
ogr_id(PRIMARY KEY), ogr_isim(UNIQUE), ogr_yas(NOT NULL) ve ogr_kayit 
adında sütunlar oluşturunuz.
Sütunlara uygun data tipleri ve belirtilen constraint'leri atayınız.
ogr_yas sütunu sadece 5'ten buyuk degerler alabilsin ve bu kısıtlamanın
adı ogr_yas_check olsun
*/

create table ogrenci_info(
    ogr_id int PRIMARY KEY,
    ogr_isim varchar(50) UNIQUE,
    ogr_yas int NOT NULL,
    ogr_kayit date,
    
    constraint ogr_yas_check CHECK(ogr_yas>5)
);

INSERT INTO ogrenci_info VALUES('101','ALI CAN', 15, '12.06.2007');
INSERT INTO ogrenci_info VALUES(102, 'VELI HAN', '19', '5.08.04');
INSERT INTO ogrenci_info VALUES(103, 'AYSE TAN', 20, '3.11.2006');
INSERT INTO ogrenci_info VALUES(104, 'KEMAL KUZU', 15, null);
INSERT INTO ogrenci_info VALUES('105', 'TOM HANKS', 20, '12-11-2003');
INSERT INTO ogrenci_info VALUES('106', 'ANGELINA JOLIE', 10, '12-6-2013');
INSERT INTO ogrenci_info VALUES('107', 'BRAD PITT', 7, '10-9-2021');

--date data turu de varchar gibi tırnak içinde girilmelidir yoksa hata verir
--int data turu tırnaksız girilir ama tırnak içinde girildiginde hata vermez
select * from ogrenci_info;

--tabloya parcalı veri girişi
--parcalı veri girisi yaparken primary key ve not null kısıtlaması olan sutunlara mutlaka veri girilmelidir

INSERT INTO ogrenci_info(ogr_id, ogr_yas) VALUES(108,17);
INSERT INTO ogrenci_info(ogr_id, ogr_yas, ogr_isim) VALUES(109,6,'JOHN WALKER');

--SORU1: ogr_id değeri 108 olan verinin ogr_isim değerini 
--'LEO OCEAN' olarak güncelleyin.
UPDATE ogrenci_info
SET ogr_isim='LEO OCEAN'
WHERE ogr_id=108;

--SORU2: JOHN WALKER'ın , ogr_kayit sütununu 11-12-1997 değeriyle değiştiriniz.
UPDATE ogrenci_info
SET ogr_kayit='11-12-1997'
WHERE ogr_isim='JOHN WALKER';

--SORU3: 105 id'li verinin ogr_kayit hücresini 11-4-1996 değerine ve 
--ogr_isim hücresini MARK TWAIN değerine güncelle.
UPDATE ogrenci_info
SET ogr_kayit='11-4-1996', ogr_isim='MARK TWAIN'
WHERE ogr_id=105;

--SORU4: id'si 106'dan küçük tüm ogr_kayit değerlerini 01-08-2021'e güncelle.
update ogrenci_info
set ogr_kayit='01-08-2021'
where ogr_id<106;

--SORU5: id'si 105 ten buyuk olan verilerin ogr_yas degerlerini 5 artır
update ogrenci_info
set ogr_yas=ogr_yas+5
where ogr_id>105;

--SORU6: ogr_kayit degeri 01.Aug.2021 olan verilerin ogr_idlerini, 
--yas ile toplayarak guncelleyın
update ogrenci_info
set ogr_id=ogr_id+ogr_yas
where ogr_kayit='01.Aug.2021';
