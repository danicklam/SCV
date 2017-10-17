 

select * from 
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
INNER JOIN
EDW_SCVER_CODA_ACCS_VIEWS.v_individual i
ON pa.party_id = i.party_id
AND  pa.address_id = 312829595
;


select * from 
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
where pa.address_id = 312829595;