-- 연령층 별 학력 수준 분포
select if(substr(cast(age as char(2)), 1, 1) < 8, concat(substr(cast(age as char(2)), 1, 1), 0), '70') as decader, sum(if(Education = 'basic', 1, 0)) / count(*) as basic,
	sum(if(Education = '2n_cycle', 1, 0)) / count(*) as 2ndCycle,
	sum(if(Education = 'graduation', 1, 0)) / count(*) as graduation,
	sum(if(Education = 'master', 1, 0)) / count(*) as master,
	sum(if(Education = 'PhD', 1, 0)) / count(*) as PhD
from ifood i group by 1;
