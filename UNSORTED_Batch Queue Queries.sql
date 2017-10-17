SEL TOP 100* FROM
EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
WHERE cC_Process_end_dttm is null
and cc_process_flag <> 99;

SEL TOP 100* FROM
EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
WHere --scv_rows_count IN (782623, 9470301, 3764335, 18300441)
CC_Process_Flag = any (3,6,9)
;


SEL TOP 100* FROM
EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
WHere dq_batch_id = 24241;


sel dq_batch_id, count (*)
FROM EDW_SCVER_CODA_ACCS_VIEWS.V_CC_IN_IDENTITY
where dq_batch_id in ( 24193, 24239)

GROUP BY 1
;

sel dq_batch_id, count (*)
FROM EDW_SCVER_CODA_ACCS_VIEWS.V_CC_MEARS_ADF_IN
where dq_batch_id in ( 
24196,24195)

GROUP BY 1
;





SEL ba.dq_batch_id, ba.SCV_Data_Source, ba.SCV_Table_name, ba.SCV_Rows_Count, res.InputCount FROM
(SELECT * 
FROM "EDW_SCVER_CODA_ACCS_VIEWS"."v_cc_batch_queue"
WHERE CC_PROCESS_FLAG = 9) ba
INNER JOIN
(
SELECT dq_batch_id, count(distinct "SK_DQ_INPUT") as InputCount
FROM "EDW_SCVER_CODA_ACCS_VIEWS"."v_cc_match_results"
GROUP BY 1
WHERE DQ_BATCH_ID = any (
'24193','24239','24196','24195'
/* Use a list of batches with cc_process_flag = 9, */
/* put in a few at a time to reduce the load       */
)) res
ON ba.dq_batch_id=res.dq_batch_id
;


SEL TOP 100 *
FROM "EDW_SCVER_CODA_ACCS_VIEWS"."v_cc_match_results"
WHERE dq_Batch_id = any('24193','24239','24196','24195')
;

SEL TOP 100 *
FROM "EDW_SCVER_CODA_ACCS_VIEWS"."v_cc_match_results"
WHERE dq_Batch_id = any('21447')
;



sel top 1000 * from 
EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
where SCV_Data_Source = 'TODS'
order by DQ_Batch_Id ASC;
 
sel dq_batch_id , count(*) FROM
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_TODS_IN
group by 1
--where dq_batch_id = 21514
;

sel cnt.dq_batch_id, cnt.cnnt, bq.CC_process_flag from
(sel dq_batch_id , count(*) as cnnt FROM
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_TODS_IN
group by 1)cnt
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE bq
on bq.dq_batch_id= cnt.dq_batch_id
and bq.scv_data_source ='TODS'
--where dq_batch_id = 21514
;


sel dq_batch_id, count (*) from
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_RMGTT_IN
where record_status = 'R'
group by 1
;

sel cnt.dq_batch_id, cnt.cnnt, bq.CC_process_flag from
(sel dq_batch_id , count(*) as cnnt FROM
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_RMGTT_IN

group by 1)cnt
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE bq
on bq.dq_batch_id= cnt.dq_batch_id
and bq.scv_data_source ='RMGTT'
--where dq_batch_id = 21514
;

23626
23850


 --SCV_Rows_Count = 637043;
 
sel top 1000 * from 
EDW_SCVER_CODA_ACCS_VIEWS.v_CC_BATCH_QUEUE
--where SCV_Rows_Count = 677380
where scv_data_source = 'RMGTT'
order by DQ_Batch_Id DESC;
;

sel * from
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_RMGTT_IN
where dq_batch_id = 23850;


SEL * FROM
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_POISE_IN
Where dq_batch_id = '21506';

SEL * FROM
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_POISE_IN
Where dq_batch_id = '21506';


