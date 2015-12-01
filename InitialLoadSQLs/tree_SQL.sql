DROP TABLE IT_SPRING_TRIPS;
CREATE TABLE INTER_SPRING_TRIPS
SELECT 
                    x.`schedule name`, 
                    date(x.`date`) dt, 
                    y.`Starting Time`, 
                    y.Inbound, 
                    y.outbound  
                FROM 
                    IU_SPRING_Shifts x, 
                    IU_SPRING_Trips y  
                WHERE 
                    x.`Shift ID`=y.`Shift ID` AND
                    x.`schedule name` like '_-__._' AND
                    x.`schedule name` not like 'F-__._';


DROP TABLE INTER_FIRST_STOP;
CREATE TABLE INTER_FIRST_STOP
SELECT * FROM 
C_SPRING_SCHEDULE t where t.STOP_ORDER=(select min(STOP_ORDER) from C_SPRING_SCHEDULE tt where tt.SCHEDULE_ID=t.SCHEDULE_ID and tt.TRIP_ID=t.TRIP_ID) AND t.SCHEDULE_ID LIKE '_-__._' 
	AND t.SCHEDULE_ID NOT LIKE 'F-__._' and t.STOP_ID is not null;

DROP TABLE INTER_LAST_STOP;
CREATE TABLE INTER_LAST_STOP
SELECT DISTINCT * FROM 
C_SPRING_SCHEDULE t where t.STOP_ORDER=(select max(STOP_ORDER) from C_SPRING_SCHEDULE tt where tt.SCHEDULE_ID=t.SCHEDULE_ID and tt.TRIP_ID=t.TRIP_ID)  AND t.SCHEDULE_ID LIKE '_-__._' 
	AND t.SCHEDULE_ID NOT LIKE 'F-__._'  and t.STOP_ID is not null;






DROP TABLE C_SPRING_SCHEDULE;

CREATE TABLE C_SPRING_SCHEDULE
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`,dbschedule.`STOP_ID` , stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end    `DOW`,MIDPOINT,UP_DOWN, CASE WHEN schedule.`TripID` IS NOT NULL THEN @prev_trip_value:= schedule.`TripID` ELSE @prev_trip_value END	 `TripId`  FROM  (select * from TEMP_DBMAP_SCHEDULE order by Route, TripID, stop_order) dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as `DOW` , cast(TripID as unsigned) TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'M-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` and dbschedule.stop_order=1 JOIN (SELECT @prev_value:=NULL) t JOIN (	SELECT 	@prev_trip_value :=NULL	)ts  JOIN (SELECT @prev_dow_value:=NULL) x ORDER BY `Schedule Id`, TripId, stop_order) u1
UNION 
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end  ,MIDPOINT,UP_DOWN, CASE WHEN schedule.`TripID` IS NOT NULL THEN @prev_trip_value:= schedule.`TripID` ELSE @prev_trip_value END	 `TripId`   FROM  (select * from TEMP_DBMAP_SCHEDULE order by Route, TripID, stop_order) dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW,  cast(TripID as unsigned) TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'T-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` and dbschedule.stop_order=1 JOIN (SELECT @prev_value:=NULL) t JOIN (	SELECT 	@prev_trip_value :=NULL	)ts  JOIN (SELECT @prev_dow_value:=NULL) x ORDER BY `Schedule Id`, TripId, stop_order) u2
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end  ,MIDPOINT,UP_DOWN, CASE WHEN schedule.`TripID` IS NOT NULL THEN @prev_trip_value:= schedule.`TripID` ELSE @prev_trip_value END	 `TripId`  FROM  (select * from TEMP_DBMAP_SCHEDULE order by Route, TripID, stop_order) dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW,  cast(TripID as unsigned) TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'W-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` and dbschedule.stop_order=1 JOIN (SELECT @prev_value:=NULL) t JOIN (	SELECT 	@prev_trip_value :=NULL	)ts  JOIN (SELECT @prev_dow_value:=NULL) x ORDER BY `Schedule Id`, TripId, stop_order) u3
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end,MIDPOINT,UP_DOWN, CASE WHEN schedule.`TripID` IS NOT NULL THEN @prev_trip_value:= schedule.`TripID` ELSE @prev_trip_value END	 `TripId`    FROM  (select * from TEMP_DBMAP_SCHEDULE order by Route, TripID, stop_order) dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW,  cast(TripID as unsigned) TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'R-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` and dbschedule.stop_order=1 JOIN (SELECT @prev_value:=NULL) t JOIN (	SELECT 	@prev_trip_value :=NULL	)ts  JOIN (SELECT @prev_dow_value:=NULL) x ORDER BY `Schedule Id`, TripId, stop_order) u4
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` ,`Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end ,MIDPOINT,UP_DOWN, CASE WHEN schedule.`TripID` IS NOT NULL THEN @prev_trip_value:= schedule.`TripID` ELSE @prev_trip_value END	 `TripId`   FROM  (select * from TEMP_DBMAP_SCHEDULE order by Route, TripID, stop_order) dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW,  cast(TripID as unsigned) TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'F-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` and dbschedule.stop_order=1 JOIN (SELECT @prev_value:=NULL) t JOIN (	SELECT 	@prev_trip_value :=NULL	)ts  JOIN (SELECT @prev_dow_value:=NULL) x ORDER BY `Schedule Id`, TripId, stop_order) u5;




ALTER TABLE `C_SPRING_SCHEDULE` CHANGE COLUMN `Schedule Id` `SCHEDULE_ID` mediumtext NULL
;
ALTER TABLE `C_SPRING_SCHEDULE` CHANGE COLUMN `Time` `SCHEDULE_TIME` time NULL
;	
ALTER TABLE `C_SPRING_SCHEDULE` CHANGE COLUMN `stop_order` `STOP_ORDER` double NULL
;
ALTER TABLE `C_SPRING_SCHEDULE` CHANGE COLUMN `TripId` `TRIP_ID` int NULL
;
