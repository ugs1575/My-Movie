create table rcomment(
rcno number not null,
rccontent varchar(500) not null,
rcdate date not null,
id varchar(10) not null,
rno number(7) not null,
primary key(rcno),
foreign key(rno) references review(rno)
);

--create(댓글등록)
select * from review;
 
select nvl(max(rcno),0)+1 from rcomment;
 
insert into rcomment(rcno, rccontent, rcdate, id, rno)
values((select nvl(max(rcno),0)+1 from rcomment),
'토피넛라떼먹고싶다',sysdate,'choi',14
);



select * from rcomment;
--하나의 글에대한 댓글 전체 삭제

delete from rcomment
where rno = 14;
 
 
--read(댓글 내용)
select * from rcomment
where rcno = 11;
 
--update(댓글 수정)
update rcomment
set rccontent = '새로운 의견을 올립니다.'
where rcno = 2;
 
--delete(댓글 삭제)
delete from rcomment
where rcno = 3;
 
 
--list(목록)
select rcno, rccontent, to_char(rcdate,'yyyy-mm-dd') rcdate, id, rno, r
FROM(
select rcno, rccontent, rcdate, id, rno, rownum r
FROM(
select rcno, rccontent, rcdate, id, rno
from rcomment
where rno = 14
order by rcno DESC
    )
)WHERE r >= 1 and r <= 5;
 
 
--total(목록)
select count(*) from rcomment;


