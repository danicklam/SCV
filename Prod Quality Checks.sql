------------------------------------------------------------
/*CHECKS*/
/*Total Number of Parties*/
/*Backlog & Batches*/ 
SELECT '00' as ID, 'Queue Size ("The backlog")' as Statistic, CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || 
CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Pickup_Dttm is null 
and SCV_Priority_Ind <> 0
and CC_Process_Flag is null
UNION
SELECT '01' as ID, 'Queue Batches > 20M      ' as Statistic, CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || 
CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, count(*) as Batches, sum(SCV_Rows_Count) as RowCount 
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Pickup_Dttm is null 
and SCV_Priority_Ind <> 0
and CC_Process_Flag is null
and SCV_Rows_Count > 20000000
UNION
/*Failed Batches*/
/*CC Download failure*/
SELECT '50' as ID,'CC Download Failure' as Statistic, CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || 
CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag= '3'and CC_Process_Flag not in ( '99') and SCV_Priority_Ind <> 0
UNION
/*CC Processing Failure*/
SELECT '51' as ID, 'CC Processing Failure' as Statistic, CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || 
CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag= '6'and CC_Process_Flag not in ( '99') and SCV_Priority_Ind <> 0
UNION
/*CC Upload Failure*/
SELECT '52' as ID, 'CC Upload Failure' as Statistic, CAST(CURRENT_DATE AS FORMAT 'YYYY-MM-DD') || ' ' || 
CAST(CAST(CURRENT_TIME AS FORMAT 'HH:MI') AS CHAR(5)) as CheckedAt, count(*) as Batches, sum(SCV_Rows_Count) as RowCount
FROM EDW_SCVER_CODA_ACCS_VIEWS.v_cc_batch_queue
where CC_Process_Flag= '9'and CC_Process_Flag not in ( '99') and SCV_Priority_Ind <> 0
;



----------------------------------------------------------

/*Total Number of Phone Number & Email Addresses*/
SELECT 'Phone Numbers' as Inventory_Check, Current_date, COUNT(*) FROM EDW_SCVER_CODA_ACCS_VIEWS.V_TELEPHONIC_ADDRESS WHERE LENGTH(Msisdn_Number) < 12 -- 27,545,292
UNION
SELECT 'Email Addresses' as Inventory_Check, Current_date, COUNT(*) FROM EDW_SCVER_CODA_ACCS_VIEWS.V_ELECTRONIC_ADDRESS WHERE ELECTRONIC_ADDRESS LIKE '%@%' -- 21,113,875
;


-----------------------------------------------------------------------------------

/*Total Number of Cluster Counts - Takes a while to run this Query*/ 
SELECT 'Total Clusters' as Inventory_Check, Current_date, COUNT(*) 
FROM
(
    SELECT PA.address_id, I.Indiv_Cluster_Id
        FROM EDW_SCVER_CODA_ACCS_VIEWS.v_party_address PA
    INNER JOIN EDW_SCVER_CODA_ACCS_VIEWS.v_individual I
        ON PA.Party_Id = I.Party_Id
    GROUP BY PA.address_id, I.Indiv_Cluster_Id
    -- HAVING COUNT(pa.party_id) = 1
) AS x
;
-----------------------------------------------------------


/*Name Detected*/
CREATE VOLATILE TABLE MATCHED_BATCH_CNT
( DQ_BATCH_ID,MATCHED_CNT)
AS
(
SELECT DQ_BATCH_ID, COUNT(*) AS MATCHED_CNT 
FROM EDW_SCVER_CODA_ACCS_VIEWS.V_CC_MATCH_RESULTS 
WHERE ADDR_ADDRESS_ID > 0  AND DQ_BATCH_ID  > 8201 GROUP BY 1
)
WITH DATA
ON COMMIT PRESERVE ROWS
;
COLLECT STATISTICS ON MATCHED_BATCH_CNT COLUMN(DQ_BATCH_ID);

SELECT
BX.SCV_DATA_SOURCE,
SCV_HANDOVER_DTTM,
BX.DQ_BATCH_ID,
A.CNT,
BX.SCV_ROWS_COUNT,
MATCHED_CNT,
A.CNT*100/MATCHED_CNT AS RATIO
FROM
    EDW_SCVER_CODA_ACCS_VIEWS.V_CC_BATCH_QUEUE BX

INNER JOIN
(
SELECT
    R1.DQ_BATCH_ID,
    COUNT(*) AS CNT
FROM
    EDW_SCVER_CODA_ACCS_VIEWS.V_CC_BATCH_QUEUE B
INNER JOIN
    EDW_SCVER_CODA_ACCS_VIEWS.V_CC_MATCH_RESULTS R1
ON
    R1.DQ_BATCH_ID = B.DQ_BATCH_ID
WHERE
    R1.DQ_BATCH_ID  > 8201 AND
    (R1.NAME_Full_Concatenated IS NULL AND R1.NAME_Organisation_Name IS NULL)
    AND ADDR_ADDRESS_ID > 0
    AND SCV_HANDOVER_DTTM > date '2016-10-01'
GROUP BY 
    R1.DQ_BATCH_ID
    ) A
ON
    BX.DQ_BATCH_ID = A.DQ_BATCH_ID
INNER JOIN
    MATCHED_BATCH_CNT MC
ON
    MC.DQ_BATCH_ID = A.DQ_BATCH_ID
--WHERE SCV_HANDOVER_DTTM > date '2016-10-01'    ---- CHECK THIS LINE LATER
ORDER BY
    BX.DQ_BATCH_ID
    ;

----------------------------------------------------
    


