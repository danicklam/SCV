----------------UNIQUE ITEMS   3 to 5 mins to run

sel c1.event_actual_dt, c1.day_of_week, RMGTT, TODS, CREDO, POISE, MARS, KOGNITIO, MEARS, SIEBEL, SPS, PARCELS from
(sel calendar_date as event_actual_dt, day_of_week from
SYS_CALENDAR.Calendar where calendar_date between (current_date - 30) and current_date) c1
left join
(sel event_actual_dt,  count(distinct piece_id) as RMGTT from edw_scver_coda_accs_views.v_event_party
where event_actual_dt between (current_date - 30) and current_date 
and data_source_type_id = 1
group by 1) x1
on c1.event_actual_dt = x1.event_actual_dt
left JOIN
(sel event_actual_dt,  count(distinct piece_id) as TODS from edw_scver_coda_accs_views.v_event_party
where event_actual_dt between (current_date - 30) and current_date 
and data_source_type_id = 2
group by 1) x2
ON c1.event_actual_dt = x2.event_actual_dt
left JOIN  
(sel cast(event_actual_date as date format 'YYYY-MM-DD') as event_actual_dt, count(distinct piece_id) as POISE 
from edw_scver_coda_accs_views.v_poise_postal_piece_event
where event_actual_date between (current_date - 30) and current_date 
group by 1) x5
ON c1.event_actual_dt = x5.event_actual_dt
left JOIN  
(sel event_actual_dt, count(distinct tag_id) as MEARS from edw_scver_coda_accs_views.v_event_party
where event_actual_dt between (current_date - 30) and current_date 
and data_source_type_id = 8
group by 1) x8
ON c1.event_actual_dt = x8.event_actual_dt
left JOIN  
(sel event_actual_dt,  count(distinct piece_id) as PARCELS from edw_scver_coda_accs_views.v_event_party
where event_actual_dt between (current_date - 30) and current_date 
and data_source_type_id = 11
group by 1) x11
ON c1.event_actual_dt = x11.event_actual_dt
left JOIN  
(sel transactionDate as event_actual_dt , count (distinct revenue_id) as MARS
from EDW_SCVER_CODA_ACCS_VIEWS.v_revenue
where transactiondate between (current_date - 30) and current_date
group by 1) x6
ON c1.event_actual_dt = x6.event_actual_dt
left JOIN  
(sel recorded_appl_dt as event_actual_dt, count (distinct agreement_id) as CREDO
from EDW_SCVER_CODA_ACCS_VIEWS.v_agreement
where recorded_appl_dt between (current_date - 30) and current_date
group by 1 ) x4
ON c1.event_actual_dt = x4.event_actual_dt
left JOIN  
(sel cast(tran_start_dttm as date format 'yyyy-mm-dd') as event_actual_dt , count (distinct sales_tran_id) as KOGNITIO
from EDW_SCVER_CODA_ACCS_VIEWS.v_sales_transaction
where source_system = 'KOGNITIO'
and tran_start_dttm between (current_date - 30) and  current_date
group by 1 )x7
ON c1.event_actual_dt = x7.event_actual_dt
left JOIN  
(sel open_dt as event_actual_dt, count (distinct opportunity_id) as SIEBEL
from EDW_SCVER_CODA_ACCS_VIEWS.v_opportunity
where open_dt between (current_date - 30) and current_date
group by 1) x9
ON c1.event_actual_dt = x9.event_actual_dt
left JOIN  
(sel event_actual_dt, count(distinct piece_id) as SPS
from EDW_SCVER_CODA_ACCS_VIEWS.v_EVENT_PARTY
where event_actual_dt between (current_date - 30) and current_date
and data_source_type_id = 10
group by 1) x10
ON c1.event_actual_dt = x10.event_actual_dt
order by c1.event_actual_dt desc
;

 