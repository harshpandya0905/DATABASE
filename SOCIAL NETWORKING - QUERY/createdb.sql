

create table fbuser(FACEBOOKID varchar2(20) primary key not null,EMAIL varchar2(30),FIRSTNAME varchar2(20),LASTNAME varchar2(20),DOB date,BIRTHPLACE varchar2(50),GENDER varchar2(20));

insert into fbuser values('F1','abhi@yahoo.com','Abhinav','cheatham','1-jul-1969','LAKE CITY,FL 32056','M');
insert into fbuser values('F2','abhishk@gmail.com','Abhishek','deponto','5-feb-1984','Adak,AK 99546','M');
insert into fbuser values('F3','ald@gmail.com','Aldrich','chapel','27-may-1988','VERNON HILLS,IL 60061','M');
insert into fbuser values('F4','dennis@yahoo.com','Dennis','brandy','1-aug-1967','SAN FRANCISCO, CA 94102','M');
insert into fbuser values('F5','davy@hotmail.com','Davy','ritacco','10-oct-1990','NEW YORK, NY 10010','F');
insert into fbuser values('F6','dawa@yahoo.com','Dawa','cusenz','12-oct-1978','CEDAR FALLS, NC 27230','F');
insert into fbuser values('F7','hila@yahoo.com','Hilary','chapman','9-sep-1988','FISHERS ISLAND, NY 06390','F');
insert into fbuser values('F8','hilda@gmail.com','Hilda','restaino','15-mar-1953','LAS VEGAS,NV 89030','F');
insert into fbuser values('F9','lli@gmail.com','Lillian','scharfman','28-dec-1954','LOS ANGELES,CA 90007','F');
insert into fbuser values('F10','mic@yahoo.com','Michael','devany','23-jul-1987','CALDWELL,NJ 07004','M');
insert into fbuser values('F11','miyoko@hotmail.com','Miyoko','orth','11-aug-1983','LOS ANGELES,CA 90007','M');
insert into fbuser values('F12','freya@yahoo.com','Freya','chapman','13-nov-1987','CLIFFSIDE PARK,NJ 07010','M');
insert into fbuser values('F13','kell@gmail.com','Kelley','ruth','12-jan-1986','REDONDO BEACH,CA 90278','F');
insert into fbuser values('F14','kris@yahoo.com','Kristine','corbitt','20-dec-1986','ALLEMAN,IA 50007','F');
insert into fbuser values('F15','yas@yahoo.com','Yasmine','altschiller','4-jul-1967','AMHERST,MA 01004','F');
insert into fbuser values('F16','paras@gmail.com','Paras','hubertus','2-oct-1978','SANTA MONICA,CA 90411','M');
insert into fbuser values('F17','pert@gmail.com','Perth','irven','21-mar-1977','CHARLOTTE HALL,MD 20622','M');
insert into fbuser values('F18','steve@yahoo.com','Stevenson','aubry','29-apr-1989','PHOENIX,AZ 85009','M');
insert into fbuser values('F19','shrey@yahoo.com','Shrey','pancho','14-jul-1968','BELLEVUE','F');
insert into fbuser values('F20','rose@hotmail.com','Rosemary','glass','15-dec-1988','AMA,LA 70031','F');






create table wall(WALLID varchar2(20) primary key not null,FACEBOOK_ID varchar2(20),foreign key(FACEBOOK_ID) references fbuser(FACEBOOKID),PUBLICVIEW varchar2(20));


insert into wall values('W1','F1','NO');
insert into wall values('W2','F2','NO');
insert into wall values('W3','F3','YES');
insert into wall values('W4','F4','NO');
insert into wall values('W5','F5','YES');
insert into wall values('W6','F6','YES');
insert into wall values('W7','F7','NO');
insert into wall values('W8','F8','YES');
insert into wall values('W9','F9','NO');
insert into wall values('W10','F10','NO');
insert into wall values('W11','F11','NO');
insert into wall values('W12','F12','NO');
insert into wall values('W13','F13','NO');
insert into wall values('W14','F14','NO');
insert into wall values('W15','F15','NO');
insert into wall values('W16','F16','NO');
insert into wall values('W17','F17','NO');
insert into wall values('W18','F18','NO');
insert into wall values('W19','F19','YES');
insert into wall values('W20','F20','NO');




