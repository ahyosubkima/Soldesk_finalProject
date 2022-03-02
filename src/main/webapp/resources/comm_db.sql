create table comm_picture(
comm_picture_no number(3) primary key,
comm_picture_name varchar2(20 char) not null,
comm_picture_write_name varchar2(20 char) not null,
comm_picture_writer varchar2(30 char) not null,
comm_picture_good number(3) not null,
comm_picture_view number(3) not null,
comm_picture_date date not null
);

create sequence comm_picture_seq;

alter table comm_picture modify comm_picture_name varchar2(200 char);

drop table comm_picture;

insert into comm_picture values(comm_picture_seq.nextval,'testimg1','풍경화','김진현','1','1',sysdate);
insert into comm_picture values(comm_picture_seq.nextval,'testimg2','ㅇㄹㅇ','서병관','1','1',sysdate);
insert into comm_picture values(comm_picture_seq.nextval,'testimg3','ㅇㅅㅇ','박혜아','1','1',sysdate);
insert into comm_picture values(comm_picture_seq.nextval,'testimg4','ㅇㅁㅇ','최재식','1','1',sysdate);
insert into comm_picture values(comm_picture_seq.nextval,'testimg5','ㅇㅂㅇ','김건우','1','1',sysdate);

select * from comm_picture order by comm_picture_date desc;

create table comm_picture_reply(
cpr_no number(3) primary key,
cpr_cp_no number(3) not null,
cpr_owner varchar(30 char) not null;
cpr_txt varchar(300 char) not null;
cpr_when date not null
);

insert into comm_picture_reply values(comm_picture_reply_seq.nextval,#{cpr_cp_no},'김진현',#{cpr_txt},sysdate);
insert into comm_picture_reply values(comm_picture_reply_seq.nextval,,'김진현',#{cpr_txt},sysdate);


select * from comm_picture_reply

SELECT * FROM comm_picture WHERE ROWNUM < 6 order by comm_picture_good


