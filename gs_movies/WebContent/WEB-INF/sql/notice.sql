create table notice(
ntno 		number(7) not null,
nttitle 	varchar(50) not null,
ntdate date not null,
ntcontent varchar(4000) not null,
viewcnt number(5) default 0,
primary key(ntno)
);

--<list>--
select nttno, nttitle, ntdate, ntcontent, viewcnt, r
from(select nttno, nttitle, ntdate, ntcontent, viewcnt, rownum as r
from(select nttno, nttitle, ntdate, ntcontent, viewcnt,
from notice
order by ntno DESC))
where r>=1 and r<=5;


		

select * from notice;

--<update>--
update notice set nttitle='update activated' where ntno = 2;

--<delete>--
delete notice where ntno=1;

delete from notice;

--<insert>--
insert into notice(ntno, nttitle, ntdate, ntcontent)
values((SELECT NVL(MAX(ntno), 0) + 1 as ntno FROM notice),
'홈페이지 이용 안내드립니다.',sysdate,'29일 이용 중지 됩니다.'); 




