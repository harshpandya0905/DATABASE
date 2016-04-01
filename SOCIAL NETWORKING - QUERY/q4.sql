
select AUTHOR from post where POSTID in(select POST_ID from likepost where LIKED_BY='F2');
