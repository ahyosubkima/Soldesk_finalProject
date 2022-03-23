create table plan_write(
p_no number(3) primary key,
p_writer varchar2(30 char) not null,
p_title varchar2(20 char) not null,
p_titleFile varchar2(100 char) not null,
p_days number(3) not null,
p_startDate date not null,
p_person number(3) not null,
p_place varchar2(20 char) not null,
p_plan varchar2(2000 char) not null,
p_budget varchar2(100 char) not null,
p_freeWrite varchar2(110 char),
p_setTitle varchar2(2000 char) not null,
p_setItem varchar2(2000 char) not null,
p_setPrice varchar2(2000 char) not null,
p_writedate date not null
);


create sequence plan_write_seq;


insert into plan_write values(plan_write_seq.nextval, 'aaa', '제목1', '사진', '3' ,'2022-03-02', '2', 
'장소','플랜' ,'예산','한마디','타이틀1,타이틀2','아이템1,아이템2','1,2',sysdate);


drop table plan_write;

select * from plan_write;

select * from plan_write where p_no = 103;

-------------------------------------------------------
create table plan_dayPlan(
pd_no number(3) primary key,
pd_p_no number(3) not null
);

-------------------------------------------------------
create table plan_budget(
pb_no
pb_setTitle 
pb_setItemName
pb_setPrice
);

select *
		from (
		select rownum as rn, p_no, p_writer,p_title,p_titleFile,p_days,
		p_startDate,p_person,p_place,p_plan,p_budget,p_freeWrite
		p_setTitle, p_setItem,p_setPrice,p_writedate
		from (
		select * from plan_write order by p_writedate desc
		)
		)
		where rn <= (1 * 6) and rn > (1 -1) * 6

