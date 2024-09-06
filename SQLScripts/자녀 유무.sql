-- 자녀 보유 여부에 따른 분포
-- noChild: 자녀 없음 / KidAndTeen: Kid, Teen 둘 다 있음 / OnlyTeen: Teen만 있음 / OnlyKid: Kid만 있음
select sum(if(not json_extract(Children, '$.Kid') and not json_extract(Children, '$.Teen'), 1, 0)) as noChild,
	sum(if(json_extract(Children, '$.Kid') and json_extract(Children, '$.Teen'), 1, 0)) as KidAndTeen,
	sum(if(not json_extract(Children, '$.Kid') and json_extract(Children, '$.Teen'), 1, 0)) as OnlyTeen,
	sum(if(json_extract(Children, '$.Kid') and not json_extract(Children, '$.Teen'), 1, 0)) as OnlyKid
from ifood i 
