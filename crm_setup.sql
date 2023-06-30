
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
 CREATE OR REPLACE PIPE crm_dashboard_pipe AUTO_INGEST=TRUE AS
 COPY INTO CRM_DASHBOARD
 FROM ext_crm_dashboard
 FILE_FORMAT = (TYPE = 'CSV')
 ON_ERROR = 'CONTINUE';

 