create table post(POSTID integer primary key not null,AUTHOR varchar2(20),WALL varchar2(20),POSTED_DATE timestamp,LOCATION varchar2(50),foreign key(AUTHOR) references fbuser(FACEBOOKID),foreign key(WALL) references wall(WALLID));


insert into post values(1201,'F2','W6','02-OCT-2007 09:11:17 AM','Gonzales,LA,United States');
insert into post values(1202,'F3','W8','02-OCT-2007 01:31:39 AM','Gonzales,LA,United States');
insert into post values(1203,'F12','W14','02-OCT-2007 09:10:54 AM','Pasadena,LA,United States');
insert into post values(1204,'F2','W6','02-OCT-2007 01:05:56 PM','Paterson,NJ,United States');
insert into post values(1205,'F7','W14','29-SEP-2007 10:38:25 AM','Mishawaka, Indiana, United States');
insert into post values(1206,'F12','W11','29-SEP-2007 02:30:47 PM','Salt Lake City, Utah, United States');
insert into post values(1207,'F12','W14','29-SEP-2007 01:52:25 PM','Directfrom the Publishers!, United States');
insert into post values(1208,'F3','W19','28-SEP-2007 07:46:08 PM','United States');
insert into post values(1209,'F15','W6','29-SEP-2007 01:45:00 PM','New York New Jersey, United States');
insert into post values(1210,'F16','W2','30-SEP-2007 05:12:29 AM','Nieuwegein, Netherlands');
insert into post values(1211,'F11','W12','29-SEP-2007 04:06:00 PM','91754,United States');
insert into post values(1212,'F3','W5','02-OCT-2007 02:28:20 PM','Hollywood,CA -Famous camera source!');
insert into post values(1213,'F3','W8','27-SEP-2007 11:00:33 AM','Woodstock, Illinois, United States');
insert into post values(1214,'F12','W11','02-OCT-2007 12:45:00 PM','Brooklyn, New York, United States');
insert into post values(1215,'F12','W14','29-SEP-2007 04:08:39 PM','Woodside, Delaware, United States');
insert into post values(1216,'F3','W5','29-SEP-2007 04:45:34 PM','The Heartland, United States');
insert into post values(1217,'F11','W12','25-SEP-2007 05:18:31 PM','New York, United States');
insert into post values(1218,'F12','W14','25-SEP-2007 05:15:00 PM','Hong Kong');
insert into post values(1219,'F16','W2','01-OCT-2007 05:15:05 PM','Authorized Dealer, United States');
insert into post values(1220,'F3','W19','29-SEP-2007 01:41:37 PM','Philadelphia, Pennsylvania, United States');
insert into post values(1221,'F6','W2','25-SEP-2007 04:47:57 PM','Vaughan,Ontario, Canada');
insert into post values(1222,'F12','W11','30-SEP-2007 02:34:54 PM','New Jersey, USA, United States');
insert into post values(1223,'F2','W1','29-SEP-2007 05:28:02 PM','Fresno, California, United States');
insert into post values(1224,'F2','W1','29-SEP-2007 05:29:40 PM','Winter Haven, Florida, United States');
insert into post values(1225,'F11','W12','02-OCT-2007 12:44:09 AM','Los Angeles, CA, United States');




create table fbcomment(COMMENTID integer primary key not null,POST_ID integer,AUTHORID varchar2(20),POSTED_DATE timestamp,foreign key(POST_ID) references post(POSTID),foreign key(AUTHORID) references fbuser(FACEBOOKID));


