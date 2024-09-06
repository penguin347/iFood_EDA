-- 연령층 별 캠페인 참여 의사
select concat(substr(cast(age as char(2)), 1, 1), 0) as decader, count(*), avg(json_extract(AcceptedCmp, '$.last')) as 참여율, sum(json_extract(AcceptedCmp, '$.last')) as '참여 인원 수'
from ifood i group by 1;