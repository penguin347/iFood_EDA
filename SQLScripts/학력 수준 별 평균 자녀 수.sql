학력 별 평균 자녀 수
select Education, avg(Json_Extract(Children, '$.Teen')) as avg_Teen, avg(Json_Extract(Children, '$.Kid')) as avg_Kid
from ifood group by 1;