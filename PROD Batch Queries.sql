sel *
From
EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
WHERE CC_PROCESS_FLAG = 9

ORDER BY DQ_BATCH_ID DESC
;

sel *
From
EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
WHERE DQ_Batch_ID = any (
--'21594', '20971', '20969'
'8486'
)
ORDER BY SCV_HANDOVER_DTTM DESC
;


SEL dq_batch_ID, count (*) FROM
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_MEARS_ADF_IN
WHERE DQ_BATCH_ID IN( 24195, 24196, 24425 )
group by 1
;



sel *
From
EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
--WHERE CC_PROGRESS_PERC <> 100
--WHERE CC_PROCESS_FLAG =99
WHERE SCV_Rows_Count = 2318179
--WHERE DQ_BATCH_ID = '20,937'
--20861
--20937
--20873
--20865
--WHERE SCV_CC_TARGET_SERVER =2
ORDER BY SCV_HANDOVER_DTTM DESC
;

sel *
From
EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
--WHERE CC_PROCESS_END_DTTM is null
--AND CC_PROCESS_START_DTTM is not NULL
--WHERE SCV_Rows_Count = 1465292
--WHERE DQ_BATCH_ID = '20,937'
--20861
--20937
--20873
--20865
WHERE SCV_CC_TARGET_SERVER = 1
ORDER BY SCV_HANDOVER_DTTM DESC
;


SELECT * 
--'00' as ID, 
--'Queue Size ("The backlog")' as Statistic, 
--CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, 
--count(*) as Batches,
--sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Pickup_Dttm is null 
and SCV_Priority_Ind <> 0
and CC_Process_Flag is null
;


/* Query to check MEARS Batches post 20 May */
select * from EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where scv_data_source='MEARS_ADF'
and scv_handover_dttm >= to_date('20/05/2016','dd/mm/yyyy')

;


/* Query to check all Failures */
select * from EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where cc_process_flag in (3,6,9);

/* Query to check long running downloads ,processing or uploads */
SELECT top 200* FROM EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where cc_process_flag in (1,5,7)
ORDER BY dq_batch_id DESC;

/* Query to check current execution of batches and servers they are running on */
SELECT top 200 * FROM EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where cc_process_flag=4
ORDER BY dq_batch_id DESC;

/* Query to check CPAC and ANCIL runs for the upload successful batches */
SELECT top 200 * FROM EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where cc_process_flag=8
ORDER BY dq_batch_id DESC;

/* Query to check the download queue waiting to be picked up by CC */
SELECT top 200 * FROM EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where cc_process_flag=2
ORDER BY dq_batch_id DESC;

/* Query to check MEARS batch creation.16 batches to be created in a day */
SELECT top 200 * FROM EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where scv_data_source='MEARS_ADF'
and scv_handover_dttm >= to_date('26/05/2016','dd/mm/yyyy')
ORDER BY dq_batch_id DESC;

/* Query to check other sources batch creation. */
SELECT top 200 * FROM EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where scv_data_source<>'MEARS_ADF'
and scv_handover_dttm >= to_date('26/05/2016','dd/mm/yyyy')
ORDER BY dq_batch_id DESC;

/*Query to check MEARS data extraction */
SELECT  * FROM EDW_SCVER.ADMIN_MEARS_ADF_EXTRACT 
ORDER BY last_extract_to_dt DESC;
