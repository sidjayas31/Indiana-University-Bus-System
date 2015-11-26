select hour(b.when_time) 'hour_time',b.route_id,case dayofweek(b.time_date)
when 1 then 'Sunday'
when 2 then 'Monday'
when 3 then 'Tuesday'
when 4 then 'Wednesday'
when 5 then 'Thursday'
when 6 then 'Friday'
when 7 then 'Saturday'
end 'day_desc',avg(b.dwell_time) 'avg_dwell',avg(b.travel_time) 'avg_travel',b.from_name,b.to_name,b.concat_name from 
(select b.*,concat(b.from_name,b.to_name) 'concat_name' from spring_runs_det b where b.travel_time < 3600 and b.dwell_time < 3600) b 
inner join 
(SELECT concat(a.from_name,a.to_name) 'concat_name' FROM spring_runs_det a
 group by concat(a.from_name,a.to_name) having count(concat(a.from_name,a.to_name)) > 500) c on b.concat_name=c.concat_name
 group by day_desc,hour_time,b.route_id,concat_name;