create table comm_picture(
comm_picture_no number(3) primary key,
comm_picture_name varchar2(20 char) not null,
comm_picture_write_name varchar2(20 char) not null,
comm_picture_writer varchar2(30 char) not null,
comm_picture_txt varchar2(30 char) not null,
comm_picture_good number(3) not null,
comm_picture_view number(3) not null,
comm_picture_date date not null
);

create sequence comm_picture_seq;

drop table comm_picture;

	
select * from comm_picture order by comm_picture_date desc;

select * from comm_picture where comm_picture_no = 28;

select * from comm_picture where comm_picture_no = #{comm_picture_no};

delete from comm_picture where comm_picture_no = #{comm_picture_no};

create table comm_picture_reply(
	cpr_no number(5) primary key, 		
	cpr_cp_no number(5) not null,		-- 소속된 글번호
	cpr_owner varchar2(10 char) not null,
	cpr_txt varchar2(100 char) not null,
	cpr_when date not null
);

create table comm_video_reply(
	cvr_no number(5) primary key, 		
	cvr_cp_no number(5) not null,		-- 소속된 글번호
	cvr_owner varchar2(10 char) not null,
	cvr_txt varchar2(100 char) not null,
	cvr_when date not null
);

create sequence comm_picture_reply_seq;

insert into comm_picture_reply values(comm_picture_reply_seq.nextval,'40','김진현','댓글입니다.',sysdate);

