SEL 
'v_stg_credo_bus_prof' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
FROM
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_bus_prof

UNION SEL 
'v_stg_credo_common' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)

FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_common

UNION SEL 
'v_stg_credo_common_ref' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_common_ref

UNION SEL 
'v_stg_credo_fraud_addr' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_fraud_addr

UNION SEL 
'v_stg_credo_payment' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
--,min(date0), max(date0)
FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_payment

UNION SEL 
'v_stg_credo_delivery_office' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_delivery_office

UNION SEL 
'v_stg_credo_media' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_media

UNION SEL 
'v_stg_credo_redir_flag' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_redir_flag

UNION SEL 
'v_stg_credo_title_list' as tablename, count(*),
min(SCVER_LOAD_DTTM), max(SCVER_LOAD_DTTM)
, min(SCVER_Upd_DTTM), max(SCVER_UPD_DTTM)
FROM 
EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_title_list
;
