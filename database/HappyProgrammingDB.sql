USE master;
GO

-- Drop the database
DROP DATABASE HappyProgrammingDB;
GO

Create database HappyProgrammingDB
GO
use HappyProgrammingDB
GO
create table Account(
	UserName varchar(200) primary key,
	GMail nvarchar(200) not null,
	FullName nvarchar(100),
	[Password] varchar(200) not null,
	Dob date,
	Sex bit,
	[Address] varchar(200),
	Phone varchar(100),
	[Role] varchar(100),
	[Status] bit
)
GO
create table Mentee(
	UserNameMentee varchar(200) foreign key references Account(UserName),
	Avatar varchar(250),
	primary key (UserNameMentee)
)
GO
create table Mentor(
	UserNameMentor varchar(200) foreign key references Account(UserName),
	Avatar varchar(250),
	primary key (UserNameMentor)
)
GO
create table Manager(
	UserNameManager varchar(200) foreign key references Account(UserName),
	primary key (UserNameManager)
)
GO
create table Skill(
	SkillId int identity(1,1) primary key,
	SkillName nvarchar(200) not null
)
GO
create table SkillMentor(
	UserNameMentor varchar(200) foreign key references Mentor(UserNameMentor),
	SkillId int foreign key references Skill(SkillId),
	SkillName nvarchar(200) not null,
	[Rate] float,
	primary key (UserNameMentor, SkillId)
)
GO
create table FeedBack(
	FeedBackId int identity(1,1) primary key,
	UserNameMentor varchar(200) foreign key references Mentor(UserNameMentor),
	UserNameMentee varchar(200) foreign key references Mentee(UserNameMentee),
	Star int,
	Comment nvarchar(1000),
	TimeFeedBack date,
)
GO

create table RequestFormMentee(
	RequestID int identity(1,1) primary key,
	UserNameMentor varchar(200) foreign key references Mentor(UserNameMentor),
	UserNameMentee varchar(200) foreign key references Mentee(UserNameMentee),
	DeadlineDate date,
	Title nvarchar(200),
	[Description] nvarchar(200),
	[Status] bit,
	DeadlineHour time,
)
GO

create table RequestSkill(
	SkillId int foreign key references Skill(SkillId),
	RequestID int foreign key references RequestFormMentee(RequestID)
	primary key (SkillId, RequestID)
)
GO

create table CV(
	CVId int identity(1,1) primary key,
	UserNameMentor varchar(200) foreign key references Mentor(UserNameMentor),
	GMail varchar(200) not null,
	UserName nvarchar(100) not null,
	FullName nvarchar(100),
	Dob date,
	Sex bit,
	[Address] varchar(200),
	Avatar nvarchar(250),
	Profession nvarchar(200),
	ProfessionIntro nvarchar(1000),
	AchievementDescription nvarchar(1000),
	ServiceDescription nvarchar(1000),
)
GO
create table CVSkill(
	SkillId int foreign key references Skill(SkillId),
	CVId int foreign key references CV(CVId),
	primary key (CVId, SkillId)
)
 GO
 INSERT INTO Account (UserName, GMail, FullName, [Password], Dob, Sex, [Address], Phone, [Role], [Status]) VALUES
('user1', 'user1@gmail.com', 'User One', 'password1', '1990-01-01', 1, 'Address 1', '1234567890', 'Mentee', 1),
('user2', 'user2@gmail.com', 'User Two', 'password2', '1992-02-02', 0, 'Address 2', '2345678901', 'Mentor', 1),
('user3', 'user3@gmail.com', 'User Three', 'password3', '1994-03-03', 1, 'Address 3', '3456789012', 'Manager', 1),
('user4', 'user4@gmail.com', 'User Four', 'password4', '1996-04-04', 0, 'Address 4', '4567890123', 'Mentee', 1),
('user5', 'user5@gmail.com', 'User Five', 'password5', '1998-05-05', 1, 'Address 5', '5678901234', 'Mentor', 1);

-- Insert into Mentee
GO
INSERT INTO Mentee (UserNameMentee, Avatar) VALUES
('user1', 'avatar1.png'),
('user4', 'avatar4.png');

-- Insert into Mentor
GO
INSERT INTO Mentor (UserNameMentor, Avatar) VALUES
('user2', 'avatar2.png'),
('user5', 'avatar5.png');

-- Insert into Manager
GO
INSERT INTO Manager (UserNameManager) VALUES
('user3');

-- Insert into Skill
GO
INSERT INTO Skill (SkillName) VALUES
('Java Programming'),
('Database Management'),
('Web Development'),
('Data Analysis'),
('Machine Learning');

-- Insert into SkillMentor
GO
INSERT INTO SkillMentor (UserNameMentor, SkillId, SkillName, [Rate]) VALUES
('user2', 1, 'Java Programming', 4.5),
('user2', 2, 'Database Management', 4.0),
('user5', 3, 'Web Development', 5.0),
('user5', 4, 'Data Analysis', 4.2),
('user5', 5, 'Machine Learning', 4.8);

-- Insert into FeedBack
GO
INSERT INTO FeedBack (UserNameMentor, UserNameMentee, Star, Comment, TimeFeedBack) VALUES
('user2', 'user1', 5, 'Great mentor!', '2024-01-01'),
('user2', 'user4', 4, 'Very helpful.', '2024-02-01'),
('user5', 'user1', 5, 'Excellent support.', '2024-03-01'),
('user5', 'user4', 3, 'Good, but can improve.', '2024-04-01'),
('user2', 'user1', 5, 'Fantastic mentor!', '2024-05-01');

-- Insert into RequestFormMentee
GO
INSERT INTO RequestFormMentee (UserNameMentor, UserNameMentee, DeadlineDate, Title, [Description], [Status], DeadlineHour) VALUES
('user2', 'user1', '2024-06-01', 'Learn Java', 'Need to learn Java basics', 1, '12:00:00'),
('user2', 'user4', '2024-06-10', 'Database Course', 'Introduction to databases', 0, '14:00:00'),
('user5', 'user1', '2024-07-01', 'Web Dev Project', 'Help with web development', 1, '16:00:00'),
('user5', 'user4', '2024-07-10', 'Data Analysis', 'Data analysis techniques', 0, '10:00:00'),
('user2', 'user1', '2024-08-01', 'Advanced Java', 'Advanced Java programming', 1, '18:00:00');

-- Insert into RequestSkill
GO
INSERT INTO RequestSkill (SkillId, RequestID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(1, 5);

-- Insert into CV
GO
INSERT INTO CV (UserNameMentor, GMail, UserName, FullName, Dob, Sex, [Address], Avatar, Profession, ProfessionIntro, AchievementDescription, ServiceDescription) VALUES
('user2', 'user2@gmail.com', 'user2', 'User Two', '1992-02-02', 0, 'Address 2', 'avatar2.png', 'Java Developer', 'Experienced Java Developer', 'Developed several Java applications', 'Provides Java training'),
('user5', 'user5@gmail.com', 'user5', 'User Five', '1998-05-05', 1, 'Address 5', 'avatar5.png', 'Web Developer', 'Expert in web technologies', 'Built numerous websites', 'Offers web development services');

-- Insert into CVSkill
GO
INSERT INTO CVSkill (SkillId, CVId) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 2);
