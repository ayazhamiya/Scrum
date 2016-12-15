CREATE TABLE projects
( project_id int NOT NULL IDENTITY(0,1),
  project_workitem varchar(100) NOT NULL ,
  project_title varchar(100) NOT NULL,
  project_description varchar(100),
 
  CONSTRAINT projects_pk PRIMARY KEY (project_id)
);