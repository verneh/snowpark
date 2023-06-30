
-- dashboard data setup. loads data when new ones arrive. does not include setup through IAM or event notification.

-- access warehouse
USE WAREHOUSE DS_DEV_QQ_WH;

-- create schema
CREATE SCHEMA CRM_DASHBOARD;

-- create table
CREATE OR REPLACE TABLE CRM_DASHBOARD (
    SNAPSHOT_DATE DATE,
    COUNTRY_CODE_UPPER VARCHAR(15),
    CUSTOMER NUMBER,
    CCM NUMBER(12,6),
    NEW_CUSTOMER VARCHAR(15),
    SALES NUMBER(12,6),
    LOYALTY VARCHAR(15),
    EMAIL_OPTIN VARCHAR(15),
    ACCOUNT VARCHAR(15),
    OCM NUMBER(12,6),
    OCM_SALES NUMBER(12,6),
    ORDERS NUMBER
);

-- create stage with S3 bucket name with file format to be loaded.
CREATE OR REPLACE STAGE ext_crm_dashboard
 URL = 's3://dpe_bucket/crm_dashboard/'
 CREDENTIALS=(AWS_KEY_ID='xxxxxxxx' AWS_SECRET_KEY='xxxxxxxx')
 FILE_FORMAT = (TYPE = 'CSV');

-- create our pipe using the stage layer.
 CREATE OR REPLACE PIPE "COVID_DATA"."PUBLIC"."COVID_SNOWPIPE_DAILY" AUTO_INGEST=TRUE AS
 COPY INTO "COVID_DATA"."PUBLIC"."COVID19_GLOBAL_DATA"
 FROM @COVID_DATA.PUBLIC.COVIDDATADAILY_STAGE
 FILE_FORMAT = (TYPE = 'CSV')
 ON_ERROR = 'CONTINUE';

 