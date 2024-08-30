USE project1;

SELECT 
    CASE 
        WHEN marital_Together = 1 THEN 'Together'
        WHEN marital_Single = 1 THEN 'Single'
        WHEN marital_Widow = 1 THEN 'Widow'
        WHEN marital_Divorced = 1 THEN 'Divorced'
        ELSE 'Other'
    END AS Marital_Status,
    
    AVG(MntWines) AS Avg_MntWines,
    AVG(MntFruits) AS Avg_MntFruits,
    AVG(MntMeatProducts) AS Avg_MntMeatProducts,
    AVG(MntFishProducts) AS Avg_MntFishProducts,
    AVG(MntSweetProducts) AS Avg_MntSweetProducts,
    AVG(MntGoldProds) AS Avg_MntGoldProds,
    AVG(MntTotal) AS Avg_MntTotal

FROM ifood_df
GROUP BY 
    CASE 
        WHEN marital_Together = 1 THEN 'Together'
        WHEN marital_Single = 1 THEN 'Single'
        WHEN marital_Widow = 1 THEN 'Widow'
        WHEN marital_Divorced = 1 THEN 'Divorced'
        ELSE 'Other'
    END;