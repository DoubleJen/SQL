use Northwind
go

create table t1
(
	id int primary key,
	data varchar(20)	
)
go

create table t2
(
	id int primary key,
	data varchar(20)	
)
go

select * from t1
select * from t2
go

---------------------------
insert into t1 values(1, 'data a')
go

select * from t1
select * from t2
go

-----------------------------
create trigger testTrigger1 on t1 for insert as
	insert into t2
		select id, data from inserted
go

insert into t1 values (2, 'data b')
go

select * from t1
select * from t2
go







