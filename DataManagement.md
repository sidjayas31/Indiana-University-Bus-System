# Data Management  
### Data cleaning during loading data from Access db to MySQL  
* From Doublemap db, for the table <i>Schedule Data</i> remove the rows that  
(Reduces number of rows from 1745 to 1729)
	* have the value "Time" for field <b><i>Time</i></b> and  
	* value "Stop" for field <b><i>Stop</i></b>  
	```sql
	delete from DBMAP_ScheduleData where Stop ='Stop'
	```