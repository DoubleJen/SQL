--create Table
drop table Test1
go

create table Test1
	(
	id int identity(1,10) not null primary key,
	data1 int null default 0,
	data2 int not null
	)
go

--加上條件約束
alter table Test1
	add constraint chk_data check (data1 >= 0)

insert into Test1(data1, data2) values(100, 1000)
insert into Test1(data1, data2) values(-1, 1000)
select * from Test1