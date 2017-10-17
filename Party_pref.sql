sel top 100 * from
EDW_SCVER_CODA_ACCS_VIEWS.v_party_privacy_preferences
;


sel count (*) from
EDW_SCVER_CODA_ACCS_VIEWS.v_party_privacy_preferences
;


sel ppp.* from 
EDW_SCVER_CODA_ACCS_VIEWS.v_party_privacy_preferences ppp
where ppp.data_source_cd = 'SIEBEL'
;


--EDW_SCVER_CODA_ACCS_VIEWS.v_prep_siebel_party


/* Get all N21 postal addresses */

create volatile table vt_N21 as (
sel da.* from edw_scver_coda_dim_views.v_dim_address
where postcode = 'N21%'
) with data
;

/* Get the parties ID assocaited to psotal addresses */

create volatile table vt_N21_parties as (
sel distinct pa.party_id, n21.*  
from edw_scver_coda_dim_views.v_party_address pa
inner join 
vt_N21 n21
ON n21.address_id = pa.address_id
and pa.address_type_id =1
) with data
;

/* Get the emails associated to those parties */

create volatile table vt_N21_email_parties as (
sel n21.party_id, pa.address_id
from vt_N21_parties n21
inner join 
edw_scver_coda_dim_views.v_party_address pa
on n21.party_id = pa.party_id
and pa.address_type_id = 2

) with data
;


create volatile table vt_N21_emails as (
sel em.*
from vt_N21_email_parties em
inner join 
edw_scver_coda_dim_views.v_electronic_address ea
on em.address_id = ea.party_id
) with data
;


sel * from
EDW_SCVER_CODA_ACCS_VIEWS.v_party_privacy_preferences pp
inner join
vt_N21_parties N21P
on N21P.party_id = pp.party_id

;

---------------------

SELECT  
Data_Source_Cd ,
Lastname ,
--Party_Name ,
Party_Type_Desc ,
Address ,
Electronic_Address ,
Postcode   ,
Email_Preference_Ind ,
Telephonic_Preference_Ind ,
Mail_Preference_Ind ,
Privacy_Data_Usage_Cd 
FROM EDW_SCVER_CODA_BO_VIEWS.v_dim_party DP 
INNER JOIN  MGRS_SELF_SERVE_CDT_ANALYSIS_DEV.MARKETING_ANALYSIS_RMG_N21   MAR 
on DP.Party_Id=MAR.Party_Id 
and DP.Address_Id=MAR.Address_Id 
and Party_Type_Id =1 
;

sel * from
MGRS_SELF_SERVE_CDT_ANALYSIS_DEV.MARKETING_ANALYSIS_RMG_N21;
