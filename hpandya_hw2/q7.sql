
select AUTHORID, COMMENTID 
from fbcomment 
where POSTED_DATE= (select max(POSTED_DATE) from fbcomment where AUTHORID='F2');
