-- n번째 캠페인에 참여했을 때, 새 캠페인에 참여할 확률 - 자녀 보유 여부 구분에 따라
with sep_child as (
	select case 
		when json_extract(Children, '$.Teen') and json_extract(Children, '$.Kid') then 'TeenAndKid'
		when json_extract(Children, '$.Teen') + json_extract(Children, '$.Kid') = 0 then 'NoChild'
		when json_extract(Children, '$.Teen') and json_extract(Children, '$.Kid') = 0 then 'OnlyTeen'
		else 'OnlyKid' end as Child_Status,
		if(json_extract(AcceptedCmp, '$.1st') and json_extract(AcceptedCmp, '$.last'), 1, 0) as reswith1,
		if(json_extract(AcceptedCmp, '$.2nd') and json_extract(AcceptedCmp, '$.last'), 1, 0) as reswith2,
		if(json_extract(AcceptedCmp, '$.3rd') and json_extract(AcceptedCmp, '$.last'), 1, 0) as reswith3,
		if(json_extract(AcceptedCmp, '$.4th') and json_extract(AcceptedCmp, '$.last'), 1, 0) as reswith4,
		if(json_extract(AcceptedCmp, '$.5th') and json_extract(AcceptedCmp, '$.last'), 1, 0) as reswith5,
		json_extract(AcceptedCmp, '$.1st') as 1st,
		json_extract(AcceptedCmp, '$.2nd') as 2nd,
		json_extract(AcceptedCmp, '$.3rd') as 3rd,
		json_extract(AcceptedCmp, '$.4th') as 4th,
		json_extract(AcceptedCmp, '$.5th') as 5th
	from ifood i
)
select Child_Status, sum(reswith1) / sum(1st) as 'P(R|1)', sum(reswith2) / sum(2nd) as 'P(R|2)', sum(reswith3) / sum(3rd) as 'P(R|3)',
	sum(reswith4) / sum(4th) as 'P(R|4)', sum(reswith5) / sum(5th) as 'P(R|5)'
from sep_child group by 1 order by 1 desc;
