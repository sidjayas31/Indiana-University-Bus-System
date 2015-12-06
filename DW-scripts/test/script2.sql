select * from W_SHED_D b;
select * from W_RUNS_F;
select concat(substring(a.SCHEDULE_ID,1,1),concat('~',concat(a.trip_id,concat('~',a.SCHEDULE_ID)))) 'integration_key' from W_SHED_D a ;

select a.STOP1_NAME,a.STOP2_NAME,b.STOP1_NAME,b.STOP2_NAME
from W_RUNS_F a left join W_SHED_D b on a.Route=b.schedule_id 
and a.stop2_time between addtime(b.stop1_time,'-00:10:00') and addtime(b.stop1_time,'00:10:00') 
and b.SEMESTER like 'Spr%' where 
concat(substring(b.SCHEDULE_ID,1,1),concat('~',concat(b.trip_id,concat('~',b.SCHEDULE_ID)))) is null;