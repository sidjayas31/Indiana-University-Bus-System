SELECT iner.*
FROM   (SELECT a.id1, a.id, a.`from`, s.ID AS `to`, a.`time`, a.bus_id, a.route_id, a.`when`, a.actRoute
        FROM   intervaldata a, StopID s
        WHERE  s.Stop = a.`to` AND a.route_id = 'A' AND date(a.`when`) = '2015-01-13' AND s.id IN (SELECT DISTINCT t.ID
                                                                                                   FROM   ScheduleData sc, StopID t
                                                                                                   WHERE  t.Stop = sc.Stop)) iner
WHERE  iner.`from` = iner.`to` order by iner.`when`;


-- sc.ID, sc.Route, sc.`Time`, t.ID `fromSELECT iner.*, inerr.*
FROM   (SELECT a.id1, a.id, a.`from`, s.ID AS `to`, a.`time`, a.bus_id, a.route_id, a.`when`, a.actRoute
        FROM   intervaldata a, StopID s
        WHERE  s.Stop = a.`to` AND a.route_id = 'A' AND date(a.`when`) = '2015-01-13') iner
       LEFT JOIN (SELECT sc.ID, sc.Route, sc.`Time`, t.ID `from`
                  FROM   ScheduleData sc, StopID t
                  WHERE  t.Stop = sc.Stop) inerr
         ON inerr.`from` = iner.`from`
WHERE  iner.`from` = iner.`to`