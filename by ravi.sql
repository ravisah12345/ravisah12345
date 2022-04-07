
create table Student (rollno int primary key , Name varchar(50) not null , address varchar(50) ,phone varchar(10) )

insert into Student values (1, 'sujan khanal', 'thali ', '9861496119')
insert into Student values (2, 'sarose nepal', 'machapokahari ', '9813660843')
insert into Student values (3, 'suman kunwar', 'koteshwor ', '9803652924')
insert into Student values (4, 'sulav', 'baneshwor ', '9803623924')
insert into Student values (5, 'ram', 'thali', '1234567891') 
insert into Student values (6, 'shyam','danchi', '234567891')
insert into Student values (7, 'ghanshyam', 'mulpani', '1234567825')
insert into Student values (8, 'krishna', 'gothatar', '2345698523')
insert into Student values (9, 'harikrishna', 'nepaltar', '3256897410')
insert into Student values (10, 'don', 'dhading', '2356410729')

select * from Student


alter table Student1 add courses char(10)


update Student1 set courses = 'BIT' where rollno ='2'
update Student1 set courses = 'Bba' where rollno ='1'
update Student1 set courses = 'mba' where rollno ='3'
update Student1 set courses = 'bhm' where rollno ='4'
update Student1 set courses = 'bsc' where rollno ='5'
update Student1 set courses = 'mat' where rollno ='6'
update Student1 set courses = 'mba' where rollno ='7'
update Student1 set courses = 'mms' where rollno ='8'
update Student1 set courses = 'wwe' where rollno ='9'
update Student1 set courses = 'chef' where rollno ='10'


select * from Student1




create table employee2 (empid int primary key, name varchar(50) not null , address varchar(50),phone varchar(10))
insert into employee2 values (1, 'Ramesh Suwal','lalitpur', '9803652564')
insert into employee2 values (2, 'sarjana Dhital','kathmandu','2345678921')
insert into employee2 values (3, 'rajasjana khanal','bhaktapur','5632147896')
insert into employee2 values (4, 'ras gulla', 'dhading', '8965321478')
insert into employee2 values (5, 'has bulla', 'russia', '1204578963')
insert into employee2 values (6, 'mula achar', 'ukraine', '2356897451')
insert into employee2 values (7, 'alu chor', 'america', '2354782510')
insert into employee2 values (8, 'rabi lamichane', 'mexica', '78745123654')
insert into employee2 values (9, 'ravi thakur' ,'portland', '2365452542')
insert into employee2 values (10, 'sarooj nepal' , 'nepal', '5648952365')



alter table employee1 add designation char(10)
update employee1 set  designation = 'manager' where empid ='1'

select * from employee2


-- book store


create table Bokstore (Bookid char(5) primary key, Name varchar(50) not null, ISBN varchar(50), Authorname varchar(50), Qty int , entrydate date default getDate () )
insert into Bokstore values (232, 'Two states', 'FGDFGDF21FDG', 'Chetan Bhagat' , 50, '3/24/2022')
insert into Bokstore values (232, 'The rock', 'FSDFSDF121','seth rogen', 60, '4/3/2022')
insert into Bokstore values (1232, 'annabelle', 'FSDFSDF12','seh rogen', 62, '5/3/2022')
insert into Bokstore values (486, 'helloworld', 'FSDFSDF11','set ogen', 63, '6/3/2022')
insert into Bokstore values (012, 'i love you', 'FSDFSD121','sth rogen', 64, '7/3/2022')
insert into Bokstore values (451, 'senorita', 'FSDFDF121','set rogen', 66, '8/3/2022')
insert into Bokstore values (781, 'muaah', 'FSDSDF121','seth roge', 65, '9/3/2022')
insert into Bokstore values (7891, 'cat and dogs', 'FSDSDF121','seth ogen', 70, '10/3/2022')
insert into Bokstore values (069, 'bye bye', 'FDFSDF121','seth roen', 80, '11/3/2022')

select * from Bokstore


-- book issuedby

create table bookissued(BookId char(5), roll int, issuedate date, issuedby char(15),Foreign Key(Bookid) references Bokstore(Bookid),Foreign key (roll) references student (roll)) 


insert into bookissued values (1,'10','11/3/2022','sujana')
insert into bookissued values (1,'9','10/3/2023','sujjn')

select * from bookissued

create table empbookissue (empid char(5), bookid char(5), issuedate date, issuedby char(50),Foreign key(bookid) references bokstore(bookid), Foreign Key(empid) references employee(empid))
insert into empbookissue values(1,'1232','11/3/2022','sujansir' )
insert into empbookissue values(2,'232','5/3/2022','sujanasir' )

select * from empbookissue


create table bookreturn_student(bokid varchar(10) ,roll varchar(10),returned_to varchar(30),return_date DATE DEFAULT current_timestamp ,  Foreign key(bokid) references bokstore(bokid), Foreign Key(empid) references employee2(empid))


create table Fine (roll int , Bookid char(10),qty int primary key ,finedate date,foreign key(roll) references Bidhyarthi(roll))






