select count(*) from (select a.*,
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp 
where route_major='A1' and travel_flg='Y' order by when_time,route,bus_id)a where stop_id < 20 order by trip_id;

select count(*) from (select a.*,
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp 
where route_major='A2' and travel_flg='Y' order by when_time,route,bus_id)a where stop_id > 20 order by trip_id;

select count(*) from (select a.*,
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp 
where route_major='A3' and travel_flg='Y' order by when_time,route,bus_id)a where stop_id > 20 order by trip_id;

select count(*) from (select a.*,
case when from_id=67 then @tripid:=@tripid+1 else @tripid end 'trip_id',
case when from_id=67 then @stpid:=1 else @stpid:=@stpid+1 end 'stop_id'
from spring_runs_det a,(select @tripid:=0)tp,(select @stpid:=0)stp 
where route_major='A4' and travel_flg='Y' order by when_time,route,bus_id)a where stop_id > 20 order by trip_id;


select ,' from t1;

create table t1 as select distinct(time_date) 'a' from spring_runs_det order by a;
select b.*,@t2 'previous',
case when @t2<>a then '0' else '1' end,@t2:=a from t1 b,(select @t2:=str_to_date('2012/01/13','%Y/%m/%d'))a;