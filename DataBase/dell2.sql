
alter session set nls_date_format = 'yyyy-mm-dd';


drop table media;
drop table projects;
drop table users;
drop table companies;


DROP SEQUENCE projectSequence;
DROP SEQUENCE usersSequence;

create table companies (
    companyname varchar(30),
    budget integer,
    primary key(companyname));

create table users(
  userid      integer,
  uname     varchar(30),
  password     varchar(32),
  email     varchar(30),
  country     varchar(30),
  urole varchar(30),
  company varchar(30),
  foreign key (company) references companies(companyname),
  primary key (userid));

create table projects(
  projectid integer,
  authorid integer,
  title varchar(30),
  startdate date,
  enddate date,
  stage varchar(30),
  budget integer,
  poe varchar(30),
  comments varchar(30),
  constraint paFK foreign key(authorid) references users(userid),
  primary key(projectid));

create table media (
  projectid integer,
  userid integer,
  filepath varchar(30),
  constraint muFK foreign key (userid) references users(userid),
  foreign key (projectid) references projects(projectid),
  primary key(projectid));

CREATE SEQUENCE projectSequence
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1000
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE usersSequence
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1000
  INCREMENT BY 1
  CACHE 20;


Insert into companies values('Dellyrom',322321);
Insert into users values(4,'pepinio','password','email@ema','Danmark','Manager','Dellyrom');
Insert into projects values(4,4,'Del','2011-12-12','2014-12-12','Pornich',1324,'Yes','Full of shits');
Insert into media values(4,4,'Filepath//LocalDiskCassdannn');

INSERT INTO companies VALUES ('Dell', 10000);
INSERT INTO companies VALUES ('El gigante', 3);
INSERT INTO users VALUES (83,'Klaus','1234','klaus@dell.dk','Denmark','admin','Dell');
INSERT INTO users VALUES (84, 'someReseller', '1234', 'res@elgig.dk', 'Denmark', 'reseller', 'El gigante');
commit;