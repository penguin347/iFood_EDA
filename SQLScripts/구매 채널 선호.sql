-- 학력 수준에 따른 채널 별 평균 구매 횟수
select education, avg(json_extract(NumPurchases, '$.Deals')) as avg_Deals,
	avg(json_extract(NumPurchases, '$.Web')) as avg_Web,
	avg(json_extract(NumPurchases, '$.Catalog')) as avg_Catalog,
	avg(json_extract(NumPurchases, '$.Store')) as avg_Store
from ifood i 
group by 1;