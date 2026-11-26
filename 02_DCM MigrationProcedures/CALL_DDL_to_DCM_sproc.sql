CALL DCM_ADMIN_DB.PROJECTS.DDL_TO_DCM_DEFINITIONS(
    'DEV_RAW_DB',                -- source database
    ['ALIP'],               -- only the CDGC schema
    NULL,                   -- all object types
    'snow://workspace/USER$.PUBLIC."SNOWFLAKE_SCHEMA01"/versions/live/dev_raw_db_alip/sources/definitions/'
);

snow://workspace/USER$.PUBLIC."SNOWFLAKE_SCHEMA01"/versions/live/DCM_TPCH_SF1/sources/definations/DCM_ADMIN_DB/PUBLIC/tables/DEPARTMENT.sql

GRANT USAGE ON DATABASE DCM_ADMIN_DB TO ROLE <ACCOUNTADMIN;
GRANT USAGE ON SCHEMA DEV_SANDBOX_DB.DCM_POC_RAW TO ROLE <YOUR_ROLE>;
GRANT USAGE ON PROCEDURE DEV_SANDBOX_DB.DCM_POC_RAW.DDL_TO_DCM_DEFINITIONS(VARCHAR, ARRAY, ARRAY, VARCHAR) TO ROLE <YOUR_ROLE>;