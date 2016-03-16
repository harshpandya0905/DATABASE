
create table count_post_on_wall as select WALL, count(AUTHOR) as TOTAL_POST from post group by WALL order by TOTAL_POST desc;

select * from 
(
select w.FACEBOOK_ID,x.TOTAL_POST from wall w , count_post_on_wall x where w.WALLID=x.WALL order by x.TOTAL_POST desc) 
where rownum<=2;
drop table count_post_on_wall;