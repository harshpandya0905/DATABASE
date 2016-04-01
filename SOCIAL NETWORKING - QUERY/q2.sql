
SELECT VISIBLE_TO_ID FROM
(
SELECT count(v.WALL_ID) as count_WALL_ID, v.VISIBLE_TO_ID, dense_rank() over (order by count(v.WALL_ID) desc) dr
FROM visible_to v
join wall w on w.WALLID = v.WALL_ID
WHERE w.PUBLICVIEW = 'NO'
group by v.VISIBLE_TO_ID
order by v.VISIBLE_TO_ID)
WHERE dr = 1;
