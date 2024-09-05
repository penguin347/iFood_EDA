use devcourse;

/*select Education, count(1)
from ifood i
group by 1*/

select Education , sum(MntCategories)
from ifood i 
group by 1

select education, sum(json_extract(MntCategories, '$.Fish')) as fish, sum(json_extract(MntCategories, '$.Fruits')) as fruits, sum(json_extract(MntCategories, '$.Meat')) as meat,
	sum(json_extract(MntCategories, '$.Sweet')) as sweet, sum(json_extract(MntCategories, '$.Wines')) as wines 
from ifood i 
group by 1

select education, avg(json_extract(MntCategories, '$.Fish')) as fish, avg(json_extract(MntCategories, '$.Fruits')) as fruits, avg(json_extract(MntCategories, '$.Meat')) as meat,
	avg(json_extract(MntCategories, '$.Sweet')) as sweet, avg(json_extract(MntCategories, '$.Wines')) as wines 
from ifood i 
group by 1

select education, avg(MntTotal) 
from ifood i 
group by 1

select count(*) as cnt_havChd
from ifood i where json_extract(Children, '$.Kid') and json_extract(Children, '$.Teen')

select MaritalStatus , count(1)
from ifood i 
group by 1

select age, count(*) as cnt from ifood i
group by 1;

select min(Customer_Days), max(Customer_Days)
from ifood i

select avg(income) as avg_income, stddev(income) as sigma_income, max(income), min(income)
from ifood i;

select sum(income) / 2 as median
from (
	select income, row_number() over(order by income) as rn from ifood i
) a
where rn in (1102, 1103);

select avg(MntTotal), stddev(MntTotal), max(MntTotal), min(MntTotal) 
from ifood i

select sum(MntTotal) / 2 as median
from (
	select MntTotal, row_number() over(order by MntTotal) as rn from ifood i
) a
where rn in (1102, 1103);

/*with NP_Total as (
	select json_extract(NumPurchases, '$') 
)
select 
from ifood i */ -- numPurchase 모든 데이터가 독립?

-- 자녀 없는 사람, Teen과 Kid 둘 다 있는 사람, Teenager만 있는 사람, Kid만 있는 사람
select sum(if(not json_extract(Children, '$.Kid') and not json_extract(Children, '$.Teen'), 1, 0)) as noChild,
	sum(if(json_extract(Children, '$.Kid') and json_extract(Children, '$.Teen'), 1, 0)) as KidAndTeen,
	sum(if(not json_extract(Children, '$.Kid') and json_extract(Children, '$.Teen'), 1, 0)) as OnlyTeen,
	sum(if(json_extract(Children, '$.Kid') and not json_extract(Children, '$.Teen'), 1, 0)) as OnlyKid
from ifood i 

-- RFM(Recency, Frequency, Monetary) .. 보류
/*with RFM as (
	select recency, json_extract(NumPurchases, '$.Web') + json_extract(NumPurchases, '$.Catalog') + json_extract(NumPurchases, '$.Store') as frequency, MntTotal as Monetary
	from ifood i
), RFM_normalized as ( -- RFM 최소 - 최대 정규화 min_R=0, max_R=99, min_F=0, max_F=32, min_M=4, max_M=2491
	select (recency - 0) / (99 - 0) as recency,
		(frequency - 0) / (32 - 0) as frequency,
		(monetary - 4) / (2491 - 4) as monetary
	from RFM
) select count(recency) from RFM_normalized
where monetary >= 0.6667*/

select Education, avg(income) from ifood i group by 1;

select Education , avg(Age) as avg_Age
from ifood i 
group by 1;

select income as 가계소득, json_extract(MntCategories, '$.Wines')
from ifood i;

select income, MntTotal
from ifood i 

select case 
	when education = 'basic' then 0
	when education = '2n_Cycle' then 1
	when education = 'graduation' then 2
	when education = 'master' then 3
	when education = 'phD' then 4
end as index_edu,
AcceptedCmpOverall
from ifood i 

select education, count(*)
from ifood i 
where AcceptedCmpOverall > 0
group by 1;

select education, sum(AcceptedCmpOverall) / count(Education)
from ifood i 
group by 1;

select min(recency), max(recency)
from ifood;

select sum(json_extract(AcceptedCmp, '$.1st')) as cnt_cmp1,
	sum(json_extract(AcceptedCmp, '$.2nd')) as cnt_cmp2,
	sum(json_extract(AcceptedCmp, '$.3rd')) as cnt_cmp3,
	sum(json_extract(AcceptedCmp, '$.4th')) as cnt_cmp4,
	sum(json_extract(AcceptedCmp, '$.5th')) as cnt_cmp5,
	sum(json_extract(AcceptedCmp, '$.last')) as response
from ifood i 

select education, avg(json_extract(NumPurchases, '$.Deals')) as avg_Deals,
	avg(json_extract(NumPurchases, '$.Web')) as avg_Web,
	avg(json_extract(NumPurchases, '$.Catalog')) as avg_Catalog,
	avg(json_extract(NumPurchases, '$.Store')) as avg_Store
from ifood i 
group by 1;

