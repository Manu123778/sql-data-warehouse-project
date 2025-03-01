/*
## DDL SCRIPT FOR [BRONZE LAYER]
------------------------------------------------------------------------------------------------------------
Here is the refined and structured DDL script for the Bronze Layer, along with its purpose and loading method.

📌 Data Warehouse - Bronze Layer (DDL Script)
🔹 Purpose of the Bronze Layer
Raw Data Storage: This layer stores raw, unprocessed data from different source systems.
No Constraints: No Primary Keys or Foreign Keys are added since data is directly ingested from source systems.
Data Staging: Acts as a temporary storage before transforming data into the Silver Layer for cleaning and processing.
Import Method: Data is loaded using MySQL Data Import Wizard.

#🔹 DDL Script for Bronze Layer (No Constraints, Raw Data Storage) 

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS Datawarehouse;
USE Datawarehouse;

-- Step 2: Create Bronze Schema (Staging Area)
CREATE DATABASE IF NOT EXISTS bronze;
USE bronze;

-- Step 3: Drop Tables if They Exist
DROP TABLE IF EXISTS b_crm_cust_info;
DROP TABLE IF EXISTS b_crm_prd_info;
DROP TABLE IF EXISTS b_crm_sales_details;
DROP TABLE IF EXISTS b_erp_loc_a101;
DROP TABLE IF EXISTS b_erp_cust_az12;
DROP TABLE IF EXISTS b_erp_px_cat_g1v2;

-- Step 4: Create Tables Without Constraints
CREATE TABLE b_crm_cust_info (
    cst_id              INT,
    cst_key             VARCHAR(50),
    cst_firstname       VARCHAR(50),
    cst_lastname        VARCHAR(50),
    cst_marital_status  VARCHAR(50),
    cst_gndr            VARCHAR(50),
    cst_create_date     DATE
);

CREATE TABLE b_crm_prd_info (
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt DATETIME,
    prd_end_dt   DATETIME
);

CREATE TABLE b_crm_sales_details (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt DATE,
    sls_ship_dt  DATE,
    sls_due_dt   DATE,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);

CREATE TABLE b_erp_loc_a101 (
    cid    VARCHAR(50),
    cntry  VARCHAR(50)
);

CREATE TABLE b_erp_cust_az12 (
    cid    VARCHAR(50),
    bdate  DATE,
    gen    VARCHAR(50)
);

CREATE TABLE b_erp_px_cat_g1v2 (
    id           VARCHAR(50),
    cat          VARCHAR(50),
    subcat       VARCHAR(50),
    maintenance  VARCHAR(50)
);


# 🔹 How to Load Data into Bronze Tables
Since the Bronze Layer is a staging area, data is loaded directly without processing. Follow these steps to import data into MySQL:

📌 Steps to Load Data Using MySQL Data Import Wizard
Open MySQL Workbench
Select Database: bronze
Navigate to Import Wizard:
Click Server → Data Import
Choose Import from File
Select the CSV or SQL file containing raw data
Map Columns to Table Structure
Click "Start Import" to load data into the Bronze tables
