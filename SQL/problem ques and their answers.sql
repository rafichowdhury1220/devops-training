SELECT * FROM web_marketing_data;

-- Calculate total number of sessions
select count(*) as total_session
 from web_marketing_data;
 
-- Aggregation: Total Revenue Generated
SELECT * FROM web_marketing_data;

SELECT SUM(Revenue) AS total_revenue FROM web_marketing_data;

-- Sessions from New Users
SELECT Country, SUM(Revenue) AS total_revenue
FROM web_marketing_data
GROUP BY Country
ORDER BY total_revenue DESC;

SELECT COUNT(*) AS new_user_sessions, SUM(Revenue) AS total_revenue
FROM web_marketing_data
WHERE New_User = 1;

-- Average Session Duration
SELECT Device_Category, AVG(Session_Duration) AS avg_session_duration
FROM web_marketing_data
GROUP BY Device_Category
ORDER BY avg_session_duration DESC;

-- Cumulative Revenue by Date
SELECT 
    CAST(Date AS DATE) AS Date, 
    Revenue,
    SUM(Revenue) OVER (ORDER BY CAST(Date AS DATE)) AS cumulative_revenue
FROM 
    web_marketing_data
ORDER BY 
    CAST(Date AS DATE);
    
    
    
    
WITH DailyRevenue AS (
    SELECT 
        CAST(Date AS DATE) AS Date, 
        SUM(Revenue) AS total_revenue
    FROM 
        web_marketing_data
    GROUP BY 
        CAST(Date AS DATE)
)
SELECT 
    Date, 
    total_revenue,
    SUM(total_revenue) OVER (ORDER BY Date) AS cumulative_revenue
FROM 
    DailyRevenue
ORDER BY 
    Date;




