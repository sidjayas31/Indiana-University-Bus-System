CREATE TABLE SPRING_RUNS_TEMP 
SELECT ival.*,wk.*  
FROM (	SELECT i.from_id, to_id,time_id, bus_id,r.`Route ID`, when_time 
		FROM DBMAP_IntervalData i , DBMAP_RouteID r 
		WHERE i.route_id=FLOOR(r.Index) 
			AND DATE(when_time) =str_to_date('2015/01/13','%Y/%m/%d') 
	)
	ival 
		LEFT JOIN (	SELECT * 
					FROM DBMAP_WorkRecord 
					WHERE `Date` = str_to_date('2015/01/13','%Y/%m/%d') 
		)
		wk 
		ON (wk.Bus=ival.bus_id 
		AND date_format(wk.`Date`,'%Y/%m/%d') = date_format(ival.when_time,
		'%Y/%m/%d')
		AND subtime(date_format(when_time,'%H:%i:%S'),'4:00:00' ) > subtime(wk.
		`Clock In`,'4:00:00') 
		AND subtime(date_format(when_time,'%H:%i:%S'),'4:00:00' ) < subtime( wk.
		`Clock Out`,'4:00:00') 
		AND wk.`Clock In` = (	SELECT MAX(wk1.`Clock In`) 
								FROM DBMAP_WorkRecord wk1 
								WHERE wk1.`Date`= wk.`Date` 
									AND wk.Bus=wk1.Bus 
									AND subtime(date_format(when_time,'%H:%i:%S'
									),'4:00:00' ) > subtime(wk1.`Clock In`,
									'4:00:00') 
									AND subtime(date_format(when_time,'%H:%i:%S'
									),'4:00:00' ) < subtime( wk1.`Clock Out`,
									'4:00:00')) 
		);
CREATE TABLE S_SPRING_RUNS_DEMO_1
SELECT Route, `Date`, TripID, from_id,to_id, time_id as sec_time,when_time, stop_order,bus_id , 
	concat(DATE(when_time),concat('~',concat(SUBSTRING(Route,1,1),concat('~',
	concat(TripID,concat('~',Route)))))) 'id', concat(SUBSTRING(Route,1,1),
	concat('~',concat(TripID,concat('~',Route)))) 'integration_key' ,
	case when from_id = to_id then 0 else 1 end travel_flag
FROM (	SELECT *, 
			@row_num := IF(date(when_time) !=@prev_date or @prev_route!= `Route`,@row_num:=0,IF( `to_id` = 67 
			AND `from_id` =67 , 
			@row_num+1, 
			@row_num)) TripID, IF(`to_id` = 67 
			AND `from_id` =67 , 
			@stop_order:=0, IF (`from_id`=`to_id`, 
			@stop_order:= 
			@stop_order +1, 
			@stop_order:= 
			@stop_order)) stop_order ,
			@prev_date:=date(when_time),
			@prev_route:=`Route`
		FROM SPRING_RUNS_TEMP 
			JOIN (	SELECT 
						@row_num :=1 
			)
			r 
			JOIN (	SELECT 
						@stop_order:=0 
			)
			s 
		WHERE Route LIKE '_-A_.%' 
		ORDER BY `Date`, Route,bus_id, `when_Time` 
	)
	a 
UNION 
SELECT Route, `Date`, TripID, from_id,to_id, time_id as sec_time,when_time, stop_order,bus_id , 
	concat(DATE(when_time),concat('~',concat(SUBSTRING(Route,1,1),concat('~',
	concat(TripID,concat('~',Route)))))) 'id', concat(SUBSTRING(Route,1,1),
	concat('~',concat(TripID,concat('~',Route)))) 'integration_key' ,
	case when from_id = to_id then 0 else 1 end travel_flag 
