create table S_FALL_SCHEDULE_TEST as SELECT * FROM iubus.S_FALL_SCHEDULE;
select * from S_FALL_SCHEDULE_TEST;
drop table S_FALL_SCHEDULE_TEST;
insert into S_FALL_SCHEDULE_TEST values('M80',timestamp('2038-01-19 03:14:07'),'A',1,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M80',timestamp('2038-01-19 03:14:07'),'B',2,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M80',timestamp('2038-01-19 03:14:07'),'C',3,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M80',timestamp('2038-01-19 03:14:07'),'D',4,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M81',timestamp('2038-01-19 03:14:07'),'A',1,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M81',timestamp('2038-01-19 03:14:07'),'B',2,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M81',timestamp('2038-01-19 03:14:07'),'C',3,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M81',timestamp('2038-01-19 03:14:07'),'D',4,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M82',timestamp('2038-01-19 03:14:07'),'A',1,null,'Y','Y');
insert into S_FALL_SCHEDULE_TEST values('M82',timestamp('2038-01-19 03:14:07'),'B',2,null,'Y','Y');

create table W_SHED_RUN_D as select a.SCHEDULE_ID,a.DOW,a.STOP_ID 'STOP1_NAME',a.SCHEDULE_TIME 'STOP1_TIME',
b.STOP_ID 'STOP2_NAME',b.SCHEDULE_TIME 'STOP2_TIME',
c.STOP_ID 'STOP3_NAME',c.SCHEDULE_TIME 'STOP3_TIME',
d.STOP_ID 'STOP4_NAME',d.SCHEDULE_TIME 'STOP4_TIME',
e.STOP_ID 'STOP5_NAME',e.SCHEDULE_TIME 'STOP5_TIME',
f.STOP_ID 'STOP6_NAME',f.SCHEDULE_TIME 'STOP6_TIME',
g.STOP_ID 'STOP7_NAME',g.SCHEDULE_TIME 'STOP7_TIME',
h.STOP_ID 'STOP8_NAME',h.SCHEDULE_TIME 'STOP8_TIME',
i.STOP_ID 'STOP9_NAME',j.SCHEDULE_TIME 'STOP9_TIME',
j.STOP_ID 'STOP10_NAME',j.SCHEDULE_TIME 'STOP10_TIME',
k.STOP_ID 'STOP11_NAME',k.SCHEDULE_TIME 'STOP11_TIME',
l.STOP_ID 'STOP12_NAME',l.SCHEDULE_TIME 'STOP12_TIME',
m.STOP_ID 'STOP13_NAME',m.SCHEDULE_TIME 'STOP13_TIME',
n.STOP_ID 'STOP14_NAME',n.SCHEDULE_TIME 'STOP14_TIME',
o.STOP_ID 'STOP15_NAME',o.SCHEDULE_TIME 'STOP15_TIME',
case when a.midpoint=1 then 1 when b.midpoint=1 then 2 when c.midpoint=1 then 3 when d.midpoint=1 then 4 when e.midpoint=1 then 5
when f.midpoint=1 then 6 when g.midpoint=1 then 7 when h.midpoint=1 then 8 when i.midpoint=1 then 9 when j.midpoint=1 then 10 
when k.midpoint=1 then 11 when l.midpoint=1 then 12 when m.midpoint=1 then 13 when n.midpoint=1 then 14 when o.midpoint=1 then 15 end 'MID_POINT'
from (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=1) a 
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=2) b on a.schedule_id=b.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=3) c on a.schedule_id=c.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=4) d on a.schedule_id=d.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=5) e on a.schedule_id=e.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=6) f on a.schedule_id=f.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=7) g on a.schedule_id=g.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=8) h on a.schedule_id=h.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=9) i on a.schedule_id=i.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=10) j on a.schedule_id=j.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=11) k on a.schedule_id=k.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=12) l on a.schedule_id=l.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=13) m on a.schedule_id=m.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=14) n on a.schedule_id=n.schedule_id
left join (select * from S_FALL_SCHEDULE_TEST where STOP_ORDER=15) o on a.schedule_id=o.schedule_id;

create view S_SPRING_SCHEDULE_V as SELECT a.*,b.stop 'STOP_NAME' FROM iubus.S_SPRING_Schedule a left join DBMAP_StopID b on a.stop_id=b.id;
create view S_FALL_SCHEDULE_V as SELECT a.*,b.stop 'STOP_NAME' FROM iubus.S_FALL_Schedule a left join DBMAP_StopID b on a.stop_id=b.id;

create table W_SHED_D as select a.integration_key,a.schedule_id,a.trip_id,a.DOW,a.STOP_NAME 'STOP1_NAME',a.SCHEDULE_TIME 'STOP1_TIME',a.STOP_ID 'STOP1_ID',
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
'Fall 2014' as 'SEMESTER'
from (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=1) a 
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=2) b on a.integration_key=b.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=3) c on a.integration_key=c.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=4) d on a.integration_key=d.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=5) e on a.integration_key=e.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=6) f on a.integration_key=f.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=7) g on a.integration_key=g.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=8) h on a.integration_key=h.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=9) i on a.integration_key=i.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=10) j on a.integration_key=j.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=11) k on a.integration_key=k.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=12) l on a.integration_key=l.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=13) m on a.integration_key=m.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=14) n on a.integration_key=n.integration_key
left join (SELECT *,concat(DOW,concat('~',concat(trip_id,concat('~',Schedule_ID)))) 'integration_key'  from S_FALL_SCHEDULE_V where STOP_ORDER=15) o on a.integration_key=o.integration_key
UNION
select a.integration_key,a.schedule_id,a.trip_id,a.DOW,a.STOP_NAME 'STOP1_NAME',a.SCHEDULE_TIME 'STOP1_TIME',a.STOP_ID 'STOP_1ID',
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