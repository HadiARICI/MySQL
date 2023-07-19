
CREATE TABLE manav
(
isim varchar(50), 
yas int,
cinsiyet char,
sehir varchar(20),
gelir int,
urun_adi varchar(50), 
urun_miktar int
);
INSERT INTO manav VALUES( 'Ali', 32, 'E', 'Istanbul',10000, 'Elma', 5);
INSERT INTO manav VALUES( 'Ayse', 30, 'K', 'Ankara', 15000, 'Armut', 3);
INSERT INTO manav VALUES( 'Veli', 35, 'E', 'Izmır', 13000, 'Elma', 2);  
INSERT INTO manav VALUES( 'Hasan', 40, 'E', 'Bolu', 14000, 'Uzum', 4);  
INSERT INTO manav VALUES( 'Ali', 35, 'E', 'Ankara', 15000, 'Armut', 1);  
INSERT INTO manav VALUES( 'Ayse', 32, 'K', 'Izmır', 14000, 'Elma', 3);  
INSERT INTO manav VALUES( 'Veli', 40, 'E', 'Istanbul', 10000, 'Uzum', 5);  
INSERT INTO manav VALUES( 'Ali', 28, 'E', 'Bolu', 11000, 'Armut', 2);  
INSERT INTO manav VALUES( 'Veli', 30, 'E', 'Istanbul', 15000, 'Elma', 3);  
INSERT INTO manav VALUES( 'Ayse', 30, 'K', 'Izmır', 12000, 'Uzum', 2);

--SORU1: manav tablosundaki max yas degerini listele

select max(yas) as max_yas from manav;

--2.yol
select yas from manav order by yas desc limit 1;
--order by default olarak kucukten buyuge sıralar
--buyukten kucuge sıralamak icin desc komutunu kullanmalıyız

--SORU2: manav tablosundaki en dusuk geliri listele
select min(gelir) as min_gelir from manav;
--2.yol
select gelir as min_gelir from manav order by gelir limit 1;

--SORU3: manav tablosundaki urun cesitlerinin sayısını listele
select count(distinct urun_adi) from manav

--SORU4: manav tablosundaki urun cesıtlerini listele
select urun_adi from manav group by urun_adi;

select distinct(urun_adi) from manav

-- SORU5: sehir'lere göre ortalama yas'ı listeleyiniz
select sehir, round(avg(yas)) as ortalama_yas from manav
group by sehir;

--SORU6: manav tablosundaki urunleri ve o urune ait urun mıktarlarının
--toplamını listele
select urun_adi, sum(urun_miktar) as toplam_urun from manav group by urun_adi;

-- SORU7: sehir'lere göre kaç çalışan olduğunu listeleyiniz.
select sehir, count(*) as calisan_Sayisi from manav group by sehir;




