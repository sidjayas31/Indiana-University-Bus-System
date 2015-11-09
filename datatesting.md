#Data Loads Testing
## Tables and their Integrity
  * Interval Data - Good, Data cleansing required
  * Route Id - Good
  * Schedule data - Good row counts, data cleansing required.
  * Stop Id - Quesitonable data. Cleansing
  
  
# Data Cleansing
  * Clean enclosures off from TO column from DBMAP_IntervalData.
  * [sid] the () signifies the return trip from the mid point.
  * Questionable data at Schedule data at time column. 
  * [sid] the null is not junk because those routes dont stop at IMU , Eg Route A stops at imu but A1 does not
    ```
    select * from DBMAP_ScheduleData where time is NULL; 
    ```
  * Stop Id has questionable data
  * [sid] we can eleminate the nulls. the () signifies the return trip from the midpoint
    ```
    SELECT * FROM iubus.DBMAP_StopID;
    ```
  * Junk values on Weather: 'T' values for Precipitaion
  * [Sid] we can use a high level classification and use only the event column. and we can assume nulls as normal weather.
  * Is this significant? Column has only null values.
  * [Sid] Not significant
  ```
  SELECT distinct(F2) FROM iubus.IU_FALL_ScheduleNames;
  ```
  * Null values at ```SELECT distinct(Field1) FROM iubus.IU_FALL_Schedules;```
  * [sid] field1 not required
  * Better representation for time?
  ```
  SELECT * FROM iubus.IU_FALL_Schedules;
  ```
  The date starts at 1899
  [sid] date is not required. only time should be sufficient
  
  * Data not loaded into SELECT * FROM iubus.IU_FALL_Trips; Questionable columns TripId,ShiftId,ScheduleID. Considering tblTrips table from database

Same set of observations for FALL tables.  
  
  
