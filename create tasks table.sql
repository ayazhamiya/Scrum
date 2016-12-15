CREATE TABLE tasks
( task_id int NOT NULL IDENTITY(0,1),
  userid int NOT NULL,
  task_title varchar(100) NOT NULL,
  task_description varchar(1000),
  task_startdate date,
  task_enddate date
 
  CONSTRAINT tasks_pk PRIMARY KEY (task_id),
  CONSTRAINT userid_fk FOREIGN KEY (userid) REFERENCES users(userid)
);