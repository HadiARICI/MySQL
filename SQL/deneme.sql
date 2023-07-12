create table kurum_list(
 id_no char(3),
adi varchar(20),
kayit_tarihi date,
ortalama real	
);

insert into kurum_list values ('71','mustafa','23-05-1971',45);
insert into kurum_list values ('72','ali','23-05-1972',46);
insert into kurum_list values ('73','ahmet','23-05-1973',47);
insert into kurum_list values ('74','emin','23-05-1974',48);
insert into kurum_list values ('75','salim','23-05-1975',49);

select * from kurum_list;

select * from kurum_list where adi='mustafa';

select adi, ortalama from kurum_list where ortalama in(45,49);

select * from kurum_list where id_no='71';

create table talebeler(
ogrenci_tc char(11),         -- Uzunlugu belli olan String veriler icin char() data turu kullanılır
ogrenci_isim varchar(20),    -- Uzunlugu belli olmayan String veriler icin varchar() data turu kullanılır
not_ort real,                -- Ondalıklı sayılar icin real data turu kullanılır
kayit_tarihi date            -- Tarih icin date data turu kullanılır
);