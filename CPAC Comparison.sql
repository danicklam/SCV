sel com_etl_module_run_id , count (distinct dq_batch_id), sum (scv_rows_count)(integer),
min(scv_com_process_start_dttm), max(scv_com_process_end_dttm)
from edw_scver_coda_accs_views.v_cc_batch_queue
where dq_batch_id > 31139
group by 1 order by com_etl_module_run_id desc;


sel * from
edw_scver_coda_accs_views.v_cc_batch_queue
order by dq_batch_id desc
where cc_process_flag in (3,6,9);

sel count (*) from edw_scver_coda_accs_views.v_mears_shipper_piece
where tag_creation_date = date '2017-07-04';
sel tag_creation_date, count (*) from edw_scver_coda_accs_views.v_mears_shipper_piece
where tag_creation_date > date '2017-07-01' group by 1;