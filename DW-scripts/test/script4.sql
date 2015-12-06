select * from information_schema.processlist;

select * from W_RUNS_F where substr(Route,1,1) in ('M','T','W','R') and id not in 
(select id from W_RUNS_F group by id having count(id)>1);
create index i_id on W_RUNS_F(id);
drop table W_RUNS_F;
select * from W_RUNS_F;
select count(*) from spring_runs_route_a;
