SELECT * FROM iubus.S_SPRING_RUNS_DEMO_1;
create table S_SPRING_RUNS_DEMO_1_BKP as select * from S_SPRING_RUNS_DEMO_1;
update S_SPRING_RUNS_DEMO_1 set stop_order=stop_order+1;

create index i_id on S_SPRING_RUNS_DEMO_1(integration_key);