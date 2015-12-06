select * from information_schema.processlist;
select STOP1_TIME,stop2_time from W_RUN_F where substr(Route,1,1) in ('M','T','W','R') and STOP1_TIME is not null
and STOP1_TIME between addtime(stop2_time,'-00:15:00') and addtime(stop2_time,'00:15:00');

select id from W_RUN_F where substr(Route,1,1) in ('M','T','W','R') and STOP1_TIME is not null
and STOP1_TIME between addtime(stop2_time,'-00:15:00') and addtime(stop2_time,'00:15:00');

(select id from W_RUN_F where substr(Route,1,1) in ('M','T','W','R') and STOP1_TIME is not null
and STOP1_TIME between addtime(stop2_time,'-00:15:00') and addtime(stop2_time,'00:15:00'));

select count(*) from W_RUN_F where STOP1_TIME is null;
select count(*) from W_RUN_F where STOP1_TIME between addtime(stop2_time,'-00:15:00') and addtime(stop2_time,'00:15:00');

-- Select dataset which has 1st and 2nd stop distance  < 15 mins or 2 and 3rd stop distance is < 15 mins
create table W_RUN_F_MFS select * from W_RUN_F a where (substr(a.Route,1,1) in ('M','T','W','R') and 
a.STOP2_TIME between addtime(a.stop3_time,'-00:15:00') and addtime(a.stop3_time,'00:15:00')) 
or (substr(Route,1,1) in ('M','T','W','R') and STOP1_TIME is not null
and STOP1_TIME between addtime(stop2_time,'-00:15:00') and addtime(stop2_time,'00:15:00'))
and id not in (select id from W_RUN_F group by id having count(id)>1);

create table W_RUN_F_BKP as select * from W_RUN_F;


ALTER TABLE `iubus`.`W_RUN_F` 
CHANGE COLUMN `id` `id` VARCHAR(35) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT '' ,
CHANGE COLUMN `integration_key` `integration_key` VARCHAR(35) CHARACTER SET 'utf8' NULL DEFAULT NULL COMMENT '' ;

create index i_id on W_RUN_F(id,integration_key);
create index i_id1 on W_RUN_F(id);
create index i_id2 on W_RUN_F(integration_key);
create index i_id on W_RUN_F_MFS(id,integration_key);
create index i_id1 on W_RUN_F_MFS(id);
create index i_id2 on W_RUN_F_MFS(integration_key);

ALTER TABLE `iubus`.`W_RUN_F_MFS` 
ADD COLUMN `RECON_KEY` VARCHAR(35) NULL DEFAULT NULL COMMENT '' AFTER `INTEGRATION_KEY`;

select * from W_SHED_D where substr(schedule_id,3,1)='X';

select b.integration_key 'shed_key',a.integration_key 'run_key' from W_RUN_F_MFS a left join
W_SHED_D b on
a.Route=b.SCHEDULE_ID and (
(a.STOP1_TIME between addtime(b.stop1_time,'-00:10:00') and addtime(b.stop1_time,'00:10:00'))
or
(a.stop2_time between addtime(b.stop2_time,'-00:10:00') and addtime(b.stop2_time,'00:10:00'))
or
(a.stop3_time between addtime(b.stop3_time,'-00:10:00') and addtime(b.stop3_time,'00:10:00')));

update W_RUN_F_MFS a, 
(select b.integration_key 'shed_key',a.id 'run_key' from W_RUN_F_MFS a left join
W_SHED_D b on
a.Route=b.SCHEDULE_ID and (
(a.STOP1_TIME between addtime(b.stop1_time,'-00:10:00') and addtime(b.stop1_time,'00:10:00'))
or
(a.stop2_time between addtime(b.stop2_time,'-00:10:00') and addtime(b.stop2_time,'00:10:00'))
or
(a.stop3_time between addtime(b.stop3_time,'-00:10:00') and addtime(b.stop3_time,'00:10:00')))) b
set a.RECON_KEY=b.shed_key where a.id=b.run_key;

