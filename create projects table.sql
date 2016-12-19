CREATE TABLE projects
( project_id int NOT NULL IDENTITY(1,1),
  project_workitem varchar(100) NOT NULL ,
  project_title varchar(100) NOT NULL,
  project_description varchar(100),
 
  CONSTRAINT projects_pk PRIMARY KEY (project_id)
);

insert into projects(project_workitem, project_title, project_description)
values('CAS-123-TEST','TEST PROJECT TITLE', 'test project created by az')

select * from projects