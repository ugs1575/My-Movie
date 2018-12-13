--제목, 내용, 작성일, 조회수, comment, 작성자id

drop table review;


select * from review;

--no: (SELECT NVL(MAX(no), 0) + 1 as no FROM review)

create table review(
rno number(7) not null,
rtitle 	varchar(50) not null,
writer varchar(30) not null,
rdate date not null,
rcontent varchar(4000) not null,
passwd varchar(15) not null,
viewcnt number(5) default 0,
primary key(rno)
);

alter table review
add(rate number(1) default 0);

--<update>--
update review set rtitle='update activated' where rno = 2;
update review set rtitle='hi', rcontent='d' where rno=2;
--<delete>--
delete review where rno=1;

delete from review;

--<insert>--
insert into review
(rno, rtitle, writer, rdate, rcontent, 
passwd)
values((SELECT NVL(MAX(rno), 0) + 1 as rno FROM review), 
'너의 결혼식 보고 왔어요','user1',sysdate,'정말 재밌다~','12');

--<list>--
select rno, rtitle, writer, rdate, rcontent, passwd, r
from(select rno, rtitle, writer, rdate, rcontent, passwd, rownum as r
from(select rno, rtitle, writer, rdate, rcontent, passwd
from review
order by rno DESC))
where r>=1 and r<=5;

--<패스워드 검증>
SELECT COUNT(rno) as cnt 
FROM review 
WHERE rno=16 AND passwd='12'; 

--<조회수 증가>
UPDATE review 
SET viewcnt = viewcnt + 1 
WHERE rno=2; 








