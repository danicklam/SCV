 
sel cast(scv_handover_dttm as date) as Batch_Date  , scv_data_source, sum(scv_rows_count), count (distinct dq_batch_id) from
 edw_scver_coda_accs_views.v_cc_batch_queue
 where scv_handover_dttm > date '2017-06-01'
 and cc_process_flag = 8
 and scv_src_process_end_dttm is not null
 group by 1, 2
 order by Batch_Date DESC
 ;

  sel top 1000 * from   edw_scver_coda_accs_views.v_cc_batch_queue
  order by dq_batch_id desc
  ;
 
  sel cast(scv_src_process_end_dttm as date),
  count (distinct src_etl_module_run_id) ,  count (distinct dq_batch_id)
  from   edw_scver_coda_accs_views.v_cc_batch_queue
  where scv_src_process_end_dttm > date '2017-08-20'
  order by cast(scv_src_process_end_dttm as date) desc
  group by 1
  ;
  
 sel * from   edw_scver_coda_accs_views.v_cc_batch_queue
 where cc_process_flag <> 99 
 order by dq_batch_id desc;
 
SEL * from   edw_scver_coda_accs_views.v_cc_batch_queue
WHERE cc_process_flag <> 99 
AND scv_src_process_end_dttm is null
AND SCV_DATA_SOURCE <> 'DIM_ADDRESS'
AND SCV_DATA_SOURCE <> 'DIM_IDENTITY'
AND SCV_DATA_SOURCE <> 'PARTY'
AND SCV_DATA_source <> 'DIM_PARTY_DELETE'
AND SCV_DATA_source <> 'DIM_BUSINESS_CONTACTS'
order by dq_batch_id desc;


SEL * from   edw_scver_coda_accs_views.v_cc_batch_queue
WHERE cc_process_flag <> 99 
AND scv_src_process_end_dttm is null
--AND SCV_DATA_SOURCE <> 'DIM_ADDRESS'
--AND SCV_DATA_SOURCE <> 'DIM_IDENTITY'
--AND SCV_DATA_SOURCE <> 'PARTY'
--AND SCV_DATA_source <> 'DIM_PARTY_DELETE'
--AND SCV_DATA_source <> 'DIM_BUSINESS_CONTACTS'
order by dq_batch_id desc;
 
 
 SELECT   * 
 --'53' as ID, 'Slow Processing' as Statistic, CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, count(*) as Batches, sum(SCV_Rows_Count) as RowCount
 FROM     EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag not in ( '8','9','18','99') and CC_Pickup_Dttm <  cast(current_date as timestamp(2)) and SCV_Priority_Ind <> 0
;
 
  sel top 100 * from   edw_scver_coda_accs_views.v_cc_batch_queue
 order by dq_batch_id desc;
 

 sel count (*) from 
 edw_scver_coda_accs_views.v_cc_match_results
 where dq_batch_id = 35166;

sel top 999 * from 
 edw_scver_coda_accs_views.v_cc_batch_queue
 where scv_data_source LIKE '%TODS%'
-- where scv_cc_target_server in (3,4)
-- and scv_handover_dttm > date '2017-07-10'
 order by dq_batch_id desc
 ;
 
 sel cc_process_flag, count (distinct dq_batch_id)
 from edw_scver_coda_accs_views.v_cc_batch_queue group by 1;
 
 
 sel top 999 * from 
 edw_scver_coda_accs_views.v_cc_batch_queue
