drop table comments cascade constraints purge;
					
create table comments(		
	num			number				primary key,			--글 번호
	id			varchar2(30)		references member(id),	--회원인 사람만 작성할 수 있게 설정
	content		varchar2(200),								--글 내용
	reg_date	date,										--등록 날짜
	board_num	number		references board(board_num) on delete cascade
);
