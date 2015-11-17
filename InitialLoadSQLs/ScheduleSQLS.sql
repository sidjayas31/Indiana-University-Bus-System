-- SPRING
CREATE TABLE TEMP_SPRING_Trip_Schedule
select @row_num := IF(@prev_value=`Schedule ID`,@row_num+1,1) AS TripID , `Schedule ID`, `Start Times`,`Schedule Key`,@prev_value := `Schedule ID`  from IU_SPRING_Schedules JOIN    (SELECT @row_num := 0) r order by `Schedule ID` ,`Start Times`

CREATE VIEW SCHEDULE_WITH_COMP_RID as select *, substr(substr(`Schedule Id`,LENGTH(`Schedule Id`) - LOCATE('-', REVERSE(`Schedule Id`))+2),1 ,LOCATE ('.',substr(`Schedule Id`,LENGTH(`Schedule Id`) - LOCATE('-', REVERSE(`Schedule Id`))+2))-1) from TEMP_SPRING_Trip_Schedule ;


CREATE TABLE C_SPRING_SCHEDULE
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`,dbschedule.`STOP_ID` , stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end    `DOW`,MIDPOINT,UP_DOWN,dbschedule.TripID FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as `DOW` , TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'M-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by `Schedule Id`, dbschedule.TripID) u1
UNION 
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end  ,MIDPOINT,UP_DOWN,dbschedule.TripID  FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'T-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by `Schedule Id`, dbschedule.TripID) u2
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end  ,MIDPOINT,UP_DOWN,dbschedule.TripID FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'W-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by `Schedule Id`, dbschedule.TripID) u3
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end,MIDPOINT,UP_DOWN,dbschedule.TripID   FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'R-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by `Schedule Id`, dbschedule.TripID) u4
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` ,`Time`, dbschedule.`STOP_ID` ,stop_order, case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end ,MIDPOINT,UP_DOWN,dbschedule.TripID  FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'F-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by `Schedule Id`, dbschedule.TripID) u5
GO

-- FALL


CREATE TABLE TEMP_FALL_Trip_Schedule select @row_num := IF(@prev_value=`Schedule ID`,@row_num+1,1) AS TripID , `Schedule ID`, `Start Times`,`Schedule Key`,@prev_value := `Schedule ID`  from IU_FALL_Schedules JOIN    (SELECT @row_num := 0) r order by `Schedule ID` ,`Start Times`
GO
CREATE VIEW FALL_SCHEDULE_WITH_COMP_RID as select *, substr(substr(`Schedule Id`,LENGTH(`Schedule Id`) - LOCATE('-', REVERSE(`Schedule Id`))+2),1 ,LOCATE ('.',substr(`Schedule Id`,LENGTH(`Schedule Id`) - LOCATE('-', REVERSE(`Schedule Id`))+2))-1) from TEMP_FALL_Trip_Schedule ;
GO
CREATE TABLE C_FALL_SCHEDULE
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end    `DOW` FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as `DOW` , TripID, `Schedule ID`, `Start Times`, Name_exp_6 from FALL_SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'M-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u1
UNION 
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end     FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from FALL_SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'T-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u2
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end   FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from FALL_SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'W-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u3
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end   FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from FALL_SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'R-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u4
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end   FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from FALL_SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'F-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u5
GO