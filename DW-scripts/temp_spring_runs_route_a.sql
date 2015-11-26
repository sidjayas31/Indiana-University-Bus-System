create table spring_runs_route_a as select 
concat(time_date,concat('~',concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))))) 'id',
concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))) 'integration_key',a.* from (select
@prevs 'prev_date',a.*,
case when time_date<>@prevs then @tripid:=0 end 'change_ind',
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id',
@prevs:=a.time_date 'prev_date_tmp'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp,(select @prevs:=str_to_date('2012/01/13','%Y/%m/%d'))p
where route_major='A1' and travel_flg='Y' order by when_time,route,bus_id)a
UNION
select 
concat(time_date,concat('~',concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))))) 'id',
concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))) 'integration_key',a.* from (select
@prevs 'prev_date',a.*,
case when time_date<>@prevs then @tripid:=0 end 'change_ind',
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id',
@prevs:=a.time_date 'prev_date_tmp'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp,(select @prevs:=str_to_date('2012/01/13','%Y/%m/%d'))p
where route_major='A2' and travel_flg='Y' order by when_time,route,bus_id)a
UNION
select 
concat(time_date,concat('~',concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))))) 'id',
concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))) 'integration_key',a.* from (select
@prevs 'prev_date',a.*,
case when time_date<>@prevs then @tripid:=0 end 'change_ind',
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id',
@prevs:=a.time_date 'prev_date_tmp'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp,(select @prevs:=str_to_date('2012/01/13','%Y/%m/%d'))p
where route_major='A3' and travel_flg='Y' order by when_time,route,bus_id)a
UNION
select 
concat(time_date,concat('~',concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))))) 'id',
concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))) 'integration_key',a.* from (select
@prevs 'prev_date',a.*,
case when time_date<>@prevs then @tripid:=0 end 'change_ind',
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id',
@prevs:=a.time_date 'prev_date_tmp'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp,(select @prevs:=str_to_date('2012/01/13','%Y/%m/%d'))p
where route_major='A4' and travel_flg='Y' order by when_time,route,bus_id)a
UNION
select 
concat(time_date,concat('~',concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))))) 'id',
concat(substring(a.route,1,1),concat('~',concat(a.trip_id,concat('~',a.route)))) 'integration_key',a.* from (select
@prevs 'prev_date',a.*,
case when time_date<>@prevs then @tripid:=0 end 'change_ind',
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id',
@prevs:=a.time_date 'prev_date_tmp'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp,(select @prevs:=str_to_date('2012/01/13','%Y/%m/%d'))p
where route_major='A5' and travel_flg='Y' order by when_time,route,bus_id)a;