create database ukcollege;
use ukcollege;
create table locations(id bigint primary key auto_increment, cityname varchar(100), address varchar(100));
create table students(id bigint primary key auto_increment, rollNo varchar(50), studentname varchar(100), location_id bigint, foreign key(location_id) references locations(id));
create table rooms(id bigint primary key auto_increment, roomNo varchar(50), location_id bigint, foreign key(location_id) references locations(id));
create table studentrooms( id bigint primary key auto_increment, student_id bigint, room_id bigint, foreign key(student_id) references students(id), foreign key(room_id) references rooms(id));
create table mteam(id bigint primary key auto_increment, staffNo bigint, staffname varchar(100), email varchar(100), mobile varchar(100), trade varchar(100), isManager boolean);
create table auths(id bigint primary key auto_increment, student_id bigint, junk1 varchar(500), lastlogin datetime, foreign key(student_id) references students(id));
create table authm(id bigint primary key auto_increment, staff_id bigint, junk2 varchar(500), lastlogin datetime, foreign key(staff_id) references mteam(id));
create table complaints(id bigint primary key auto_increment, location_id bigint, room_id bigint, createdOn datetime, updatedOn datetime, createdByStudent bigint, 
status enum("OPEN","ACK","WIP","COMP","CLOSED"),
remarksByStudent varchar(1000), remarksByMteam varchar(1000), updatedByMteam bigint, foreign key(location_id) references locations(id), foreign key(room_id) references rooms(id), 
foreign key(createdByStudent)references students(id), foreign key(updatedByMteam)references mteam(id));

insert into locations(cityname,address)values
("Bangalore", "180,Royal Hermitage"),
("Mysore", "Palace Road"),
("Belgaum", "Shivaji Road");
insert into students(rollNo, studentName, location_id)values
("A101","Kishan",1), ("A102","Siva",2),("A103","Vikranth",3);
insert into rooms(roomNo, location_id)values
(1,1),(2,1),(3,1),(4,1),(5,1),
(1,2),(2,2),(3,2),(4,2),(5,2),(6,2),(7,2),(8,2),(9,2),(10,2),
(1,3),(2,3),(3,3),(4,3),(5,3),(6,3),(7,3),(8,3);
insert into studentrooms(student_id,room_id)values
(1,1),(2,6),(3,16);
insert into mteam(staffNo,staffname,email,mobile,trade,isManager)values
(543,"ChandrashekarRaoKuthyar","ckuthyar@gmail.com","9481851276","Facilities Management", true),
(544,"Chandrappa", "cappa@gmail.com", "123", "Painter", false);
insert into auths(student_id,junk1)values
(1,"b1634c02812896b87fff3d56f89e36af"),
(2,"1955b38f13116a57e4de2134a139d139"),
(3,"0de9b14125b2cf8f9937f3644b514a8d");
insert into authm(staff_id, junk2)values
(1,"12a5681ca7d2e1d8850b0e6080a6223a"),
(2,"2bc36363dce0f137fbc37decd6afebce");
insert into complaints(location_id, room_id, createdOn, createdByStudent, status, remarksByStudent)values
(1,1,"2024-11-29 22:36:00",1,"OPEN","Foul smell due to dead rat is coming from window on northside");

update complaints set status="ACK", remarksByMteam="Will send Housekeeping staff to clean", updatedByMteam=1 where id=1;
update complaints set status="WIP", remarksByMteam="started work", updatedOn=now(), updatedByMteam=2 where id=1;
update complaints set status="COMP", remarksByMteam="finished work", updatedOn=now(), updatedByMteam=2 where id=1;

