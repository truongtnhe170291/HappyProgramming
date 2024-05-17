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
	[address] varchar(200),
	phone varchar(100),
	role_id int foreign key references Roles(role_id),
	status_id int foreign key references AccountStatuses(status_id)
)
GO
create table Mentees(
	mentee_name varchar(200) foreign key references Accounts([user_name]),
	avatar varchar(250),
	primary key (mentee_name)
)
GO
create table Mentors(
	mentor_name varchar(200) foreign key references Accounts([user_name]),
	avatar varchar(250),
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
	feedback_id int identity(1,1) primary key,
	mentor_name varchar(200) foreign key references Mentors(mentor_name),
	mentee_name varchar(200) foreign key references Mentees(mentee_name),
	star int,
	comment nvarchar(1000),
	time_feedback date,
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
	[address] varchar(200),
	avatar nvarchar(250),
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
-- Thêm dữ liệu vào bảng AccountStatuses
INSERT INTO AccountStatuses (status_name) VALUES
('Active'),
('Inactive'),
('Pending'),
('Blocked'),
('Suspended');
GO
-- Thêm dữ liệu vào bảng Roles
INSERT INTO Roles (role_name) VALUES
('Mentee'),
('Mentor'),
('Manager');
GO
-- Thêm dữ liệu vào bảng Accounts
INSERT INTO Accounts ([user_name], gmail, full_name, [pass_word], dob, sex, [address], phone, role_id, status_id) VALUES
('user1', 'user1@gmail.com', 'User One', 'password1', '1990-01-01', 1, 'Address 1', '1234567890', 1, 1),
('user2', 'user2@gmail.com', 'User Two', 'password2', '1992-02-02', 0, 'Address 2', '2345678901', 2, 1),
('user3', 'user3@gmail.com', 'User Three', 'password3', '1994-03-03', 1, 'Address 3', '3456789012', 3, 1),
('user4', 'user4@gmail.com', 'User Four', 'password4', '1996-04-04', 0, 'Address 4', '4567890123', 1, 2),
('user5', 'user5@gmail.com', 'User Five', 'password5', '1998-05-05', 1, 'Address 5', '5678901234', 2, 2);
GO
-- Thêm dữ liệu vào bảng Mentees
INSERT INTO Mentees (mentee_name, avatar) VALUES
('user1', 'avatar1.png'),
('user4', 'avatar4.png');
GO
-- Thêm dữ liệu vào bảng Mentors
INSERT INTO Mentors (mentor_name, avatar) VALUES
('user2', 'avatar2.png'),
('user5', 'avatar5.png');
GO
-- Thêm dữ liệu vào bảng Managers
INSERT INTO Managers (manager_name) VALUES
('user3');
GO
-- Thêm dữ liệu vào bảng Skills
INSERT INTO Skills (skill_name) VALUES
('Java Programming'),
('Database Management'),
('Web Development'),
('Data Analysis'),
('Machine Learning');
GO
-- Thêm dữ liệu vào bảng MentorSkills
INSERT INTO MentorSkills (mentor_name, skill_id, [rate]) VALUES
('user2', 1, 4.5),
('user2', 2, 4.0),
('user5', 3, 5.0),
('user5', 4, 4.2),
('user5', 5, 4.8);
GO
-- Thêm dữ liệu vào bảng FeedBacks
INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES
('user2', 'user1', 5, 'Great mentor!', '2024-01-01'),
('user2', 'user4', 4, 'Very helpful.', '2024-02-01'),
('user5', 'user1', 5, 'Excellent support.', '2024-03-01'),
('user5', 'user4', 3, 'Good, but can improve.', '2024-04-01'),
('user2', 'user1', 5, 'Fantastic mentor!', '2024-05-01');
GO
-- Thêm dữ liệu vào bảng RequestStatuses
INSERT INTO RequestStatuses (status_name) VALUES
('Open'),
('Processing'),
('Closed');
GO
-- Thêm dữ liệu vào bảng RequestsFormMentee
INSERT INTO RequestsFormMentee (mentor_name, mentee_name, deadline_date, title, [description], status_id, deadline_hour) VALUES
('user2', 'user1', '2024-06-01', 'Learn Java', 'Need to learn Java basics', 1, '12:00:00'),
('user2', 'user4', '2024-06-10', 'Database Course', 'Introduction to databases', 1, '14:00:00'),
('user5', 'user1', '2024-07-01', 'Web Dev Project', 'Help with web development', 1, '16:00:00'),
('user5', 'user4', '2024-07-10', 'Data Analysis', 'Data analysis techniques', 1, '10:00:00'),
('user2', 'user1', '2024-08-01', 'Advanced Java', 'Advanced Java programming', 1, '18:00:00');
GO
-- Thêm dữ liệu vào bảng RequestSkills
INSERT INTO RequestSkills (skill_id, request_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 5);
GO
-- Thêm dữ liệu vào bảng CV
INSERT INTO CV (mentor_name, gmail, full_name, dob, sex, [address], avatar, profession, profession_intro, achievement_description, service_description) VALUES
('user2', 'user2@gmail.com', 'User Two', '1992-02-02', 0, 'Address 2', 'avatar2.png', 'Java Developer', 'Experienced Java Developer', 'Developed several Java applications', 'Provides Java training'),
('user5', 'user5@gmail.com', 'User Five', '1998-05-05', 1, 'Address 5', 'avatar5.png', 'Web Developer', 'Expert in web technologies', 'Built numerous websites', 'Offers web development services');
GO
-- Thêm dữ liệu vào bảng CVSkills
INSERT INTO CVSkills (skill_id, cv_id) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2);
