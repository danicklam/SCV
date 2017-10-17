SELECT * FROM
dbc.users WHERE 
username = 'lam_c'
;
   
drop table scverupdtable;

create volatile table SCVERUPDTABLE  as 
(
sel top 99999 recipient_party_id, recipient_address_id, 
CAST(CAST(SCVER_UPD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE
FROM
EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event
where Event_Actual_Date = date '2016-09-01'
) WITH DATA --NO PRIMARY INDEX
NO PRIMARY INDEx
ON COMMIT PRESERVE ROWS
;

sel SCVDATE, count(*), count(distinct Recipient_Party_id), count (distinct Recipient_address_id)
from sCVERUPDTABLE
GROUP BY SCVDATE
;


-----------------------------------------------------------

sel event_actual_date, count(*), count (distinct recipient_party_id), count (distinct recipient_address_id)
FROM
EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event
where Event_Actual_Date > date '2016-09-01'
and Event_Actual_Date < date '2016-09-01'
;
   
---------------------------------------------------------------------------------   

sel top 100
CAST(CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count(distinct Party_id), count(distinct Address_Id)
FROM 
EDW_SCVER_CODA_BO_VIEWS.v_party_address
WHERE SCVER_LOAD_DTTM > date '2016-06-30'
AND SCVER_LOAD_DTTM < date '2016-09-30'
GROUP BY SCVDATE
--HAVING SCVDATE = '2016-07-15'
;

sel top 100
CAST(CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count(distinct Party_id), count(distinct Address_Id)
FROM 
EDW_SCVER_CODA_BO_VIEWS.v_party_address
WHERE SCVER_LOAD_DTTM >= date '2016-11-20'
AND SCVER_LOAD_DTTM <= date '2016-11-30'
GROUP BY SCVDATE;
--HAVING SCVDATE = '2016-07-15'
;


sel 
CAST(CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count (distinct Party_id)
from
EDW_SCVER_CODA_ACCS_VIEWS.v_individual
WHERE SCVER_LOAD_DTTM >= date '2016-11-20'
AND SCVER_LOAD_DTTM <= date '2016-11-30'
GROUP BY SCVDATE
;

sel count (*) 
from (
sel address_id||indiv_Cluster_id as addclusterid, count (distinct ind.party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on ind.party_id = pa.party_id
and indiv_cluster_id is not null
group by 1
having count (distinct ind.party_id) >1
)clus
;

sel count (addclusterid) from (
sel address_id||indiv_cluster_id as addclusterid, count (party_id) as numparty
from EDW_SCVER_CODA_ACCS_VIEWS.v_address_cluster
where indiv_cluster_id is not null 
group by 1
having numparty >1 )cus
;


/**/
sel 
SCVDATE,
count(*) as ClusterCount,
sum (NumOfParties) as PartyCount
from (
sel 
address_id||indiv_Cluster_id as addclusterid, 
CAST(CAST(ind.SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count (distinct ind.party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on ind.party_id = pa.party_id
and indiv_cluster_id is not null
and ind.SCVER_LOAD_DTTM >= date '2016-11-19'
AND ind.SCVER_LOAD_DTTM <= date '2016-11-30'
group by 1,2
having count (distinct ind.party_id) >1
)clus
GROUP BY 1
;


sel 
SCVDATE,
count(*) as ClusterCount,
sum (NumOfParties) as PartyCount
from (
sel 
address_id||indiv_Cluster_id as addclusterid, 
CAST(CAST(ind.SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count (distinct ind.party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on ind.party_id = pa.party_id
and indiv_cluster_id is not null
and ind.SCVER_LOAD_DTTM >= date '2016-11-19'
AND ind.SCVER_LOAD_DTTM <= date '2016-11-30'
group by 1,2
having count (distinct ind.party_id) =1
)clus
GROUP BY 1
;

sel 
SCVDATE,
count(*) as ClusterCount,
sum (NumOfParties) as PartyCount
from (
sel 
address_id||indiv_Cluster_id as addclusterid, 
CAST(CAST(ind.SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count (distinct ind.party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on ind.party_id = pa.party_id
and indiv_cluster_id is not null
and ind.SCVER_LOAD_DTTM >= date '2016-11-19'
AND ind.SCVER_LOAD_DTTM <= date '2016-11-30'
group by 1,2
)clus
GROUP BY 1
;





sel 
min (address_id), max(address_id),
count(*) as ClusterCount,
sum (NumOfParties) as PartyCount,
avg (NumOfParties) as PartyAvg
from (
sel 
address_id||indiv_Cluster_id as addclusterid, 
count (distinct ind.party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on ind.party_id = pa.party_id
and indiv_cluster_id is not null
and address_id > 433409936
group by 1
having count (distinct ind.party_id) > 1
)clus
;

sel 
min (address_id), max(address_id),
count(*) as ClusterCount,
sum (NumOfParties) as PartyCount,
avg (NumOfParties) as PartyAvg
from (
sel 
address_id||indiv_Cluster_id as addclusterid, 
count (distinct ind.party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on ind.party_id = pa.party_id
and indiv_cluster_id is not null
and address_id <= 433409936
and address_id >= 320000000
group by 1
having count (distinct ind.party_id) > 1
)clus
;

sel 
min (address_id), max(address_id),
count(*) as ClusterCount,
sum (NumOfParties) as PartyCount,
avg (NumOfParties) as PartyAvg
from (
sel 
address_id||indiv_Cluster_id as addclusterid, 
count (distinct ind.party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address pa
on ind.party_id = pa.party_id
and indiv_cluster_id is not null
and address_id < 320000000
group by 1
having count (distinct ind.party_id) > 1
)clus
;




sel count(*) from
EDW_SCVER_CODA_ACCS_VIEWS.v_party_address
where address_id > 433409936
;






sel ind.party_id, ind.indiv_cluster_id, pa.address_id from 
EDW_SCVER_CODA_ACCS_VIEWS.v_individual ind
inner join EDW_SCVER_CODA_ACCS_VIEWS.v_party_address  pa
on ind.party_id = pa.party_id
where indiv_cluster_id is not null
WHERE SCVER_LOAD_DTTM >= date '2016-11-20'
AND SCVER_LOAD_DTTM <= date '2016-11-30'
;


sel count (*) from 
EDW_SCVER_CODA_ACCS_VIEWS.v_address_cluster
where indiv_cluster_id is not null;
-------623,253,828

sel count (party_id) from 
EDW_SCVER_CODA_ACCS_VIEWS.v_address_cluster
where indiv_cluster_id is not null
-------623,253,828  Same
;

sel count(*) from (
sel address_id||indiv_cluster_id as clusID, count (party_id) as c 
from 
EDW_SCVER_CODA_ACCS_VIEWS.v_address_cluster
where indiv_cluster_id is not null
group by 1
having c >1
)x
;


sel count(*) from (
sel address_id||indiv_cluster_id as clusID, count (party_id) as c 
from 
EDW_SCVER_CODA_ACCS_VIEWS.v_address_cluster
where indiv_cluster_id is not null
group by 1
having c = 1
)x
;


sel count (*) from 
EDW_SCVER_CODA_ACCS_VIEWS.v_address_cluster
where indiv_cluster_id is not null
having count (address_id) =1
;



--UNION
sel count (indiv_cluster_id) 
from (
sel indiv_Cluster_id, count (distinct party_id) as NumOfParties
from EDW_SCVER_CODA_ACCS_VIEWS.v_individual
group by 1
having count (distinct party_id) =1
)clus
;





sel top 100
CAST(CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS CHAR(10)) AS SCVDATE,
count(Party_id) over (Partition by SCVDATE), 
count(Address_Id) over (Partition by SCVDATE)
FROM
EDW_SCVER_CODA_BO_VIEWS.v_party_address
GROUP BY SCVDATE
HAVING SCVDATE = '2016-07-15';

   

sel top 100
CAST(SCVER_LOAD_DTTM AS FORMAT 'YYYY-MM-DD') AS SCVDATE,
count(distinct Party_id), count(distinct Address_Id)
FROM 
EDW_SCVER_CODA_BO_VIEWS.v_party_address
GROUP BY SCVDATE
HAVING SCVDATE = '2016-07-01';
   
   
   
   sel min(SCVER_Upd_Dttm)
   FROM
   EDW_SCVER_CODA_DIM_VIEWS.v_fct_piece_event
   ;