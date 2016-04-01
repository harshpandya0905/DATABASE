
-------------------------View------------------------------
create view sum_fbFriends
as select fl.USERIDS, count(fl.FRIENDSID) mycount
from fbfriends fl
where fl.USERIDS IN
(
select fb.FACEBOOKID from fbuser fb, fbfriends fl
where
fb.FACEBOOKID IN
(
select w.FACEBOOK_ID from wall w  where w.WALLID not in (select WALL from post)
)
group by fb.FACEBOOKID
)
group by fl.USERIDS;
--------------------------------------------------------

--------------------------Query----------------------------
select USERIDS from sum_fbFriends where mycount=(select max(mycount) from sum_fbFriends);
