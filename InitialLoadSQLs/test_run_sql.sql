
SELECT COUNT(1) , `Date` 
FROM DBMAP_WorkRecord 
WHERE `Date`=DATE('2015/01/13') ;;
SELECT COUNT(1), DATE(when_time) 
FROM DBMAP_IntervalData 
WHERE DATE(when_time) BETWEEN DATE('2015/01/13') 
	AND DATE('2015/04/30') 
GROUP BY DATE(when_time);

SELECT count(1)
FROM (	SELECT i.from_id, to_id,time_id, bus_id,r.`Route ID`, when_time 
		FROM DBMAP_IntervalData i , DBMAP_RouteID r 
		WHERE i.route_id=FLOOR(r.Index) 
			AND DATE(when_time) BETWEEN DATE('2015/01/13') 
	AND DATE('2015/04/30')
	)
	ival left join (select * from DBMAP_WorkRecord where
	`Date` BETWEEN DATE('2015/01/13') 
	AND DATE('2015/04/30'))wk 
on (wk.Bus=ival.bus_id  
and wk.`Date` = date(ival.when_time)AND TIME(when_time)BETWEEN TIME(`Clock In`) 
	AND TIME(`Clock Out`) ) 
    ;
	
ORDER BY DOW, RouteBus, Shift, `when_time`;
