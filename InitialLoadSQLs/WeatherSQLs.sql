INSERT into S_Weather ( WEATHER_DATE, MIN_TEMP, PRECIPITATION, RAIN, FOG, SNOW)SELECT date(EDT), MinTemp,Precipitation, case when INSTR(UPPER(Events),'THUNDERSTORM') > 0 then 2  when INSTR(UPPER(Events),'RAIN') > 0 then 1 else 0 end as  RAIN,case when INSTR(UPPER(Events),'FOG') > 0 then 1 else 0 end as  FOG  ,case when INSTR(UPPER(Events),'SNOW') > 0 then 1 else 0 end as  SNOW    from DBMAP_WeatherData
GO
select count(1) from DBMAP_WeatherData;

select * from S_Weahter
GO
INSERT into S_Weather ( WEATHER_DATE, MIN_TEMP, PRECIPITATION, RAIN, FOG, SNOW) select `DATE` as WEATHER_DATE, case when TMIN = -9999 then null else TMIN end MIN_TEMP, case when PRCP < 1 AND `Measurement Flag` = 'T' then `Measurement Flag` else PRCP end as PRECIPITATION ,case when THUNDER = -9999 AND RAIN = -9999 then 0 when THUNDER =-9999 then 1 else 2 end as RAIN ,case when FOG = -9999 then 0 else 1 end as FOG,case when SNOW != 0 then 1 else SNOW end SNOW from NOAA_Weather
GO

