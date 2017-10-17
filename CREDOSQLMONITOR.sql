SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_bus_prof ' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_bus_prof 	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_business_rdrctn' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_business_rdrctn	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_changes' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_changes	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_common	' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_common	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_common_ref	' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_common_ref	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_delivery_office' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_delivery_office	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_double' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_double	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_foreign_address	' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_foreign_address	GROUP BY 1,2
--UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_fraud_addr' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_fraud_addr	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_hmmsp_email_optout' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_hmmsp_email_optout	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm,'	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_media' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_media	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_ncoa_excl	' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_ncoa_excl	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_ncoa_hmms_optout' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_ncoa_hmms_optout	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_ncoa_supp_optout' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_ncoa_supp_optout	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_paflink	' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_paflink	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_payment	' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_payment	GROUP BY 1,2
--UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_preferences	' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_preferences	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_redagree ' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_redagree 	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_redir_flag' as SOURCE	,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_redir_flag	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_social_rdrctn' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_social_rdrctn	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_title_list' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_title_list	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_unknown_address' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_unknown_address	GROUP BY 1,2
UNION SEL	SCVER_Load_Dttm	 ,'EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_valid_address' as SOURCE		,count (*)	from	 EDW_SCVER_CODA_STG_VIEWS.v_stg_credo_valid_address	GROUP BY 1,2;