select * from W_SHED_D;
select * from W_RUN_F_MFS where substr(recon_key,7,1)='E';
select * from W_RUN_F_MFS where recon_key is not null and substr(recon_key,7,1)='B';

drop table W_ROUTE_A_REP_S;
create table W_ROUTE_A_REP_S as select * from (
select a.time_date,monthname(a.time_date) 'MONTH_NAME',a.route,a.trip_id,hour(b.stop1_time) 'HR_DAY',
b.stop1_name 'SHED1_NAME', b.stop1_time 'SHED1_TIME',
a.stop1_name,a.stop1_time,time_to_sec(timediff(b.stop1_time,a.stop1_time)) 'STP1_SEC',timediff(b.stop1_time,a.stop1_time) 'STP1_MIN',
b.stop2_name 'SHED2_NAME', b.stop2_time 'SHED2_TIME',
a.stop6_name 'STOP2_NAME',a.stop6_time 'STOP2_TIME',time_to_sec(timediff(b.stop2_time,a.stop6_time)) 'STP2_SEC',timediff(b.stop2_time,a.stop6_time) 'STP2_MIN',
b.stop3_name 'SHED3_NAME', b.stop3_time 'SHED3_TIME',
a.stop8_name 'STOP3_NAME',a.stop8_time 'STOP3_TIME',time_to_sec(timediff(b.stop3_time,a.stop8_time)) 'STP3_SEC',timediff(b.stop3_time,a.stop8_time) 'STP3_MIN',
b.stop4_name 'SHED4_NAME', b.stop4_time 'SHED4_TIME',
a.stop12_name 'STOP4_NAME',a.stop12_time 'STOP4_TIME',time_to_sec(timediff(b.stop4_time,a.stop12_time)) 'STP4_SEC',timediff(b.stop4_time,a.stop12_time) 'STP4_MIN',
b.stop5_name 'SHED5_NAME', b.stop5_time 'SHED5_TIME',
a.stop19_name 'STOP5_NAME',a.stop19_time 'STOP5_TIME',time_to_sec(timediff(b.stop5_time,a.stop19_time)) 'STP5_SEC',timediff(b.stop5_time,a.stop19_time) 'STP5_MIN'
from (select * from W_RUN_F_MFS where recon_key is not null and substr(recon_key,7,1)='A') a
left join W_SHED_D b
on a.recon_key=b.integration_key)a where
SHED1_NAME=stop1_name and
SHED2_NAME=stop2_name and
SHED3_NAME=stop3_name and
SHED4_NAME=stop4_name;

select time_date,month_name,route,trip_id,hr_day,SHED1_NAME 'SHED_NAME',SHED1_TIME 'SHED_TIME',stop1_name 'STOP_NAME',stop1_time 'STOP_TIME', STP1_SEC 'STP_SEC',STP1_MIN 'STP_MIN' from W_ROUTE_A_REP_S
UNION
select time_date,month_name,route,trip_id,hr_day,SHED2_NAME 'SHED_NAME',SHED2_TIME 'SHED_TIME',stop2_name 'STOP_NAME',stop2_time 'STOP_TIME', STP2_SEC 'STP_SEC',STP2_MIN 'STP_MIN' from W_ROUTE_A_REP_S
UNION
select time_date,month_name,route,trip_id,hr_day,SHED3_NAME 'SHED_NAME',SHED3_TIME 'SHED_TIME',stop3_name 'STOP_NAME',stop3_time 'STOP_TIME', STP3_SEC 'STP_SEC',STP3_MIN 'STP_MIN' from W_ROUTE_A_REP_S
UNION
select time_date,month_name,route,trip_id,hr_day,SHED4_NAME 'SHED_NAME',SHED4_TIME 'SHED_TIME',stop4_name 'STOP_NAME',stop4_time 'STOP_TIME', STP4_SEC 'STP_SEC',STP4_MIN 'STP_MIN' from W_ROUTE_A_REP_S
UNION
select time_date,month_name,route,trip_id,hr_day,SHED5_NAME 'SHED_NAME',SHED5_TIME 'SHED_TIME',stop5_name 'STOP_NAME',stop5_time 'STOP_TIME', STP5_SEC 'STP_SEC',STP5_MIN 'STP_MIN' from W_ROUTE_A_REP_S;

