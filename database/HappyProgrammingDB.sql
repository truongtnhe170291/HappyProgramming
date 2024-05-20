USE master;
GO

-- Drop the database
DROP DATABASE HappyProgrammingDB;
GO

Create database HappyProgrammingDB
GO
use HappyProgrammingDB

GO
create table AccountStatuses(
	status_id int identity(1,1) primary key,
	status_name varchar(100)
)
GO
create table Roles(
	role_id int identity(1,1) primary key,
	role_name varchar(100)
)
GO
create table Accounts(
	[user_name] varchar(200) primary key,
	gmail nvarchar(200) not null,
	full_name nvarchar(100),
	[pass_word] varchar(200) not null,
	dob date,
	sex bit,
	[address] nvarchar(200),
	phone varchar(100),
	avatar varchar(250),
	role_id int foreign key references Roles(role_id),
	status_id int foreign key references AccountStatuses(status_id)
)
GO
create table Mentees(
	mentee_name varchar(200) foreign key references Accounts([user_name]),
	primary key (mentee_name)
)
GO
create table Mentors(
	mentor_name varchar(200) foreign key references Accounts([user_name]),
	rate float,
	primary key (mentor_name)
)
GO
create table Managers(
	manager_name varchar(200) foreign key references Accounts([user_name]),
	primary key (manager_name)
)
GO
create table Skills(
	skill_id int identity(1,1) primary key,
	skill_name nvarchar(200) not null,
	[description] nvarchar(600),
	[status] bit
)
GO
create table MentorSkills(
	mentor_name varchar(200) foreign key references Mentors(mentor_name),
	skill_id int foreign key references Skills(skill_id),
	primary key (mentor_name, skill_id)
)
GO
create table FeedBacks(
	mentor_name varchar(200) foreign key references Mentors(mentor_name),
	mentee_name varchar(200) foreign key references Mentees(mentee_name),
	star int,
	comment nvarchar(1000),
	time_feedback date,
	primary key (mentor_name, mentee_name)
)
GO
create table RequestStatuses(
	status_id int identity(1,1) primary key,
	status_name varchar(100)
)
GO
create table RequestsFormMentee(
	request_id int identity(1,1) primary key,
	mentor_name varchar(200) foreign key references Mentors(mentor_name),
	mentee_name varchar(200) foreign key references Mentees(mentee_name),
	deadline_date date,
	title nvarchar(200),
	[description] nvarchar(200),
	status_id int foreign key references RequestStatuses(status_id),
	deadline_hour time,
)
GO

create table RequestSkills(
	skill_id int foreign key references Skills(skill_id),
	request_id int foreign key references RequestsFormMentee(request_id)
	primary key (skill_id, request_id)
)
GO

create table CV(
	cv_id int identity(1,1) primary key,
	mentor_name varchar(200) foreign key references Mentors(mentor_name),
	gmail varchar(200) not null,
	full_name nvarchar(100),
	dob date,
	sex bit,
	[address] nvarchar(200),
	profession nvarchar(200),
	profession_intro nvarchar(1000),
	achievement_description nvarchar(1000),
	service_description nvarchar(1000),
)
GO
create table CVSkills(
	skill_id int foreign key references Skills(skill_id),
	cv_id int foreign key references CV(cv_id),
	primary key (cv_id, skill_id)
)

GO
USE HappyProgrammingDB;
GO

-- Insert into AccountStatuses
INSERT INTO AccountStatuses (status_name) VALUES ('Active');
INSERT INTO AccountStatuses (status_name) VALUES ('Inactive');
INSERT INTO AccountStatuses (status_name) VALUES ('Pending');
GO

-- Insert into Roles
INSERT INTO Roles (role_name) VALUES ('Admin');
INSERT INTO Roles (role_name) VALUES ('Mentee');
INSERT INTO Roles (role_name) VALUES ('Mentor');
GO

