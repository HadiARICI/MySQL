CREATE TABLE insanlar
(
kimlik_no INT,
isim VARCHAR(50),
adres VARCHAR(80)     
);



INSERT INTO insanlar VALUES(123456789, 'Emre Can', 'Ankara');
INSERT INTO insanlar VALUES(234567890, 'Melek Yildiz', 'Istanbul');
INSERT INTO insanlar VALUES(345678901, 'Eylem Gunduz', 'Eskisehir');
INSERT INTO insanlar(kimlik_no, adres) VALUES(456789012, 'Izmır');
INSERT INTO insanlar(kimlik_no, adres) VALUES(567890123, 'Kutahya');
INSERT INTO insanlar(kimlik_no, isim) VALUES(567890123, 'Eymen Ozden');

select * from insanlar;

--SORU1: null isim değerlerini "Daha sonra eklenecek" değerine güncelleyin.
update insanlar
set isim='Daha sonra eklenecek'
where isim is null;-- is not null da da bu sekilde belirtiyoruz

--SORU2: null adres değerlerini "Daha sonra eklenecek" değerine güncelleyin.
update insanlar
set adres='Daha sonra eklenecek'
where adres is null;

--SORU3: İsimsiz kayıtları silin.(not: isimsiz kayıtların degeri 
--'Daha sonra eklenecek' seklinde guncellenmıstı)
delete from insanlar
where isim='Daha sonra eklenecek';

--SORU4:Adres değeri Ankara olmayan kayıtları siliniz
delete from insanlar
where adres<>'Ankara';

--<> isareti esit degildir ifadesidir sadece sql icin

