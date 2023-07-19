
CREATE TABLE personel
(
id int PRIMARY KEY, 
isim VARCHAR(50), 
sehir VARCHAR(50), 
maas int, 
sirket VARCHAR(20)
);



INSERT INTO personel VALUES(123456789, 'Ali Yilmaz', 'Istanbul', 5500, 'Honda');
INSERT INTO personel VALUES(234567890, 'Veli Sahin', 'Istanbul', 4500, 'Toyota');
INSERT INTO personel VALUES(345678901, 'Mehmet Maden', 'Ankara', 3500, 'Hyundai'); 
INSERT INTO personel VALUES(456789012, 'Ahmet Gurbuz', 'Izmir', 6000, 'Ford');
INSERT INTO personel VALUES(567890123, 'Ali Sahin', 'Ankara', 7000, 'Fiat');
INSERT INTO personel VALUES(456715012, 'Mahmut Sahin', 'Ankara', 4500, 'Citroen');

--SORU1: personel tablosuna cinsiyet sutunu ekleyiniz.(E/K girilecek) 
--DDL KOMUTLARI: create alter drop truncate

alter table personel add column cinsiyet char(1);

-- SORU2: personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' 
--olan yeni bir sutun ekleyiniz.
alter table personel
add column ulke_isim varchar(20) default 'Turkiye';

 
--SORU3: cinsiyet sutunu siliniz
alter table personel
drop column cinsiyet;

-- SORU4: personel tablosundan sehir sutununu siliniz.
alter table personel
drop column sehir;

--SORU5: personel tablosuna tel_no char(11) ve cocuk_sayisi int 
--seklinde yeni sutunlar ekleyiniz.
alter table personel
add column tel_no char(11) , add column cocuk_sayisi int;

--SORU6: personel tablosundan tel_no ve cocuk_sayisi sutunlarını siliniz
alter table personel
drop column tel_no , drop column cocuk_sayisi;

-- SORU7: personel tablosundaki ulke_isim sutununun 
--adini ulke_adi olarak degistiriniz.

alter table personel
rename column ulke_isim to ulke_adi;

-- SORU8: personel tablosunun adini isciler olarak degistiriniz.
alter table personel rename to isciler;

-- SORU9: isciler tablosundaki ulke_adi sutununun veri tipini 
--VARCHAR(30) olarak değiştiriniz.
alter table isciler
alter column ulke_adi type varchar(30);

-- SORU10: isciler tablosuna maas 3000 den kucuk olan 
--degerler veri olarak girilemesin.
alter table isciler
add constraint check_maas --burası kısıtlamaya benim verdiğim ozel isim
check(maas>=3000);

INSERT INTO isciler VALUES(456715062, 'Veliye Sahin', 3500, 'Renault','Turkiye');

--SORU11: isciler tablosundaki check constraintini 2000den az deger 
--girilemeyecek seklinde guncelleyin

--mevcut bir kısıtlamayı guncellemek için; ilk önce eski kısıtlamayı
--sileriz daha sonra aynı isimli yeni bir kısıtlama ekleriz
alter table isciler
drop constraint check_maas, add constraint check_maas check(maas>=2000);

INSERT INTO isciler VALUES(456718060, 'Merve Coban',  2500, 'Volkswagen','Almanya');

--SORU12: isciler tablosunun isim sutununa unique constrainti ekleyin, 
--kısıtlamanın ismi uni_isim olsun

alter table isciler
add constraint uni_isim unique(isim);

INSERT INTO isciler VALUES(450715092, 'Veli Sah', 6500, 'Nissan', 'Japonya');

--SORU13: isciler tablosundaki unique kısıtlamasını kaldırın
alter table isciler
drop constraint uni_isim;

INSERT INTO isciler VALUES(450715992, 'Veli Sahin', 6500, 'Opel','Almanya');

--SORU14: isciler tablosundaki şirket sutununa unique cons ekleyiniz
alter table isciler add constraint uni_sirket unique(sirket);

--cons eklemek için 2.yol; cons ismini pgadmin veriyor
alter table isciler add unique(sirket);

--INSERT INTO isciler VALUES(450715998, 'Veli Sahin', 6500, 'Opel','Almanya');

--SORU15: isciler tablosundaki sirket sutununa ait unique cons kaldırınız
alter table isciler
drop constraint isciler_sirket_key;

--SORU16: isciler tablosundaki tum verileri silin

--1.yol delete komutu ile -->delete from isciler

--2.yol truncate komutu ile 
truncate table isciler;
--truncate komutu where kosulu ile kullanılamaz

 --SORU17: isciler tablosunu silin
drop table isciler;





