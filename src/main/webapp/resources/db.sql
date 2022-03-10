/*
3월 7일_ 서병관
1) dm_name, dm_photo not null 삭제
2) dm_email, dm_isAdmin 추가 
 * */

create table danim_member(
dm_id varchar2(10 char) primary key,
dm_pw varchar2(300 char) not null,
dm_nickname varchar2(20 char) not null,
dm_email varchar2(300 char) not null,
dm_addr varchar2(20 char),
dm_photo varchar2(40 char),
dm_isAdmin varchar2(2 char) not null 
);


insert into danim_member values ('admin2', '1004', '곰', 'abc@abc.abc', '서울', 'dog4.jpg', 'Y');
insert into danim_member
		values (#{dm_id}, #{dm_pw},
		#{dm_nickname}, #{dm_email}, #{dm_addr, jdbcType=VARCHAR}, #{dm_photo, jdbcType=VARCHAR}, #{dm_isAdmin})

/*insert into danim_member values('jh','1004','김진현','김진지','대구','dog4.jpg')
insert into danim_member values('bg1','1004','서병관','병관띠','대구','dog.jpg')*/

select * from danim_member;

drop table danim_member cascade constraints;