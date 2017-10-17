-- ClearCore Health Metric SQL
-- John Platten
-- Infoshare Limited
-- 04/12/2015

SELECT '00' as ID, 'Queue Size ("The backlog")' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Pickup_Dttm is null 
and SCV_Priority_Ind <> 0
and CC_Process_Flag is null

UNION

SELECT '01' as ID, 'Queue Batches > 20M' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Pickup_Dttm is null 
and SCV_Priority_Ind <> 0
and CC_Process_Flag is null
and SCV_Rows_Count > 20000000

UNION

SELECT '11' as ID, 'Engine 1 (processing)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('4') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '1'

UNION

SELECT '12' as ID, 'Engine 2 (processing)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('4') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '2'

UNION

SELECT '13' as ID, 'Engine 3 (processing)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('4') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '3'

UNION

SELECT '14' as ID, 'Engine 4 (processing)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('4') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '4'

UNION

SELECT '21' as ID, 'Engine 1 (uploading)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('7') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '1'

UNION

SELECT '22' as ID, 'Engine 2 (uploading)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('7') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '2'

UNION

SELECT '23' as ID, 'Engine 3 (uploading)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('7') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '3'

UNION

SELECT '24' as ID, 'Engine 4 (uploading)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('7') and SCV_Priority_Ind <> 0
and SCV_CC_Target_Server = '4'

UNION

SELECT '31' as ID, 'Engine 1 (completed since 00:00)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('8')
and SCV_CC_Target_Server = '1'
and CC_Upload_Dttm >  cast(current_date as timestamp(2))

UNION

SELECT '32' as ID, 'Engine 2 (completed since 00:00)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('8') 
and SCV_CC_Target_Server = '2'
and CC_Upload_Dttm >  cast(current_date as timestamp(2))

UNION

SELECT '33' as ID, 'Engine 3 (completed since 00:00)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('8') 
and SCV_CC_Target_Server = '3'
and CC_Upload_Dttm >  cast(current_date as timestamp(2))

UNION

SELECT '34' as ID, 'Engine 4 (completed since 00:00)' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ('8') 
and SCV_CC_Target_Server = '4'
and CC_Upload_Dttm >  cast(current_date as timestamp(2))

UNION


SELECT '50' as ID,'CC Download Failure' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag= '3'and CC_Process_Flag not in ( '99') and SCV_Priority_Ind <> 0

UNION 

SELECT '51' as ID, 'CC Processing Failure' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag= '6'and CC_Process_Flag not in ( '99') and SCV_Priority_Ind <> 0

UNION 

SELECT '52' as ID, 'CC Upload Failure' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag= '9'and CC_Process_Flag not in ( '99') and SCV_Priority_Ind <> 0

UNION 

SELECT '53' as ID, 'Slow Processing' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag not in ( '8','9','18','99') and CC_Pickup_Dttm <  cast(current_date as timestamp(2)) and SCV_Priority_Ind <> 0

UNION

SELECT '54' as ID,'Batch Write Error' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(A) as Batches, sum(B) as RowCount
FROM
(
SELECT DQ_Batch_ID as A, count(*) as B
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_match_results
where ADDR_Postcode like '%[%'
group by 1
) as Subqry

UNION

SELECT '90' as ID, 'Ops Suspension' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt , 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where SCV_Priority_Ind = 0  and (CC_Process_Flag not in ( '18','99') or CC_Process_Flag is null)

UNION

SELECT '98' as ID, 'Ops Delayed Upload' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt , 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where  CC_Process_Flag =  '18' 

UNION

SELECT '99' as ID, 'Ops Cancelled' as Statistic, 
CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag in ( '99');

