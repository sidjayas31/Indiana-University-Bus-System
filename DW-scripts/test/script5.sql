select count(*) from (select id from W_RUNS_F group by id having count(id)>1)a;
create table W_RUNS_CT as select * from W_RUNS_F group by id having count(*) >1;
drop table W_RUNS_CT;
drop table W_RUNS_F;
drop table W_RUNS_F_BKP;
delete from W_RUNS_F where id in (select id from W_RUNS_CT);
create table W_RUNS_F_BKP as select * from W_RUNS_F;
select * from W_RUNS_F;
create index i_id on W_RUNS_F(id,integration_key);
create index i_id1 on W_RUNS_F(id);
create index i_id2 on W_RUNS_F(integration_key);
select * from W_SHED_D;

/* */
ALTER TABLE `iubus`.`W_RUNS_F` 
CHANGE COLUMN `id` `id` VARCHAR(35) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `integration_key` `integration_key` VARCHAR(35) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT '' ;
/* */
ALTER TABLE `iubus`.`W_SHED_D` 
CHANGE COLUMN `integration_key` `integration_key` VARCHAR(35) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT '' ;
create index i_id on W_SHED_D(integration_key);
/* */
ALTER TABLE `iubus`.`S_SPRING_RUNS_DEMO_1` 
CHANGE COLUMN `integration_key` `integration_key` VARCHAR(35) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT '' ;
ALTER TABLE `iubus`.`S_SPRING_RUNS_DEMO_1` 
CHANGE COLUMN `stop_order` `stop_order` INT NULL DEFAULT NULL COMMENT '' ;
create index i_id on S_SPRING_RUNS_DEMO_1(integration_key);
create index i_cd on S_SPRING_RUNS_DEMO_1(travel_flag,stop_order);

select id,`from` to_name ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=1;
