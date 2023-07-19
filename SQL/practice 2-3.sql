
/*
anneler, babalar ve cocuklar adında 3 tane tablo olusturun
anneler tablosunda id(primary key), isim(unique) ve meslek sutunları olsun
babalar tablosunda id(primary key), isim ve meslek sutunları olsun
cocuklar tablosunda isim, anne_id,  baba_id,yas sutunları olsun
her cocugun anneler tablosundan bir annesi ve
babalar tablosundan bir babası olsun
cocuklar tablosunda anne_id ve baba_id sutunlarını 
referans alan foreign key kısıtlaması olsun
*/

create table anneler(
	id int primary key,
	isim varchar(30) unique,
	meslek varchar(40)
);

create table babalar(
	id int primary key,
	isim varchar(30),
	meslek varchar(40)
);

create table cocuklar(
	isim varchar(30),
	anne_id int,
	baba_id int,
	yas int,
	
	--anneler tablosundaki id sutunu ile anne_id sutununu baglayalım
	constraint anne_fk foreign key(anne_id) references anneler(id),
	--babalar tablosundaki id ile baba_id sutnunu baglayalım
	constraint baba_fk foreign key(baba_id) references babalar(id) 
);