where scv_data_source NOT LIKE 'DIM%'
and scv_data_source NOT LIKE 'SIEBEL%'
and scv_data_source NOT LIKE 'MARS%'
 order by dq_batch_id desc
 ;
 
 
 sel tag_creation_date, count (*) from edw_scver_coda_accs_views.v_mears_shipper_piece
 where tag_creation_date between date '2017-07-15' and date '2017-07-16'
 group by 1;
 
 sel tag_creation_date, count (*) from edw_scver_coda_accs_views.v_mears_events
  where tag_creation_date between date '2017-07-15' and date '2017-07-16'
 group by 1;
 
 sel tag_creation_date, count ( *) from 
 EDW_SCVER_CODA_ACCS_VIEWS.v_mears_adf_stg
  where tag_creation_date between date '2017-07-15' and date '2017-07-16'
 group by 1;
 
  sel top 999 * from 
 edw_scver_coda_accs_views.v_cc_batch_queue
 --where cc_process_flag IN (1,3,6,9)
 --where cc_process_flag NOT IN (8, 99)
 --where cc_process_end_dttm is null and cc_process_flag <> 99
 order by dq_batch_id desc
 ;
 
 sel top 999 * from 
 edw_scver_coda_accs_views.v_cc_batch_queue
 --where cc_process_flag IN (1,3,6,9)
 where cc_process_flag IN (1,2,7)
 order by dq_batch_id desc
 ;
 sel top 999 * from 
 edw_scver_coda_accs_views.v_cc_batch_queue
 --where cc_process_flag IN (3,6,9)
 --where cc_process_flag <> 99
 order by dq_batch_id desc
 ;
 
  sel top 999 * from 
 edw_scver_coda_accs_views.v_cc_batch_queue
 where cc_process_flag <> 99
 and scv_data_source <> 'DIM_ADDRESS' and
 (
 cc_pickup_dttm is null 
 or cc_process_start_dttm is null
 or cc_process_end_dttm is null
 or cc_upload_dttm is null
 or (
 scv_data_source = 'DIM_ADDRESS' and 
 (cc_pickup_dttm is null 
 or cc_process_start_dttm is null
 or cc_process_end_dttm is null)
 )
 )
 order by dq_batch_id desc
 ;
 
 SHOW TABLE
 EDW_SCVER.eVENT_PARTY;
 ;
 SHOW VIEW
  EDW_SCVER_coda_accs_views.v_eVENT_PARTY;
 ;
 
 
 
   sel top 10 * from 
 EDW_SCVER_CODA_ACCS_VIEWS.v_agreement
 ;
 
 

 
 sel top 999 * from
  edw_scver_coda_accs_views.v_etl_module_details;
 

  
 sel * from 
 edw_scver_coda_accs_views.v_data_source_type;
 
 
 
 sel event_actual_dt, data_source_type_id, count(*)
 from
 edw_scver_coda_accs_views.v_event_party
 where event_actual_dt between (current_date - 60) and current_date
 group by 1,2

 union
 
 sel transactionDate as event_actual_dt , 6 as data_source_type_id, count (*)
from EDW_SCVER_CODA_ACCS_VIEWS.v_revenue
where transactiondate between (current_date - 60) and current_date
group by 1,2
 
 
 UNION
 
 sel recorded_appl_dt as event_actual_dt, 4 as data_source_type_id, count (*) 
 from 
 EDW_SCVER_CODA_ACCS_VIEWS.v_agreement
 where recorded_appl_dt between (current_date - 60) and current_date
 group by 1,2
 
 UNION
 
 sel cast(tran_start_dttm as date format 'yyyy-mm-dd') as event_actual_dt, 7 as data_source_type_id , count (*)
 from
 EDW_SCVER_CODA_ACCS_VIEWS.v_sales_transaction
 where source_system = 'KOGNITIO'
 and tran_start_dttm between (current_date - 60) and current_date
 group by 1, 2


UNION
 
 sel open_dt as event_actual_dt, 9 as data_source_type_id, count (*)
 from
 EDW_SCVER_CODA_ACCS_VIEWS.v_opportunity
 where open_dt between (current_date - 60) and current_date
 group by 1,2
 
 UNION
 
 sel event_actual_date as event_actual_dt,  10 as data_source_type_id,  count(*) 
 from
 EDW_SCVER_CODA_ACCS_VIEWS.v_SERVICEPOINT_EVENT
 where event_actual_date between (current_date - 60) and current_date
 group by 1,2
;

show view
edw_scver_bo_views.v_bo_base_track_data_dtl
;

show table
edw_scver.bo_base_track_data_dtl
;

sel  current_record_ind, count (*) from edw_scver_coda_dim_views.v_dim_address
where prem_pobox is not null
and prem_pobox <>''
and prem_pobox <> ' '
group by 1
;




select er_mpe_id, event_dttm, unique_item_id, tracked_event_cd, location_id, delivery_point, delivery_point_postcode from edw_scver_coda_accs_views.v_base_mpe where er_dttm  between (current_date - 7)  and current_date
; 

