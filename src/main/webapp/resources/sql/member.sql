create table member_info(
	m_id varchar2 (20 char) primary key,
	m_password varchar2 (20 char) not null,
	m_name varchar2 (20 char) not null,
	m_email varchar2 (40 char) not null
);
insert into member_info values(
'DYJ00085','tjddnjs0-','jsw','dyj02056@gmail.com');
select * from member_info;
drop table member_info cascade constraints;