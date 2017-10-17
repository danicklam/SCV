SELECT "DQ_Batch_ID", "SCV_Data_Source", "SCV_Table_Name", "SCV_Rows_Count", "SCV_CC_Target_Server", "SCV_Handover_Dttm", "SCV_Priority_Ind", "SCV_Process_Flag", "CC_Pickup_Dttm", "CC_Process_Start_Dttm", "CC_Process_End_Dttm", "CC_UpLoad_Dttm", "CC_Rows_Count_Success", "CC_Rows_Count_Failed", "CC_Process_Flag", "SCV_Pickup_Dttm", "ETL_Module_Run_ID", "SCV_Load_Dttm", "SCV_Upd_Dttm", "CC_Progress_Perc", "COM_ETL_Module_Run_ID", "SCV_Com_Process_Start_Dttm", "SCV_Com_Process_End_Dttm", "SRC_Etl_Module_Run_Id", "SCV_Src_Process_Start_Dttm", "SCV_Src_Process_End_Dttm" FROM "EDW_SCVER_CODA_ACCS_VIEWS"."v_CC_BATCH_QUEUE"
where scv_data_source = 'TODS'
ORDER BY CC_Process_Start_Dttm DESC;




/* MEAR_TRAFFIC_COUNT_JS 8 MILLION */
/* data at the date level, DPS, Route_ID , DO */ 

--SEL COUNT * FROM
SEL top 100* FROM 
MgrS_TRAFFIC.MEARS_TRAFFIC_COUNT_JS;



/* MgrS_TRAFFIC.mears_traffic_count_tp */
/* data at the date level, DPS, Route_ID , DO */ 

SEL top 100* FROM 
--SEL COUNT * FROM
MgrS_TRAFFIC.mears_traffic_count_tp;


/* MgrS_TRAFFIC.parcel_high_receivers_tp */
/* data at the date level, DPS, Route_ID , DO */ 

SEL TOP 100* FROM
--SEL COUNT * FROM
MgrS_TRAFFIC.parcel_high_receivers_tp;


/* MgrS_TRAFFIC.TODS_HIGH_RECEIVERS_TP */
/* data at the date level, DPS, Route_ID , DO */ 

SEL TOP 100 * FROM
--SEL COUNT * FROM
MgrS_TRAFFIC.TODS_HIGH_RECEIVERS_TP
;


SEL 'MgrS_TRAFFIC.MEARS_TRAFFIC_COUNT_JS' as SOURCE, COUNT (*)
FROM
MgrS_TRAFFIC.MEARS_TRAFFIC_COUNT_JS
UNION
SEL 'MgrS_TRAFFIC.mears_traffic_count_tp' as SOURCE, COUNT (*)
FROM
MgrS_TRAFFIC.mears_traffic_count_tp
UNION
SEL 'MgrS_TRAFFIC.parcel_high_receivers_tp' as SOURCE, COUNT (*)
FROM
MgrS_TRAFFIC.parcel_high_receivers_tp
UNION
SEL 'MgrS_TRAFFIC.TODS_HIGH_RECEIVERS_TP' as SOURCE, COUNT (*)
FROM
MgrS_TRAFFIC.TODS_HIGH_RECEIVERS_TP;






SELECT Address_Id, Delivery_Point, COUNT( er_mpe_id)
FROM EDW_SCVER_BO_VIEWS.v_base_mpe mpe
INNER JOIN edw_Scver_coda_dim_views.v_dim_address vda
    ON OREPLACE(Delivery_Point, ' ', '') = OREPLACE(Postcode || Delivery_Point_Suffix_Val, ' ', '')
WHERE Location_ID IN ( 9699 )   --, 9391, 52624474
AND SUBSTR(tracked_event_cd, 1, 3) = 'EVK'
AND CAST(SUBSTR(scan_dttm_bt,1,10) AS DATE FORMAT 'yyyy-mm-dd') BETWEEN '2016-08-01' AND '2016-10-31'

and delivery_point not = ' '
GROUP BY 1, 2;


SEL TOP 100 *
FROM
EDW_SCVER_CODA_ACCS_VIEWS.v_SHIPPER_PIECE
WHERE SOURCE_SYSTEM ='POISE'
;

sELECT Address_Id, Delivery_Point, COUNT( er_mpe_id)
FROM eDW_SCVER_BO_VIEWS.v_base_mpe mpe
INNER JOIN edw_Scver_coda_dim_views.v_dim_address vda
    ON OREPLACE(Delivery_Point, ' ', '') = OREPLACE(Postcode || Delivery_Point_Suffix_Val, ' ', '')
WHERE Location_ID IN ( 9699 )   --, 9391, 52624474
AND SUBSTR(tracked_event_cd, 1, 3) = 'EVK'
/* AND CAST(SUBSTR(scan_dttm_bt,1,10) AS DATE FORMAT 'yyyy-mm-dd') BETWEEN '2016-10-01' AND '2016-10-01' */
AND CAST(SUBSTR(scan_dttm_bt,1,10) AS DATE FORMAT 'yyyy-mm-dd') = '2016-10-01' 

and delivery_point not = ' '
GROUP BY 1, 2

;
sel top 10 * from
EDW_SCVER_CODA_ACCS_VIEWS.v_base_mpe;

sel top 10 * FROM
EDW_SCVER_CODA_ACCS_VIEWS.v_pcl_ana_rep 
where reporting_dt = date '2017-03-02';



SEL min(event_actual_date), max(event_actual_date), count (*) from 
EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event 
where 
data_source_type_id =2
;

sel event_actual_date,count (distinct piece_id)
from
EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event 
where 
data_source_type_id =2
group by 1;


sel top 10 *
from
EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event 
where 
data_source_type_id =2 ;

  


