/* IDENTIFY THE ADDRESS */
 
 sel * from edw_scver_coda_accs_views.v_dim_address 
 where 1=1
 and address_id in 
 (313384260
,313384261
);


 --PAF_UDPRN = 52552748
 --and address_id = 313384261
 --; --- HP3 0GB 1S

 
/* CREATE REFERENCE PARTY_IDS */ 
 drop table VT_ADD_ID_313384260_313384261;
create volatile table VT_ADD_ID_313384260_313384261
as (
 sel distinct party_id as party_id
 from edw_scver_coda_accs_views.v_party_address
 where address_id IN ( 313384261, 313384260)
 and address_type_id = 1
 ) with data
 on commit preserve rows;
 
 sel count (*) from
 VT_ADD_ID_313384260_313384261
 ;
 
  sel * from
 VT_ADD_ID_313384260_313384261
 ;
 
 /* FIND REDIRECTIONS HISTORY */
 
 sel da.* from
 edw_scver_coda_dim_views.v_dim_agreement da
 inner join
 EDW_SCVER_CODA_DIM_VIEWS.v_fct_credo_redirectee fcr
 on da.dim_agreement_id = fcr.dim_agreement_id
 and fcr.to_scv_address_id IN ( 313384260,313384261)  -- Existing and historic redirections found
 --where from_scv_address_id = 313384261  -- no outbound redirections found!
 ;
 
/* GET THE PARTY NAMES */ 
 
 sel * from
  edw_scver_coda_accs_views.v_party
  where party_type_id = 1
  and party_id IN 
  (sel party_id from VT_ADD_ID_313384260_313384261)
  ;
 
 /* COUNT THE MAIL VOLUMES -- EVENTS */
 
sel party_id, data_source_type_id , event_actual_dt, count (distinct piece_id), count(distinct tag_id), count (*) from 
 edw_scver_coda_accs_views.v_event_party
 where party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 and event_actual_dt between date '2017-05-01' and date '2017-05-10'
 group by 1,2,3
 union
 sel party_id, data_source_type_id , event_actual_dt, count (distinct piece_id), count(distinct tag_id), count (*)  from 
 edw_scver_coda_accs_views.v_event_party
 where party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 and event_actual_dt between date '2017-05-11' and date '2017-05-20'
 group by 1,2,3
 union
 sel party_id, data_source_type_id , event_actual_dt, count (distinct piece_id), count(distinct tag_id), count (*)  from 
 edw_scver_coda_accs_views.v_event_party
 where party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 and event_actual_dt between date '2017-05-21' and date '2017-05-31'
 group by 1,2,3
 ;
 
 -- no results as fct_piece is out of date
 -- sel * from edw_scver_coda_dim_views.v_fct_piece_event 
 -- where event_actual_date between date '2017-05-01' and date '2017-05-10'
 -- and recipient_party_id in 
 --(sel party_id from VT_ADD_ID_313384260_313384261);   
 
 
 sel* from edw_scver_coda_accs_views.v_data_source_type;
 
 sel party_id, data_source_type_id , event_actual_dt, piece_id,  tag_id from 
 edw_scver_coda_accs_views.v_event_party
 where party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 and event_actual_dt between date '2017-05-01' and date '2017-05-10'
 union
 sel party_id, data_source_type_id , event_actual_dt, piece_id,  tag_id from 
 edw_scver_coda_accs_views.v_event_party
 where party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 and event_actual_dt between date '2017-05-11' and date '2017-05-20'
 union
 sel party_id, data_source_type_id , event_actual_dt, piece_id,  tag_id from 
 edw_scver_coda_accs_views.v_event_party
 where party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 and event_actual_dt between date '2017-05-21' and date '2017-05-31'
 ;
 
 
 /* RETRIEVE ALL MAIL MARK DATA DETAILS AVAILABLE */
 
 
 
 sel * from
 edw_scver_coda_accs_views.v_mears_shipper_piece 
 where
 tag_id in (
1855746770001,
1976276907473,
2062411183841,
4140905419105,
7679555416257,
7696726296273,
7696800598689,
7696930774065,
7697168630097,
7697270018465,
7697338097441,
7697431302961,
7697431302977,
7697488528769,
7697503620433,
7713944915857,
7714175151393,
7714414774977,
7731091291425,
7731379585238,
7731696181649,
7731991920497,
7732187958422,
7732628819094,
7748434030449,
7748542055761,
7748542086033,
7748807376865,
7748808877777,
7765484955185,
7765754634801,
7765908561585,
7765908561585,
7766343962321,
7766359478657,
7851388036433,
15703249318966
)
 and tag_creation_date between date '2017-05-01' and date '2017-05-31'
 ;
 
 
 sel msp.* from
 edw_scver_coda_accs_views.v_mears_shipper_piece msp
 inner join
  edw_scver_coda_accs_views.v_event_party evp
  --on evp.piece_id = msp.piece_id
  on evp.tag_id = msp.tag_id
  and evp.event_actual_dt between date '2017-05-01' and date '2017-05-10'
  and msp.tag_creation_date between date '2017-05-01' and date '2017-05-10'
  and evp.party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 union
  sel msp.* from
 edw_scver_coda_accs_views.v_mears_shipper_piece msp
 inner join
  edw_scver_coda_accs_views.v_event_party evp
  --on evp.piece_id = msp.piece_id
  on evp.tag_id = msp.tag_id
  and evp.event_actual_dt between date '2017-05-11' and date '2017-05-20'
  and msp.tag_creation_date between date '2017-05-11' and date '2017-05-20'
  and evp.party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 union
  sel msp.* from
 edw_scver_coda_accs_views.v_mears_shipper_piece msp
 inner join
  edw_scver_coda_accs_views.v_event_party evp
  --on evp.piece_id = msp.piece_id
  on evp.tag_id = msp.tag_id
  and evp.event_actual_dt between date '2017-05-21' and date '2017-05-31'
  and msp.tag_creation_date between date '2017-05-21' and date '2017-05-31'
  and evp.party_id in
 (sel party_id from VT_ADD_ID_313384260_313384261)
 ;
  
