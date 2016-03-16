
select post from
(
select post, mycount, dense_rank() over (order by mycount desc) dr from
(
select POST_ID as post, count(LIKED_BY) mycount
from likepost 
group by POST_ID
)
where post NOT IN (select POST_ID from fbcomment)
)
where dr = 1;