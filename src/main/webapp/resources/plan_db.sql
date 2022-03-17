create table plan_write(
p_no number(3) primary key,
p_writer varchar2(30 char) not null,
p_title varchar2(20 char) not null,
p_TitleFile varchar2(20 char) not null,
p_startDate date not null,
p_person number(3) not null,
p_place varchar2(20 char) not null,
p_budget varchar2(100 char) not null,
p_freeWrite varchar2(110 char) not null,
p_Writedate date not null
);


create sequence plan_write_seq;

insert into plan_write values(plan_write_seq.nextval, 'aaa', '제목', '사진', '2022-03-02', '2', '장소', '예산', '한마디', sysdate);
insert into plan_write values(plan_write_seq.nextval, 'aaa', '제목', '사진', '2022-03-02', '2', '장소', '예산', '한마디', sysdate);
insert into plan_write values(plan_write_seq.nextval, 'aaa', '제목', '사진', '2022-03-02', '2', '장소', '예산', '한마디', sysdate);
insert into plan_write values(plan_write_seq.nextval, 'aaa', '제목', '사진', '2022-03-02', '2', '장소', '예산', '한마디', sysdate);

drop table plan_write;

select * from plan_write;

-------------------------------------------------------
create table plan_dayPlan(
pd_no number(3) primary key,
pd_p_no number(3) not null
);

-------------------------------------------------------
