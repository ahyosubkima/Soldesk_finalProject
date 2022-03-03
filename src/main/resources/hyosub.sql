

--사진,제목,좋아요,뷰수,댓글수,작성일자, 작성자프사, 작성자 아이디, 검색키워

create table review_board(
rb_no number(5)primary key,
rb_title varchar2(100 char)not null,
rb_likecount number(10) not null,
rb_viewcount number(10) not null,
rb_commentcount number(10) not null,
rb_date date not null,
rb_text varchar2(500 char) not null

);



create sequence review_board_seq;

insert into REVIEW_BOARD values(review_board_seq.nextval, 'bbc', 0, 0, 0, sysdate, 'test','10','10000','1','서울','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, '한글', 0, 0, 0, sysdate, 'test','5','100000','1','인천','1.jpg');

insert into REVIEW_BOARD values(review_board_seq.nextval, '예산1', 0, 0, 0, sysdate, 'test','1','1','1','1','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test2', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test2', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test2', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test2', 0, 0, 0, sysdate, 'test','1','500000','커플여행','서울','1.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test3', 0, 0, 0, sysdate, 'test','2','500','감성카페찾기','부산','2.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test1', 0, 0, 0, sysdate, 'test','3','700000','비즈니스여행','대구','2.jpg');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test1', 0, 0, 0, sysdate, 'test','8','80000','비즈니스여행','대구','2.jpg');

select * from REVIEW_BOARD where rb_headnum like '1'
select * from REVIEW_BOARD



select * from REVIEW_BOARD where  rb_budget <= '100000' and rb_theme like '%%' and rb_location like '%%';

delete REVIEW_BOARD where rb_no = 102;


alter table REVIEW_BOARD add (
rb_headNum varchar2(50 char) not null,
rb_budget varchar2(50 char) not null,
rb_theme varchar2(50 char) not null,
rb_location varchar2(50 char) not null
)

alter table review_board add rb_img varchar2(100 char) not null;

truncate table review_board;

alter table review_board modify rb_budget number(20);
