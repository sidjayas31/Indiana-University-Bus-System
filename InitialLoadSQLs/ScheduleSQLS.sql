SELECT * from TEMP_SPRING_Trip_Schedule WHERE `Schedule ID`  LIKE '_-__._' order by `Start Times`
GO

SELECT * FROM TEMP_DBMAP_SCHEDULE where Route like '%A1%' LIMIT 10
GO 
SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE '_-__._' order by Name_exp_6,DOW,`Start Times`
GO

CREATE TABLE C_SPRING_SCHEDULE
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end    `DOW` FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as `DOW` , TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'M-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u1
UNION 
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end     FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'T-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u2
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end   FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'W-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u3
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end   FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'R-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u4
UNION
SELECT * FROM (SELECT  case when `Schedule Id` is not null then @prev_value:= `Schedule Id` else  @prev_value end `Schedule Id` , `Time`, `Stop` , case when `DOW` is not null then @prev_dow_value:= `DOW` else  @prev_dow_value end   FROM TEMP_DBMAP_SCHEDULE dbschedule LEFT JOIN (SELECT substr(`Schedule ID`,1,1) as DOW, TripID, `Schedule ID`, `Start Times`, Name_exp_6 from SCHEDULE_WITH_COMP_RID where `Schedule ID`  LIKE 'F-__._' order by Name_exp_6,DOW,`Start Times`) schedule 
on schedule.Name_exp_6 = dbschedule.Route and schedule.`Start Times` = dbschedule.`Time` JOIN (SELECT @prev_value:=NULL) t JOIN (SELECT @prev_dow_value:=NULL) x order by Route, dbschedule.TripID) u5
GO