/* GET THEIR CONTACT DETAILS */ 
 
 sel * from
 edw_scver_coda_accs_views.v_electronic_address
 where electronic_address_id in
 (sel pa.address_id from VT_ADD_ID_313384260_313384261 vt
 inner join edw_scver_coda_accs_views.v_party_address pa
 on pa.party_id = vt.party_id
 and pa.address_type_id = 2
 )
 ;
 
 sel * from
 edw_scver_coda_accs_views.v_telephonic_address
where telephonic_address_id in
 (sel pa.address_id from VT_ADD_ID_313384260_313384261 vt
 inner join edw_scver_coda_accs_views.v_party_address pa
 on pa.party_id = vt.party_id
 and pa.address_type_id = 3
 )
 ;
 
 
 
 
 /*
 sel top 10 * from 
  edw_scver_coda_accs_views.v_mears_shipper_piece;
-- edw_scver_coda_dim_views.v_dim_agreement;
 --EDW_SCVER_CODA_DIM_VIEWS.v_dim_credo_redirectee;
 --EDW_SCVER_CODA_DIM_VIEWS.v_fct_credo_redirectee;
 */
 
 
 sel tag_creation_date , count(*) from
 edw_scver_coda_accs_views.v_mears_shipper_piece msp
 where msp.tag_creation_date between date '2017-05-21' and date '2017-05-31'
group by 1;


sel * from edw_scver_coda_accs_views.v_mears_shipper_piece
where eib_bc_addr_result = 'HP30GB1S'
and tag_creation_date between date '2017-05-01' and date '2017-05-10'
union
sel * from edw_scver_coda_accs_views.v_mears_shipper_piece
where eib_bc_addr_result = 'HP30GB1S'
and tag_creation_date between date '2017-05-11' and date '2017-05-20'
union
sel * from edw_scver_coda_accs_views.v_mears_shipper_piece
where eib_bc_addr_result = 'HP30GB1S'
and tag_creation_date between date '2017-05-21' and date '2017-05-31';


sel * from 
 EDW_SCVER_CODA_ACCS_VIEWS.v_mears_adf_stg
 where tag_creation_date between date '2017-05-01' and date '2017-05-31'
-- and mears_event_id IN (
--'04052017105426961002242539856',
--'04052017155306961002243025478',
--'05052017154518961002244552751',
--'05052017160545961002244621826',
--'05052017194439471001993465736',
--'06052017165729961002246593399',
--'06052017173534961002246698666',
--'09052017110248961002248370378',
--'09052017174537661001721654284',
--'10052017135140961002250478427',
--'12052017112212961002253190690',
--'12052017181128961002253855090',
--'12052017181548961002253863728',
--'13052017034927968002254499952',
--'13052017172622961002255366618',
--'16052017185209421002005057225',
--'17052017163618961002259233528',
--'17052017210747821002446594267',
--'18052017040404961002260031036',
--'18052017181944961002260815939',
--'18052017233301691001150887528',
--'19052017155432961002261976937',
--'20052017150804961002263206036',
--'20052017163109961002263413964',
--'20052017172922961002263588627',
--'22052017163818961002264280549',
--'24052017202016571001787611771',
--'25052017040227968002268432446',
--'25052017110704961002268554466',
--'25052017110704961002268554470',
--'27052017160506961002271889675',
--'30052017203311961002273191869',
--'31052017032804961002273606625',
--'31052017104030961002273767735',
--'31052017181937961002274761138')
and tag_id in (
7766359478657,
7731991920497,
7766343962321,
7749148632817,
7697503620433,
7697431302977,
7697431302961,
7732628819094,
2062411183841,
7731696181649,
7697270018465,
7748808877777,
7748807376865,
7714414774977,
3367883543457,
7732187958422,
7765908561585,
1976276907473,
7697168630097,
4140905419105,
7765754634801,
15703249318966,
7748542086033,
7748542055761,
7714175151393,
7696930774065,
1855746770001,
7748434030449,
7696800598689,
7731379585238,
7851388036433,
7765484955185,
7713944915857,
7731091291425,
7696726296273
 );

sel tag_creation_date, count (*) from EDW_SCVER_CODA_ACCS_VIEWS.v_mears_adf_stg
group by 1;
 

sel top 10 * from edw_scver_coda_accs_views.v_cc_match_results;

sel  * from
EDW_SCVER_CODA_ACCS_VIEWS.v_prep_mears_adf_scv
where tag_creation_date between date '2017-05-01' and date '2017-05-11'
and tag_id in (
7766359478657,
7731991920497,
7766343962321,
7749148632817,
7697503620433,
7697431302977,
7697431302961,
7732628819094,
2062411183841,
7731696181649,
7697270018465,
7748808877777,
7748807376865,
7714414774977,
3367883543457,
7732187958422,
7765908561585,
1976276907473,
7697168630097,
4140905419105,
7765754634801,
15703249318966,
7748542086033,
7748542055761,
7714175151393,
7696930774065,
1855746770001,
7748434030449,
7696800598689,
7731379585238,
7851388036433,
7765484955185,
7713944915857,
7731091291425,
7696726296273
 );
 
 
 
 select top 1000 * from edw_scver_coda_accs_views.v_cc_match_results where 1=1
 and dq_batch_id between 29000 and 30000
and addr_postcode = 'HP3 0GB' ;
 
 
select * from edw_scver_coda_accs_views.v_cc_batch_queue where cc_process_flag = 8;