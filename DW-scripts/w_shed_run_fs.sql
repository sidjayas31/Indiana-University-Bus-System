LOAD DATA LOCAL INFILE 'C:\\Users\\Ganesh\\Google Drive\\Courses\\CSCI B 565\\Bus Project\\Data\\intervaldata2014-2015.tsv\\intervaldata2014-2015.tsv' 
INTO TABLE intervaldata_tsv FIELDS TERMINATED BY '\t' LINES TERMINATED BY '\n'
(id,from_id,to_id,time_id,bus_id,route_id,@var1) SET when_time = STR_TO_DATE(@var1,'%Y-%m-%d %k:%i:%s');
create table iubus.intervaldata_tsv (id int(10), from_id int(10), to_id int(10),time_id int(10),bus_id int(10),route_id int(10),when_time timestamp);
drop table intervaldata_tsv;
select * from intervaldata_tsv;
select * from intervaldata_tsv where id = 0;
create index i_br on intervaldata_tsv(bus_id,route_id);
create index i_bus on intervaldata_tsv(bus_id);
create index i_route on intervaldata_tsv(route_id);
create index i_r_id on DBMAP_StopID(`Index`);
delete from intervaldata_tsv where id=0;

create table W_SHED_RUN_FS select a.id,b.`Route ID` 'route_name',substring(b.`Route ID`,1,2) 'route_major',fr.Stop 'from_name',tid.Stop 'to_name',case when a.from_id=a.to_id then a.time_id else 0 end 'dwell_time',
case when a.from_id<>a.to_id then a.time_id else 0 end 'travel_time',
case when a.from_id<>a.to_id then 'Y' else 'N' end 'travel_flg',
a.when_time 'timestmp',date(a.when_time) 'time_day',time(a.when_time) 'time_hour'
from intervaldata_tsv a inner join DBMAP_RouteID b on a.route_id=b.`index`
inner join DBMAP_StopID fr on a.from_id=fr.`Index`
inner join DBMAP_StopID tid on a.to_id=fr.`Index`;

create table W_SHED_RUN_FS1 as select a.id,b.`Route ID` 'route_name',substring(b.`Route ID`,1,2) 'route_major',fr.Stop 'from_name',a.to_id,case when a.from_id=a.to_id then a.time_id else 0 end 'dwell_time',
case when a.from_id<>a.to_id then a.time_id else 0 end 'travel_time',
case when a.from_id<>a.to_id then 'Y' else 'N' end 'travel_flg',
a.when_time 'timestmp',date(a.when_time) 'time_day',time(a.when_time) 'time_hour'
from intervaldata_tsv a left join DBMAP_RouteID b on a.route_id=b.`index`
left join DBMAP_StopID fr on a.from_id=fr.`Index`;
select count(*) from intervaldata_tsv;
select count(*) from W_SHED_RUN_FS1;
create index i_rto on W_SHED_RUN_FS1(to_id);


create table W_SHED_RUN_FS as select a.id,a.route_name,a.route_major,a.from_name,tid.Stop 'to_name',
a.dwell_time,a.travel_time,a.travel_flg,a.timestmp,a.time_day,a.time_hour 
from W_SHED_RUN_FS1 a left join DBMAP_StopID tid on a.to_id=tid.`Index`;

/* Original Data : 1814250, matched data : 1761666 */
drop table W_SHED_RUN_FS1;

inner join DBMAP_StopID tid on a.to_id=fr.`Index`;
select distinct(from_id) from intervaldata_tsv;
select distinct(to_id) from intervaldata_tsv;

select count(*) from W_SHED_RUN_FS;
select * from W_SHED_RUN_FS;
drop table W_SHED_RUN_FS;

select from_name,avg(dwell_time) 'avg_time',hour(timestmp) 'hour_time' from W_SHED_RUN_FS where travel_flg='N' group by from_name,hour_time order by hour_time;
select route_name,from_name,to_name,concat(from_name,concat('~',to_name)) 'fromtostops',avg(travel_time) 'avg_time',hour(timestmp) 'hour_time' from W_SHED_RUN_FS where travel_flg='Y' group by route_name,fromtostops,hour_time order by route_name,hour_time;
select route_name,from_name,to_name,concat(from_name,concat('~',to_name)) 'fromtostops',avg(travel_time) 'avg_time',hour(timestmp) 'hour_time' from W_SHED_RUN_FS where travel_flg='Y' and hour(timestmp)=1 group by route_name,fromtostops,hour_time order by route_name,hour_time;
select * from W_SHED_RUN_FS;