drop table W_ROUTE_B_REP_S;
create table W_ROUTE_B_REP_S as 
select * from (
select a.time_date,monthname(a.time_date) 'MONTH_NAME',a.route,a.trip_id,hour(b.stop1_time) 'HR_DAY',
b.stop1_name 'SHED1_NAME', b.stop1_time 'SHED1_TIME',
a.stop1_name,a.stop1_time,time_to_sec(timediff(b.stop1_time,a.stop1_time)) 'STP1_SEC',timediff(b.stop1_time,a.stop1_time) 'STP1_MIN',
b.stop2_name 'SHED2_NAME', b.stop2_time 'SHED2_TIME',
a.stop8_name 'STOP2_NAME',a.stop8_time 'STOP2_TIME',time_to_sec(timediff(b.stop2_time,a.stop8_time)) 'STP2_SEC',timediff(b.stop2_time,a.stop8_time) 'STP2_MIN',
b.stop3_name 'SHED3_NAME', b.stop3_time 'SHED3_TIME',
a.stop10_name 'STOP3_NAME',a.stop10_time 'STOP3_TIME',time_to_sec(timediff(b.stop3_time,a.stop10_time)) 'STP3_SEC',timediff(b.stop3_time,a.stop10_time) 'STP3_MIN',
b.stop4_name 'SHED4_NAME', b.stop4_time 'SHED4_TIME',
a.stop14_name 'STOP4_NAME',a.stop14_time 'STOP4_TIME',time_to_sec(timediff(b.stop4_time,a.stop14_time)) 'STP4_SEC',timediff(b.stop4_time,a.stop14_time) 'STP4_MIN',
b.stop5_name 'SHED5_NAME', b.stop5_time 'SHED5_TIME',
a.stop21_name 'STOP5_NAME',a.stop21_time 'STOP5_TIME',time_to_sec(timediff(b.stop5_time,a.stop21_time)) 'STP5_SEC',timediff(b.stop5_time,a.stop21_time) 'STP5_MIN'
from (select * from W_RUN_F_MFS where recon_key is not null and substr(recon_key,7,1)='B') a
left join W_SHED_D b
on a.recon_key=b.integration_key)a where
stop1_name like 'Fis%' and
SHED2_NAME=stop2_name;

select * from W_ROUTE_B_REP_S;


