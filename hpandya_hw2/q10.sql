
select p.AUTHOR, (extract( YEAR from sysdate)- extract( YEAR from f.DOB)) AS Age from post p, fbuser f
where
f.FACEBOOKID = p.AUTHOR
and
p.LOCATION = 'Los Angeles, CA, United States'
and 
p.AUTHOR IN
(
select fb.FACEBOOKID from fbuser fb
where fb.BIRTHPLACE <> 'LOS ANGELES,CA 90007'
);