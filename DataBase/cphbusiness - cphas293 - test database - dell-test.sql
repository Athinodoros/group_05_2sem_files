alter session set nls_date_format = 'yyyy-mm-dd';


drop table budget;
drop table POE;
drop table comments;
drop table Project;
drop table userAthentication;
drop table userInfo;
drop table partner;
drop table dell;

create table budget(
quarter integer,
qyear integer,
qbudget integer,
primary key (quarter, qyear));

create table partner (
companyName varchar(30) primary key,
companyID integer);

create table dell (
companyName varchar(30) primary key ,
companyID integer);

create table userInfo (
userID integer primary key ,
firstname varchar(20),
lastname varchar(20),
country  varchar(4),
-- companyName varchar(30) references partner(companyName) references dell(companyName) ,
companyName varchar(30) references partner(companyName) ,
urole varchar(20));

create table userAthentication (
userID integer primary key references userInfo(userID),
uname     varchar(30),
password     varchar(32),
email     varchar(30));


create table project (
projectID integer primary key,
companyName varchar(30) references Partner(companyName) references dell(companyName),
title varchar(40),
description varchar(1200),
stage varchar(40),
sdate date,
fdate date,
projectBudget integer);

create table POE (
projectID integer primary key references Project(projectID),
filePath varchar(50));

create table comments (
commentID integer primary key,
projectID integer references project(projectID),
userID integer,
"comment" varchar(2000));


commit;