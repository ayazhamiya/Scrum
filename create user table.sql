CREATE TABLE users
( userid int NOT NULL IDENTITY(0,1),
  fname varchar(100) NOT NULL ,
  lname varchar(100) NOT NULL,
  email varchar(100) NOT NULL,
  usertype int,
  isauthenticate int,
  CONSTRAINT users_pk PRIMARY KEY (userid)
);

ALTER TABLE users
ADD password varchar(100);

insert into users(fname, lname, email, usertype, isauthenticate)
values('ayaz', 'shahid', 'ayaz.shahid@curemd.com', 1, 1)

select * from users
