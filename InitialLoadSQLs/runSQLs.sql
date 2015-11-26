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

select * from (select * from SPRING_RUNS_TEMP where Route like '_-A_.%'order by `Date`, Route,bus_id, `when_Time`)a UNION
select * from (select * from SPRING_RUNS_TEMP where Route like '_-B_.%'order by `Date`, Route,bus_id, `when_Time`)b UNION
select * from (select * from SPRING_RUNS_TEMP where Route like '_-E_.%'order by `Date`, Route,bus_id, `when_Time`)c UNION
select * from (select * from SPRING_RUNS_TEMP where Route like '_-X_.%'order by `Date`, Route,bus_id, `when_Time`)d;

select str_to_date(subtime(date_format(now(),'%h:%i:%S %p'),'2:00:00'),'%h:%i:%S');

select date_format(now(),'%h:%i:%S %p')