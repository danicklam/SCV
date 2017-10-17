sel * from 
edw_scver_coda_accs_views.v_cc_batch_queue
where cc_process_flag in (3,6,9);


sel Count (*) from
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_POISE_IN
where dq_batch_id = 29071 ;

sel top 100 * from
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_MATCH_RESULTS
where dq_batch_id = 29071 ;


sel count (*) from
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_POISE_IN pin
inner join
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_MATCH_RESULTS mr
on mr.sk_dq_input = pin.sk_id
and mr.dq_batch_id = 29071
and pin.dq_batch_id = 29071;




sel count (*) from
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_POISE_IN pin
where pin.dq_batch_id = 29071
and pin.sk_id NOT IN (
sel mr.sk_dq_input from
EDW_SCVER_CODA_ACCS_VIEWS.V_CC_MATCH_RESULTS mr
where mr.dq_batch_id = 29071
)
;

