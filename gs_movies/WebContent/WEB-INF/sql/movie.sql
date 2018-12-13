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
DROP COLUMN viewcnt;

ALTER TABLE movie
DROP COLUMN grpno;

ALTER TABLE movie
DROP COLUMN indent;

ALTER TABLE movie
DROP COLUMN ansnum;

ALTER TABLE movie
ADD ryear varchar(10) not null;

--<list>--
select no, mainPoster, poster, title, viewLevel, ryear, director,
country, content, viewer, genre, r
from(select no, mainPoster, poster, title, viewLevel, ryear, director,
country, content, viewer, genre, rownum as r
from(select no, mainPoster, poster, title, viewLevel, ryear, director,
country, content, viewer, genre
from movie
order by no DESC))
where r>=1 and r<=5;

	
		
SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum, r
from(SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum, 
rownum as r
from(SELECT bbsno, wname, title, viewcnt, wdate, grpno, indent, ansnum 
FROM bbs  
ORDER BY bbsno DESC))
where r>=1 and r<=5;


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
'왕눈이', '2018', '12세 관람가', '멜로/로맨스',
'이석근', 'Republic of Korea', '2,820,525명', '너의결혼식 줄거리');


insert into movie(no, title, ryear, directer, country, content, mdate)
values((SELECT NVL(MAX(no), 0) + 1 as no FROM movie), 'La La Land', '2016', 'Damien Chazelle', 'United States', 'lalaland content', sysdate);