INSERT INTO S_Driver
SELECT `Driver ID`, `Driver` FROM IU_FALL_Drivers 
UNION 
SELECT `Driver ID`, `Driver` FROM IU_SPRING_Drivers S