sel top 10 * from
EDW_SCVER_CODA_ACCS_VIEWS.v_base_mpe;
 
 drop table 
 MgrS_SELF_SERVE_CDT.TDCSPSTAGE_043357704;
 
 
 sel source_channel, count(*) from
  EDW_SCVER_CODA_ACCS_VIEWS.v_opportunity
  group by 1;
 
 sel top 10 * from
 --EDW_SCVER_CODA_ACCS_VIEWS.v_EVENT;
 EDW_SCVER_CODA_ACCS_VIEWS.v_opportunity;
 
 sel * from
 EDW_SCVER_CODA_ACCS_VIEWS.v_event_type;
 
 sel top 100 * from
 EDW_SCVER_CODA_ACCS_VIEWS.v_sales_transaction_line
 ;
 
 sel * from 
 dbc.usersV
 ;
 
 sel * from
 DBC.AllRoleRights;
 
 
 sel *
 from
 EDW_SCVER_CODA_ACCS_VIEWS.v_sales_transaction
 where tran_start_dttm is null


 order by tran_Start_dttm desc;
 --and tran_start_dttm between (current_date - 60) and current_date
 
 
 sel event_actual_date, data_source_type_Id , count(*)
 from edw_scver_coda_dim_views.v_fct_piece_event
 where event_actual_date between date '2017-03-01' and date '2017-05-03'
 group by 1,2;
 
 
 sel top 999 * from 
 EDW_SCVER_CODA_ACCS_VIEWS.v_etl_module_details
 where run_date between current_date - 60 and current_date
 and stage_name <> 'MYPOST SCVER'
 order by run_date desc;
 
 
 sel top 999 * from 
 EDW_SCVER_CODA_ACCS_VIEWS.v_etl_job_details
 order by job_starttime desc;
 
 sel top 10 * 
  from DBC.DBQLogTbl
 ;
 
 sel count (distinct party_id) from edw_scver_coda_accs_views.v_party;
 
 sel top 10* from edw_scver_coda_accs_views.v_individual;
 
 sel top 10 * from edw_scver_coda_dim_views.v_dim_party
 ;
 
 
 
 sel count (distinct address_id) from 
EDW_SCVER_CODA_ACCS_VIEWS.v_address_cluster
where indiv_cluster_id is not null;

 
 /*
 MgrS_SELF_SERVE_CDT.TDCSPSTAGE_041457342
 sel
 
 MgrS_SELF_SERVE_CDT.TDCSPSTAGE_043357704
 */


