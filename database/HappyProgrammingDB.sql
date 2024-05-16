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
	GMail varchar(200) primary key,
	UserName nvarchar(100) not null,
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
	GMailMentee varchar(200) foreign key references Account(GMail),
	Avatar varchar(250),
	primary key (GMailMentee)
)
GO
create table Mentor(
	GMailMentor varchar(200) foreign key references Account(GMail),
	Avatar varchar(250),
	primary key (GMailMentor)
)
GO
create table Manager(
	GMailManager varchar(200) foreign key references Account(GMail),
	primary key (GMailManager)
)
GO
create table Skill(
	SkillId int identity(1,1) primary key,
	SkillName nvarchar(200) not null
)
GO
create table SkillMentor(
	GMailMentor varchar(200) foreign key references Mentor(GMailMentor),
	SkillId int foreign key references Skill(SkillId),
	SkillName nvarchar(200) not null,
	[Rate] float,
	primary key (GMailMentor, SkillId)
)
GO
create table FeedBack(
	GMailMentor varchar(200) foreign key references Mentor(GMailMentor),
	GMailMentee varchar(200) foreign key references Mentee(GMailMentee),
	Star int,
	Comment nvarchar(1000),
	TimeFeedBack date,
	primary key (GMailMentor, GMailMentee)
)
GO

create table RequestFormMentee(
	RequestID int identity(1,1) primary key,
	GMailMentor varchar(200) foreign key references Mentor(GMailMentor),
	GMailMentee varchar(200) foreign key references Mentee(GMailMentee),
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
	GMailMentor varchar(200) foreign key references Mentor(GMailMentor),
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