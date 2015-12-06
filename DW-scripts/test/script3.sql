select * from W_RUNS_F where id = '2015-01-15~R~6~R-A2.2';

select * from S_SPRING_SCHEDULE_V where DOW in ('M','T','W','R');
select count(id),id from W_RUNS_F where substr(Route,1,1) in ('M','T','W','R') and substr(Route,3,1) = 'A'
group by id having count(id)>1 order by id;

select * from S_SPRING_SCHEDULE_V where SCHEDULE_ID='R-A2.2' 
-- and trip_id='6' 
order by SCHEDULE_TIME ;
select * from W_SHED_D where integration_key='M~1~M-E3.1';

select count(integration_key),integration_key from W_SHED_D where STOP1_NAME is not null and substr(integration_key,1,1) in ('M','T','W','R') group by integration_key having count(integration_key)>1;
create view W_SHED_MDV as select * from W_SHED_D where STOP1_NAME is not null and substr(integration_key,1,1) in ('M','T','W','R')

create table W_SHED_D as select a.integration_key,a.schedule_id,a.trip_id,a.DOW,a.STOP_NAME 'STOP1_NAME',a.SCHEDULE_TIME 'STOP1_TIME',a.STOP_ID 'STOP_1ID',
b.STOP_NAME 'STOP2_NAME',b.SCHEDULE_TIME 'STOP2_TIME',b.STOP_ID 'STOP2_ID',
c.STOP_NAME 'STOP3_NAME',c.SCHEDULE_TIME 'STOP3_TIME',c.STOP_ID 'STOP3_ID',
d.STOP_NAME 'STOP4_NAME',d.SCHEDULE_TIME 'STOP4_TIME',d.STOP_ID 'STOP4_ID',
e.STOP_NAME 'STOP5_NAME',e.SCHEDULE_TIME 'STOP5_TIME',e.STOP_ID 'STOP5_ID',
f.STOP_NAME 'STOP6_NAME',f.SCHEDULE_TIME 'STOP6_TIME',f.STOP_ID 'STOP6_ID',
g.STOP_NAME 'STOP7_NAME',g.SCHEDULE_TIME 'STOP7_TIME',g.STOP_ID 'STOP7_ID',
h.STOP_NAME 'STOP8_NAME',h.SCHEDULE_TIME 'STOP8_TIME',h.STOP_ID 'STOP8_ID',
i.STOP_NAME 'STOP9_NAME',j.SCHEDULE_TIME 'STOP9_TIME',i.STOP_ID 'STOP9_ID',
j.STOP_NAME 'STOP10_NAME',j.SCHEDULE_TIME 'STOP10_TIME',j.STOP_ID 'STOP10_ID',
k.STOP_NAME 'STOP11_NAME',k.SCHEDULE_TIME 'STOP11_TIME',k.STOP_ID 'STOP11_ID',
l.STOP_NAME 'STOP12_NAME',l.SCHEDULE_TIME 'STOP12_TIME',l.STOP_ID 'STOP12_ID',
m.STOP_NAME 'STOP13_NAME',m.SCHEDULE_TIME 'STOP13_TIME',m.STOP_ID 'STOP13_ID',
n.STOP_NAME 'STOP14_NAME',n.SCHEDULE_TIME 'STOP14_TIME',n.STOP_ID 'STOP14_ID',
o.STOP_NAME 'STOP15_NAME',o.SCHEDULE_TIME 'STOP15_TIME',o.STOP_ID 'STOP15_ID',
case when a.midpoint=1 then 1 when b.midpoint=1 then 2 when c.midpoint=1 then 3 when d.midpoint=1 then 4 when e.midpoint=1 then 5
when f.midpoint=1 then 6 when g.midpoint=1 then 7 when h.midpoint=1 then 8 when i.midpoint=1 then 9 when j.midpoint=1 then 10 
when k.midpoint=1 then 11 when l.midpoint=1 then 12 when m.midpoint=1 then 13 when n.midpoint=1 then 14 when o.midpoint=1 then 15 end 'MID_POINT',
'Spring 2015' as 'SEMESTER'
from (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=1) a 
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=2) b on a.integration_key=b.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=3) c on a.integration_key=c.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=4) d on a.integration_key=d.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=5) e on a.integration_key=e.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=6) f on a.integration_key=f.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=7) g on a.integration_key=g.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=8) h on a.integration_key=h.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=9) i on a.integration_key=i.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=10) j on a.integration_key=j.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=11) k on a.integration_key=k.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=12) l on a.integration_key=l.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=13) m on a.integration_key=m.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=14) n on a.integration_key=n.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_SPRING_SCHEDULE_V where STOP_ORDER=15) o on a.integration_key=o.integration_key;