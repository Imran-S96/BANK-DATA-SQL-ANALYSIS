# 📊 BANK-DATA-SQL-ANALYSIS

## 🧾 Introduction
This project showcases a comprehensive SQL-based analysis of a fictional banking dataset, covering key areas such as customer behavior, marketing opportunities, loan performance, financial health, and risk assessment. The goal is to simulate how a data analyst or SQL developer would work across teams to extract insights, identify trends, and support data-driven decisions.

Using structured SQL queries, the analysis addresses real-world business questions relevant to departments like Customer Experience, Marketing, Lending, Finance, and Risk & Compliance. The findings are summarized in a way that aligns with stakeholder needs, and actionable suggestions are provided based on the data.

This project demonstrates my ability to:

- Write clean, efficient, and purpose-driven SQL queries
- Analyze and interpret relational data
- Communicate insights clearly to non-technical stakeholders
- Think critically about data quality, business context, and strategic recommendations

## 📚 Table of Contents

- [🧑‍💼 Customer Experience Team Analysis](#-customer-experience-team-analysis)  
  - [📌 Metrics](#-metrics)  
  - [🔍 Insights](#-insights)  
  - [💡 Suggestions](#-suggestions)
- [📈 Marketing Team Analysis](#-marketing-team-analysis)  
  - [📌 Metrics](#-metrics-1)  
  - [🔍 Insights](#-insights-1)  
  - [💡 Suggestions](#-suggestions-1)
- [💰 Lending Team Analysis](#-lending-team-analysis)  
  - [📌 Metrics](#-metrics-2)  
  - [🔍 Insights](#-insights-2)  
  - [💡 Suggestions](#-suggestions-2)
- [📊 Finance & Revenue Team Analysis](#-finance--revenue-team-analysis)  
  - [📌 Metrics](#-metrics-3)  
  - [🔍 Insights](#-insights-3)  
  - [💡 Suggestions](#-suggestions-3)
- [🛡️ Risk & Compliance Team Analysis](#-risk--compliance-team-analysis)  
  - [📌 Metrics](#-metrics-4)  
  - [🔍 Insights](#-insights-4)  
  - [💡 Suggestions](#-suggestions-4)
- [🛠️ Queries & Techniques Used](#-queries--techniques-used)
- [⚠️ Data Limitations & Considerations](#-data-limitations--considerations)

## 🧑‍💼 Customer Experience Team Analysis

### 📌 Metrics
- **Inactive Customers**: 8 customers haven’t made any transactions in over 30 days.  
- **Recently Closed Accounts**: 263 customers have closed accounts.  
- **Preferred Channels by Age Group**:
  - 18–30: Mobile App  
  - 30–40: Online  
  - 40–60: Branch  
  - 60–70: Online  
  - 70–80: Phone  

### 🔍 Insights
- A small segment of customers is fully inactive, but the closure rate (263 accounts) is a more pressing concern.  
- Channel preference is heavily influenced by age, with a visible shift from digital channels in younger customers to physical or assisted channels in older demographics.  
- Data limitations (incomplete or outdated closure info) weaken the reliability of customer lifecycle metrics.

### 💡 Suggestions
- Improve data accuracy in account lifecycle fields (e.g., closure dates, dormant flags).  
- Run exit surveys or interviews with recently closed customers to identify patterns or issues.  
- Design an omnichannel strategy that aligns preferred channels with age segments — e.g., investing more in mobile UX for younger users and maintaining strong branch/phone support for older customers.

## 📈 Marketing Team Analysis

### 📌 Metrics
- **Loan Upsell Opportunities**: 55 active customers have good credit scores and high income.  
- **Cross-Sell Potential**: 112 active customers use savings accounts but do not have loans.  
- **Top Spenders**: 100 customers in the top 10% by average monthly spend.

### 🔍 Insights
- The bank has a relatively small but high-value segment for potential loan upsells.  
- There is an overlooked cross-sell opportunity among savings customers.  
- Top spenders represent a key segment for premium or loyalty offerings.

### 💡 Suggestions
- Launch targeted campaigns for the 55 eligible customers, highlighting loan benefits or exclusive rates.  
- Educate savings-only users about loan products through personalized nudges.  
- Introduce a premium rewards program or tiered account offerings for top spenders to improve retention and lifetime value.

## 💰 Lending Team Analysis

### 📌 Metrics
- **Overdue Loans**: 105 loans are overdue.  
- **Average Loan Amounts**:
  - Paid: 22,488.89  
  - Active: 26,125.92  
  - Defaulted: 26,062.95  
- **Early Loan Repayments**: 57 customers have repaid ahead of schedule.

### 🔍 Insights
- The similarity in loan amounts across active and defaulted loans suggests repayment risk isn't tightly linked to loan size.  
- A group of early repayers may indicate overqualified borrowers or missed refinancing opportunities.  
- 105 overdue loans is a significant volume that may impact cash flow projections.

### 💡 Suggestions
- Reassess the credit scoring or approval model — consider adding behavioral data to strengthen risk predictions.  
- Offer refinancing or top-up options to early repayers to keep them within the lending ecosystem.  
- Review collection workflows and outreach strategies for overdue loans to improve recovery rates.


## 📊 Finance & Revenue Team Analysis

### 📌 Metrics
- **Total Position**:
  - Balances: 9.89M  
  - Overdrafts: 2.56M  
  - Net: 7.32M  
- **Monthly Financial Behavior**:
  - Average Spend: 2,516.34  
  - Average Income: 8,721.46  
  - Average Margin: 6,205.11  
- **Negative Net Customers**: 134 customers are currently in a negative position.

### 🔍 Insights
- The bank is in a strong net position overall, but the number of customers in the red (134) is a concern.  
- Customer income significantly exceeds spend, implying potential for more upsell or investment products.  
- Overdraft levels are substantial and could become a liability if not managed.

### 💡 Suggestions
- Monitor customers with persistent negative net positions — consider financial counseling or product adjustments.  
- Introduce automated alerts or budgeting tools for customers nearing overdraft.  
- Explore investment or savings products to help customers with high margins make better use of surplus income.


## 🛡️ Risk & Compliance Team Analysis

### 📌 Metrics
- **High-Risk Loan Holders**: 196 customers have low credit scores (<561) and large loan amounts (>5K).  
- **At-Risk Overdraft Customers**: 39 customers have overdrafts >2K and income <3K.  
- **Default Rates by Country**:
  - Highest: Italy (51.85%), Poland (41.03%), Germany (40.48%)  
  - Lowest: France (25.42%), Austria (25.00%)

### 🔍 Insights
- A large pool of customers holds risky loan profiles, making them vulnerable to default.  
- Customers with low income and high overdrafts pose both credit and compliance concerns.  
- Default rates are highly regional, suggesting different market dynamics or underwriting practices.

### 💡 Suggestions
- Tighten lending criteria for customers in the high-risk category or implement additional verification steps.  
- Launch proactive outreach programs for customers with large overdrafts and low incomes — offer budgeting tools or hardship plans.  
- Re-evaluate lending strategies in countries with high default rates — consider localized risk modeling or stricter policies.


## 🛠️ Queries & Techniques Used

This project involves a range of SQL queries designed to simulate real-world business reporting and analytics. The following data manipulation and analytical techniques were used throughout the analysis:

### 📌 Query Structure & Techniques

#### 🧱 **1. View Creation for Simplified Analysis**  
- Created a `BANK` view by joining multiple tables (`CUSTOMERS`, `ACCOUNTS`, and `LOANS`) using `LEFT JOIN` and `USING()` to streamline complex queries and maintain privacy by excluding sensitive fields like names.

#### 🧮 **2. Aggregation & Grouping**
- Used `GROUP BY` and aggregation functions like `COUNT()`, `SUM()`, `AVG()`, and `ROUND()` to calculate metrics such as average loan amounts, monthly margins, total balances, and loan default rates.

#### 🔍 **3. Filtering & Conditional Logic**
- Applied `WHERE` clauses with custom conditions (e.g., credit score thresholds, income brackets, loan status) to isolate specific customer segments or risk profiles.
- Used `CASE WHEN` statements for data classification (e.g., age groups and default status flags).

#### 🧊 **4. Common Table Expressions (CTEs)**
- Utilized CTEs like `WITH AGE AS (...)` and `WITH RATES_CTE AS (...)` to create intermediate steps in complex queries, improving readability and modularity.

#### 📏 **5. Window Functions**
- Employed `RANK()` and `NTILE()` for advanced ranking and quantile segmentation:
  - Ranked preferred banking channels within age groups.
  - Identified the top 10% of customers by spending behavior.

#### 🧠 **6. Subqueries**
- Integrated subqueries within `FROM` and `SELECT` clauses to allow multi-layered filtering and transformation of grouped data (e.g., selecting only the top channel per age group).

#### 🛡️ **7. Data Quality Awareness**
- Acknowledged limitations in the dataset (e.g., inconsistencies in `ACCOUNT_CLOSURE_DATE`, lack of regular updates to account statuses), and adjusted logic accordingly, showcasing responsible data handling.


This diverse use of SQL tools reflects a practical approach to solving business problems, demonstrating my capability in building performant, readable, and insightful queries across various departments and use cases.

## ⚠️ Data Limitations & Considerations

While the analysis provides meaningful insights across various departments, several limitations in the dataset should be considered when interpreting the results:

### 1. **Incomplete or Inaccurate Account Closure Data**
- The `ACCOUNT_CLOSURE_DATE` field is not consistently updated. Some accounts marked as "Closed" still show recent transactions, while others marked as "Active" show long periods of inactivity.
- This inconsistency affects the accuracy of metrics related to customer churn and account activity.

### 2. **Transaction History Simplification**
- The dataset provides a field like `NUM_TRANSACTIONS_LAST_30D` rather than full transactional history. This limits the depth of behavior-based insights (e.g., spending trends, frequency analysis).

### 3. **Loan Duration & Status Mismatch**
- The assumed 5-year repayment period for all loans may not hold true for all entries, and no actual loan schedule is provided.  
- Some "Paid" loans have short repayment timelines that may indicate early repayment, but this cannot be confirmed without more detailed amortization data.

### 4. **Limited Demographic Information**
- Apart from age and country, other potentially useful demographic attributes (e.g., employment status, education level, marital status) are not included, which restricts customer segmentation and targeting strategies.

### 5. **No Timestamped Event Data**
- Data lacks exact timestamps for key events (e.g., account creation, login activity, repayment dates), making time-series or lifecycle analysis difficult.

By identifying these limitations, I was able to adjust my approach accordingly — applying conservative logic, flagging potential inaccuracies, and making business recommendations that account for uncertainty in the data.