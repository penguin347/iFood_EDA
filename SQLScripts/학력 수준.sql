-- 학력 수준 분포
select Education, count(1)
from ifood i
group by 1