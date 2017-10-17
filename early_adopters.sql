show view
EDW_SCVER_CODA_BO_VIEWS.v_rptng_coda_ea_party_actvty
;

sel top 10 * from 
EDW_SCVER_BO_VIEWS.V_TODS_TRACKED_PRE_ADVICE;

SELECT  * FROM dbc.tables 
WHERE  tablename like '%TODS_TRACKED_PRE_ADVICE%'
;

select count (*) from
EDW_SCVER_BO_VIEWS.V_TODS_TRACKED_PRE_ADVICE
;

show table 
EDW_SCVER.RPTNG_CODA_EA_PARTY_ACTVTY;

sel count (*) from 
EDW_SCVER_CODA_BO_VIEWS.v_rptng_coda_ea_party_actvty ;
sel count (*) from 
EDW_SCVER_CODA_BO_VIEWS.v_rptg_coda_ea_partyclstr_addr;

sel top 10 * from 
EDW_SCVER_CODA_BO_VIEWS.v_rptg_coda_ea_partyclstr_addr;

sel top 100 * from 
EDW_SCVER_CODA_BO_VIEWS.v_rptng_coda_ea_party_actvty 
where source_system = 'TODS';