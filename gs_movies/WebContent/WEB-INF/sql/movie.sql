drop table movie;


select * from movie;

--no: (SELECT NVL(MAX(no), 0) + 1 as no FROM movie)

create table movie(
no 		number(7) not null,
mainPoster VARCHAR(50) DEFAULT 'movielist_header.jpg',
poster  VARCHAR(50) DEFAULT 'movielist_header.jpg',
title 	varchar(50) not null,
ryear	varchar(10) not null,
viewLevel varchar(30) not null,
genre	varchar(30) not null,
director varchar(50) not null,
country varchar(30) not null,
viewer  varchar(50) not null,
content varchar(4000) not null,
viewcnt number(5) default 0,
grpno 	number(7) default 0,
indent	number(2) default 0,
ansnum 	number(5) default 0,
primary key(no)
);

ALTER TABLE movie
DROP COLUMN ryear;

ALTER TABLE movie
ADD ryear varchar(10) not null;


--<update>--
update movie set title='update activated' where no = 2;

--<delete>--
delete movie where no=1;

delete from movie;

--<insert>--
insert into movie(no, mainPoster, poster, 
title, ryear, viewLevel, genre, 
director, country, viewer, content)
values((SELECT NVL(MAX(no), 0) + 1 as no FROM movie), 'on_your_wedding_day_main.jpg', 'on_your_wedding_day.jpg', 
'너의 결혼식', '2018', '12세 관람가', '멜로/로맨스',
'이석근', 'Republic of Korea', '2,820,525명', '너의결혼식 줄거리');


insert into movie(no, title, ryear, directer, country, content, mdate)
values((SELECT NVL(MAX(no), 0) + 1 as no FROM movie), 'La La Land', '2016', 'Damien Chazelle', 'United States', 'lalaland content', sysdate);