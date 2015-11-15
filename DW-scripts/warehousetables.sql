/* The table has 354 as a row value, whereas this should have a valid route*/
select distinct(route_id) from DBMAP_IntervalData;
/* Replacing corresponding value as route_id */
update DBMAP_IntervalData set Route_ID = 'A Route M-R' where route_id = 354; 

/* Test stuff */
select * from DBMAP_StopID;
select * from DBMAP_RouteID;
select * from DBMAP_ScheduleData;
select * from DBMAP_IntervalData;
select * from DBMAP_WorkRecord a where bus=642;

/* create the main intermediate table */
create table route_run_temp as select b.Stop as 'from_stp',a.to 'to_stp',
case when b.stop=a.to then a.time else 0 end 'dwell_time',
case when b.stop<>a.to then a.time else 0 end 'travel_time',
a.bus_id,a.route_id,a.when 
from DBMAP_IntervalData a inner join DBMAP_StopID b on a.from=b.id
order by a.route_id,a.bus_id,a.when;
/* verify the above table has same row as the original interval table */
select count(*) from DBMAP_IntervalData;

/*Testing time test formats */
select time(a.when) from DBMAP_IntervalData a;
select date(b.Date) from DBMAP_WorkRecord b;

/*verify the temp table */
select * from route_run_temp;

/* Try to associate each run with the schedule id */
/* The issue here is time between the shifts cover one or more drivers, hence cannot identify the exact schedule id in which the bus is running */

select b.route 'schedule_id',a.bus_id, a.route_id,a.from_stp,a.to_stp,a.dwell_time,a.travel_time,b.date 'date_cl',time(a.when) 'time_cl' from route_run_temp a inner join DBMAP_WorkRecord b on a.BUS_ID=b.bus and date(a.when)=date(b.Date) and time(a.when) between b.`clock in` and b.`clock out`;