insert into fbcomment values(21201,1201,'F2','02-OCT-2007 09:11:17 AM');
insert into fbcomment values(21202,1202,'F3','02-OCT-2007 01:31:39 AM');
insert into fbcomment values(12023,1203,'F12','02-OCT-2007 09:10:54 AM');
insert into fbcomment values(13204,1204,'F2','02-OCT-2007 01:05:56 PM');
insert into fbcomment values(12305,1205,'F7','29-SEP-2007 10:38:25 AM');
insert into fbcomment values(12106,1206,'F12','29-SEP-2007 02:30:47 PM');
insert into fbcomment values(12607,1207,'F12','29-SEP-2007 01:52:25 PM');
insert into fbcomment values(12088,1208,'F3','28-SEP-2007 07:46:08 PM');
insert into fbcomment values(12609,1209,'F15','29-SEP-2007 01:45:00 PM');
insert into fbcomment values(12810,1210,'F16','30-SEP-2007 05:12:29 AM');
insert into fbcomment values(12911,1211,'F11','29-SEP-2007 04:06:29 PM');
insert into fbcomment values(12012,1212,'F3','02-OCT-2007 02:28:20 PM');
insert into fbcomment values(12013,1211,'F3','27-SEP-2007 11:00:33 AM');
insert into fbcomment values(12164,1214,'F12','02-OCT-2007 12:45:00 PM');
insert into fbcomment values(12415,1211,'F12','29-SEP-2007 04:08:39 PM');
insert into fbcomment values(12316,1216,'F3','29-SEP-2007 04:45:34 PM');
insert into fbcomment values(12127,1212,'F11','25-SEP-2007 05:18:31 PM');
insert into fbcomment values(12138,1218,'F12','25-SEP-2007 05:15:00 PM');
insert into fbcomment values(12419,1213,'F16','01-OCT-2007 05:15:05 PM');
insert into fbcomment values(12250,1220,'F3','29-SEP-2007 01:41:37 PM');
insert into fbcomment values(12421,1215,'F6','25-SEP-2007 04:47:57 PM');
insert into fbcomment values(122322,1215,'F12','30-SEP-2007 02:34:54 PM');
insert into fbcomment values(124423,1215,'F2','29-SEP-2007 05:28:02 PM');
insert into fbcomment values(124424,1214,'F2','29-SEP-2007 05:29:40 PM');
insert into fbcomment values(134225,1210,'F11','02-OCT-2007 12:44:09 AM');




create table fbfriends(USERIDS varchar2(20),FRIENDSID varchar2(20),FRIEND_WALL_VISIBILITY varchar2(25),foreign key(USERIDS) references fbuser(FACEBOOKID),foreign key(FRIENDSID) references fbuser(FACEBOOKID));


insert into fbfriends values('F1','F2','YES');
insert into fbfriends values('F1','F7','YES');
insert into fbfriends values('F1','F9','YES');
insert into fbfriends values('F2','F1','YES');
insert into fbfriends values('F2','F6','YES');
insert into fbfriends values('F2','F9','YES');
insert into fbfriends values('F2','F16','NO');
insert into fbfriends values('F2','F18','YES');
insert into fbfriends values('F3','','');
insert into fbfriends values('F4','F7','YES');
insert into fbfriends values('F5','','');
insert into fbfriends values('F6','F2','YES');
insert into fbfriends values('F6','F15','YES');
insert into fbfriends values('F7','F1','YES');
insert into fbfriends values('F7','F4','YES');
insert into fbfriends values('F7','F17','YES');
insert into fbfriends values('F8','F13','YES');
insert into fbfriends values('F8','F15','YES');
insert into fbfriends values('F9','F1','NO');
insert into fbfriends values('F9','F2','NO');
insert into fbfriends values('F10','F16','YES');
insert into fbfriends values('F11','F12','NO');
insert into fbfriends values('F12','F11','YES');
insert into fbfriends values('F12','F14','YES');
insert into fbfriends values('F13','F8','YES');
insert into fbfriends values('F14','F12','YES');
insert into fbfriends values('F15','F6','YES');
insert into fbfriends values('F15','F8','YES');
insert into fbfriends values('F16','F2','NO');
insert into fbfriends values('F16','F10','YES');
insert into fbfriends values('F17','F7','YES');
insert into fbfriends values('F18','F2','YES');
insert into fbfriends values('F19','','');
insert into fbfriends values('F20','','');




create table likepost(POST_ID integer,LIKED_BY varchar2(20),foreign key(POST_ID) references post(POSTID),foreign key(LIKED_BY) references fbuser(FACEBOOKID));

