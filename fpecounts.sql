 sel event_actual_date , data_source_type_id, count (*), count (distinct piece_id), count (distinct event_id)
 
 from edw_Scver_coda_dim_views.v_fct_piece_event 
  where event_actual_date >= date '2017-02-20'
 and event_actual_date < '2017-03-01'

 group by 1,2 ;
 
 
 sel * from 
 edw_scver_coda_accs_views.v_data_source_type
 ;
 
 
 sel event_actual_dt, count (*), count (distinct piece_id) from 
 edw_scver_coda_accs_views.v_event_party 
 where event_actual_dt = date '2017-01-18'
 and data_source_type_id = 5
 group by 1
 ;
 
 
 
 sel * from 
  edw_scver_coda_accs_views.v_event_party_role 
 ;
 
 
  /*

 

 

 

 */
 
 