-- 기혼 여부 분포
select MaritalStatus , count(1)
from ifood i 
group by 1
