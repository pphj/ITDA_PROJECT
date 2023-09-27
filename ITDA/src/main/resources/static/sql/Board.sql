drop table board cascade constraints purge;

create table board(
	board_num		number,					--글 번호
	board_name		varchar2(30),			--작성자
	board_pass		varchar2(30),			--비밀번호
	board_subject	varchar2(300),			--제목
	board_content	varchar2(4000),			--내용
	board_file		varchar2(50),			--첨부 파일 명(가공)
	board_original	varchar2(50),			--첨부 파일 명
	board_re_ref	number,					--참조 글 번호
	board_re_lev	number,					--답변 글 깊이
	board_re_seq	number,					--답변 글 순서
	board_readcount	number,					--조회수
	board_date date default sysdate,		--작성 날짜
	primary key(board_num)
);


select * from board;
