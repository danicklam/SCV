/* ADDRESS SELECTION */

sel * from edw_scver_coda_accs_views.v_dim_address
where postcode = 'CV238AY'  
--where postcode = 'KT173HD'
;


sel pa.party_id, ind.*, da.* 
from edw_scver_coda_accs_views.v_party_address pa
inner join edw_scver_coda_accs_views.v_dim_address da
on da.address_id = pa.address_id
and da.address_id IN 
(
310469972,   -- R KENT
312829595,   -- T LAMB
311561107    -- J CONNING
)
inner join edw_scver_coda_accs_views.v_individual ind
on ind.party_id = pa.party_id
;




sel pa.party_id, ind.*, da.* 
from edw_scver_coda_accs_views.v_party_address pa
inner join edw_scver_coda_accs_views.v_dim_address da
on da.address_id = pa.address_id
and da.address_id IN 
(
322655093,
325440597,
313112369,
330003895,
305935646,
317529308,
332361646,
305341104,
311871630,
302408442,
319555548,
319555549,
311561107,
331444452,
331444451,
302408443,
331444453,
306689040
)
inner join edw_scver_coda_accs_views.v_individual ind
on ind.party_id = pa.party_id
;