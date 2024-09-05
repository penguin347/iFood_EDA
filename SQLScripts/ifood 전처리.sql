-- 모든 row는 marital status 중 하나만 1, 나머지 0
/*use devcourse;
select sum(marital_Divorced), sum(marital_Married), sum(marital_Single), sum(marital_Together), sum(marital_Widow)
from ifood_df id*/

-- 모든 row는 education status 중 하나만 1, 나머지 0
/*select sum(`education_2n Cycle`), sum(education_Basic), sum(education_Graduation), sum(education_Master), sum(education_PhD)
from ifood_df id*/

-- AcceptedCmpOverall = AcceptedCmp1~5의 합
/*select AcceptedCmp1, AcceptedCmp2, AcceptedCmp3, AcceptedCmp4, AcceptedCmp5, AcceptedCmpOverall
from ifood_df id*/

-- Z_CostContact, Z_Revenue - garbage schema
/*select Z_CostContact, Z_Revenue, Income
from ifood_df id
where Z_Revenue != 11*/

-- select Response from ifood_df id where response = 1

-- select count(distinct income, Customer_Days, age) from ifood_df

/*select income, Recency, Age,
	json_object('Teen', Teenhome, 'Kid', Kidhome) as Children, -- teenhome과 kidhome 컬럼 병합
	case
		when education_basic = 1 then 'basic'
		when education_2n_Cycle = 1 then '2n_cycle'
		when education_graduation = 1 then 'graduation'	
		when education_master = 1 then 'master'
		when education_PhD = 1 then 'PhD'
	end as Education,
	case
		when marital_Single = 1 then 'single'
		when marital_Together = 1 then 'together'
		when marital_Married = 1 then 'married'
		when marital_Divorced = 1 then 'divorced'
		when marital_Widow = 1 then 'widow'
	end as MaritalStatus,
	Customer_Days, complain,
	json_object('Deals', NumDealsPurchases, 'Web', NumWebPurchases, 'Catalog', NumCatalogPurchases, 'Store', NumStorePurchases) as NumPurchases, NumWebVisitsMonth, -- purchase 컬럼 병합
	json_object('Fish', MntFishProducts, 'Fruits', MntFruits, 'Meat', MntMeatProducts, 'Sweet', MntSweetProducts, 'Wines', MntWines) as MntCategories, MntTotal, MntRegularProds, MntGoldProds, -- Mnt 컬럼 병합
	json_object('1st', AcceptedCmp1, '2nd', AcceptedCmp2, '3rd', AcceptedCmp3, '4th', AcceptedCmp4, '5th', AcceptedCmp5, 'last', Response) as AcceptedCmp, AcceptedCmpOverall -- AcceptedCmp 병합	
from ifood_df*/
