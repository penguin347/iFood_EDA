-- 학력 별 평균 연간 가계소득
select Education, avg(income) from ifood i group by 1;
-- 학력 별 평균 나이
select Education , avg(Age) as avg_Age
from ifood i 
group by 1;
-- 학력 수준에 따른 평균 지출액
select Education, avg(MntTotal) as avg_spent
from ifood
group by 1;