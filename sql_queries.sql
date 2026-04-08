CREATE DATABASE churn_analysis;
SELECT * 
FROM churn_data
;
DROP TABLE churn_data;

SELECT * 
FROM churn_data
;

SELECT COUNT(*) TOTAL_CUSTOMERS
FROM churn_data
;


SELECT CHURN , COUNT(*) TOTAL_CUSTOMERS
FROM churn_data
GROUP BY Churn
;

SELECT GENDER,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY GENDER
;

SELECT DEPENDENTS,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY DEPENDENTS
;

SELECT Partner,
COUNT(*) AS total,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY Partner;


SELECT OnlineSecurity,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY OnlineSecurity
;

SELECT TechSupport,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY TechSupport
;
SELECT Contract,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY Contract
;

SELECT Contract, TechSupport,  
COUNT(*) AS total_customers,  
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned, 
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data  
GROUP BY Contract, TechSupport  
ORDER BY churned DESC
;

SELECT InternetService,
COUNT(*) AS total_customers,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY InternetService
;

SELECT 
Contract,
InternetService,
COUNT(*) AS total,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY Contract, InternetService
ORDER BY churn_rate DESC;

SELECT PaymentMethod,
COUNT(*) AS total,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM churn_data
GROUP BY PaymentMethod;

SELECT CASE WHEN MonthlyCharges < 40 THEN 'LOW'
            WHEN MonthlyCharges BETWEEN 40 AND 70 THEN 'MODERATE'
            WHEN MonthlyCharges > 70 THEN 'HIGH'
            END AS MONTHLY_CHARGES, COUNT(*) total_customers,
        SUM(CASE WHEN CHURN = 'YES' THEN 1 ELSE 0 END) AS churned,
        ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*))churn_rate
FROM churn_data
GROUP BY MONTHLY_CHARGES
;

SELECT Churn, AVG(MonthlyCharges) avg_monthly_charges
FROM churn_data
GROUP BY Churn
;

SELECT StreamingTV,
COUNT(*) AS total,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*))churn_rate
FROM churn_data
GROUP BY StreamingTV;

SELECT 
    CASE 
        WHEN tenure < 5 THEN 'NEW CUSTOMER'
        WHEN tenure BETWEEN 5 AND 15 THEN 'EARLY CUSTOMER'
        WHEN tenure BETWEEN 15 AND 30 THEN 'REGULAR CUSTOMER'
        WHEN tenure BETWEEN 30 AND 60 THEN 'LOYAL CUSTOMER'
        ELSE 'VERY LOYAL CUSTOMER'
    END AS status_of_customer,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(
        SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS churn_rate_percentage
FROM churn_data
GROUP BY status_of_customer;

SELECT customerID,
CASE 
    WHEN tenure < 12 AND MonthlyCharges > 70 THEN 'HIGH RISK'
    WHEN tenure < 24 THEN 'MEDIUM RISK'
    ELSE 'LOW RISK'
END AS risk_level
FROM churn_data;

SELECT risk_level,
COUNT(*) AS total,
SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS churn_rate
FROM (
    SELECT 
    CASE 
        WHEN tenure < 12 AND MonthlyCharges > 70 THEN 'HIGH RISK'
        WHEN tenure < 24 THEN 'MEDIUM RISK'
        ELSE 'LOW RISK'
    END AS risk_level,
    Churn
    FROM churn_data
) t
GROUP BY risk_level;




