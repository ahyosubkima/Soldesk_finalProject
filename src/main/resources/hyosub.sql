

--사진,제목,좋아요,뷰수,댓글수,작성일자, 작성자프사, 작성자 아이디, 검색키워

create table review_board(
rb_no number(5)primary key,
rb_title varchar2(100 char)not null,
rb_likecount number(10) not null,
rb_viewcount number(10) not null,
rb_commentcount number(10) not null,
rb_date date not null,
rb_text varchar2(500 char) not null

)



create sequence review_board_seq;

insert into REVIEW_BOARD values(review_board_seq.nextval, 'bbc', 0, 0, 0, sysdate, 'test','10','10000','1','서울');
insert into REVIEW_BOARD values(review_board_seq.nextval, '한글', 0, 0, 0, sysdate, 'test','5','100000','1','인천');

insert into REVIEW_BOARD values(review_board_seq.nextval, '예산1', 0, 0, 0, sysdate, 'test','1','1','1','1');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test2', 0, 0, 0, sysdate, 'test','1','예산2','테마2','지역2');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test3', 0, 0, 0, sysdate, 'test','1','예산3','테마3','지역3');
insert into REVIEW_BOARD values(review_board_seq.nextval, 'test1', 0, 0, 0, sysdate, 'test','1','예산1','테마1','지역1');

select * from REVIEW_BOARD 


delete REVIEW_BOARD where rb_no = 1;

alter table REVIEW_BOARD add (
rb_headNum varchar2(50 char) not null,
rb_budget varchar2(50 char) not null,
rb_theme varchar2(50 char) not null,
rb_location varchar2(50 char) not null
)

