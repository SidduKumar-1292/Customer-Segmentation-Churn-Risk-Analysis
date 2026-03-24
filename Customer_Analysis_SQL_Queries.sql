/* PROJECT: Customer Segmentation & Churn Risk Analysis
LEVEL: Basic to Medium SQL
*/

-- QUERY 1: Gender & Status Count (Basic)
-- It shows how many people are in each group.
SELECT 
    Gender, 
    Customer_Status, 
    COUNT(*) AS Total_Customers
FROM Customer_Data
GROUP BY Gender, Customer_Status
ORDER BY Customer_Status;


-- QUERY 2: Finding High-Value Targets (Basic)
-- Finds 'Loyal' customers who also earn more than 100k. 
SELECT *
FROM Customer_Data
WHERE Customer_Status = 'Loyal' AND Annual_income_k$ > 100
ORDER BY Spending_score DESC;


-- QUERY 3: Average Spending per Segment (Medium-Lite)
-- Uses ROUND to keep decimals clean (just like the Excel decimal button).
SELECT 
    Customer_Status, 
    ROUND(AVG(Spending_score), 2) AS Average_Spending
FROM Customer_Data
GROUP BY Customer_Status;


-- QUERY 4: The "Age Bucket" Logic (Medium)
-- This is the 'CASE' statement. Think of it as a sorting machine for ages.
SELECT 
    CASE 
        WHEN Age < 35 THEN 'Younger Group'
        ELSE 'Older Group'
    END AS Age_Category,
    COUNT(*) AS Customer_Count,
    ROUND(AVG(Spending_score), 2) AS Avg_Spending
FROM Customer_Data
GROUP BY Age_Category;