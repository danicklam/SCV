/*PROD - DASHBOARD METRICS*/
/*FULL VIEWS EXTRACTS*/

SELECT * FROM "EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_addr_cov_daily"
ORDER BY Scver_Load_Dt DESC
--WHERE  Source_System ='MEARS-ADF'
;

SELECT * FROM "EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_daily_run"
ORDER BY Scver_Load_Dt DESC
--WHERE  Source_System ='MEARS-ADF'
;


/*JOINT DASHBOARD QUERY*/
------------------------------------------------------------------------
SELECT *
FROM
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_daily_run" as run
FULL OUTER JOIN
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_addr_cov_daily" as cov
ON run.Source_System  = cov.Source_System 
AND run.Scver_Load_Dt = cov.Scver_Load_Dt
;


---------------------------------


SELECT calendar_date, day_of_week FROM
Sys_Calendar.Calendar
INNER JOIN
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_addr_cov_daily" as coda

ON calendar_date = coda.Scver_Load_Dt
;

-------------------------------------------------------------------------
/* FULL TABLE Extract for dashboard!!!!!  */
/*1219*/
SELECT 
run.Scver_Load_Dt as Load_Date,
day_of_week,
run.Source_System as Load_Source, 
Total_System_Items, NULLIFZERO(Total_Items_Aft_DropOff1), NULLIFZERO(Total_Items_Aft_DropOff2), Total_Matchable_Addr, Total_Items_Matched, 
Total_Items_Full_Matched, Total_Items_Partial_Matched, 
/*Total_Items_Unmatched Recalculated*/ 
(Total_Items_Handed_Over-Total_Items_Matched) as Total_Unmatched_Items,

Total_Items_Handed_Over, Total_Items_Not_Handed_Over,
Total_Paf_Addresses, Distinct_Parties_Covered, Distinct_Addresses_Covered,