insert into likepost values(1201,'F1');
insert into likepost values(1202,'F5');
insert into likepost values(1203,'F1');
insert into likepost values(1203,'F9');
insert into likepost values(1204,'F7');
insert into likepost values(1205,'F8');
insert into likepost values(1205,'F2');
insert into likepost values(1205,'F6');
insert into likepost values(1205,'F11');
insert into likepost values(1205,'F13');
insert into likepost values(1206,'F13');
insert into likepost values(1207,'F17');
insert into likepost values(1208,'F14');
insert into likepost values(1209,'F1');
insert into likepost values(1209,'F2');
insert into likepost values(1209,'F7');
insert into likepost values(1209,'F8');
insert into likepost values(1210,'F19');
insert into likepost values(1210,'F2');
insert into likepost values(1210,'F1');
insert into likepost values(1211,'F20');
insert into likepost values(1212,'F1');
insert into likepost values(1213,'F20');
insert into likepost values(1213,'F3');
insert into likepost values(1213,'F2');
insert into likepost values(1214,'F8');
insert into likepost values(1215,'F8');
insert into likepost values(1216,'F1');
insert into likepost values(1217,'F18');
insert into likepost values(1217,'F2');
insert into likepost values(1218,'F18');
insert into likepost values(1219,'F5');
insert into likepost values(1220,'F5');
insert into likepost values(1221,'F9');
insert into likepost values(1221,'F2');
insert into likepost values(1222,'F10');
insert into likepost values(1223,'F4');
insert into likepost values(1224,'F5');
insert into likepost values(1225,'F9');





create table likecomment(COMMENT_ID integer,C_LIKED_BY varchar2(20),foreign key(COMMENT_ID) references fbcomment(COMMENTID),foreign key(C_LIKED_BY) references fbuser(FACEBOOKID));


insert into likecomment values(21201,'F2');
insert into likecomment values(21201,'F7');
insert into likecomment values(21201,'F9');
insert into likecomment values(21202,'F1');
insert into likecomment values(21202,'F6');
insert into likecomment values(21202,'F9');
insert into likecomment values(21202,'F16');
insert into likecomment values(21202,'F18');
insert into likecomment values(12023,'');
insert into likecomment values(13204,'F7');
insert into likecomment values(12305,'');
insert into likecomment values(12106,'F2');
insert into likecomment values(12106,'F15');
insert into likecomment values(12607,'F1');
insert into likecomment values(12607,'F4');
insert into likecomment values(12607,'F17');
insert into likecomment values(12088,'F13');
insert into likecomment values(12088,'F15');
insert into likecomment values(12088,'F2');
insert into likecomment values(12609,'F1');
insert into likecomment values(12609,'F2');
insert into likecomment values(12810,'F16');
insert into likecomment values(12911,'F12');
insert into likecomment values(12012,'F11');
insert into likecomment values(12012,'F14');
insert into likecomment values(12012,'F2');
insert into likecomment values(12013,'F8');
insert into likecomment values(12164,'F12');
insert into likecomment values(12415,'F6');
insert into likecomment values(12415,'F8');
insert into likecomment values(12316,'F2');
insert into likecomment values(12316,'F10');
insert into likecomment values(12127,'F7');
insert into likecomment values(12138,'F2');
insert into likecomment values(12419,'');
insert into likecomment values(12250,'');
insert into likecomment values(12421,'');
insert into likecomment values(122322,'F2');
insert into likecomment values(124423,'');
insert into likecomment values(124424,'');
insert into likecomment values(134225,'');



create table visible_to(WALL_ID varchar2(20),VISIBLE_TO_ID varchar2(20),foreign key(WALL_ID) references wall(WALLID),foreign key(VISIBLE_TO_ID) references fbuser(FACEBOOKID));


insert into visible_to values('W1','F2');
insert into visible_to values('W1','F7');
insert into visible_to values('W2','F1');
insert into visible_to values('W2','F6');
insert into visible_to values('W2','F18');
insert into visible_to values('W3','');
insert into visible_to values('W4','F7');
insert into visible_to values('W5','');
insert into visible_to values('W6','F2');
insert into visible_to values('W6','F15');
insert into visible_to values('W7','F1');
insert into visible_to values('W7','F4');
insert into visible_to values('W7','F17');
insert into visible_to values('W8','F13');
insert into visible_to values('W8','F15');
insert into visible_to values('W9','F1');
insert into visible_to values('W9','F2');
insert into visible_to values('W10','F16');
insert into visible_to values('W11','F12');
insert into visible_to values('W12','F14');
insert into visible_to values('W13','F8');
insert into visible_to values('W14','F12');
insert into visible_to values('W15','F6');
insert into visible_to values('W15','F8');
insert into visible_to values('W16','F10');
insert into visible_to values('W17','F7');
insert into visible_to values('W18','F2');
insert into visible_to values('W19','');
insert into visible_to values('W20','');


