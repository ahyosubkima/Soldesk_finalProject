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

/*사진댓글*/
create table comm_picture_reply(
cpr_no number(3) primary key,
cpr_cp_no number(3) not null,
cpr_owner varchar(30 char) not null,
cpr_owner_id varchar(30 char) not null,
cpr_txt varchar(300 char) not null,
cpr_when date not null,

constraint cp_no 
foreign key(cpr_cp_no)
		references comm_picture(comm_picture_no)
		on delete cascade
);

/*영상댓글*/
create table comm_video_reply(
cvr_no number(3) primary key,
cvr_cv_no number(3) not null,
cvr_owner varchar(30 char) not null,
cvr_owner_id varchar(30 char) not null,
cvr_txt varchar(300 char) not null,
cvr_when date not null,

constraint cvpr_no 
foreign key(cvr_cv_no)
		references comm_video(cv_no)
		on delete cascade
);


insert into comm_picture_reply values(comm_picture_reply_seq.nextval,#{cpr_cp_no},'김진현',#{cpr_txt},sysdate);
insert into comm_picture_reply values(comm_picture_reply_seq.nextval,,'김진현',#{cpr_txt},sysdate);



select * from comm_picture_reply

SELECT * FROM comm_picture WHERE ROWNUM < 6 order by comm_picture_good

drop table comm_picture_reply

/*좋아요 관리테이블*/
create table comm_picture_good(
cpg_id varchar2(30 char) not null,
cpg_good number(3) not null,
cpg_no number(3) not null,


constraint cpg_cp_no 
foreign key(cpg_no)
		references comm_picture(comm_picture_no)
		on delete cascade
)

/*영상 추천 관리테이블*/
create table comm_video_good(
cvg_id varchar2(30 char) not null,
cvg_good number(3) not null,
cvg_no number(3) not null,


constraint cvg_cv_no 
foreign key(cvg_no)
		references comm_video(comm_video_no)
		on delete cascade
)

select count(*) from comm_picture

select * from comm_picture_good where cpg_id = 'jh' and cpg_no= 57
/*영상게시판*/
create table comm_video(
cv_no number(3) primary key,
cv_name varchar2(20 char) not null,
cv_write_name varchar2(20 char) not null,
cv_writer varchar2(30 char) not null,
cv_txt varchar2(300 char) not null,
cv_good number(3) not null,
cv_view number(3) not null,
cv_date date not null
);

select * 
from (	
select rownum as rn, cv_no, cv_name, cv_write_name,cv_writer, 
				cv_txt, cv_good,cv_view,cv_date
				from (
					select * from comm_video order by cv_date desc
				)
			)
			where rn <= 6 and rn > 0

			 select count(*) from comm_video
			
create sequence cv_seq;

insert into COMM_VIDEO values(cv_seq.nextval,'테스트2.mp4','테스트','김진현','내용','0','0',sysdate);


select * from comm_video 


select * 
from (	
select rownum as rn, comm_picture_no, comm_picture_name, comm_picture_write_name,comm_picture_writer, 
				comm_picture_txt, comm_picture_good,comm_picture_view,comm_picture_date
				from (
					select * from comm_picture order by comm_picture_date desc
				)
			)
			where rn <= 6 and rn >= 1

/*자유게시판*/
			
create table comm_free(
cf_no number(3) primary key,
cf_file_name varchar2(20 char),
cf_write_name varchar2(20 char) not null,
cf_writer varchar2(30 char) not null,
cf_txt varchar2(300 char) not null,
cf_good number(3) not null,
cf_view number(3) not null,
cf_date date not null
)	

drop table comm_free

create sequence cf_seq

select * from comm_free

insert into comm_free values(cf_seq.nextval,'a.jpg','제목','글쓴이','내용',0,0,sysdate)
insert into comm_free values(cf_seq.nextval,#{cf_file_name},#{cf_write_name},#{cf_writer},#{cf_txt},0,0,sysdate)

/*자유게시판 리플*/
create table comm_free_reply(
cfr_no number(3) primary key,
cfr_cf_no number(3) not null,
cfr_owner varchar(30 char) not null,
cfr_owner_id varchar(30 char) not null,
cfr_txt varchar(300 char) not null,
cfr_when date not null,

constraint cfpr_no 
foreign key(cfr_cf_no)
		references comm_free(cf_no)
		on delete cascade
);

create sequence comm_free_reply_seq

select * from COMM_FREE_REPLY
/*자유게시판 추천 확인테이블*/
create table comm_free_good(
cfg_id varchar2(30 char) not null,
cfg_good number(3) not null,
cfg_no number(3) not null,


constraint cfg_cf_no 
foreign key(cfg_no)
		references comm_free(cf_no)
		on delete cascade
)
