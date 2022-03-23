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


insert into plan_write values(plan_write_seq.nextval, 'aaa', '제목2', '사진', '3' ,'2022-03-02', '2', 
'장소2','플랜' ,'예산','한마디','타이틀1,타이틀2','아이템1,아이템2','1,2',sysdate);



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


select count(*) from plan_write where (p_title LIKE '%'||'장소'||'%' OR p_place LIKE '%'||'장소'||'%')
select count(*) from plan_write where p_title LIKE '%'||'봄날'||'%' 

select * from plan_write where (p_title LIKE '%'||'야야'||'%' 
OR p_place LIKE '%'||'동일'||'%')
order by p_writedate desc

select * from plan_write where (p_title LIKE '%'||'dd'||'%' 
		OR p_place LIKE '%'||'dd'||'%')
		order by p_writedate desc


select * from plan_write where (p_title || p_place) like '%'||'부천'||'%'
		order by p_writedate desc

SELECT *
		from (
		select rownum as rn, p_no, p_writer, p_title, p_titleFile, p_days,
		p_startDate, p_person, p_place, p_plan, p_budget, p_freeWrite,
		p_setTitle, p_setItem, p_setPrice, p_writedate
		from (
		select * from plan_write where (p_title LIKE '%'||#{n_searchWrite}||'%' 
		OR p_place LIKE '%'||#{n_searchWrite}||'%')
		order by p_writedate desc
		)
		)
		where rn &lt;= (#{pageNum} * #{amount}) and rn > (#{pageNum} -1) *
		#{amount}


select count(*) from plan_write where (p_title LIKE '%'||#{n_searchWrite}||'%' 
		OR p_place LIKE '%'||#{n_searchWrite}||'%')


----------------------------------------------------------------------------------
create table plan_heart (
heart_id varchar2(10 char) not null
heart_no number(3) not null,
heart_like number(3) not null,
);
		
constraint ph_no 
foreign key(heart_no)
		references plan_heart(p_no)
		on delete cascade
)
		
		
		
		
		
		
		
		
		
		


