/*------------ AGGREGATE METHOD KULLANIMI ---------------------------

AGGREGATE METHODLARI:  Tek bir deger elde etmek istedigimizde kullanılır.

sum() ==>   Verilerin toplamını alır.
count() ==> Verilerin sayisini alır.
min() ==>   Verilerden en kücük degeri alır.
max() ==>   Verilerden en büyük degeri alır.
avg() ==>   Verilerin ortalamasını alır.

--------------------------------------------------------------------*/

create table arac
(
id int,
marka varchar(30),
model varchar(30),
fiyat int,
kilometre int,
vites varchar(20)
);

insert into arac values(100, 'Citroen', 'C3', 500000, 5000, 'Otomatik' );
insert into arac values(101, 'Mercedes', 'C180', 900000, 10000, 'Otomatik' );
insert into arac values(102, 'Honda', 'Cıvıc', 400000, 15000, 'Manuel' );
insert into arac values(103, 'Wolkswagen', 'Golf', 350000, 20000, 'Manuel' );
insert into arac values(104, 'Ford', 'Mustang', 750000, 5000, 'Otomatik' );
insert into arac values(105, 'Porsche', 'Panamera', 850000, 5000, 'Otomatik' );
insert into arac values(106, 'Bugatti', 'Veyron', 950000, 5000, 'Otomatik' );

--SORU1 : arac tablosundaki en yüksek fiyat'ı listele

select max(fiyat) from arac; 
select max(fiyat) as max_fiyat from arac; --- listelediğimiz sutunlara as ile geçiçi isimlendirme verebiliriz.

--SORU2 : arac tablosundaki en düşük fiyat'ı listele
select min(fiyat) from arac;
select min(fiyat) as min_fiyat from arac;

--SORU3 : arac tablosundaki fiyatların toplamını listele
select sum(fiyat) from arac;
select sum(fiyat) as Total_Fiyat from arac;

--SORU4 : arac tablosundaki fiyat ortalamalarını listele
select avg(fiyat) from arac;
select avg(fiyat) as ort_Fiyat from arac;

select round(avg(fiyat)) as ort_Fiyat from arac;--round ondalık lı kısımdan kurtulmak için kullanılan bir komut
select round(avg(fiyat),2) as ort_Fiyat from arac;-- , den sonra iki basamka olması için kullanılır

--SORU5 : arac tablosunda kaç tane araç oldugunu listele
select count(id) from arac;
select count(id) as arac_sayisi from arac;

select count(vites) as arac_sayisi from arac;

-- 2.YOL

-- select count(*) as arac_sayisi from arac;


