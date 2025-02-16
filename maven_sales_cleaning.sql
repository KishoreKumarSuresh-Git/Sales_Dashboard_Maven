SELECT column_name, data_type
FROM `maven-sales.maven_sales.INFORMATION_SCHEMA.COLUMNS`
WHERE table_name = 'products';

--Viewing Sample Data

SELECT * 
FROM `maven-sales.maven_sales.accounts` 
LIMIT 10;

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN account IS NULL THEN 1 ELSE 0 END) AS missing_account,
    SUM(CASE WHEN sector IS NULL THEN 1 ELSE 0 END) AS missing_sector,
    SUM(CASE WHEN year_established IS NULL THEN 1 ELSE 0 END) AS missing_year_established,
    SUM(CASE WHEN revenue IS NULL THEN 1 ELSE 0 END) AS missing_revenue,
    SUM(CASE WHEN employees IS NULL THEN 1 ELSE 0 END) AS missing_employees,
    SUM(CASE WHEN office_location IS NULL THEN 1 ELSE 0 END) AS missing_office_location
FROM `maven-sales.maven_sales.accounts`;

SELECT account, COUNT(*) AS count
FROM `maven-sales.maven_sales.accounts`
GROUP BY account
HAVING COUNT(*) > 1;

SELECT * 
FROM `maven-sales.maven_sales.accounts`
WHERE revenue < 0 OR employees < 0;



-- Data cleaning and preprocessing for sales_pipeline table

SELECT * 
FROM `maven-sales.maven_sales.sales_pipeline` 
LIMIT 10;

SELECT * 
FROM `maven-sales.maven_sales.sales_pipeline`
WHERE close_date IS NOT NULL
LIMIT 10;

SELECT DISTINCT sales_agent 
FROM `maven-sales.maven_sales.sales_pipeline`;

SELECT deal_stage, COUNT(*) AS total_deals
FROM `maven-sales.maven_sales.sales_pipeline`
GROUP BY deal_stage
ORDER BY total_deals DESC;

UPDATE `maven-sales.maven_sales.sales_pipeline`
SET account = 'Unknown'
WHERE account IS NULL;

SELECT * 
FROM `maven-sales.maven_sales.sales_pipeline`
WHERE engage_date > close_date;

SELECT DISTINCT deal_stage 
FROM `maven-sales.maven_sales.sales_pipeline`;

SELECT account, COUNT(*) AS total_deals
FROM `maven-sales.maven_sales.sales_pipeline`
GROUP BY account
ORDER BY total_deals DESC
LIMIT 10;

SELECT *
FROM `maven-sales.maven_sales.sales_pipeline`
WHERE deal_stage = 'Won' AND close_value = 0
LIMIT 10;


--Data cleaning and preprocessing for sales_teams

SELECT * 
FROM `maven-sales.maven_sales.sales_teams`
LIMIT 10;

SELECT 
    string_field_0 AS sales_agent, 
    string_field_1 AS manager, 
    string_field_2 AS regional_office
FROM `maven-sales.maven_sales.sales_teams`
LIMIT 10;


SELECT string_field_0 AS sales_agent, string_field_1 AS manager, string_field_2 AS regional_office, COUNT(*) AS count
FROM `maven-sales.maven_sales.sales_teams`
GROUP BY string_field_0, string_field_1, string_field_2
HAVING COUNT(*) > 1;

-- Data cleaning and preprocessing for products

SELECT * 
FROM `maven-sales.maven_sales.products`
LIMIT 10;

SELECT 
    COUNT(*) AS total_rows,
    SUM(CASE WHEN product IS NULL THEN 1 ELSE 0 END) AS missing_product,
    SUM(CASE WHEN series IS NULL THEN 1 ELSE 0 END) AS missing_series,
    SUM(CASE WHEN sales_price IS NULL THEN 1 ELSE 0 END) AS missing_price
FROM `maven-sales.maven_sales.products`;


SELECT product, COUNT(*) AS count
FROM `maven-sales.maven_sales.products`
GROUP BY product
HAVING COUNT(*) > 1;

SELECT * 
FROM `maven-sales.maven_sales.products`
WHERE sales_price <= 0;





