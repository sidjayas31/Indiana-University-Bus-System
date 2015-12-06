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

select * from S_SPRING_RUNS_WITH_STOP;
drop table test;
create table W_RUNS_F as select a.*,
b.`to` 'STOP3_NAME',b.time_hour 'STOP3_TIME',b.travel_time 'TRAVEL3_TIME',
c.`to` 'STOP4_NAME',c.time_hour 'STOP4_TIME',c.travel_time 'TRAVEL4_TIME',
d.`to` 'STOP5_NAME',d.time_hour 'STOP5_TIME',d.travel_time 'TRAVEL5_TIME',
e.`to` 'STOP6_NAME',e.time_hour 'STOP6_TIME',e.travel_time 'TRAVEL6_TIME',
f.`to` 'STOP7_NAME',f.time_hour 'STOP7_TIME',f.travel_time 'TRAVEL7_TIME',
g.`to` 'STOP8_NAME',g.time_hour 'STOP8_TIME',g.travel_time 'TRAVEL8_TIME',
h.`to` 'STOP9_NAME',h.time_hour 'STOP9_TIME',h.travel_time 'TRAVEL9_TIME',
i.`to` 'STOP10_NAME',i.time_hour 'STOP10_TIME',i.travel_time 'TRAVEL10_TIME',
j.`to` 'STOP11_NAME',j.time_hour 'STOP11_TIME',j.travel_time 'TRAVEL11_TIME',
k.`to` 'STOP12_NAME',k.time_hour 'STOP12_TIME',k.travel_time 'TRAVEL12_TIME',
l.`to` 'STOP13_NAME',l.time_hour 'STOP13_TIME',l.travel_time 'TRAVEL13_TIME',
m.`to` 'STOP14_NAME',m.time_hour 'STOP14_TIME',m.travel_time 'TRAVEL14_TIME',
n.`to` 'STOP15_NAME',n.time_hour 'STOP15_TIME',n.travel_time 'TRAVEL15_TIME',
o.`to` 'STOP16_NAME',o.time_hour 'STOP16_TIME',o.travel_time 'TRAVEL16_TIME',
p.`to` 'STOP17_NAME',p.time_hour 'STOP17_TIME',p.travel_time 'TRAVEL17_TIME',
q.`to` 'STOP18_NAME',q.time_hour 'STOP18_TIME',q.travel_time 'TRAVEL18_TIME',
r.`to` 'STOP19_NAME',r.time_hour 'STOP19_TIME',r.travel_time 'TRAVEL19_TIME',
s.`to` 'STOP20_NAME',s.time_hour 'STOP20_TIME',s.travel_time 'TRAVEL20_TIME',
t.`to` 'STOP21_NAME',t.time_hour 'STOP21_TIME',t.travel_time 'TRAVEL21_TIME'
from
(select id,integration_key,route,date(when_time) 'date_time',tripid,`from` 'STOP1_NAME',`to` 'STOP2_NAME',time(when_time)  'STOP2_TIME',sec_time 'TRAVEL2_TIME' from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=0)a left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=1)b on a.id=b.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=2)c on a.id=c.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=3)d on a.id=d.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=4)e on a.id=e.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=5)f on a.id=f.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=6)g on a.id=g.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=7)h on a.id=h.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=8)i on a.id=i.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=9)j on a.id=j.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=10)k on a.id=k.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=11)l on a.id=l.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=12)m on a.id=m.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=13)n on a.id=n.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=14)o on a.id=o.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=15)p on a.id=p.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=16)q on a.id=q.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=17)r on a.id=r.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=18)s on a.id=s.id left join
(select id,`to` ,time(when_time) 'time_hour' ,sec_time 'travel_time'  from S_SPRING_RUNS_WITH_STOP where travel_flag=1 and stop_order=19)t on a.id=t.id order by a.date_time,a.id;