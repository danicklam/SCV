/*
  * SOURCE CHECK
   */

sel cast(substr(file_header_date,2,8) as date format 'YYYYMMDD') as FILE_DATE, job_procsd_date, exec_status, 
(case when file_date = job_procsd_date and exec_status = 'SUCCESSFUL' then 'COMPLETE' ELSE 'BEHIND' END) as UPTODATE
,job_start_tmstmp, job_end_tmstmp
from edw_scver_coda_accs_views.v_file_load_control
where job_name like '%CREDO%' and data_file_name = 'MASTER'
order by file_date desc;

/*
  * PROCESS CHECK
   */
 
sel dq_batch_id, scv_data_source, scv_rows_count, 
 (case when cc_process_flag = 8 then 'COMPLETE' ELSE 'BEHIND' END) AS CC_STATUS, 
 (case when scv_com_process_end_dttm is not null then 'COMPLETE' ELSE 'BEHIND' END) AS CPAC_STATUS, 
 (case when scv_src_process_end_dttm is not null then 'COMPLETE' ELSE 'BEHIND' END) AS ANCIL_STATUS,
 scv_handover_dttm, cc_pickup_dttm, cc_process_start_dttm, cc_process_end_dttm, cc_upload_dttm,
 scv_com_process_start_dttm, scv_com_process_end_dttm, scv_src_process_start_dttm, scv_src_process_end_dttm
 from 
 edw_scver_coda_accs_views.v_cc_batch_queue
 where scv_data_source LIKE '%CREDO%'
 and scv_handover_dttm > current_date - 31
 order by dq_batch_id desc
 ;
 
 /*
   * DIMENSION CHECKS
    */
 
 sel cal.calendar_date, cal.day_of_week, cal.week_of_year, count (*) as DIM_COUNT , 
 (case when DIM_COUNT >1000  then 'COMPLETE' 
 WHEN DIM_COUNT = 1 and day_of_week = 1 then 'NOT RUN' 
 ELSE 'BEHIND' END) AS DIM_STATUS
 from 
 (sel * from 
 SYS_CALENDAR.Calendar 
 where calendar_date between (current_date - 31) and (current_date - 1)) cal
 left join
 EDW_SCVER_CODA_ACCS_VIEWS.v_agreement agg
 on cal.calendar_date = agg.recorded_appl_dt
 and agg.recorded_appl_dt between (current_date - 31) and current_date 

 group by 1, 2, 3
 order by cal.calendar_date desc
 ;
 
 
/*
 sel * from edw_scver_coda_accs_views.v_etl_module;
  */