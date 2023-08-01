create table movieboard(
	b_no number (5) primary key,
	b_title varchar2 (50 char) not null,
	b_when date default sysdate,
	b_content varchar2 (300 char) not null,
	b_writter varchar2 (20 char) not null,
	constraint fkkey_board foreign key(b_writter)
	references member_info(m_id)
	on delete cascade
);

purge recyclebin;

insert into movieboard(b_no, b_title, b_when, b_content,b_writter) 
	values (movieboard_seq.nextval,'테스트',default,'테스트','dyj02056');


create sequence movieboard_seq;
drop sequence movieboard_seq;
select * from tab;
select * from seq;
select * from movieboard;
drop table movieboard cascade constraint;