-- Insert into Accounts
INSERT INTO Accounts ([user_name], gmail, full_name, [pass_word], dob, sex, [address], phone, avatar, role_id, status_id)
VALUES ('user1', 'user1@gmail.com', 'User One', 'password1', '1990-01-01', 1, '123 Main St', '1234567890', 'avatar1.png', 2, 1);
INSERT INTO Accounts ([user_name], gmail, full_name, [pass_word], dob, sex, [address], phone, avatar, role_id, status_id)
VALUES ('user2', 'user2@gmail.com', 'User Two', 'password2', '1991-02-02', 0, '456 Elm St', '0987654321', 'avatar2.png', 2, 2);
INSERT INTO Accounts ([user_name], gmail, full_name, [pass_word], dob, sex, [address], phone, avatar, role_id, status_id)
VALUES ('user3', 'user3@gmail.com', 'User Three', 'password3', '1992-03-03', 1, '789 Oak St', '1112223333', 'avatar3.png', 3, 3);
GO

-- Insert into Mentees
INSERT INTO Mentees (mentee_name) VALUES ('user1');
INSERT INTO Mentees (mentee_name) VALUES ('user2');
GO

-- Insert into Mentors
INSERT INTO Mentors (mentor_name, rate) VALUES ('user3', 3.5);
GO

-- Insert into Managers
INSERT INTO Managers (manager_name) VALUES ('user1');
INSERT INTO Managers (manager_name) VALUES ('user2');
INSERT INTO Managers (manager_name) VALUES ('user3');
GO

-- Insert into Skills
INSERT INTO Skills (skill_name, [description], [status]) VALUES ('Java Programming', 'Java development skills', 1);
INSERT INTO Skills (skill_name, [description], [status]) VALUES ('Database Management', 'Database administration and management', 1);
INSERT INTO Skills (skill_name, [description], [status]) VALUES ('Web Development', 'HTML, CSS, JavaScript skills', 1);
GO

-- Insert into MentorSkills
INSERT INTO MentorSkills (mentor_name, skill_id) VALUES ('user3', 1);
INSERT INTO MentorSkills (mentor_name, skill_id) VALUES ('user3', 2);
INSERT INTO MentorSkills (mentor_name, skill_id) VALUES ('user3', 3);
GO

-- Insert into FeedBacks
INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES ('user1', 'user3', 5, 'Excellent mentor', '2024-05-01');
INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES ('user2', 'user3', 4, 'Very helpful', '2024-05-02');
GO

-- Insert into RequestStatuses
INSERT INTO RequestStatuses (status_name) VALUES ('Pending');
INSERT INTO RequestStatuses (status_name) VALUES ('Approved');
INSERT INTO RequestStatuses (status_name) VALUES ('Rejected');
GO

-- Insert into RequestsFormMentee

INSERT INTO RequestsFormMentee (mentor_name, mentee_name, deadline_date, title, [description], status_id, deadline_hour)
VALUES ('user3', 'user1', '2024-06-03', 'Website Development', 'Help needed for website development', 3, '14:00:00');
GO

-- Insert into RequestSkills
INSERT INTO RequestSkills (skill_id, request_id) VALUES (1, 1);
INSERT INTO RequestSkills (skill_id, request_id) VALUES (2, 2);
INSERT INTO RequestSkills (skill_id, request_id) VALUES (3, 3);
GO

-- Insert into CV
INSERT INTO CV (mentor_name, gmail, full_name, dob, sex, [address], profession, profession_intro, achievement_description, service_description)
VALUES ('user3', 'user3@gmail.com', 'User Three', '1992-03-03', 1, '789 Oak St', 'Web Developer', 'Specializes in front-end development', 'Created numerous responsive websites', 'Available for web development projects');
GO

-- Insert into CVSkills
INSERT INTO CVSkills (skill_id, cv_id) VALUES (1, 1);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (2, 1);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (3, 1);
GO



