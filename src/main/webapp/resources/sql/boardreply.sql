create table mbreply(
	r_no number (5) primary key,
	b_no number (5) not null,
	r_content varchar2 (300 char) not null,
	r_writter varchar2 (20 char) not null,
	constraint fk_writter foreign key(r_writter)
	references member_info(m_id)
	on delete cascade,
	constraint fk_no foreign key(b_no)
	references movieboard(b_no)
	on delete cascade
);

insert into mbreply values(mbreply_seq.nextval,18,
'123','dyj02056');

purge recyclebin;

create sequence mbreply_seq;
drop sequence mbreply_seq;
select * from tab;
select * from seq;
select * from mbreply;
drop table mbreply cascade constraint;