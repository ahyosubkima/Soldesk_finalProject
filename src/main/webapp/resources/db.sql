create table danim_member(
dm_id varchar2(10 char) primary key,
dm_pw varchar2(20 char) not null,
dm_name varchar2(20 char) not null,
dm_nickname varchar2(20 char) not null,
dm_addr varchar2(20 char) not null,
dm_photo varchar2(20 char) not null
)

insert into danim_member values('jh','1004','김진현','김진지','대구','dog4.jpg')
insert into danim_member values('bg1','1004','서병관','병관띠','대구','dog.jpg')

select * from danim_member;