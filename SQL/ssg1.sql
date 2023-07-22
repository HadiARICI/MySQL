--SET OPERATORLERI 
--UNION, UNION ALL, INTERSECT, EXCEPT

--iki sorgu ifadesini birlestirmeye yarar



create table musteriler(
id int primary key,
isim varchar(50),
sehir varchar(50),
yas int	
);

insert into musteriler values(100, 'Ahmet Umit', 'Istanbul', 54);
insert into musteriler values(101, 'R.Nuri Guntekin', 'Antalya', 18);
insert into musteriler values(102, 'S.Faik Abasiyanik', 'Bursa', 14);
insert into musteriler values(103, 'Yasar Kemal', 'Istanbul', 26);
insert into musteriler values(104, 'Halide E. Adivar', 'Izmir', 35);
insert into musteriler values(105, 'Nazan Bekiroğlu', 'Izmir', 42);
insert into musteriler values(106, 'Peyami Safa', 'Antalya', 33);
insert into musteriler values(107, 'Sabahattin Ali', 'Istanbul', 41);
insert into musteriler values(108, 'Oguz Atay', 'Istanbul', 28);
insert into musteriler values(109, 'Orhan Pamuk', 'Ankara', 30);
insert into musteriler values(110, 'Elif Safak', 'Bursa',27);
insert into musteriler values(111, 'Kemal Tahir', 'Izmir', 29);



create table siparisler(
id int,
musteri_id int,
urun_adi varchar(50),
tutar int);



insert into siparisler values(3002, 101,'roman', 230);
insert into siparisler values(3004, 102,'tukenmez kalem', 80);
insert into siparisler values(3006, 109,'sirt cantasi', 440);
insert into siparisler values(3008, 103,'kursun kalem', 75);
insert into siparisler values(3009, 105,'cizgili defter', 250);
insert into siparisler values(3010, 108,'kol cantasi', 300);
insert into siparisler values(3011, 106,'masal kitabi', 175);
insert into siparisler values(3013, 107,'kareli defter', 145);
insert into siparisler values(3001, 111,'matematik kitabi',500);
insert into siparisler values(3003, 130,'cizgisiz defter', 145);

select * from musteriler;

select * from siparisler;

--SORU1: musteriler tablosunda sehir'i Istanbul olan veriler ile yasi 30dan 
--buyuk olan verilerin isimlerini listeleyiniz
select isim from musteriler
where sehir='Istanbul' or yas>30

--union
select isim from musteriler where sehir='Istanbul'
union
select isim from musteriler where yas>30

--SORU2: musteriler tablosunda id degeri 105ten kucuk olan verilerin isimlerini 
--ve yası 20 ile 30 arasında olan verilerin sehirlerini listeleyiniz
select isim as isim_sehir from musteriler where id<105
union
select sehir from musteriler where yas<30 and  yas>20

--SORU3: siparisler tablosundaki k ile baslayan urunlerin urun adi ve musteri_idleri ile
--musteriler tablosundaki ismi O ile baslayan verilerin isim ve id lerini listeleyiniz 
select * from siparisler;

select urun_adi as urun_isim , musteri_id from siparisler where urun_adi like 'k%'-- k ile baslayan urunleri verir
union
select isim , id from musteriler where isim like 'O%' --ismi O ile baslayanları verir

--SORU4: musteriler tablosundaki verilerden yası en buyuk 
--3. ve 6 verilerin tum bilgilerini listeleyin
(select * from musteriler order by yas desc offset 2 limit 1)
union
(select * from musteriler order by yas desc offset 5 limit 1)

--SORU5: musteriler tablosundan yası 30dan kucuk olan verilerin id ve sehirleri ile
--siparisler tablosundan tutarı 250den buyuk olan verilerin id ve urun_adi'larini listeleyiniz

select * from siparisler;

select id , sehir as sehir_urun from musteriler where yas<30
union
select id , urun_adi from siparisler where tutar>250;


--SORU6: musteriler tablosundaki sehir ismi I ile baslayan verilerin isimlerini ve 
--yas degeri 30dan cok olan verilerin isimlerini tekrarlı olacak sekilde listeleyiniz

--union all

select isim from musteriler where sehir like 'I%'
union all
select isim from musteriler where yas>30

--SORU7: musteriler tablosundaki sehir'i Izmır olan verilerin id leri ile
--siparisler tablosundaki urun_adi cizgili defter olan verilerin musteri_idlerinin
--kesişimini(ortak olanları) bulunuz
select * from siparisler;

--intersect
select id from musteriler where sehir='Izmir' --104, 105, 111
intersect
select musteri_id from siparisler where urun_adi='cizgili defter' --105

--SORU8: musteriler tablosundaki sehir'i Izmır olan verilerin id lerinin
--siparisler tablosundaki urun_adi cizgili defter olan verilerin  
--musteri_idlerinden farklı olanları bulunuz

--except
select id from musteriler where sehir='Izmir'
except
select musteri_id from siparisler where urun_adi='cizgili defter'


