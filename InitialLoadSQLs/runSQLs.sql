SELECT *
FROM (	SELECT i.from_id, to_id,time_id, bus_id,r.`Route ID`, when_time 
		FROM DBMAP_IntervalData i , DBMAP_RouteID r 
		WHERE i.route_id=FLOOR(r.Index) 
			AND DATE(when_time) =str_to_date('2015/01/13','%Y/%m/%d')  
	)
	ival left join (select * from DBMAP_WorkRecord where
	`Date` = str_to_date('2015/01/13','%Y/%m/%d') 
	)wk 
on (wk.Bus=ival.bus_id  
and date_format(wk.`Date`,'%Y/%m/%d') = date_format(ival.when_time,'%Y/%m/%d')AND subtime(date_format(when_time,'%h:%i:%S %p'),'4:00:00' ) BETWEEN subtime(`Clock In`,'4:00:00')
	AND subtime(`Clock Out`,'4:00:00') ) where wk.bus is null
    ;



select str_to_date(subtime(date_format(now(),'%h:%i:%S %p'),'2:00:00'),'%h:%i:%S');

select date_format(now(),'%h:%i:%S %p')