
select * from movie_MEMBER;

create table movie_member(
id varchar(10) not null,
psw varchar(20) not null,
name varchar(20) not null,
email varchar (50) not null unique,
fname    VARCHAR(50) DEFAULT 'member.jpg',
grade char(1) default 'H',
primary key (id)
);

--create
insert into movie_member(id, psw, name, email, grade)
values('woo','123','우경서','email@email.com','H');
insert into movie_member(id, psw, name, email, grade)
values('choi','123','최우식','email2@email.com','H');

insert into movie_member(id, psw, name, email, grade)
values('admin','123','관리자','admin@email.com','A');