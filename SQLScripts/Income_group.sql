USE project1;
SELECT 
    CASE 
        WHEN Income < 20000 THEN 'Low Income'
        WHEN Income >= 20000 AND Income < 50000 THEN 'Middle Income'
        WHEN Income >= 50000 AND Income < 80000 THEN 'High Income'
        ELSE 'Very High Income'
    END AS Income_Group,

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
        WHEN Income < 20000 THEN 'Low Income'
        WHEN Income >= 20000 AND Income < 50000 THEN 'Middle Income'
        WHEN Income >= 50000 AND Income < 80000 THEN 'High Income'
        ELSE 'Very High Income'
	END;