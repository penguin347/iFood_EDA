-- 소득 구간에 따른 캠페인 참여율 및 참여 인원 수
-- 참여율: avg_response / 참여 인원 수: sum_response
select case 
	when income <= 20000 then 'low'
	when income <= 50000 then 'middle'
	when income <= 80000 then 'high'
	else 'very high'
end as lv_income, avg(json_extract(AcceptedCmp, '$.last')) as avg_response, sum(json_extract(AcceptedCmp, '$.last')) as sum_response
from ifood i group by 1;

-- 학력에 따른 캠페인 참여율 및 참여 인원 수
select education, avg(json_extract(AcceptedCmp, '$.last')) as avg_response, sum(json_extract(AcceptedCmp, '$.last')) as sum_response
from ifood i group by 1;