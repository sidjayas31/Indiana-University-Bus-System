CREATE TABLE IT_SPRING_TRIPS
SELECT 
                    x.`schedule name`, 
                    date(x.`date`), 
                    y.`Starting Time`, 
                    y.Inbound, 
                    y.outbound  
                FROM 
                    IU_SPRING_Shifts x, 
                    IU_SPRING_Trips y  
                WHERE 
                    x.`Shift ID`=y.`Shift ID` AND
                    x.`schedule name` like '_-__._' AND
                    x.`schedule name` not like 'F-__._'