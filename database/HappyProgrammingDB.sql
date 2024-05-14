Create database HappyProgrammingDB
GO
use HappyProgrammingDB
GO
create table Account(
	GMail varchar(200) primary key,
	Username nvarchar(100) not null,
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
	GMailMentor varchar(200) foreign key references Mentor(GMailMentor),
	GMailMentee varchar(200) foreign key references Mentee(GMailMentee),
	SkillId int,
	Deadline_date date,
	Title nvarchar(200),
	Desciption nvarchar(200),
	[Status] bit,
	Deadline_hour time,
	primary key (GMailMentor, GMailMentee)
)