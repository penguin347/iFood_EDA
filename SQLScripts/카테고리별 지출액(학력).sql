-- 학력 수준에 따른 카테고리 별 평균 지출액
select education, sum(json_extract(MntCategories, '$.Fish')) as fish, sum(json_extract(MntCategories, '$.Fruits')) as fruits, sum(json_extract(MntCategories, '$.Meat')) as meat,
	sum(json_extract(MntCategories, '$.Sweet')) as sweet, sum(json_extract(MntCategories, '$.Wines')) as wines 
from ifood i 
group by 1