create table W_ROUTE_E_REP_S as select * from (
select a.time_date,monthname(a.time_date) 'MONTH_NAME',a.route,a.trip_id,hour(b.stop1_time) 'HR_DAY',
b.stop1_name 'SHED1_NAME', b.stop1_time 'SHED1_TIME',
a.stop1_name,a.stop1_time,time_to_sec(timediff(b.stop1_time,a.stop1_time)) 'STP1_SEC',timediff(b.stop1_time,a.stop1_time) 'STP1_MIN',
b.stop2_name 'SHED2_NAME', b.stop2_time 'SHED2_TIME',
a.stop6_name 'STOP2_NAME',a.stop5_time 'STOP2_TIME',time_to_sec(timediff(b.stop2_time,a.stop5_time)) 'STP2_SEC',timediff(b.stop2_time,a.stop5_time) 'STP2_MIN',
b.stop3_name 'SHED3_NAME', b.stop3_time 'SHED3_TIME',
a.stop7_name 'STOP3_NAME',a.stop7_time 'STOP3_TIME',time_to_sec(timediff(b.stop3_time,a.stop7_time)) 'STP3_SEC',timediff(b.stop3_time,a.stop7_time) 'STP3_MIN',
b.stop4_name 'SHED4_NAME', b.stop4_time 'SHED4_TIME',
a.stop9_name 'STOP4_NAME',a.stop9_time 'STOP4_TIME',time_to_sec(timediff(b.stop4_time,a.stop9_time)) 'STP4_SEC',timediff(b.stop4_time,a.stop9_time) 'STP4_MIN',
b.stop5_name 'SHED5_NAME', b.stop5_time 'SHED5_TIME',
a.stop13_name 'STOP5_NAME',a.stop13_time 'STOP5_TIME',time_to_sec(timediff(b.stop5_time,a.stop13_time)) 'STP5_SEC',timediff(b.stop5_time,a.stop13_time) 'STP5_MIN',
b.stop6_name 'SHED6_NAME', b.stop6_time 'SHED6_TIME',
a.stop16_name 'STOP6_NAME',a.stop16_time 'STOP6_TIME',time_to_sec(timediff(b.stop6_time,a.stop16_time)) 'STP6_SEC',timediff(b.stop6_time,a.stop16_time) 'STP6_MIN'
from (select * from W_RUN_F_MFS where recon_key is not null and substr(recon_key,7,1)='E') a
left join W_SHED_D b
on a.recon_key=b.integration_key)a where
stop1_name like 'Evermann%';

create table W_ROUTE_X_REP_S as ;select * from (
select a.time_date,monthname(a.time_date) 'MONTH_NAME',a.route,a.trip_id,hour(b.stop1_time) 'HR_DAY',
b.stop1_name 'SHED1_NAME', b.stop1_time 'SHED1_TIME',
a.stop1_name,a.stop1_time,time_to_sec(timediff(b.stop1_time,a.stop1_time)) 'STP1_SEC',timediff(b.stop1_time,a.stop1_time) 'STP1_MIN',
b.stop2_name 'SHED2_NAME', b.stop2_time 'SHED2_TIME',
a.stop6_name 'STOP2_NAME',a.stop5_time 'STOP2_TIME',time_to_sec(timediff(b.stop2_time,a.stop5_time)) 'STP2_SEC',timediff(b.stop2_time,a.stop5_time) 'STP2_MIN',
b.stop3_name 'SHED3_NAME', b.stop3_time 'SHED3_TIME',
a.stop7_name 'STOP3_NAME',a.stop7_time 'STOP3_TIME',time_to_sec(timediff(b.stop3_time,a.stop7_time)) 'STP3_SEC',timediff(b.stop3_time,a.stop7_time) 'STP3_MIN',
b.stop4_name 'SHED4_NAME', b.stop4_time 'SHED4_TIME',
a.stop9_name 'STOP4_NAME',a.stop9_time 'STOP4_TIME',time_to_sec(timediff(b.stop4_time,a.stop9_time)) 'STP4_SEC',timediff(b.stop4_time,a.stop9_time) 'STP4_MIN',
b.stop5_name 'SHED5_NAME', b.stop5_time 'SHED5_TIME',
a.stop13_name 'STOP5_NAME',a.stop13_time 'STOP5_TIME',time_to_sec(timediff(b.stop5_time,a.stop13_time)) 'STP5_SEC',timediff(b.stop5_time,a.stop13_time) 'STP5_MIN',
b.stop6_name 'SHED6_NAME', b.stop6_time 'SHED6_TIME',
a.stop16_name 'STOP6_NAME',a.stop16_time 'STOP6_TIME',time_to_sec(timediff(b.stop6_time,a.stop16_time)) 'STP6_SEC',timediff(b.stop6_time,a.stop16_time) 'STP6_MIN'
from (select * from W_RUN_F_MFS where recon_key is not null and substr(recon_key,7,1)='E') a
left join W_SHED_D b
on a.recon_key=b.integration_key)a where
stop1_name like 'Evermann%';


