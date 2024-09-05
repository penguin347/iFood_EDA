USE project1;
SELECT 
    CASE 
        WHEN age >=20 and age < 30 THEN '20s'
        WHEN age >= 30 AND age < 40 THEN '30s'
        WHEN age >= 40 AND age < 50 THEN '40s'
        WHEN age >= 50 AND age < 60 THEN '50s'
        WHEN age >= 60 AND age < 70 THEN '60s'
        ELSE '70s'
    END AS age_Group,

    AVG(MntWines) AS Avg_MntWines,
    AVG(MntFruits) AS Avg_MntFruits,
    AVG(MntMeatProducts) AS Avg_MntMeatProducts,
    AVG(MntFishProducts) AS Avg_MntFishProducts,
    AVG(MntSweetProducts) AS Avg_MntSweetProducts,
    AVG(MntGoldProds) AS Avg_MntGoldProds,
    AVG(MntTotal) AS Avg_MntTotal

FROM ifood_df
GROUP BY 1