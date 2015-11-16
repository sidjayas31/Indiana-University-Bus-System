CREATE TABLE TEMP_DBMAP_SCHEDULE
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) TripID, Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%A1'  order by `ID`)f1
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) TripID, Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%A2'  order by `ID`)f2
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) TripID, Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%A3'  order by `ID`)f3
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) TripID, Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%A4'  order by `ID`)f4
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) TripID, Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%A5'  order by `ID`)f5
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) TripID, Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%A6'  order by `ID`)f6
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) TripID, Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%A7'  order by `ID`)f7
UNION


SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Fisher Court',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%B1'  order by `ID`)s1
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Fisher Court',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%B2'  order by `ID`)s2
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Fisher Court',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%B3'  order by `ID`)s3
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Fisher Court',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%B4'  order by `ID`)s4
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Fisher Court',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%B5'  order by `ID`)s5
UNION

SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Evermann',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%E1'  order by `ID`)t1
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Evermann',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%E2'  order by `ID`)t2
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Evermann',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%E3'  order by `ID`)t3
UNION

SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%X1'  order by `ID`)fo3
UNION
SELECT * FROM (SELECT @row_num := IF(`Stop` like 'Load',@row_num+1,@row_num) , Route, `Time`, `Stop` from DBMAP_ScheduleData JOIN ( SELECT @row_num :=0)r where Route like '%X2'  order by `ID`)fo4
GO 
