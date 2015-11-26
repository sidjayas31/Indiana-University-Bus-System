create table spring_runs_det as
select a.*,c.stop 'from_name',b.stop 'to_name' from (SELECT ival.*,wk.route,substring(wk.route,3,2) 'route_major',date(ival.when_time) 'time_date',time(ival.when_time) 'time_hour',
case when ival.from_id=ival.to_id then ival.time_id else 0 end 'dwell_time',
case when ival.from_id<>ival.to_id then ival.time_id else 0 end 'travel_time',
case when ival.from_id=ival.to_id then 'N' else 'Y' end 'travel_flg'
FROM (	SELECT i.from_id, to_id,time_id, bus_id,r.`Route ID` 'route_id', when_time 
		FROM DBMAP_IntervalData i , DBMAP_RouteID r 
		WHERE i.route_id=FLOOR(r.Index)
	)
	ival left join (select * from DBMAP_WorkRecord where `Shift Type` ='Standard'
	)wk 
on (wk.Bus=ival.bus_id  
and date_format(wk.`Date`,'%Y/%m/%d') = date_format(ival.when_time,'%Y/%m/%d')AND ival.when_time BETWEEN str_to_date(concat(wk.`Date`,wk.`Clock In`),'%Y-%m-%d%k:%i:%s')
	AND str_to_date(concat(wk.`Date`,wk.`Clock Out`),'%Y-%m-%d%k:%i:%s')) where route is not null order by bus_id,route,when_time) a 
    left join DBMAP_StopID b on a.to_id=b.id
    left join DBMAP_StopID c on a.from_id=c.id order by route_major,bus_id,when_time;
    
    
    drop table spring_runs_det;
    
    select count(*) from spring_runs_det;
select str_to_date(concat(`Date`,`Clock In`),'%Y-%m-%d%k:%i:%s'),concat(`Date`,`Clock In`) from DBMAP_WorkRecord;