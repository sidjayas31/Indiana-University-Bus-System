#Data Loads Testing
## Tables and their Integrity
  * Interval Data - Good, Data cleansing required
  * Route Id - Good
  * Schedule data - Good row counts, data cleansing required.
  * Stop Id - Quesitonable data. Cleansing
  
  
# Data Cleansing
  * Clean enclosures off from TO column from DBMAP_IntervalData.
  * Questionable data at Schedule data at time column.
    ```
    select * from DBMAP_ScheduleData where time is NULL;
    ```
  * Stop Id has questionable data
    ```
    SELECT * FROM iubus.DBMAP_StopID;
    ```
  * Junk values on Weather: 'T' values for Precipitaion
  * Is this significant? Column has only null values.
  ```
  SELECT distinct(F2) FROM iubus.IU_FALL_ScheduleNames;
  ```
  * Null values at ```SELECT distinct(Field1) FROM iubus.IU_FALL_Schedules;```
  * Better representation for time?
  ```
  SELECT * FROM iubus.IU_FALL_Schedules;
  ```
  The date starts at 1899
  * Data not loaded into SELECT * FROM iubus.IU_FALL_Trips; Questionable columns TripId,ShiftId,ScheduleID. Considering tblTrips table from database

Same set of observations for FALL tables.  
  
  