sel
 clientID, count(*), sum (numsteps), sum(numresultrows), sum(spoolusage), sum(ampcputime), sum(parserCPUtime)  
 from DBC.DBQLogTbl
 --and collecttimestamp > '2017-09-01 00:00:00'
 where  clientID NOT IN 
 ('SCVER_ETL', 'IIS APPPOOL\OPERATIONSSTANDARD','DB2BOBJ','SVC_INET_QLIKVIEW_01','SVC_APP_CLEARCORE_01',
 'S-RMG-QV-ADMIN','ROOT','CONAN','JUNO_D2D', 'DMUSER','TEST.INTEGRATEDCOMPLIANCE.ROYA')
 and acctstring <> 'DBC'
 and appid NOT IN ('W3WP', 'SERVICE','BTEQ')
 and statementtype NOT IN ('Help','Collect Statistics','Commit Work','Show','Database','Modify Database','Set Query_Band')
 group by clientID
 order by count (*) desc
 ;
 


 
 sel
 collecttimestamp, acctstring, clientID, logonsource, appid, numsteps, 
 numresultrows, numofactiveamps, spoolusage, ampcputime, parserCPUtime, 
 statementtype, querytext  
 from DBC.DBQLogTbl
 --and collecttimestamp > '2017-09-01 00:00:00'
 where  clientID NOT IN 
 ('SCVER_ETL', 'IIS APPPOOL\OPERATIONSSTANDARD','DB2BOBJ','SVC_INET_QLIKVIEW_01','SVC_APP_CLEARCORE_01',
 'S-RMG-QV-ADMIN','ROOT','CONAN','JUNO_D2D', 'DMUSER','TEST.INTEGRATEDCOMPLIANCE.ROYA')
 --and clientID = 'XXXXXX'
 and acctstring <> 'DBC'
 and appid NOT IN ('W3WP', 'SERVICE','BTEQ')
 and statementtype NOT IN ('Help','Collect Statistics','Commit Work','Show','Database','Modify Database','Set Query_Band')
 order by spoolusage desc
 ;
 
 
 sel 
 collecttimestamp, acctstring, clientID, logonsource, appid, numsteps, 
 numresultrows, numofactiveamps, spoolusage, ampcputime, (spoolusage/ampcputime), parserCPUtime, 
 statementtype, querytext  
 from DBC.DBQLogTbl
 where clientID IN ('UNKNOWNUSER', 'SCVER_ETL','DB2BOBJ','CONAN')
 --and collecttimestamp > '2017-08-25 00:00:00'
 and ampcputime is not null
 and ampcputime > 10000
 and spoolusage >100
 and spoolusage is not null
 order by spoolusage desc
 ;
 
 
 sel count (*) from
 DBC.DBQLogTbl
 ;
 
 sel min(collecttimestamp) from DBC.DBQLogTbl;
 
 sel clientId, APPID, count(*), sum(numsteps), sum(spoolusage), sum (AMPCPUTIME), sum(PARSERCPUTIME)
 from DBC.DBQLogTbl
  --where collecttimestamp > '2017-08-31 00:00:00'
  --and collecttimestamp   <'2017-09-02 00:00:00'
  order by sum(spoolusage) desc
  group by 1,2
  ;
  
  sel--- (cast (collecttimestamp as format'YYYY-MM-DD HH')) , 
  (cast (collecttimestamp as date)),
  extract (hour from collecttimestamp), 
  count(*), sum(spoolusage), sum (AMPCPUTIME), sum(PARSERCPUTIME)
  from DBC.DBQLogTbl
  group by 1,2
  ;             
               
  
  select count (*) from edw_scver_coda_accs_views.v_event_party;
              
  sel dest_country, obacountryname, isocountrycode, isocountryname, count (*)  from 
  MgrS_SELF_SERVE_CDT.VW_RPT_INTLREVMAN
  group by 1,2,3,4
  ;
  
  sel count (*) from edw_scver_coda_accs_views.v_base_mpe;
  sel count (*) from edw_scver_coda_accs_views.v_delivery;
  sel count (*) from edw_scver_bo_views.v_bo_base_track_data_dtl;
 
  
 sel 
 collecttimestamp, acctstring, clientID, logonsource, appid, numsteps, 
 numresultrows, numofactiveamps, spoolusage, ampcputime, parserCPUtime, 
 statementtype, querytext  
 from DBC.DBQLogTbl
 where collecttimestamp >= '2017-09-01 00:00:00'
 and clientID NOT IN 
 ('SCVER_ETL', 'IIS APPPOOL\OPERATIONSSTANDARD','DB2BOBJ','SVC_INET_QLIKVIEW_01','SVC_APP_CLEARCORE_01',
 'S-RMG-QV-ADMIN','ROOT','CONAN','JUNO_D2D', 'DMUSER','TEST.INTEGRATEDCOMPLIANCE.ROYA')
 and acctstring <> 'DBC'
 and appid NOT IN ('W3WP', 'SERVICE','BTEQ')
 and statementtype NOT IN ('Help','Collect Statistics','Commit Work','Show','Database','Modify Database','Set Query_Band')
 order by collecttimestamp desc
 ;
 
 sel top 10 * from edw_scver_coda_dim_views.v_dim_address;
 
 
 sel data_source_type_id, event_actual_date, count (*) from edw_scver_coda_dim_views.v_fct_piece_event
 where event_actual_date between date '2017-09-01' and date '2017-09-06'
 group by 1,2
 UNION
 
  sel data_source_type_id, event_actual_date, count (*) from edw_scver_coda_dim_views.v_fct_piece_event
 where event_actual_date between date '2017-08-01' and date '2017-08-31'
 group by 1,2
 UNION
  sel data_source_type_id, event_actual_date, count (*) from edw_scver_coda_dim_views.v_fct_piece_event
 where event_actual_date between date '2017-07-01' and date '2017-07-31'
 group by 1,2
 
 ;
 
 show view
 edw_scver_coda_accs_views.v_base_mpe
 ;
 
 show view
 edw_scver_bo_views.v_base_mpe
 ;
 