select json_extract(MntCategories, '$.Fish') as fish, json_extract(MntCategories, '$.Fruits') as fruits, json_extract(MntCategories, '$.Meat') as meat, json_extract(MntCategories, '$.Sweet') as sweet
from ifood i

select Education, avg(json_extract(Children, '$.Teen')) as avg_teenhome, avg(json_extract(Children, '$.Kid')) as avg_kidhome 
from ifood i
group by 1

select Age , json_extract(MntCategories, '$.Wines') 
from ifood i

select json_extract(Children, '$.Teen') as teenHome, avg(json_extract(AcceptedCmp, '$.last')) as avg_response 
from ifood i group by 1;

select json_extract(Children, '$.Kid') as kidHome, avg(json_extract(AcceptedCmp, '$.last')) as avg_response 
from ifood i group by 1;

select if(json_extract(Children, '$.Teen'), 'Y', 'N') as teenHome, avg(json_extract(AcceptedCmp, '$.last')) as avg_response 
from ifood i group by 1;

select if(json_extract(Children, '$.Kid'), 'Y', 'N') as kidHome, avg(json_extract(AcceptedCmp, '$.last')) as avg_response 
from ifood i group by 1;

select age, sum(json_extract(AcceptedCmp, '$.last')) as avg_response 
from ifood i group by 1;

select Education , sum(json_extract(AcceptedCmp, '$.last')) as cnt_response 
from ifood i group by 1;

select avg(income) , json_extract(AcceptedCmp, '$.last') as cnt_response 
from ifood i group by 2;

select case 
	when income <= 20000 then 'low'
	when income <= 50000 then 'middle'
	when income <= 80000 then 'high'
	else 'very high'
end as lv_income, avg(json_extract(AcceptedCmp, '$.last')) as avg_response, sum(json_extract(AcceptedCmp, '$.last')) as sum_response
from ifood i group by 1;

select education, avg(json_extract(AcceptedCmp, '$.1st')) as avg_cmp1, sum(json_extract(AcceptedCmp, '$.1st')) as cnt_cmp1, 
	avg(json_extract(AcceptedCmp, '$.2nd')) as avg_cmp2, sum(json_extract(AcceptedCmp, '$.2nd')) as cnt_cmp2,
	avg(json_extract(AcceptedCmp, '$.3rd')) as avg_cmp3, sum(json_extract(AcceptedCmp, '$.3rd')) as cnt_cmp3,
	avg(json_extract(AcceptedCmp, '$.4th')) as avg_cmp4, sum(json_extract(AcceptedCmp, '$.4th')) as cnt_cmp4,
	avg(json_extract(AcceptedCmp, '$.5th')) as avg_cmp5, sum(json_extract(AcceptedCmp, '$.5th')) as cnt_cmp5
from ifood i group by 1

with cnt_cmp as (
	select education,
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
select education, sum(reswith1) / sum(1st) as 'P(R|1)', sum(reswith2) / sum(2nd) as 'P(R|2)', sum(reswith3) / sum(3rd) as 'P(R|3)',
	sum(reswith4) / sum(4th) as 'P(R|4)', sum(reswith5) / sum(5th) as 'P(R|5)'
from cnt_cmp group by 1;

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

with cnt_cmp as (
	select if(json_extract(AcceptedCmp, '$.1st') and json_extract(AcceptedCmp, '$.last'), 1, 0) as reswith1,
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
) select sum(reswith1) / sum(1st) as 'P(R|1)', sum(reswith2) / sum(2nd) as 'P(R|2)', sum(reswith3) / sum(3rd) as 'P(R|3)', sum(reswith4) / sum(4th) as 'P(R|4)', sum(reswith5) / sum(5th) as 'P(R|5)'
from cnt_cmp;

select concat(substr(cast(age as char(2)), 1, 1), 0) as decader, count(*), avg(json_extract(AcceptedCmp, '$.last')) as 참여율, sum(json_extract(AcceptedCmp, '$.last')) as '참여 인원 수'
from ifood i group by 1;

select case
	when age < 30 then '20대'
	when age < 35 then '30초'
	when age < 40 then '30후'
	when age < 45 then '40초'
	when age < 50 then '40후'
	when age < 55 then '50초'
	when age < 60 then '50후'
	when age < 65 then '60초'
	when age < 70 then '60후'
	when age < 75 then '70초'
	when age < 80 then '70후'
	else '80대'
end as 연령층, count(*) as '인원수(명)', avg(json_extract(AcceptedCmp, '$.last')) as 참여율, sum(json_extract(AcceptedCmp, '$.last')) as '참여 인원 수'
from ifood i group by 1;

select if(substr(cast(age as char(2)), 1, 1) < 8, concat(substr(cast(age as char(2)), 1, 1), 0), '70') as decader, sum(if(Education = 'basic', 1, 0)) / count(*) as basic,
	sum(if(Education = '2n_cycle', 1, 0)) / count(*) as 2ndCycle,
	sum(if(Education = 'graduation', 1, 0)) / count(*) as graduation,
	sum(if(Education = 'master', 1, 0)) / count(*) as master,
	sum(if(Education = 'PhD', 1, 0)) / count(*) as PhD
from ifood i group by 1;
