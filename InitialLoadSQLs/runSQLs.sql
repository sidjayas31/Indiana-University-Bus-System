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

CREATE TABLE S_SPRING_RUNS
select Route, `Date`, TripID, from_id,to_id, when_time, stop_order,bus_id from (select *,@row_num := IF(`to_id` = 39 and `from_id` =39 ,@row_num+1,@row_num) TripID, IF(`to_id` = 39  and `from_id` =39 ,@stop_order:=0,@stop_order:=@stop_order +1) stop_order  from SPRING_RUNS_TEMP JOIN ( SELECT @row_num :=0)r JOIN (SELECT @stop_order:=0)s where Route like '_-A_.%'order by `Date`, Route,bus_id, `when_Time`)a UNION
select Route, `Date`, TripID, from_id,to_id, when_time, stop_order,bus_id from (select *,@row_num := IF(`to_id` = 25 and `from_id` =25 ,@row_num+1,@row_num) TripID, IF(`to_id` = 25  and `from_id` =25 ,@stop_order:=0,@stop_order:=@stop_order +1) stop_order  from SPRING_RUNS_TEMP JOIN ( SELECT @row_num :=0)r JOIN (SELECT @stop_order:=0)s where Route like '_-B_.%'order by `Date`, Route,bus_id, `when_Time`)b UNION
select Route, `Date`, TripID, from_id,to_id, when_time, stop_order,bus_id from (select *,@row_num := IF(`to_id` = 48 and `from_id` =48 ,@row_num+1,@row_num) TripID, IF(`to_id` = 48  and `from_id` =48 ,@stop_order:=0,@stop_order:=@stop_order +1) stop_order   from SPRING_RUNS_TEMP JOIN ( SELECT @row_num :=0)r JOIN (SELECT @stop_order:=0)s where Route like '_-E_.%'order by `Date`, Route,bus_id, `when_Time`)c UNION
select Route, `Date`, TripID, from_id,to_id, when_time, stop_order,bus_id from (select *,@row_num := IF(`to_id` = 68 and `from_id` =68 ,@row_num+1,@row_num) TripID, IF(`to_id` = 68  and `from_id` =68 ,@stop_order:=0,@stop_order:=@stop_order +1) stop_order   from SPRING_RUNS_TEMP JOIN ( SELECT @row_num :=0)r JOIN (SELECT @stop_order:=0)s where Route like '_-X_.%'order by `Date`, Route,bus_id, `when_Time`)d;







select str_to_date(subtime(date_format(now(),'%h:%i:%S %p'),'2:00:00'),'%h:%i:%S');

select date_format(now(),'%h:%i:%S %p')