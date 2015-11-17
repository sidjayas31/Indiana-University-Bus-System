SELECT count(1) from DBMAP_ScheduleData where Route like '%A%' and Stop like 'Stadium';
GO
SELECT count(1) FROM IU_SPRING_Schedules where `Schedule ID` like '%-A%'
GO
SELECT count(1) FROM IU_FALL_Schedules where `Schedule ID` like '%-A%' and `Schedule ID` not like 'FB%'
GO

select @row_num := IF(@prev_value=`Schedule ID`,@row_num+1,1) AS TripID , `Schedule ID`, `Start Times`,`Schedule Key`,@prev_value := `Schedule ID`  from IU_SPRING_Schedules JOIN    (SELECT @row_num := 0) r order by `Schedule ID` ,`Start Times`
Go
SELECT * from IU_FALL_Schedules LIMIT 10
GO
SELECT * from DBMAP_ScheduleData where Route like '%A%';
GO
Select s.Stop, a.`to`, `time`, bus_id, route_id, `when` FROM   DBMAP_IntervalData a, DBMAP_StopID s
        WHERE  s.ID = a.`from` AND a.route_id like '%A%' and  date(a.`when`) = '2015-01-13' and Stop like '%Stadium%';
GO
SELECT * from DBMAP_ScheduleData where Route like '%A7%'  order by `Time`;

GO

SELECT * FROM (SELECT * from DBMAP_ScheduleData where Route like '%A%' and Stop like 'Stadium' order by `Time`) DBS ,(select *  from IU_SPRING_Schedules where `Schedule ID` like '%-A%' and `Schedule ID` not like 'FB%') IUS 
where  DBS.`Time`=IUS.`Start Times`

GO

SELECT * from DBMAP_ScheduleData where Route like '%A%'  order by ID
Go
UNION 
SELECT * from DBMAP_ScheduleData where Route like '%B%' and Stop like 'Fisher Court' order by `Time`
UNION
SELECT * from DBMAP_ScheduleData where Route like '%B%' and Stop like 'Stadium' order by `Time`
UNION
SELECT * from DBMAP_ScheduleData where Route like '%B%' and Stop like 'Stadium' order by `Time`
UNION
SELECT * from DBMAP_ScheduleData where Route like '%B%' and Stop like 'Stadium' order by `Time`

GO

SELECT @row_num := IF(`Stop` like 'Fisher Court',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%B%'  order by `ID`
Go

CREATE VIEW SCHEDULE_WITH_COMP_RID as select *, substr(substr(`Schedule Id`,LENGTH(`Schedule Id`) - LOCATE('-', REVERSE(`Schedule Id`))+2),1 ,LOCATE ('.',substr(`Schedule Id`,LENGTH(`Schedule Id`) - LOCATE('-', REVERSE(`Schedule Id`))+2))-1) from TEMP_SPRING_Trip_Schedule ;
Go
SELECT LOCATE('-', 'somest-ring',1) from dual
GO
SELECT * FROM SCHEDULE_WITH_COMP_RID a , TEMP_DBMAP_SCHEDULE b where a.Name_exp_6 = b.Route LIMIT 10
GO
SELECT * FROM TEMP_DBMAP_SCHEDULE where Route like '%A1%' LIMIT 10
GO 

SELECT * from DBMAP_ScheduleData 