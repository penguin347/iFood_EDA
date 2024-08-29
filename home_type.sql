USE project1;

WITH HomeKidTeen AS (
    SELECT 
        *,
        CASE 
            WHEN Kidhome > 0 AND Teenhome > 0 THEN 'Both Kidhome and Teenhome'
            WHEN Kidhome > 0 AND Teenhome = 0 THEN 'Only Kidhome'
            WHEN Kidhome = 0 AND Teenhome > 0 THEN 'Only Teenhome'
            ELSE 'No Kids or Teens'
        END AS HomeType
    FROM ifood_df
)

SELECT 
    HomeType,
    AVG(MntWines) AS Avg_MntWines,
    AVG(MntFruits) AS Avg_MntFruits,
    AVG(MntMeatProducts) AS Avg_MntMeatProducts,
    AVG(MntFishProducts) AS Avg_MntFishProducts,
    AVG(MntSweetProducts) AS Avg_MntSweetProducts,
    AVG(MntGoldProds) AS Avg_MntGoldProds
FROM 
    HomeKidTeen
GROUP BY 
    HomeType;
