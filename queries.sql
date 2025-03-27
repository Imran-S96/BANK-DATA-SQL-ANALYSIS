-- BANKING DATA CUSTOMER, ACCOUNTS AND LOANS ANALYSIS


-- CREATE VIEW REMOVE NAMES FOR PRIVACY AND COMBINE TABLES

CREATE VIEW BANK AS(
SELECT CUSTOMER_ID, JOIN_DATE, COUNTRY, AGE, MONTHLY_INCOME, CREDIT_SCORE, ACCOUNT_NUMBER, ACCOUNT_TYPE, BALANCE, OVERDRAFT, LAST_TRANSACTION_DATE, ACCOUNT_STATUS, ACCOUNT_CLOSURE_DATE, PREFERRED_CHANNEL, AVG_MONTHLY_SPEND, NUM_TRANSACTIONS_LAST_30D, LOAN_ID, LOAN_STATUS, LOAN_AMOUNT, LOAN_ISSUED_DATE, LOAN_PAID_DATE
FROM CUSTOMERS AS C
LEFT JOIN ACCOUNTS AS A USING(customer_id)
LEFT JOIN LOANS AS L USING(customer_id));

-- 🧑‍💼 1. Customer Experience Team
-- Goal: Understand how customers interact with the bank and where they might be dropping off.

-- List of inactive customers (no transactions in 30+ days)

SELECT 
    customer_id, 
    num_transactions_last_30d
FROM BANK
WHERE num_transactions_last_30d = 0;

-- Customers who closed accounts recently

-- DATE LIMITATIONS - ACCOUNT_CLOSURE_DATE NOT PERFECT AS CLOSED ACCOUNS NOT UPDATED AND ACTIVE AND DORMINAT ACCOUNTS EITHER HAVENT BEEEN UPDATED OR THE INFORMATION IS INACURATE

SELECT *
FROM BANK 
WHERE LAST_TRANSACTION_DATE >= CURRENT_DATE - 30 AND ACCOUNT_STATUS = 'Closed';


-- Preferred channels by age group

WITH AGE AS(
SELECT 
    customer_id,
    age,
    CASE 
     WHEN age BETWEEN 18 AND 30 THEN '18-30'
     WHEN age BETWEEN 31 AND 40 THEN '30-40'
     WHEN age BETWEEN 41 AND 50 THEN '40-50'
     WHEN age BETWEEN 51 AND 60 THEN '50-60'
     WHEN age BETWEEN 61 AND 70 THEN '60-70'
     WHEN age BETWEEN 71 AND 80 THEN '70-80'
     ELSE NULL END AS age_group,
     preferred_channel
FROM BANK)

SELECT age_group, preferred_channel
FROM(
    SELECT 
        age_group, 
        preferred_channel, 
        COUNT(preferred_channel),
        RANK() OVER (PARTITION BY age_group ORDER BY COUNT(preferred_channel) DESC ) AS RNK
    FROM AGE
    GROUP BY age_group, preferred_channel
    ORDER BY age_group, COUNT(preferred_channel) DESC)
WHERE RNK = 1;


-- 📈 2. Marketing Team
-- Goal: Target the right customers with offers like loans or premium accounts.

-- Active customers eligible for a loan upsell (good credit > 700, high income > 8000)

SELECT *
FROM BANK
WHERE credit_score > 700 AND monthly_income > 8000 AND loan_id IS NULL AND account_status != 'Closed' ;

-- Active customers who use savings accounts but not loans

SELECT *
FROM BANK 
WHERE loan_id IS NULL AND account_type = 'Savings' AND account_status != 'Closed';

-- Top 10% of customers by average monthly spend

WITH CTE_AVG_SPEND AS(
SELECT *,
NTILE(10) OVER (ORDER BY avg_monthly_spend DESC) AS ntile_rank
FROM BANK)

SELECT customer_id, avg_monthly_spend
FROM CTE_AVG_SPEND
WHERE ntile_rank = 1;

-- 💰 3. Lending Team (Loans)
-- Goal: Monitor loan performance, defaults, repayment timelines

-- List of active loans with overdue payments (All loans have a 5 year repayment plan)

SELECT *
FROM LOANS
WHERE loan_status = 'Active' AND (CURRENT_DATE - loan_issued_date) > 365*5;

-- Average loan amount by loan status

SELECT loan_status, ROUND(AVG(loan_amount),2) AS avg_loan_amount
FROM LOANS
GROUP BY loan_status;


-- Customers who repaid loans early

SELECT *
FROM LOANS
WHERE loan_status = 'Paid' AND (CURRENT_DATE - loan_issued_date) < 365*5;


-- 📊 4. Finance & Revenue Team
-- Goal: Track money movement, profitability, and balances

-- Total customer balances vs. overdrafts

SELECT  
    SUM(balance) AS total_balance,
    SUM(overdraft) AS total_overdraft,
    SUM(balance) - SUM(overdraft) AS net_position
FROM ACCOUNTS;


-- Monthly average spend vs. income

SELECT     
    ROUND(AVG(avg_monthly_spend), 2) AS avg_spend,
    ROUND(AVG(monthly_income), 2) AS avg_income,
    ROUND(AVG(monthly_income) - AVG( avg_monthly_spend), 2) AS avg_margin
FROM BANK;

-- Customers with negative net position

SELECT 
    customer_id, 
    balance, 
    overdraft, 
    (balance - overdraft) AS net_balance
FROM ACCOUNTS 
WHERE (balance - overdraft) < 0;



-- 🛡️ 5. Risk & Compliance Team
-- Goal: Identify risky behavior, ensure regulation compliance

-- Customers with low credit scores (< 561) and high loan amounts (> 5000)

SELECT  
    customer_id, 
    credit_score,  
    loan_amount
FROM BANK
WHERE credit_score < 561 AND loan_amount > 5000;



-- Large overdrafts (>2000) with low monthly income (<3000)

SELECT  
    customer_id, 
    overdraft,  
    monthly_income
FROM BANK
WHERE overdraft > 2000 AND monthly_income < 3000 ;

-- Loan default rates per country

WITH RATES_CTE AS (
SELECT 
     *,
     CASE 
        WHEN loan_status = 'Defaulted' THEN 1
        ELSE 0 END AS default_status,
     CASE 
        WHEN loan_status IS NOT NULL THEN 1
        ELSE 0 END AS status
FROM BANK
WHERE loan_status IS NOT NULL)

SELECT 
    country, 
    SUM(status) AS total_loans , 
    SUM(default_status) AS total_default_loans, 
    ROUND((SUM(default_status)/SUM(status))*100,2) AS default_percentage
FROM RATES_CTE
GROUP BY country
ORDER BY (SUM(default_status)/SUM(status))*100 DESC ;
