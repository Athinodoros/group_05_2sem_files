alter session set nls_date_format = 'yyyy-mm-dd';


drop table Proof;
drop table projects;
drop table userz;
drop table resellers;

create table resellers (
    resname varchar(30),
    address varchar(30),
    primary key(resname));

create table users (
  userid      integer,
  firstname varchar(40),
lastname varchar(40),
  uname     varchar(30),
  password     varchar(32),
  email     varchar(30),
  country     varchar(30),
  urole varchar(30),
  resellername varchar(30),
  foreign key (resellername) references resellers(resname),
  primary key (userid));

create table projects(
  projectid integer,
  resname varchar(40),
  title varchar(30),
  startdate date,
  enddate date,
  stage varchar(30),
  projbudget integer,
  poe varchar(30),
  comments varchar(30),
  constraint reFK foreign key(resname) references resellers(resname),
  primary key(projectid));

create table Proof (
  projectid integer,
  userid integer,
  filepath varchar(30),
    filename varchar(40),
  constraint ruFK foreign key (userid) references userz(userid),
  foreign key (projectid) references projects(projectid));


Insert into resellers values('Dellyromz','Kustendja baba iliitsa');
Insert into userz values(3,'Pepi','Dunata','pepinio','password','email@ema','Danmark','Reseller','Dellyromz');
Insert into projects values(3,'Dellyromz','Del','2011-12-12','2014-12-12','Pornich',5455,'Yes','Full of shits');
Insert into Proof values(3,3,'Filepath//LocalDiskCassdannn','KAKKA');
commit;


