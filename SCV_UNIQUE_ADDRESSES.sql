---- UNIQUE ADDRESSES   5 to 6 mins

sel c1.event_actual_dt, c1.day_of_week, RMGTT, TODS, CREDO, POISE, MARS, KOGNITIO, MEARS, SIEBEL, SPS, PARCELS from
(sel calendar_date as event_actual_dt, day_of_week from
SYS_CALENDAR.Calendar where calendar_date between (current_date - 30) and current_date) c1
left join
(sel ep.event_actual_dt,  count(distinct pa.address_id) as RMGTT from edw_scver_coda_accs_views.v_event_party ep
inner join edw_scver_coda_accs_views.v_party_address pa
on ep.party_id = pa.party_id and pa.address_type_id = 1
and ep.event_actual_dt between (current_date - 30) and current_date 
and ep.data_source_type_id = 1
group by 1) x1
on c1.event_actual_dt = x1.event_actual_dt
left JOIN
(sel ep.event_actual_dt,  count(distinct pa.address_id) as TODS from edw_scver_coda_accs_views.v_event_party ep
inner join edw_scver_coda_accs_views.v_party_address pa
on ep.party_id = pa.party_id and pa.address_type_id = 1
and ep.event_actual_dt between (current_date - 30) and current_date 
and ep.data_source_type_id = 2
group by 1) x2
ON c1.event_actual_dt = x2.event_actual_dt
left JOIN  
(sel ep.event_actual_dt, count(distinct pa.address_id) as POISE 
from edw_scver_coda_accs_views.v_event_party ep 
inner join edw_scver_coda_accs_views.v_party_address pa
on ep.party_id = pa.party_id and pa.address_type_id = 1
and ep.event_actual_dt between (current_date - 30) and current_date 
and ep.data_source_type_id = 5
group by 1) x5
ON c1.event_actual_dt = x5.event_actual_dt
left JOIN  
(sel ep.event_actual_dt, count(distinct pa.address_id) as MEARS from edw_scver_coda_accs_views.v_event_party ep
inner join edw_scver_coda_accs_views.v_party_address pa
on ep.party_id = pa.party_id and pa.address_type_id = 1
and ep.event_actual_dt between (current_date - 30) and current_date 
and ep.data_source_type_id = 8
group by 1) x8
ON c1.event_actual_dt = x8.event_actual_dt
left JOIN  
(sel ep.event_actual_dt,  count(distinct pa.address_id) as PARCELS from edw_scver_coda_accs_views.v_event_party ep
inner join edw_scver_coda_accs_views.v_party_address pa
on ep.party_id = pa.party_id and pa.address_type_id = 1
and ep.event_actual_dt between (current_date - 30) and current_date 
and ep.data_source_type_id = 11
group by 1) x11
ON c1.event_actual_dt = x11.event_actual_dt
left JOIN  
(sel rev.transactionDate as event_actual_dt , count (distinct pa.address_id) as MARS
from EDW_SCVER_CODA_ACCS_VIEWS.v_revenue rev  -- sel top 10 * from EDW_SCVER_CODA_ACCS_VIEWS.v_revenue
inner join edw_scver_coda_accs_views.v_party_address pa
on rev.party_id = pa.party_id and pa.address_type_id = 1
and rev.transactiondate between (current_date - 30) and current_date
group by 1) x6
ON c1.event_actual_dt = x6.event_actual_dt
left JOIN  
(sel agg.recorded_appl_dt as event_actual_dt, count (distinct fpagg.to_address_id) as CREDO
from EDW_SCVER_CODA_ACCS_VIEWS.v_agreement agg -- sel top 10 * from EDW_SCVER_CODA_DIM_VIEWS.v_fct_party_agreement
inner join EDW_SCVER_CODA_DIM_VIEWS.v_fct_party_agreement fpagg -- sel top 10 * from EDW_SCVER_CODA_ACCS_VIEWS.v_party_agreement
on agg.agreement_id = fpagg.agreement_id
and agg.recorded_appl_dt between (current_date - 30) and current_date
group by 1 ) x4
ON c1.event_actual_dt = x4.event_actual_dt
left JOIN 
(sel cast(str.tran_start_dttm as date format 'yyyy-mm-dd') as event_actual_dt , count (distinct pa.address_id) as KOGNITIO
from EDW_SCVER_CODA_ACCS_VIEWS.v_sales_transaction str-- sel top 10 * from EDW_SCVER_CODA_ACCS_VIEWS.v_sales_transaction
inner join edw_scver_coda_accs_views.v_party_address pa
on str.party_id = pa.party_id and pa.address_type_id = 1
and str.source_system = 'KOGNITIO'
and str.tran_start_dttm between (current_date - 30) and  current_date
group by 1 )x7
ON c1.event_actual_dt = x7.event_actual_dt
left JOIN  
(sel opp.open_dt as event_actual_dt, count (distinct pa.address_id) as SIEBEL
from EDW_SCVER_CODA_ACCS_VIEWS.v_opportunity opp --- sel * from EDW_SCVER_CODA_ACCS_VIEWS.v_opportunity
inner join edw_scver_coda_accs_views.v_party_address pa
on opp.party_id = pa.party_id and pa.address_type_id = 1
and opp.open_dt between (current_date - 30) and current_date
group by 1) x9
ON c1.event_actual_dt = x9.event_actual_dt
left JOIN  
(sel ep.event_actual_dt, count(distinct pa.address_id) as SPS
from EDW_SCVER_CODA_ACCS_VIEWS.v_EVENT_PARTY ep
inner join edw_scver_coda_accs_views.v_party_address pa
on ep.party_id = pa.party_id and pa.address_type_id = 1
and ep.event_actual_dt between (current_date - 30) and current_date
and ep.data_source_type_id = 10
group by 1) x10
ON c1.event_actual_dt = x10.event_actual_dt
order by c1.event_actual_dt desc
;