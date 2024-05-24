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
	img nvarchar(300),
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
INSERT INTO Roles (role_name) VALUES ('Mentee');
INSERT INTO Roles (role_name) VALUES ('Mentor');
INSERT INTO Roles (role_name) VALUES ('Admin');
GO

-- Insert into Accounts
INSERT INTO Accounts ([user_name], gmail, full_name, [pass_word], dob, sex, [address], phone, avatar, role_id, status_id) VALUES
 ('user1', 'user1@gmail.com', 'User One', 'password1', '1990-01-01', 1, '123 Main St', '1234567890', 'mentee1.jpg', 1, 1),
 ('user2', 'user2@gmail.com', 'User Two', 'password2', '1991-02-02', 0, '456 Elm St', '0987654321', 'mentee2.jpg', 1, 1),
 ('user3', 'user3@gmail.com', 'User Three', 'password3', '1992-03-03', 1, '789 Oak St', '1112223333', 'mentor1.jpg', 2, 1),
 ('user4', 'user4@gmail.com', 'User 4', 'password4', '2003-03-03', 1, '456 HN St', '0977333888', 'mentor2.jpg', 2, 1);
GO

-- Insert into Mentees
INSERT INTO Mentees (mentee_name) VALUES 
('user1'),
('user2');
GO

-- Insert into Mentors
INSERT INTO Mentors (mentor_name, rate) VALUES 
('user3', 3.5),
('user4', 5.0);
GO

-- Insert into Managers


-- Insert into Skills
INSERT INTO Skills (skill_name,img, [description], [status]) VALUES 
('Java Programming','java.jpg', 'Java development skills', 1),
('Database Management','database.jpg', 'Database administration and management', 1),
('Web Development','web.jpg', 'HTML, CSS, JavaScript skills', 1)
GO

-- Insert into MentorSkills
INSERT INTO MentorSkills (mentor_name, skill_id) VALUES 
('user3', 1),
('user3', 2),
('user3', 3),
('user4', 3),
('user4', 1);
GO

-- Insert into FeedBacks
INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES 
('user3', 'user1', 5, 'Excellent mentor', '2024-05-01'),
('user3', 'user2', 4, 'Very helpful', '2024-05-02'),
('user4', 'user2', 4, 'GOOD', '2024-05-02');
GO

-- Insert into RequestStatuses
INSERT INTO RequestStatuses (status_name) VALUES ('Pending');
INSERT INTO RequestStatuses (status_name) VALUES ('Approved');
INSERT INTO RequestStatuses (status_name) VALUES ('Rejected');
GO

-- Insert into RequestsFormMentee





-- Insert into CV
INSERT INTO CV (mentor_name, gmail, full_name, dob, sex, [address], profession, profession_intro, achievement_description, service_description)
VALUES ('user3', 'user3@gmail.com', 'User Three', '1992-03-03', 1, '789 Oak St', 'Web Developer', 'Specializes in front-end development', 'Created numerous responsive websites', 'Available for web development projects');
GO

-- Insert into CVSkills
INSERT INTO CVSkills (skill_id, cv_id) VALUES (1, 1);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (2, 1);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (3, 1);
GO



