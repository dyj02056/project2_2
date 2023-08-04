create table mymovie(
	mm_no number (8) primary key,
	mm_id varchar2 (20 char) not null,
	mm_name varchar2 (100 char) not null,
	constraint fmm_id foreign key(mm_id)
	references member_info(m_id)
	on delete cascade
);

create sequence mymovie_seq;
drop sequence mymovie_seq;

select * from mymovie;
drop table mymovie cascade constraint;