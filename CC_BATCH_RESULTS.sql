/*
sel cast(scv_handover_dttm as date) as Batch_Date  , scv_data_source, sum(scv_rows_count), count (distinct dq_batch_id) from
 edw_scver_coda_accs_views.v_cc_batch_queue
 where scv_handover_dttm > date '2017-06-01'
 and cc_process_flag = 8
 and scv_src_process_end_dttm is not null
 group by 1, 2
 order by Batch_Date DESC
 ;
*/
 
 sel c1.BATCH_DATE, c1.day_of_week, 
 RMGTT, TODS, CREDO, POISE, MARS, KOGNITIO, MEARS, SIEBEL, SPS, PARCELS, 
 RMGTT_BATCHES, TODS_BATCHES, CREDO_BATCHES, POISE_BATCHES, MARS_BATCHES, 
 KOGNITIO_BATCHES, MEARS_BATCHES, SIEBEL_BATCHES, SPS_BATCHES, PARCELS_BATCHES
 from
(sel calendar_date as BATCH_DATE, day_of_week from
 SYS_CALENDAR.Calendar where calendar_date between (current_date - 30) and current_date) c1
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS RMGTT, count (distinct dq_batch_id) AS RMGTT_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE = 'RMGTT'
 group by 1) S1
 ON C1.BATCH_DATE = S1.BATCH_DATE
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS TODS, count (distinct dq_batch_id) AS TODS_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE = 'TODS'
 group by 1) S2
 ON C1.BATCH_DATE = S2.BATCH_DATE
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS CREDO, count (distinct dq_batch_id) AS CREDO_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE LIKE 'CREDO%'
 group by 1) S3
 ON C1.BATCH_DATE = S3.BATCH_DATE
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS POISE, count (distinct dq_batch_id) AS POISE_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE = 'POISE'
 group by 1) S4
 ON C1.BATCH_DATE = S4.BATCH_DATE
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS MARS, count (distinct dq_batch_id) AS MARS_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE LIKE 'MARS%'
 group by 1) S5
 ON C1.BATCH_DATE = S5.BATCH_DATE
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS KOGNITIO, count (distinct dq_batch_id) AS KOGNITIO_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE LIKE 'KOGNITIO%'
 group by 1) S6
 ON C1.BATCH_DATE = S6.BATCH_DATE
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS MEARS, count (distinct dq_batch_id) AS MEARS_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE = 'MEARS_ADF'
 group by 1) S7
 ON C1.BATCH_DATE = S7.BATCH_DATE 

 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS SIEBEL, count (distinct dq_batch_id) AS SIEBEL_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE LIKE 'SIEBEL%'
 group by 1) S8
 ON C1.BATCH_DATE = S8.BATCH_DATE 
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS SPS, count (distinct dq_batch_id) AS SPS_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE = 'SPS'
 group by 1) S9
 ON C1.BATCH_DATE = S9.BATCH_DATE 
 
 LEFT JOIN
 (sel cast(scv_handover_dttm as date) as Batch_Date  , 
 sum(scv_rows_count) AS PARCELS, count (distinct dq_batch_id) AS PARCELS_BATCHES 
 from edw_scver_coda_accs_views.v_cc_batch_queue
 where 1=1
 and cc_process_flag = 8 and scv_src_process_end_dttm is not null
 AND SCV_DATA_SOURCE = 'PARCELS'
 group by 1) S10
 ON C1.BATCH_DATE = S10.BATCH_DATE 
 
 
 
 ORDER BY C1.BATCH_DATE DESC
 ;