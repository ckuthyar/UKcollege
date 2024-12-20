## UKcollege   
# Database Tables
create table locations(id bigint primary key auto_increment, cityname varchar(100), address varchar(100));   

create table students(id bigint primary key auto_increment, rollNo varchar(50), studentname varchar(100), location_id bigint, foreign key(location_id) references locations(id)); 

create table rooms(id bigint primary key auto_increment, roomNo varchar(50), location_id bigint, foreign key(location_id) references locations(id));   

create table studentrooms( id bigint primary key auto_increment, student_id bigint, room_id bigint, foreign key(student_id) references students(id), foreign key(room_id) references rooms(id));   

create table mteam(id bigint primary key auto_increment, staffNo bigint, staffname varchar(100), email varchar(100), mobile varchar(100), trade varchar(100), isManager boolean);   

create table auths(id bigint primary key auto_increment, student_id bigint, junk1 varchar(500), lastlogin datetime, foreign key(student_id) references students(id));   

create table authm(id bigint primary key auto_increment, staff_id bigint, junk2 varchar(500), lastlogin datetime, foreign key(staff_id) references mteam(id));   

create table complaints(id bigint primary key auto_increment, location_id bigint, room_id bigint, createdOn datetime, updatedOn datetime, createdByStudent bigint, status enum("OPEN","ACK","WIP","COMP","CLOSED"),
remarksByStudent varchar(1000), remarksByMteam varchar(1000), updatedByMteam bigint, foreign key(location_id) references locations(id), foreign key(room_id) references rooms(id), 
foreign key(createdByStudent)references students(id), foreign key(updatedByMteam)references mteam(id));  


Port numbers   
8081 - TimeTable   
8082 - UKcollege   

Project Plan   
1. Phase1 development   
2. Phase1 deployment to Linode   
3. Phase1 Mobile App for UKcollege    
4. Email Integration    

APIs   
addLocations()    
viewLocations()    

registerStudents()    
viewStudents()    

addRooms()   
viewRooms()   

registerMteam()   
viewMTeam()   

loginStudent()   
loginMteam()   

addComplaints()    
viewComplaints()    

REST API using Java Spring Boot
Step1 - Create Spring Boot Project - File-New-Spring Starter Project   
Choose Type=Maven  (not Gradle)   
Choose Packing=jar   
Choose Version=17   
Choose Language=Java   
Enter Package=pkg1   
Add Dependency=Spring Web   
Add Dependency=Spring Data JPA   
Add Dependency=MySQL Driver   
Add Dependency=Thymeleaf   

Step2: In src/main/java, within pkg1, create 4 sub-packages   
-pkg1.entity   
-pkg1.repo   
-pkg1.controller   
-pkg1.webcontroller 
Wait for Project Update to be complete (2 to 3 minutes)   

Step3: Create Entity Class within pkg1.entity 
3a. Add annotations @Entity, @Table in the file
3b. Add annotations @Id, @GeneratedValue inside the class
```
@Entity
@Table(name="locations")   //tablename
public class LocationsEntity {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	long location_id;
	String city_name;
	String address;
}
```


