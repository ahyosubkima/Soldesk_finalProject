

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

insert into REVIEW_BOARD values(review_board_seq.nextval, 'test', 0, 0, 0, sysdate, 'test')

select * from REVIEW_BOARD