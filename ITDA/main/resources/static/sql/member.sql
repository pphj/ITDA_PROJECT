drop table member cascade constraints purge;

create table member(					
	id			varchar2(12),			--아이디
	password	varchar2(10),			--비밀번호
	name		varchar2(15),			--이름
	age			number(2),				--나이
	gender		varchar2(3),			--성별
	email		varchar2(30),			--이메일
	primary key(id)

);
