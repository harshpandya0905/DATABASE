
select FACEBOOKID,FIRSTNAME,LASTNAME from fbuser fb
where extract( YEAR from sysdate)- extract( YEAR from fb.DOB) > 23
and fb.FACEBOOKID IN (select USERIDS from fbfriends group by USERIDS having count(FRIENDSID)>2)
and fb.FACEBOOKID NOT IN (select AUTHORID from fbcomment)
and fb.FACEBOOKID NOT IN (select AUTHOR from post);