FROM (	SELECT *, 
			IF(date(when_time) !=@prev_date or @prev_route!= `Route`,@row_num:=0,@row_num := IF(`to_id` = 24 
			AND `from_id` =24 , 
			@row_num+1, 
			@row_num)) TripID, IF(`to_id` = 24 
			AND `from_id` =24 , 
			@stop_order:=0, IF (`from_id`=`to_id`, 
			@stop_order:= 
			@stop_order +1, 
			@stop_order:= 
			@stop_order)) stop_order ,
			@prev_date:=date(when_time),
			@prev_route:=`Route`
		FROM SPRING_RUNS_TEMP 
			JOIN (	SELECT 
						@row_num :=1 
			)
			r 
			JOIN (	SELECT 
						@stop_order:=0 
			)
			s 
		WHERE Route LIKE '_-B_.%' 
		ORDER BY `Date`, Route,bus_id, `when_Time` 
	)
	b 
UNION 
SELECT Route, `Date`, TripID, from_id,to_id,time_id as sec_time, when_time, stop_order,bus_id , 
	concat(DATE(when_time),concat('~',concat(SUBSTRING(Route,1,1),concat('~',
	concat(TripID,concat('~',Route)))))) 'id', concat(SUBSTRING(Route,1,1),
	concat('~',concat(TripID,concat('~',Route)))) 'integration_key'  ,
	case when from_id = to_id then 0 else 1 end travel_flag
FROM (	SELECT *, 
			IF(date(when_time) !=@prev_date or @prev_route!= `Route`,@row_num:=0,@row_num := IF(`to_id` = 62 
			AND `from_id` =62 , 
			@row_num+1, 
			@row_num) )TripID, IF(`to_id` = 62 
			AND `from_id` =62 , 
			@stop_order:=0, IF (`from_id`=`to_id`, 
			@stop_order:= 
			@stop_order +1, 
			@stop_order:= 
			@stop_order)) stop_order ,
			@prev_date:=date(when_time),
			@prev_route:=`Route`
		FROM SPRING_RUNS_TEMP 
			JOIN (	SELECT 
						@row_num :=1 
			)
			r 
			JOIN (	SELECT 
						@stop_order:=0 
			)
			s 
		WHERE Route LIKE '_-E_.%' 
		ORDER BY `Date`, Route,bus_id, `when_Time` 
	)
	C 
UNION 
SELECT Route, `Date`, TripID, from_id,to_id, time_id as sec_time,when_time, stop_order,bus_id , 
	concat(DATE(when_time),concat('~',concat(SUBSTRING(Route,1,1),concat('~',
	concat(TripID,concat('~',Route)))))) 'id', concat(SUBSTRING(Route,1,1),
	concat('~',concat(TripID,concat('~',Route)))) 'integration_key'  ,
	case when from_id = to_id then 0 else 1 end travel_flag
FROM (	SELECT *, 
			IF(date(when_time) !=@prev_date or @prev_route!= `Route`,@row_num:=0,@row_num := IF(`to_id` = 76 
			AND `from_id` =76 , 
			@row_num+1, 
			@row_num)) TripID, IF(`to_id` = 76 
			AND `from_id` =76 , 
			@stop_order:=0, IF (`from_id`=`to_id`, 
			@stop_order:= 
			@stop_order +1, 
			@stop_order:= 
			@stop_order)) stop_order ,
			@prev_date:=date(when_time),
			@prev_route:=`Route`
			
		FROM SPRING_RUNS_TEMP 
			JOIN (	SELECT 
						@row_num :=1 
			)
			r 
			JOIN (	SELECT 
						@stop_order:=0 
			)
			s 
		WHERE Route LIKE '_-X_.%' 
		ORDER BY `Date`, Route,bus_id, `when_Time` 
	)
	d;


create  or replace view S_SPRING_RUNS_WITH_STOP as select s.*, t1.Stop as `from`, t2.Stop as `to` from S_SPRING_RUNS_DEMO s, DBMAP_StopID t1, DBMAP_StopID t2 where
s.from_id = t1.ID and s.to_id=t2.ID;


select str_to_date(subtime(date_format(now(),'%h:%i:%S %p'),'2:00:00'),'%h:%i:%S');

select date_format(now(),'%h:%i:%S %p')