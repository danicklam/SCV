sel top 10 * from edw_scver_coda_dim_views.v_dim_agreement;

sel agreement_status_type_desc, agmt_end_dt ,count (*)
from edw_scver_coda_dim_views.v_dim_agreement
where agreement_status_type_desc = 'ACTIVE'
group by 1,2
order by agmt_end_dt desc
;

sel * from edw_scver_coda_accs_views.v_credo_products_control
order by run_time desc;