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
	skill_name nvarchar(200) not null
)
GO
create table MentorSkills(
	mentor_name varchar(200) foreign key references Mentors(mentor_name),
	skill_id int foreign key references Skills(skill_id),
	[rate] float,
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

-- Insert rows into AccountStatuses
INSERT INTO AccountStatuses (status_name) VALUES 
('Active'),
('Inactive'),
('Pending'),
('Suspended'),
('Deleted');
GO

-- Insert rows into Roles
INSERT INTO Roles (role_name) VALUES 
('Admin'),
('Mentor'),
('Mentee'),
('Manager'),
('User');
GO

-- Insert rows into Accounts
INSERT INTO Accounts ([user_name], gmail, full_name, [pass_word], dob, sex, [address], phone, avatar, role_id, status_id) VALUES 
('user1', 'user1@gmail.com', 'User One', 'password1', '1990-01-01', 1, '123 Main St', '1234567890', 'avatar1.jpg', 2, 1),
('user2', 'user2@gmail.com', 'User Two', 'password2', '1991-02-02', 0, '456 Elm St', '2345678901', 'avatar2.jpg', 2, 2),
('user3', 'user3@gmail.com', 'User Three', 'password3', '1992-03-03', 1, '789 Oak St', '3456789012', 'avatar3.jpg', 3, 3),
('user4', 'user4@gmail.com', 'User Four', 'password4', '1993-04-04', 0, '101 Pine St', '4567890123', 'avatar4.jpg', 2, 4),
('user5', 'user5@gmail.com', 'User Five', 'password5', '1994-05-05', 1, '202 Birch St', '5678901234', 'avatar5.jpg', 3, 5);
GO

-- Insert rows into Mentees
INSERT INTO Mentees (mentee_name) VALUES 
('user3'),
('user5')

GO

-- Insert rows into Mentors
INSERT INTO Mentors (mentor_name) VALUES 
('user1'),
('user2'),
('user4')
GO

-- Insert rows into Managers




-- Insert rows into Skills
INSERT INTO Skills (skill_name) VALUES 
('Java'),
('Python'),
('SQL'),
('HTML'),
('CSS');
GO

-- Insert rows into MentorSkills
INSERT INTO MentorSkills (mentor_name, skill_id, [rate]) VALUES 
('user1', 1, 4.5),
('user2', 2, 4.0),
('user4', 4, 3.5)
GO

-- Insert rows into FeedBacks
INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES 
('user1', 'user3', 5, 'Great mentor!', '2024-05-01'),
('user2', 'user5', 4, 'Very helpful.', '2024-05-02')
GO

-- Insert rows into RequestStatuses
INSERT INTO RequestStatuses (status_name) VALUES 
('Open'),
('In Progress'),
('Closed'),
('Cancelled'),
('Pending Review');
GO

-- Insert rows into RequestsFormMentee
INSERT INTO RequestsFormMentee (mentor_name, mentee_name, deadline_date, title, [description], status_id, deadline_hour) VALUES 
('user1', 'user3', '2024-06-01', 'Java Basics', 'Need help with Java basics', 1, '12:00:00'),
('user2', 'user5', '2024-06-02', 'Python Advanced', 'Guidance on advanced Python topics', 2, '14:00:00'),
('user4', 'user1', '2024-06-04', 'HTML and CSS', 'Assistance with web design', 4, '18:00:00')
GO

-- Insert rows into RequestSkills
INSERT INTO RequestSkills (skill_id, request_id) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);
GO

-- Insert rows into CV
INSERT INTO CV (mentor_name, gmail, full_name, dob, sex, [address], profession, profession_intro, achievement_description, service_description) VALUES 
('user1', 'user1@gmail.com', 'User One', '1990-01-01', 1, '123 Main St', 'Software Engineer', 'Experienced in Java and Python', 'Developed several applications', 'Offering mentoring in programming'),
('user2', 'user2@gmail.com', 'User Two', '1991-02-02', 0, '456 Elm St', 'Data Scientist', 'Skilled in data analysis and machine learning', 'Published research papers', 'Offering mentoring in data science'),
('user4', 'user4@gmail.com', 'User Four', '1993-04-04', 0, '101 Pine St', 'Web Developer', 'Proficient in HTML, CSS, and JavaScript', 'Designed several websites', 'Offering mentoring in web development')
GO

-- Insert rows into CVSkills
INSERT INTO CVSkills (skill_id, cv_id) VALUES 
(1, 1),
(2, 2),
(3, 3),