/*Calculated Fields*/
/*Coverage Rate = Distinct Addresses/Total Paf addresses*/
(cast(cast(Distinct_Addresses_Covered AS decimal(15,3))/CAST(Total_Paf_Addresses AS decimal(15,3)) as decimal(4,3))) as Coverage_Rate,
/*Drop Off Rate*/
(cast(cast(NULLIFZERO(Total_Items_Aft_DropOff1) AS decimal(15,3))/CAST(Total_System_Items AS decimal(15,3)) as decimal(4,3))) as Drop_Rate,
(cast(cast(NULLIFZERO(Total_Items_Aft_DropOff2) AS decimal(15,3))/CAST(Total_System_Items AS decimal(15,2)) as decimal(4,3))) as Drop_Rate2,
/*Match Rate*/
(cast(cast(Total_Items_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,3)) as decimal(4,3))) as Match_Rate,
/*Full Match Rate*/
(cast(cast(Total_Items_Full_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Full_Match_Rate,
/*Partial Match Rate*/
(cast(cast(Total_Items_Partial_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Partial_Match_Rate,
/*Unmatch Rate*/
(cast(cast(Total_Unmatched_Items AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Unmatch_Rate

FROM
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_daily_run" as run
INNER JOIN
Sys_Calendar.Calendar
ON
Load_Date=calendar_date
INNER JOIN
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_addr_cov_daily" as cov
ON run.Source_System  = cov.Source_System 
AND run.Scver_Load_Dt = cov.Scver_Load_Dt


/*183*/
UNION 
SELECT
cov.Scver_Load_Dt as Load_Date,
day_of_week,
cov.Source_System as Load_Source, 
Total_System_Items, NULLIFZERO(Total_Items_Aft_DropOff1), NULLIFZERO(Total_Items_Aft_DropOff2), Total_Matchable_Addr, Total_Items_Matched, 
Total_Items_Full_Matched, Total_Items_Partial_Matched, 
/*Total_Items_Unmatched Recalculated*/ 
(Total_Items_Handed_Over-Total_Items_Matched) as Total_Unmatched_Items,

Total_Items_Handed_Over, Total_Items_Not_Handed_Over,
Total_Paf_Addresses, Distinct_Parties_Covered, Distinct_Addresses_Covered,

/*Calculated Fields*/
/*Coverage Rate = Distinct Addresses/Total Paf addresses*/
(cast(cast(Distinct_Addresses_Covered AS decimal(15,3))/CAST(Total_Paf_Addresses AS decimal(15,3)) as decimal(4,3))) as Coverage_Rate,
/*Drop Off Rate*/
(cast(cast(NULLIFZERO(Total_Items_Aft_DropOff1) AS decimal(15,3))/CAST(Total_System_Items AS decimal(15,3)) as decimal(4,3))) as Drop_Rate,
(cast(cast(NULLIFZERO(Total_Items_Aft_DropOff2) AS decimal(15,3))/CAST(Total_System_Items AS decimal(15,2)) as decimal(4,3))) as Drop_Rate2,
/*Match Rate*/
(cast(cast(Total_Items_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,3)) as decimal(4,3))) as Match_Rate,
/*Full Match Rate*/
(cast(cast(Total_Items_Full_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Full_Match_Rate,
/*Partial Match Rate*/
(cast(cast(Total_Items_Partial_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Partial_Match_Rate,
/*Unmatch Rate*/
(cast(cast(Total_Unmatched_Items AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Unmatch_Rate

FROM
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_daily_run" as run

RIGHT JOIN
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_addr_cov_daily" as cov
ON run.Source_System  = cov.Source_System 
AND run.Scver_Load_Dt = cov.Scver_Load_Dt
--AND run.Source_System is null
LEFT JOIN
Sys_Calendar.Calendar
ON
Load_Date=calendar_date
WHERE Total_System_Items is NULL

UNION 
/*219*/
SELECT
run.Scver_Load_Dt as Load_Date,
day_of_week,
run.Source_System as Load_Source, 
Total_System_Items, NULLIFZERO(Total_Items_Aft_DropOff1), NULLIFZERO(Total_Items_Aft_DropOff2), Total_Matchable_Addr, Total_Items_Matched, 
Total_Items_Full_Matched, Total_Items_Partial_Matched, 
/*Total_Items_Unmatched Recalculated*/ 
(Total_Items_Handed_Over-Total_Items_Matched) as Total_Unmatched_Items,

Total_Items_Handed_Over, Total_Items_Not_Handed_Over,
Total_Paf_Addresses, Distinct_Parties_Covered, Distinct_Addresses_Covered,

/*Calculated Fields*/
/*Coverage Rate = Distinct Addresses/Total Paf addresses*/
(cast(cast(Distinct_Addresses_Covered AS decimal(15,3))/CAST(Total_Paf_Addresses AS decimal(15,3)) as decimal(4,3))) as Coverage_Rate,
/*Drop Off Rate*/
(cast(cast(NULLIFZERO(Total_Items_Aft_DropOff1) AS decimal(15,3))/CAST(Total_System_Items AS decimal(15,3)) as decimal(4,3))) as Drop_Rate,
(cast(cast(NULLIFZERO(Total_Items_Aft_DropOff2) AS decimal(15,3))/CAST(Total_System_Items AS decimal(15,2)) as decimal(4,3))) as Drop_Rate2,
/*Match Rate*/
(cast(cast(Total_Items_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,3)) as decimal(4,3))) as Match_Rate,
/*Full Match Rate*/
(cast(cast(Total_Items_Full_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Full_Match_Rate,
/*Partial Match Rate*/
(cast(cast(Total_Items_Partial_Matched AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Partial_Match_Rate,
/*Unmatch Rate*/
(cast(cast(Total_Unmatched_Items AS decimal(15,3))/CAST(NULLIFZERO(Total_Items_Handed_Over) AS decimal(15,2)) as decimal(4,3))) as Unmatch_Rate

FROM
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_daily_run" as run
INNER JOIN
Sys_Calendar.Calendar
ON
Load_Date=calendar_date

LEFT JOIN
"EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_addr_cov_daily" as cov
ON run.Source_System  = cov.Source_System 
AND run.Scver_Load_Dt = cov.Scver_Load_Dt
--AND run.Source_System is null
WHERE Total_Paf_Addresses is NULL
;

--------------------

/*Average Total Processed Records*/
SELECT Source_System, AVG(CAST(Total_System_Items as DECIMAL(10,2))) FROM "EDW_SCVER_CODA_BO_VIEWS"."v_qv_cc_scv_daily_run"
GROUP BY Source_System
;


----------------------

sel top 100
count (distinct Party_Id), SCVER_Load_Dttm
FROM
EDW_SCVER_CODA_BO_VIEWS.v_party
GROUP by SCVER_Load_Dttm
ORDER BY SCVER_LOAD_DTTM DESC;





