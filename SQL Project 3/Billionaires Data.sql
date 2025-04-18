SELECT Country, COUNT(Name) AS "Number of Billionaires"  
FROM billionaires  
GROUP BY Country;

SELECT Country, SUM(Net_worth_in_Billions) OVER(PARTITION BY Country) AS "Total worth"  
FROM billionaires  
GROUP BY Country;

SELECT Industry, COUNT(Name) AS "Number of Billionaires"  
FROM billionaires  
GROUP BY Industry  
ORDER BY 2 DESC;

SELECT Industry, SUM(Net_worth_in_Billions) OVER (PARTITION BY Industry) AS "Total Net Worth"  
FROM billionaires  
GROUP BY Industry;

SELECT DISTINCT(Country), COUNT(Rank) OVER(PARTITION BY Country) AS "Number of Ranks"  
FROM billionaires  
WHERE Rank <= 100  
ORDER BY 2 DESC  
LIMIT 1;

SELECT Country, Industry, COUNT(Name) OVER (PARTITION BY Industry) AS "Number of Billionaires"  
FROM billionaires  
ORDER BY Country;

SELECT Country, Industry, SUM(Net_worth_in_Billions) OVER (PARTITION BY Industry) AS "Number of Billionaires"  
FROM billionaires  
ORDER BY Country, Industry;

SELECT Country, AVG(Net_worth_in_Billions) OVER(PARTITION BY Country) AS "Average Net worth"  
FROM billionaires  
GROUP BY Country;

SELECT Industry, AVG(Net_worth_in_Billions) OVER(PARTITION BY Industry) AS "Average Net worth"  
FROM billionaires  
GROUP BY Industry;

SELECT Country, SUM(Net_worth_in_Billions) OVER(PARTITION BY Country) AS "Total worth"  
FROM billionaires  
GROUP BY Country  
ORDER BY 2 DESC  
LIMIT 10;

SELECT Country, COUNT(Name) AS "Number of Billionaires"  
FROM billionaires  
GROUP BY Country  
HAVING COUNT(Name) > 10;

SELECT Industry, COUNT(Name) AS "Number of Billionaires"  
FROM billionaires  
GROUP BY Industry  
HAVING COUNT(Name) >= 50  
ORDER BY 2 DESC;

SELECT DISTINCT(Country), AVG(Age) OVER(PARTITION BY Country) AS "Average Age"  
FROM billionaires;

SELECT Country, Name AS "Youngest Billionaire", MIN(Age) OVER (PARTITION BY Country) AS Age  
FROM billionaires;

SELECT DISTINCT(Country),  
       SUM(Net_worth_in_Billions) OVER(PARTITION BY Country) AS "Total Net Worth of the Billionaires from Country",  
       SUM(Net_worth_in_Billions) OVER(PARTITION BY Country) / (SELECT SUM(Net_worth_in_Billions) FROM billionaires) * 100 AS "% of Net Worth in the Total Net Worth of all the Billionaires"  
FROM billionaires;

SELECT DISTINCT(Industry),  
       SUM(Net_worth_in_Billions) OVER(PARTITION BY Industry) AS "Total Net Worth of the Billionaires from Industry",  
       SUM(Net_worth_in_Billions) OVER(PARTITION BY Industry) / (SELECT SUM(Net_worth_in_Billions) FROM billionaires) * 100 AS "% of Net Worth in the Total Net Worth of all the Billionaires"  
FROM billionaires;

SELECT "Age groups", "Number of Billionaires"  
FROM (  
    SELECT 1 AS "S.No", "0-9" AS "Age groups", COUNT(Name) AS "Number of Billionaires" FROM billionaires WHERE Age BETWEEN 0 AND 9  
    UNION  
    SELECT 2, "10-19", COUNT(Name) FROM billionaires WHERE Age BETWEEN 10 AND 19  
    UNION  
    SELECT 3, "20-29", COUNT(Name) FROM billionaires WHERE Age BETWEEN 20 AND 29  
    UNION  
    SELECT 4, "30-39", COUNT(Name) FROM billionaires WHERE Age BETWEEN 30 AND 39  
    UNION  
    SELECT 5, "40-49", COUNT(Name) FROM billionaires WHERE Age BETWEEN 40 AND 49  
    UNION  
    SELECT 6, "50-59", COUNT(Name) FROM billionaires WHERE Age BETWEEN 50 AND 59  
    UNION  
    SELECT 7, "60-69", COUNT(Name) FROM billionaires WHERE Age BETWEEN 60 AND 69  
    UNION  
    SELECT 8, "70-79", COUNT(Name) FROM billionaires WHERE Age BETWEEN 70 AND 79  
    UNION  
    SELECT 9, "80-89", COUNT(Name) FROM billionaires WHERE Age BETWEEN 80 AND 89  
    UNION  
    SELECT 10, "90-99", COUNT(Name) FROM billionaires WHERE Age BETWEEN 90 AND 99  
    UNION  
    SELECT 11, "100-119", COUNT(Name) FROM billionaires WHERE Age BETWEEN 100 AND 119  
    UNION  
    SELECT 12, "120-129", COUNT(Name) FROM billionaires WHERE Age BETWEEN 120 AND 129  
    UNION  
    SELECT 13, "N/A", COUNT(Age) FROM billionaires WHERE Age LIKE "N/A"  
);

WITH DD AS (  
    SELECT Name, Age,  
        CASE  
            WHEN Age BETWEEN 0 AND 9 THEN "0-9"  
            WHEN Age BETWEEN 10 AND 19 THEN "10-19"  
            WHEN Age BETWEEN 20 AND 29 THEN "20-29"  
            WHEN Age BETWEEN 30 AND 39 THEN "30-39"  
            WHEN Age BETWEEN 40 AND 49 THEN "40-49"  
            WHEN Age BETWEEN 50 AND 59 THEN "50-59"  
            WHEN Age BETWEEN 60 AND 69 THEN "60-69"  
            WHEN Age BETWEEN 70 AND 79 THEN "70-79"  
            WHEN Age BETWEEN 80 AND 89 THEN "80-89"  
            WHEN Age BETWEEN 90 AND 99 THEN "90-99"  
            WHEN Age BETWEEN 100 AND 109 THEN "100-109"  
            WHEN Age BETWEEN 110 AND 119 THEN "110-119"  
            WHEN Age BETWEEN 120 AND 129 THEN "120-129"  
            ELSE "N/A"  
        END AS "Age Groups"  
    FROM billionaires  
)  
SELECT "Age Groups", COUNT(Age) AS "Number of Billionaires"  
FROM DD  
GROUP BY "Age Groups"  
ORDER BY "Age Groups";

 