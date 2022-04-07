-- student2 table

create table Student2 (rollno int primary key , Name varchar(50) not null , address varchar(50) ,phone varchar(10) )

insert into Student2 values (1, 'ravi sah ',     'bardibas ',       '9861496119')
insert into Student2 values (2, 'niraj sah',     'rajbiraj ',       '9813660843')
insert into Student2 values (3, 'kushal dotel ', 'bardia ',         '9803652924')
insert into Student2 values (4, 'silvia dangol', 'setopul ',        '9803623924')
insert into Student2 values (5, 'siwani karki',  'gaushala',        '1234567891') 
insert into Student2 values (6, 'aarati sah',    'lajimpat',        '2345678911')
insert into Student2 values (7, 'alisha basnet', 'gokarna',         '1234567825')
insert into Student2 values (8, 'ubisha sigdel', 'lajinpat',        '2345698523')
insert into Student2 values (9, 'dipen basnet',  'khoii',           '3256897410')
insert into Student2 values (10,'bhupendra sah', 'birjung',         '2356410729')

select * from Student2

-- employee2 table

create table employee2 (empid int primary key, name varchar(50) not null , address varchar(50),phone varchar(10))

insert into employee2 values (1, 'Ramesh adhikari', 'london',       '9803652564')
insert into employee2 values (2, 'sarjana Dhital',  'kathmandu',    '2345678921')
insert into employee2 values (3, 'bimal khanal',    'bhaktapur',    '5632147896')
insert into employee2 values (4, 'dev karki',       'malasiya',     '8965321478')
insert into employee2 values (5, 'nabin sah',       'russia',       '1204578963')
insert into employee2 values (6, 'sudip sah',       'ukraine',      '2356897451')
insert into employee2 values (7, 'umesh bhandari',  'america',      '2354782510')
insert into employee2 values (8, 'rabi dhakal',     'mexica',       '7874512365')
insert into employee2 values (9, 'ravi thakur' ,    'portland',     '2365452542')
insert into employee2 values (10, 'sarooj nepal' ,  'uk',           '5648952365')


select * from employee2

-- book store

create table Bokstore (Bookid char(5) primary key, Name varchar(50) not null, ISBN varchar(50), Authorname varchar(50), Qty int , entrydate date default getDate () )

insert into Bokstore values (232,   'python',       'LBEF101',  'logger',       50, '3/24/2022')
insert into Bokstore values (232,   'javascript',   'LBEF102',  'hacker',       60, '4/3/2022')
insert into Bokstore values (1232,  'c#',           'LBEF103',  'cracker',      62, '5/3/2022')
insert into Bokstore values (486,   'html',         'LBEF104',  'fisher',       63, '6/3/2022')
insert into Bokstore values (012,   'django',       'LBEF105',  'blackhat',     64, '7/3/2022')
insert into Bokstore values (451,   'php',          'LBEF106',  'redhat',       66, '8/3/2022')
insert into Bokstore values (781,   'css',          'LBEF107',  'grayhat',      65, '9/3/2022')
insert into Bokstore values (7891,  'photoshop',    'LBEF108',  'bluehat',      70, '10/3/2022')
insert into Bokstore values (069,   'blender',      'LBEF109',  'whitehat',     80, '11/3/2022')

select * from Bokstore


-- book issued

create table bookissued (BookId char(5), roll int, issuedate date, issuedby char(15),Foreign Key(Bookid) references Bokstore(Bookid),Foreign key (roll) references student (roll)) 



insert into bookissued values (1,   '10',   '11/3/2022',    'ravi')
insert into bookissued values (2,   '9',    '10/3/2023',    'niraj')
-- 10 ota table banauna mun xa vane afaii type garara banauu bujhyauu....



-- aru pani xa haii maila lakhako xaina so afaii lakha haii 


