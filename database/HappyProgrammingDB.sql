

USE master;
GO


IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'HappyProgrammingDB')
BEGIN
	ALTER DATABASE HappyProgrammingDB SET OFFLINE WITH ROLLBACK IMMEDIATE;
	ALTER DATABASE HappyProgrammingDB SET ONLINE;
	DROP DATABASE HappyProgrammingDB;
END
GO
-- Create the database
CREATE DATABASE HappyProgrammingDB;
GO

USE HappyProgrammingDB;
GO

-- Create AccountStatuses table
CREATE TABLE AccountStatuses(
    status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name NVARCHAR(100)
);
GO

-- Create Roles table
CREATE TABLE Roles(
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    role_name NVARCHAR(100)
);
GO

-- Create Accounts table
CREATE TABLE Accounts(
    [user_name] NVARCHAR(200) PRIMARY KEY,
    gmail NVARCHAR(200) NOT NULL,
    full_name NVARCHAR(100),
    [pass_word] NVARCHAR(200) NOT NULL,
    dob DATE,
    sex BIT,
    [address] NVARCHAR(200),
    phone NVARCHAR(100),
    avatar NVARCHAR(250),
    role_id INT FOREIGN KEY REFERENCES Roles(role_id),
    status_id INT FOREIGN KEY REFERENCES AccountStatuses(status_id)
);
GO
CREATE TABLE NoteAccount(
    [user_name] NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
    PRIMARY KEY ([user_name]),
	note NVARCHAR(Max)
);
GO
-- Create Mentees table
CREATE TABLE Mentees(
    mentee_name NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
    PRIMARY KEY (mentee_name)
);
GO

-- Create Mentors table
CREATE TABLE Mentors(
    mentor_name NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
    rate INT,
    PRIMARY KEY (mentor_name)
);
GO

-- Create Managers table
CREATE TABLE Managers(
    manager_name NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
    PRIMARY KEY (manager_name)
);
GO

-- Create Skills table
CREATE TABLE Skills(
    skill_id INT IDENTITY(1,1) PRIMARY KEY,
    skill_name NVARCHAR(200) NOT NULL,
    img NVARCHAR(300),
    [description] NVARCHAR(MAX),
    [status] BIT
);
GO

CREATE TABLE CVStatus(
	status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name NVARCHAR(100)
);
GO
-- Create CV table
CREATE TABLE CV(
    cv_id INT IDENTITY(1,1) PRIMARY KEY,
    mentor_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
    gmail NVARCHAR(200) NOT NULL,
    full_name NVARCHAR(100),
    dob DATE,
    sex BIT,
    [address] NVARCHAR(200),
    profession NVARCHAR(200),
    profession_intro NVARCHAR(MAX),
    achievement_description NVARCHAR(MAX),
    service_description NVARCHAR(MAX),
    avatar NVARCHAR(250),
	status_id INT FOREIGN KEY REFERENCES CVStatus(status_id),
	note NVARCHAR(Max)
);
GO

-- Create CVSkills table
CREATE TABLE CVSkills(
    skill_id INT FOREIGN KEY REFERENCES Skills(skill_id),
    cv_id INT FOREIGN KEY REFERENCES CV(cv_id),
    PRIMARY KEY (cv_id, skill_id)
);

GO

-- Create Slots table
CREATE TABLE Slots(
    slot_id NVARCHAR(50) PRIMARY KEY,
    slot_name NVARCHAR(100)
);
GO

-- Create Cycle table
CREATE TABLE Cycle(
    cycle_id INT IDENTITY(1,1) PRIMARY KEY,
	start_time DATE,
	end_time DATE,
	note NVARCHAR(Max),
	mentor_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
	deadline_date DATE,
	unique(start_time, end_time,mentor_name)
);
GO

-- Create Status_Selected table
CREATE TABLE Status_Selected(
	status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name NVARCHAR(50)
);
GO

-- Create Selected_Slot table
CREATE TABLE Selected_Slot(
    selected_id INT IDENTITY(1,1) PRIMARY KEY,
    slot_id NVARCHAR(50) FOREIGN KEY REFERENCES Slots(slot_id),
    cycle_id INT FOREIGN KEY REFERENCES Cycle(cycle_id),
	day_of_slot DATE,
    status_id INT FOREIGN KEY REFERENCES Status_Selected(status_id),
);
GO


-- Create RequestStatuses table
CREATE TABLE RequestStatuses(
    status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name NVARCHAR(100)
);
GO

-- Create RequestsFormMentee table
CREATE TABLE RequestsFormMentee(
    request_id INT IDENTITY(1,1) PRIMARY KEY,
    mentor_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
    mentee_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentees(mentee_name),
    deadline_date DATE,
    deadline_hour TIME,
    title NVARCHAR(1000),
    [description] NVARCHAR(MAX),
    status_id INT FOREIGN KEY REFERENCES RequestStatuses(status_id),
	price INT,
	note NVARCHAR(1000)
);
GO 
CREATE TABLE RquestSelectedSlot(
	request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
	selected_id INT FOREIGN KEY REFERENCES Selected_Slot(selected_id),
	PRIMARY KEY (request_id, selected_id)
);

GO

-- Create RequestSkills table
CREATE TABLE RequestSkills(
    skill_id INT FOREIGN KEY REFERENCES Skills(skill_id),
    request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
    PRIMARY KEY (skill_id, request_id)
);
GO
-- Create FeedBacks table
CREATE TABLE FeedBacks(
	feedback_id INT IDENTITY(1,1) PRIMARY KEY,
	request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
    mentor_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
    mentee_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentees(mentee_name),
    star INT,
    comment NVARCHAR(Max),
    time_feedback DATE,
);
GO
CREATE TABLE Wallet(
	wallet_id NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	real_balance DECIMAL(15, 0),
	hold DECIMAL(15, 0),
	PRIMARY KEY (wallet_id)
);

GO
CREATE TABLE Hold(
	hold_id INT IDENTITY(1,1) PRIMARY KEY,
	[user_name] NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
	amount DECIMAL(15, 0),
	create_date DATETIME,
	[message] NVARCHAR(Max),
	hold bit
)
GO
CREATE TABLE Transactions(
	transaction_id INT IDENTITY(1,1) PRIMARY KEY,
	user_send NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	user_receive NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	create_date DATETIME,
	amount DECIMAL(15, 0),
	[message] NVARCHAR(Max)
);
GO
CREATE TABLE Attendance (
    attendance_id INT IDENTITY(1,1) PRIMARY KEY,
    request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
    selected_id INT FOREIGN KEY REFERENCES Selected_Slot(selected_id),
    mentee_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentees(mentee_name),
    attendance_status VARCHAR(50),
    attendance_date DATETIME DEFAULT GETDATE()
);
GO
CREATE TABLE Blogs (
	blog_id INT IDENTITY(1,1) PRIMARY KEY,
    img NVARCHAR(500),
	link NVARCHAR(500),
	[status] bit
);

GO
-- Insert into AccountStatuses
USE [HappyProgrammingDB]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (1, N'Mentee')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (2, N'Mentor')
INSERT [dbo].[Roles] ([role_id], [role_name]) VALUES (3, N'Manager')
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[AccountStatuses] ON 

INSERT [dbo].[AccountStatuses] ([status_id], [status_name]) VALUES (1, N'Active')
INSERT [dbo].[AccountStatuses] ([status_id], [status_name]) VALUES (2, N'Inactive')
INSERT [dbo].[AccountStatuses] ([status_id], [status_name]) VALUES (3, N'Pending')
SET IDENTITY_INSERT [dbo].[AccountStatuses] OFF
GO
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'alexander_thomas', N'alexander.thomas@gmail.com', N'Alexander Thomas', N'1', CAST(N'1992-11-11' AS Date), 1, N'258 Willow St', N'0334567890', N'mentor1.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'amelia_hall', N'amelia.hall@gmail.com', N'Amelia Hall', N'1', CAST(N'1993-06-18' AS Date), 0, N'123 Sequoia St', N'0901234567', N'mentor8.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'ava_taylor', N'ava.taylor@gmail.com', N'Ava Taylor', N'1', CAST(N'1990-10-10' AS Date), 0, N'147 Aspen St', N'0923456789', N'mentee10.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'benjamin_anderson', N'benjamin.anderson@gmail.com', N'Benjamin Anderson', N'1', CAST(N'1985-09-09' AS Date), 1, N'369 Redwood St', N'0912345678', N'mentee9.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'charlotte_lewis', N'charlotte.lewis@gmail.com', N'Charlotte Lewis', N'1', CAST(N'1990-04-16' AS Date), 0, N'456 Chestnut St', N'0889012345', N'mentor6.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'daniel_white', N'daniel.white@gmail.com', N'Daniel White', N'1', CAST(N'1991-01-13' AS Date), 1, N'456 Fir St', N'0956789012', N'mentor3.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'ella_young', N'ella.young@gmail.com', N'Ella Young', N'1', CAST(N'1991-08-20' AS Date), 0, N'789 Hickory St', N'0923456789', N'mentor10.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'emily_davis', N'emily.davis@gmail.com', N'Emily Davis', N'1', CAST(N'1991-04-04' AS Date), 0, N'321 Maple St', N'0867890123', N'mentee4.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'hieu', N'hieuvqhe173211@fpt.edu.vn', N'Vu Quang Hieu', N'1', CAST(N'1991-02-02' AS Date), 0, N'456 Elm St', N'0987654321', N'mentee2.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'isabella_baker', N'isabella.baker@gmail.com', N'Isabella Baker', N'1', CAST(N'1991-02-26' AS Date), 0, N'369 Ash St', N'0989012345', N'mentor15.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'isabella_harris', N'isabella.harris@gmail.com', N'Isabella Harris', N'1', CAST(N'1987-02-14' AS Date), 0, N'789 Walnut St', N'0967890123', N'mentor4.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'james_wilson', N'james.wilson@gmail.com', N'James Wilson', N'1', CAST(N'1986-07-07' AS Date), 1, N'147 Spruce St', N'0990123456', N'mentee7.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'jayden_allen', N'jayden.allen@gmail.com', N'Jayden Allen', N'1', CAST(N'1989-07-19' AS Date), 1, N'456 Hemlock St', N'0912345678', N'mentor9.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'logan_hernandez', N'logan.hernandez@gmail.com', N'Logan Hernandez', N'1', CAST(N'1990-09-21' AS Date), 1, N'147 Linden St', N'0934567890', N'mentor11.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'lucas_walker', N'lucas.walker@gmail.com', N'Lucas Walker', N'1', CAST(N'1988-05-17' AS Date), 1, N'789 Palm St', N'0890123456', N'mentor7.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'manager', N'manager@fpt.edu.vn', N'Manager', N'1', CAST(N'2002-03-03' AS Date), 1, N'456 HN St', N'0977331888', N'manager.jpg', 3, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'mason_scott', N'mason.scott@gmail.com', N'Mason Scott', N'1', CAST(N'1987-11-23' AS Date), 1, N'369 Magnolia St', N'0956789012', N'mentor13.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'matthew_clark', N'matthew.clark@gmail.com', N'Matthew Clark', N'1', CAST(N'1985-03-15' AS Date), 1, N'123 Cypress St', N'0878901234', N'mentor5.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'mia_green', N'mia.green@gmail.com', N'Mia Green', N'1', CAST(N'1988-12-24' AS Date), 0, N'147 Dogwood St', N'0867890123', N'mentor14.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'mia_moore', N'mia.moore@gmail.com', N'Mia Moore', N'1', CAST(N'1988-12-12' AS Date), 0, N'369 Poplar St', N'0345678901', N'mentor2.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'michael_jones', N'michael.jones@gmail.com', N'Michael Jones', N'1', CAST(N'1988-03-03' AS Date), 1, N'789 Oak St', N'0356789012', N'mentee3.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'minh', N'minhvqhe176726@fpt.edu.vn', N'Vu Quang Minh', N'1', CAST(N'1992-03-03' AS Date), 1, N'789 Oak St', N'0912223333', N'mentor16.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'olivia_johnson', N'olivia.johnson@gmail.com', N'Olivia Johnson', N'1', CAST(N'1993-06-06' AS Date), 0, N'987 Cedar St', N'0989012345', N'mentee6.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'son', N'sonph@fpt.edu.vn', N'Pham Hung Son', N'1', CAST(N'2003-03-03' AS Date), 1, N'456 HN St', N'0977933888', N'mentor17.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'sophia_king', N'sophia.king@gmail.com', N'Sophia King', N'1', CAST(N'1992-10-22' AS Date), 0, N'258 Juniper St', N'0945678901', N'mentor12.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'sophia_martinez', N'sophia.martinez@gmail.com', N'Sophia Martinez', N'1', CAST(N'1994-08-08' AS Date), 0, N'258 Birch St', N'0901234567', N'mentee8.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'truong', N'truongtnhe170291@fpt.edu.vn', N'Tran Nam Truong', N'1', CAST(N'1990-01-01' AS Date), 1, N'123 Main St', N'0867113858', N'mentee1.jpg', 1, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'VuMinh', N'quantahe170755@fpt.edu.vn', N'Vu Minh', N'1', CAST(N'2004-06-25' AS Date), 1, N'HN', N'0979781768', N'defaultAcount.jpg', 2, 1)
INSERT [dbo].[Accounts] ([user_name], [gmail], [full_name], [pass_word], [dob], [sex], [address], [phone], [avatar], [role_id], [status_id]) VALUES (N'william_brown', N'william.brown@gmail.com', N'William Brown', N'1', CAST(N'1987-05-05' AS Date), 1, N'654 Pine St', N'0978901234', N'mentee5.jpg', 1, 1)
GO
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'ava_taylor')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'benjamin_anderson')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'emily_davis')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'hieu')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'james_wilson')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'michael_jones')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'olivia_johnson')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'sophia_martinez')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'truong')
INSERT [dbo].[Mentees] ([mentee_name]) VALUES (N'william_brown')
GO
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'alexander_thomas', 150000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'amelia_hall', 200000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'charlotte_lewis', 100000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'daniel_white', 200000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'ella_young', 150000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'isabella_baker', 100000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'isabella_harris', 200000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'jayden_allen', 150000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'logan_hernandez', 150000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'lucas_walker', 200000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'mason_scott', 100000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'matthew_clark', 200000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'mia_green', 100000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'mia_moore', 200000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'minh', 100000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'son', 100000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'sophia_king', 100000)
INSERT [dbo].[Mentors] ([mentor_name], [rate]) VALUES (N'VuMinh', 100000)
GO
INSERT [dbo].[Managers] ([manager_name]) VALUES (N'manager')
GO
SET IDENTITY_INSERT [dbo].[CVStatus] ON 

INSERT [dbo].[CVStatus] ([status_id], [status_name]) VALUES (1, N'Pending')
INSERT [dbo].[CVStatus] ([status_id], [status_name]) VALUES (2, N'Approved')
INSERT [dbo].[CVStatus] ([status_id], [status_name]) VALUES (3, N'Rejected')
INSERT [dbo].[CVStatus] ([status_id], [status_name]) VALUES (4, N'Draft')
SET IDENTITY_INSERT [dbo].[CVStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[CV] ON 

INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (1, N'minh', N'minhvqhe176726@fpt.edu.vn', N'John Doe', CAST(N'1985-01-15' AS Date), 1, N'123 Main St', N'Software Engineer', N'Experienced in Java and Python', N'Created a successful app', N'Offering software development services', N'mentor16.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (2, N'son', N'example2@gmail.com', N'Jane Smith', CAST(N'1990-02-20' AS Date), 0, N'456 Elm St', N'Graphic Designer', N'Expert in Adobe Suite', N'Designed award-winning logos', N'Providing graphic design services', N'mentor17.jpg', 2, N'Everything is ok')
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (3, N'alexander_thomas', N'alexander.thomas@gmail.com', N'Alexander Thomas', CAST(N'1992-11-11' AS Date), 1, N'258 Willow St', N'Software Engineer', N'Experienced software engineer with a strong background in developing scalable web applications and working with cross-functional teams.', N'Led the development of a high-traffic web application that improved the company’s user engagement by 20%.', N'Offers consulting services in software development and optimization.', N'mentor1.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (4, N'mia_moore', N'mia.moore@gmail.com', N'Mia Moore', CAST(N'1988-12-12' AS Date), 0, N'369 Poplar St', N'Graphic Designer', N'Creative graphic designer with over 10 years of experience in creating visual concepts that inspire, inform, and captivate consumers.', N'Designed a series of advertisements that increased client sales by 15%.', N'Provides freelance graphic design services, including branding and advertisement.', N'mentor2.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (5, N'daniel_white', N'daniel.white@gmail.com', N'Daniel White', CAST(N'1991-01-13' AS Date), 1, N'456 Fir St', N'Marketing Specialist', N'Results-driven marketing specialist with expertise in digital marketing strategies and campaign management.', N'Managed a marketing campaign that generated a 30% increase in lead generation.', N'Specializes in digital marketing consultation and campaign strategy.', N'mentor3.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (6, N'isabella_harris', N'isabella.harris@gmail.com', N'Isabella Harris', CAST(N'1987-02-14' AS Date), 0, N'789 Walnut St', N'Project Manager', N'Detail-oriented project manager with a proven track record in leading projects from inception to completion.', N'Successfully managed a project portfolio worth over $2 million, ensuring on-time and on-budget delivery.', N'Offers project management services, including project planning and risk management.', N'mentor4.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (7, N'matthew_clark', N'matthew.clark@gmail.com', N'Matthew Clark', CAST(N'1985-03-15' AS Date), 1, N'123 Cypress St', N'Financial Analyst', N'Analytical financial analyst with a strong background in financial modeling and investment analysis.', N'Developed financial models that improved forecasting accuracy by 25%.', N'Provides financial analysis and investment advisory services.', N'mentor5.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (8, N'charlotte_lewis', N'charlotte.lewis@gmail.com', N'Charlotte Lewis', CAST(N'1990-04-16' AS Date), 0, N'456 Chestnut St', N'Human Resources Manager', N'Dedicated HR manager with extensive experience in employee relations, talent acquisition, and HR policy development.', N'Implemented HR strategies that reduced employee turnover by 10%.', N'Specializes in HR consulting, including employee training and policy formulation.', N'mentor6.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (9, N'lucas_walker', N'lucas.walker@gmail.com', N'Lucas Walker', CAST(N'1988-05-17' AS Date), 1, N'789 Palm St', N'Data Scientist', N'Innovative data scientist with a passion for turning data into actionable insights.', N'Developed machine learning models that increased prediction accuracy by 40%.', N'Offers data science consulting services, including predictive modeling and data visualization.', N'mentor7.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (10, N'amelia_hall', N'amelia.hall@gmail.com', N'Amelia Hall', CAST(N'1993-06-18' AS Date), 0, N'123 Sequoia St', N'Content Writer', N'Versatile content writer with a knack for creating engaging and informative content for various industries.', N'Authored articles that boosted website traffic by 50%.', N'Provides freelance writing services, including blog posts, articles, and SEO content.', N'mentor8.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (11, N'jayden_allen', N'jayden.allen@gmail.com', N'Jayden Allen', CAST(N'1989-07-19' AS Date), 1, N'456 Hemlock St', N'Network Engineer', N'Skilled network engineer with experience in designing and maintaining network infrastructure.', N'Implemented network solutions that improved system uptime by 15%.', N'Offers network engineering services, including network design and troubleshooting.', N'mentor9.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (12, N'ella_young', N'ella.young@gmail.com', N'Ella Young', CAST(N'1991-08-20' AS Date), 0, N'789 Hickory St', N'UX/UI Designer', N'Creative UX/UI designer focused on enhancing user experience and interface design.', N'Designed user interfaces that enhanced user satisfaction by 25%.', N'Provides UX/UI design services, including user research and interface design.', N'mentor10.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (13, N'logan_hernandez', N'logan.hernandez@gmail.com', N'Logan Hernandez', CAST(N'1990-09-21' AS Date), 1, N'147 Linden St', N'Cybersecurity Specialist', N'Experienced cybersecurity specialist with expertise in securing network infrastructure and data protection.', N'Developed security protocols that reduced security breaches by 20%.', N'Specializes in cybersecurity consulting, including vulnerability assessments and security training.', N'mentor11.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (14, N'sophia_king', N'sophia.king@gmail.com', N'Sophia King', CAST(N'1992-10-22' AS Date), 0, N'258 Juniper St', N'Operations Manager', N'Efficient operations manager with a strong background in optimizing business processes and operational efficiency.', N'Streamlined operations that improved process efficiency by 30%.', N'Offers operations management consulting, including process improvement and supply chain management.', N'mentor12.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (15, N'mason_scott', N'mason.scott@gmail.com', N'Mason Scott', CAST(N'1987-11-23' AS Date), 1, N'369 Magnolia St', N'Business Analyst', N'Strategic business analyst with a talent for analyzing business processes and identifying improvement opportunities.', N'Developed business solutions that increased operational efficiency by 20%.', N'Provides business analysis services, including process mapping and requirements gathering.', N'mentor13.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (16, N'mia_green', N'mia.green@gmail.com', N'Mia Green', CAST(N'1988-12-24' AS Date), 0, N'147 Dogwood St', N'Customer Service Manager', N'Dedicated customer service manager with a focus on enhancing customer satisfaction and retention.', N'Implemented customer service strategies that increased customer satisfaction by 15%.', N'Specializes in customer service consulting, including training and strategy development.', N'mentor14.jpg', 2, NULL)
INSERT [dbo].[CV] ([cv_id], [mentor_name], [gmail], [full_name], [dob], [sex], [address], [profession], [profession_intro], [achievement_description], [service_description], [avatar], [status_id], [note]) VALUES (17, N'isabella_baker', N'isabella.baker@gmail.com', N'Isabella Baker', CAST(N'1991-02-26' AS Date), 0, N'369 Ash St', N'Public Relations Specialist', N'Creative public relations specialist with experience in managing media relations and crafting communication strategies.', N'Executed PR campaigns that enhanced brand reputation by 20%.', N'Offers public relations consulting, including media outreach and communication strategy development.', N'mentor15.jpg', 2, NULL)
SET IDENTITY_INSERT [dbo].[CV] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 

INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (1, N'Web Development', N'web.jpg', N'Web development involves creating websites and web applications that are accessible via the internet or an intranet. It encompasses several key components and technologies:

Front-end Development: This involves creating the user interface and user experience (UI/UX) of a website. It typically uses languages like HTML (Hypertext Markup Language), CSS (Cascading Style Sheets), and JavaScript. Frameworks like React, Angular, and Vue.js are commonly used to streamline front-end development.

Back-end Development: This focuses on server-side logic and interactions, managing databases, and ensuring the smooth functioning of web applications. Popular back-end languages include JavaScript (Node.js), Python (Django, Flask), Ruby (Ruby on Rails), PHP, and Java.

Database Management: Websites often require data storage and retrieval. Common databases used in web development include MySQL, PostgreSQL, MongoDB (NoSQL), and SQLite.

Full-Stack Development: Full-stack developers work on both the front-end and back-end aspects of a website or application. They are proficient in both server-side and client-side programming and understand how to integrate these components to create a cohesive web experience.

Web Servers and Deployment: Websites need to be hosted on web servers for users to access them. Technologies like Apache, Nginx, and Microsoft IIS are used to serve web pages. Deployment involves configuring servers, managing domain names, and ensuring security (e.g., HTTPS).

Responsive Design and Accessibility: With the increasing diversity of devices accessing the web, responsive design ensures websites look and function well on various screen sizes and devices. Accessibility ensures that websites are usable by people with disabilities, adhering to standards like WCAG (Web Content Accessibility Guidelines).

Security: Web developers must consider security aspects such as protecting against vulnerabilities like SQL injection, cross-site scripting (XSS), and ensuring data privacy and user authentication.

Web APIs: APIs (Application Programming Interfaces) allow different software applications to communicate and interact. They are crucial for integrating third-party services, accessing databases, and enabling functionalities like payment processing or social media logins.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (2, N'CSS', N'CSS.jpg', N'CSS (Cascading Style Sheets) is a stylesheet language used to define the presentation and styling of HTML elements on a web page. It allows web developers to control the appearance of their web pages, including layout, colors, fonts, spacing, and more.

Key aspects of CSS include:

Selectors: CSS selectors are patterns used to select and style elements in HTML documents. Selectors can target elements based on their type (p, h1, div), class (.classname), ID (#idname), attributes, relationships between elements, and more.

Properties and Values: CSS properties define what aspects of an element''s style will be changed, such as color, font-size, margin, padding, background-color, border, etc. Each property has a corresponding value that specifies how the property should be applied.

Cascade and Specificity: The "Cascading" in CSS refers to the way styles are applied from multiple sources (author, user, browser defaults) and how conflicts are resolved based on specificity and the order of rules. Specificity determines which styles take precedence when multiple rules apply to the same element.

Units: CSS supports various units for specifying lengths and sizes, such as pixels (px), percentages (%), ems (em), rems (rem), viewport units (vw, vh), etc. These units help make designs responsive and adaptable to different screen sizes and devices.

Box Model: The CSS box model describes how elements are structured and sized, including content area, padding, border, and margin. Understanding the box model is crucial for controlling spacing and layout.

Flexbox and Grid: CSS includes layout models like Flexbox and Grid Layout that provide powerful tools for creating responsive and complex layouts with ease. Flexbox is designed for one-dimensional layouts (rows or columns), while Grid Layout allows for two-dimensional layouts.

Media Queries: Media queries in CSS enable developers to apply different styles based on the characteristics of the device or viewport, such as screen width, height, orientation, or resolution. This is essential for creating responsive designs that adapt to different devices and screen sizes.

CSS Preprocessors: CSS preprocessors like Sass and LESS extend the capabilities of CSS by adding features like variables, nesting, mixins, and functions. They help streamline CSS development and make stylesheets more maintainable and reusable.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (3, N'Python', N'python.jfif', N'Python is a versatile programming language known for its simple syntax, readability, and ease of learning. Here are some key features and applications of Python:

Features of Python:
1. Readable and Easy to Learn: Python has a simple and clear syntax, making it popular among beginners and experienced programmers alike.
2. Cross-Platform: Python runs on various operating systems such as Windows, macOS, and Linux.
3. Interpreted Language: Python is an interpreted language, meaning the source code is executed directly without prior compilation.
4. Multi-Paradigm: Python supports multiple programming paradigms, including object-oriented, functional, and procedural programming.
5. Rich Library Ecosystem: Python boasts a rich ecosystem of libraries and frameworks like NumPy, Pandas, Matplotlib, Django, and Flask.

Applications of Python:
1. Web Development: Python is widely used in web development with frameworks like Django and Flask.
2. Data Science and Machine Learning: Python is a popular language in data science and machine learning with libraries such as TensorFlow, PyTorch, Scikit-Learn, and Pandas.
3. Automation and Scripting: Python is often used for automating tasks and writing scripts for daily operations.
4. Game Development: Python has libraries like Pygame for game development.
5. Desktop Applications: Python can be used to develop desktop applications with libraries like Tkinter and PyQt.
6. Embedded Software Development: Python is also used in embedded software projects, such as those involving Raspberry Pi.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (4, N'C', N'CC.jpg', N'C is a powerful and efficient programming language that has been widely used for system programming, developing operating systems, and creating software that requires high performance. Here are some key features and applications of C:

Features of C:
Low-Level Access: C provides low-level access to memory through pointers, making it suitable for system-level programming.
Portability: C code can be compiled and run on various types of computers with minimal changes, making it highly portable.
Efficiency: C is known for its efficiency and performance, which is why it is often used in performance-critical applications.
Modularity: C supports modular programming, allowing large programs to be divided into smaller, manageable functions.
Rich Library Support: C has a standard library with a wide range of built-in functions for handling common tasks such as I/O operations, string manipulation, and mathematical computations.

Applications of C:
Operating Systems: Many operating systems, including Unix and Linux, are written in C due to its efficiency and control over system resources.
Embedded Systems: C is widely used in embedded systems for programming microcontrollers and developing firmware.
System Software: C is used to develop system software such as compilers, interpreters, and device drivers.
Game Development: C is often used in game development for its performance and control over hardware.
Database Systems: Many database management systems are developed in C to take advantage of its speed and efficiency.
Utilities and Tools: Various utilities and development tools, such as text editors and network utilities, are written in C.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (5, N'C++', N'C++.jpg', N'C++ is a versatile and powerful programming language that builds on the foundation of C, adding support for object-oriented programming and other modern programming paradigms. Here are some key features and applications of C++:

Features of C++:
Object-Oriented Programming: C++ introduces object-oriented programming (OOP) concepts such as classes, inheritance, polymorphism, and encapsulation, enabling more structured and modular code.
Standard Template Library (STL): C++ includes the Standard Template Library, which provides a set of common data structures (like vectors, lists, and maps) and algorithms (like sort and search).
Compatibility with C: C++ is backward compatible with C, meaning C code can be compiled using a C++ compiler, allowing developers to leverage existing C libraries and applications.
Low-Level Manipulation: Like C, C++ allows low-level memory manipulation through pointers, giving developers control over system resources.
High Performance: C++ is known for its performance and efficiency, making it suitable for applications that require high computational power.
Multi-Paradigm: C++ supports multiple programming paradigms, including procedural, object-oriented, and generic programming.

Applications of C++:
System Software: C++ is widely used for developing system software such as operating systems, device drivers, and embedded systems.
Game Development: Many high-performance games and game engines (like Unreal Engine) are developed in C++ due to its speed and control over hardware.
Application Software: C++ is used for developing a wide range of application software, including desktop applications, GUI-based applications, and more.
Real-Time Systems: C++ is used in real-time systems where timely and predictable responses are critical.
Financial Systems: C++ is employed in developing high-frequency trading platforms and other financial systems requiring quick data processing.
Scientific Computing: C++ is used in scientific computing and simulations that require high performance and precise calculations.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (6, N'Java', N'java.jpg', N'Java is a powerful and versatile programming language developed by Sun Microsystems (now owned by Oracle). It is one of the most widely used languages globally, known for its platform independence and extensive use in applications ranging from desktop software to complex enterprise systems. Below are some key features and applications of Java:

Features of Java:
Platform Independence: Java follows the principle of "Write Once, Run Anywhere" (WORA), where Java code is compiled into bytecode that can run on any platform supporting Java Virtual Machine (JVM).
Object-Oriented: Java is an object-oriented programming language, supporting concepts like classes, objects, inheritance, polymorphism, and encapsulation.
Security: Java has a robust security model with built-in mechanisms for access control to classes, packages, and objects.
Rich Standard Library: Java comes with a rich set of libraries and APIs that facilitate rapid development of applications.
Multithreading: Java supports multithreading, allowing concurrent execution of multiple threads for optimizing performance.

Applications of Java:
Web Application Development: Java is widely used in web development with frameworks like Spring, Hibernate, and Struts.
Mobile Application Development: Java is used for developing Android applications using Android SDK.
Desktop Application Development: Java is used for developing desktop applications, ranging from small utilities to large-scale applications.
Embedded Systems: Java is used in embedded systems development for devices such as printers and control systems.
Server-side Applications: Java is a preferred choice for developing server-side applications, including database management systems and web services.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (7, N'C#', N'Csharp.png', N'C# (pronounced as "C sharp") is a modern and versatile programming language developed by Microsoft. It is designed for building a wide range of applications on the .NET framework. Here are some key features and applications of C#:

Features of C#:
Simple and Modern Syntax: C# has a clean and easy-to-understand syntax, making it approachable for developers familiar with C-like languages.
Object-Oriented Programming: C# supports object-oriented programming (OOP) concepts such as classes, inheritance, polymorphism, and encapsulation.
Type Safety: C# is a statically typed language, providing type safety at compile time to catch errors early.
Memory Management: C# uses automatic memory management through garbage collection, reducing the burden of manual memory management.
Language Integration: C# integrates well with other .NET languages and libraries, facilitating interoperability and code reuse.
Asynchronous Programming: C# includes language features like async/await for asynchronous programming, making it easier to write responsive applications.

Applications of C#:
Windows Applications: C# is used for developing desktop applications on the Windows platform using technologies like Windows Forms (WinForms) and Windows Presentation Foundation (WPF).
Web Development: C# is used in web development with ASP.NET, providing frameworks like ASP.NET MVC and ASP.NET Core for building web applications and APIs.
Mobile Development: C# is used for cross-platform mobile app development using Xamarin, which allows sharing code across iOS, Android, and Windows platforms.
Game Development: C# is widely used in game development with Unity, a popular game engine that supports C# scripting for developing games and interactive experiences.
Enterprise Applications: C# is commonly used in enterprise software development, including large-scale business applications, financial systems, and data-driven applications.
Cloud Services: C# is used for developing cloud-based applications and services on platforms like Microsoft Azure.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (8, N'JavaScript', N'javaScript.png', N'JavaScript is a versatile and widely-used programming language primarily known for its role in web development. Originally developed by Netscape, it has evolved into a fundamental technology for building interactive and dynamic web pages. Here are some key features and applications of JavaScript:

Features of JavaScript:
Client-Side Scripting: JavaScript is primarily used as a client-side scripting language in web browsers, allowing developers to manipulate the content and behavior of web pages dynamically.
Object-Based: JavaScript is based on a prototype-based object model rather than the classical object-oriented model used in languages like Java or C++.
Event-Driven: JavaScript is event-driven, meaning it can respond to user actions (like clicks and keystrokes) and execute appropriate code in response.
Asynchronous Programming: JavaScript supports asynchronous programming with features like callbacks, promises, and async/await, making it suitable for handling tasks that require non-blocking operations.
Cross-Platform: JavaScript is supported by all modern web browsers, making it a cross-platform language for client-side scripting.

Server-Side Development: With platforms like Node.js, JavaScript can also be used for server-side development, allowing developers to build scalable and efficient server applications.

Applications of JavaScript:
Web Development: JavaScript is extensively used for front-end development to create interactive user interfaces and enhance user experience on websites.
Single Page Applications (SPAs): JavaScript frameworks and libraries like React, Angular, and Vue.js are used to build SPAs that provide seamless navigation and responsiveness.
Server-Side Development: JavaScript can be used with Node.js to build server-side applications, APIs, and microservices.
Mobile App Development: JavaScript frameworks like React Native and Ionic allow developers to build cross-platform mobile applications using JavaScript and native components.
Game Development: JavaScript, along with HTML5 and WebGL, is used for browser-based game development.
Desktop Applications: With frameworks like Electron, JavaScript can be used to develop desktop applications for Windows, macOS, and Linux.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (9, N'Ruby', N'Ruby.jpg', N'Ruby is a dynamic, reflective, object-oriented programming language known for its simplicity and productivity. Developed in the mid-1990s by Yukihiro Matsumoto ("Matz"), Ruby has gained popularity for its elegant syntax and focus on developer happiness. Here are some key features and applications of Ruby:

Features of Ruby:
Simple and Elegant Syntax: Ruby has a clean and readable syntax that focuses on human-friendly code, often described as "syntactic sugar" for its expressive nature.
Object-Oriented: Everything in Ruby is an object, including primitive data types. It supports object-oriented programming principles such as classes, inheritance, and encapsulation.
Dynamic Typing: Ruby is dynamically typed, meaning type checking is done at runtime, providing flexibility and reducing boilerplate code.
Metaprogramming: Ruby allows for powerful metaprogramming capabilities, enabling developers to write code that can modify its own structure and behavior at runtime.
Gems and Libraries: RubyGems, the package manager for Ruby, hosts a vast ecosystem of libraries and frameworks (gems) that extend Ruby''s functionality for various purposes.
Ruby on Rails: Ruby is the primary language for Ruby on Rails, a popular web application framework that emphasizes convention over configuration and follows the MVC (Model-View-Controller) pattern.

Applications of Ruby:
Web Development: Ruby on Rails (RoR) is widely used for building robust and scalable web applications. It powers websites like GitHub, Airbnb, and Shopify.
Prototyping and MVPs: Ruby''s focus on developer productivity makes it ideal for quickly prototyping ideas and building Minimum Viable Products (MVPs) to validate concepts.
Automation and Scripting: Ruby is used for scripting and automation tasks, thanks to its concise syntax and powerful string manipulation capabilities.
Testing: Ruby''s testing frameworks like RSpec and Capybara are popular choices for writing automated tests and behavior-driven development (BDD).
Data Analysis and Visualization: Ruby libraries such as SciRuby and Gnuplot provide tools for scientific computing, data analysis, and visualization.
Game Development: While less common than in other domains, Ruby has been used for game development through frameworks like Gosu.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (10, N'PHP', N'php.png', N'PHP (Hypertext Preprocessor) is a widely-used open-source scripting language designed for web development. Originally created by Rasmus Lerdorf in 1994, PHP has evolved into a powerful server-side scripting language. Here are some key features and applications of PHP:

Features of PHP:
Server-Side Scripting: PHP is primarily used for server-side scripting, generating dynamic web pages and interacting with databases.
Simplicity: PHP syntax is easy to learn and straightforward, especially for developers familiar with C-like languages.
Integration: PHP integrates seamlessly with HTML, allowing developers to embed PHP code directly within HTML pages for dynamic content generation.
Database Support: PHP has built-in support for a wide range of databases, including MySQL, PostgreSQL, SQLite, and more, making it suitable for developing database-driven web applications.
Extensibility: PHP supports a large number of extensions and libraries (PECL and PEAR), enabling developers to extend its core functionality for various purposes.
Frameworks: PHP has popular frameworks like Laravel, Symfony, and CodeIgniter that facilitate rapid development and follow modern design patterns like MVC (Model-View-Controller).

Applications of PHP:
Web Development: PHP is widely used for building dynamic websites and web applications. It powers platforms like WordPress, Drupal, and Joomla.
E-commerce Platforms: Many e-commerce platforms, such as Magento and WooCommerce, are built using PHP due to its flexibility and robustness.
Content Management Systems (CMS): PHP is the backbone of numerous content management systems, providing features for content creation, management, and publishing.
Server-Side Scripting: PHP handles server-side tasks such as file processing, session management, and authentication, essential for web applications.
Command-Line Scripting: PHP can be used for command-line scripting to automate tasks and perform administrative functions on servers.
API Development: PHP is used for developing APIs (Application Programming Interfaces) to facilitate communication between different software systems.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (11, N'SQL', N'sql.jpg', N'SQL (Structured Query Language) is a standard language for managing and manipulating relational databases. It is essential for storing, querying, and managing data in databases. Here are some key features and aspects of SQL:

Features of SQL:
Data Definition Language (DDL): SQL includes commands for defining and modifying database structures, such as creating tables (CREATE TABLE), altering tables (ALTER TABLE), and dropping tables (DROP TABLE).
Data Manipulation Language (DML): SQL provides commands for manipulating data within tables, such as inserting data (INSERT INTO), retrieving data (SELECT), updating data (UPDATE), and deleting data (DELETE FROM).
Data Control Language (DCL): SQL includes commands for managing access to data within the database, such as granting privileges (GRANT) and revoking privileges (REVOKE).
Transaction Control: SQL supports transaction management with commands like COMMIT (to save changes) and ROLLBACK (to undo changes) to maintain data integrity.
Joins and Relationships: SQL allows for querying data from multiple tables using joins (INNER JOIN, LEFT JOIN, RIGHT JOIN, etc.) and defining relationships between tables through primary keys and foreign keys.
Aggregation Functions: SQL provides built-in functions for performing calculations on groups of rows, such as SUM, AVG, COUNT, MIN, and MAX.

Applications of SQL:
Database Management: SQL is used extensively for managing relational databases like MySQL, PostgreSQL, Oracle Database, SQL Server, and SQLite.
Data Analysis and Reporting: SQL queries are used to extract and analyze data for generating reports and insights from large datasets.
Web Development: SQL is integrated with web applications to store and retrieve data dynamically, supporting backend functionality.
Business Intelligence: SQL is crucial for business intelligence (BI) processes, enabling analysts to perform complex queries and generate actionable insights.
Data Warehousing: SQL is used in data warehousing environments for storing and managing large volumes of historical data.
Data Migration and Integration: SQL is employed in data migration tasks to transfer data between databases and in data integration processes to consolidate data from different sources.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (12, N'Adobe Photoshop', N'photoshop.jpg', N'Adobe Photoshop is a powerful software application used primarily for editing and manipulating digital images. It offers a wide range of tools and features that cater to both professional graphic designers and casual users looking to enhance their photos. Here are some key aspects and capabilities of Adobe Photoshop:

Features of Adobe Photoshop:
Image Editing Tools: Photoshop provides a comprehensive set of tools for editing images, including cropping, resizing, retouching, and adjusting colors and tones.
Layers: One of Photoshop''s most powerful features is its support for layers, allowing users to work on different elements of an image independently and manipulate them non-destructively.
Selections and Masks: Photoshop offers various selection tools (e.g., lasso, magic wand, quick selection) and masking techniques (e.g., layer masks, clipping masks) for precise editing and blending of elements.
Filters and Effects: Photoshop includes a wide range of filters and effects (e.g., blur, sharpen, artistic filters) to apply creative enhancements and transformations to images.
Retouching and Healing: Tools like the clone stamp, healing brush, and content-aware fill enable users to remove imperfections, retouch portraits, and seamlessly fill in missing areas.
Typography: Photoshop allows for advanced text manipulation, including formatting, styling, and applying effects to text layers within images.
3D and Video Editing: While primarily a tool for images, Photoshop also supports limited 3D modeling and editing capabilities, as well as basic video editing functionalities.
Integration and Compatibility: Photoshop integrates seamlessly with other Adobe Creative Cloud applications like Illustrator and InDesign, enabling efficient workflows across different design disciplines.

Applications of Adobe Photoshop:
Graphic Design: Photoshop is widely used in graphic design for creating logos, posters, banners, and marketing materials with precise control over design elements.
Photography: Photographers use Photoshop for retouching and enhancing photos, adjusting colors, correcting exposure, and applying artistic effects.
Web Design: Photoshop is used in web design to create mockups and design elements for websites and user interfaces before development.
Digital Art: Many digital artists use Photoshop for creating illustrations, paintings, and digital artworks using its extensive brush and drawing tools.
Print Design: Photoshop is essential in print design for preparing high-resolution images and layouts for print publications, packaging, and promotional materials.
Multimedia Projects: It is used in multimedia projects for creating visuals and graphics for presentations, interactive content, and multimedia storytelling.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (13, N'Data Analysis', N'DataAnalysis.jpg', N'Data analysis is the process of inspecting, cleansing, transforming, and modeling data with the goal of discovering useful information, informing conclusions, and supporting decision-making. It involves a variety of techniques and methods to extract insights from data, which can range from simple descriptive statistics to complex machine learning algorithms. Here are some key aspects and steps involved in data analysis:

Steps in Data Analysis:
Problem Definition: Clearly define the objectives and questions to be answered through data analysis. Understand the context and scope of the problem or opportunity.
Data Collection: Gather relevant data from various sources, ensuring data quality, completeness, and accuracy. This may involve cleaning and preprocessing data to prepare it for analysis.
Exploratory Data Analysis (EDA): Explore and visualize the data to understand its characteristics, distributions, relationships, and potential patterns. EDA helps in formulating hypotheses and identifying initial insights.
Data Preparation: This involves cleaning data (handling missing values, outliers, etc.), transforming data (e.g., normalization, encoding categorical variables), and selecting relevant features for analysis.
Statistical Analysis: Apply statistical techniques to analyze data, such as hypothesis testing, correlation analysis, regression analysis, and clustering to uncover patterns and relationships.
Machine Learning: Utilize machine learning algorithms for predictive modeling, classification, regression, clustering, and other tasks depending on the nature of the problem and available data.
Data Visualization: Visualize data through charts, graphs, and dashboards to communicate findings effectively and identify trends, outliers, and patterns that may not be apparent in raw data.
Interpretation and Insight Generation: Interpret the results of analysis in the context of the original problem statement. Draw meaningful conclusions, derive insights, and generate actionable recommendations.
Communication and Reporting: Present findings and insights to stakeholders using clear, non-technical language and visualizations. Document the analysis process, methodologies, and assumptions made.

Tools and Technologies for Data Analysis:
Statistical Tools: Software like R, SPSS, and SAS are commonly used for statistical analysis and modeling.
Programming Languages: Languages such as Python and R are popular for data analysis due to their extensive libraries (e.g., Pandas, NumPy, SciPy) and frameworks for machine learning (e.g., scikit-learn, TensorFlow, PyTorch).
Visualization Tools: Tools like Tableau, Power BI, and matplotlib (Python library) are used for creating interactive and insightful data visualizations.
Database Management Systems (DBMS): Systems like SQL Server, MySQL, and PostgreSQL are used for managing and querying large datasets.
Big Data Technologies: Platforms such as Apache Hadoop and Spark are used for processing and analyzing large-scale datasets (big data).

Applications of Data Analysis:
Business Analytics: Analyzing sales data, customer behavior, market trends, and operational efficiency to improve decision-making and strategic planning.
Healthcare and Medical Research: Analyzing patient data, clinical trials, and health outcomes to improve healthcare delivery and develop new treatments.
Financial Analysis: Analyzing financial data, market trends, and investment portfolios to guide investment decisions and risk management.
Marketing and Customer Analytics: Analyzing customer preferences, segmentation, and campaign effectiveness to optimize marketing strategies and improve customer experience.
Operations and Supply Chain Management: Analyzing supply chain data, logistics, and production metrics to optimize operations and reduce costs.
Social Sciences and Public Policy: Analyzing survey data, demographic trends, and public opinion to inform policy-making and social research.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (14, N'PowerShell', N'Shell.jpg', N'Shell is a command-line interface or graphical user interface that allows users to interact with the operating system and applications using command-line commands. Popular types of shells include Bash and PowerShell, each with their own characteristics and applications:

Bash (Bourne Again Shell):
Bash is one of the most popular shells in Unix and Linux-based operating systems. Here are some key features of Bash:

Flexibility and Power: Bash provides powerful features such as variables, loops, conditions, and support for shell scripting to automate tasks.

File and Directory Management: Bash allows users to perform operations on files and directories such as creation, deletion, moving, and renaming.

System Interaction: Bash can call operating system programs and commands, and handle their input and output.

Integration with Linux and Unix: Bash is the default command-line environment on Unix and Linux-based systems.

PowerShell:
PowerShell is a powerful shell and scripting language developed by Microsoft. Here are some key features of PowerShell:

Integrated with Windows: PowerShell is integrated into Windows and is part of the Windows Management Framework.

Object-Oriented Programming: PowerShell supports object-oriented programming, allowing users to interact with system components such as files, registry, services, and user management.

Clear Syntax: PowerShell has a clear and powerful syntax, supporting regular expressions and conditional statements.

Automation and Scripting: PowerShell is widely used for automating system administration tasks and executing scripts.

Support for .NET Framework: PowerShell can utilize libraries and functions from the .NET Framework, extending programming capabilities and integrating with Windows applications.

Usage and Applications of Shell:
System Management: Use shell to manage files, directories, permissions, and processes on the operating system.
Automation: Automate repetitive and complex tasks through shell scripts.
Programming and Development: Use shell as a programming language for developing applications and scripts.
Cloud Management: Use PowerShell to manage and automate cloud computing resources such as Microsoft Azure.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (15, N'Windows Forms', N'Forms.jpg', N'Windows Forms is a part of the .NET Framework, providing a graphical user interface (GUI) programming interface for desktop applications. Here are some key features of Windows Forms:

User Interface Design:
- **Drag and Drop**: Windows Forms provides an easy-to-use development environment with drag-and-drop capabilities to design user interfaces.
- **Integrated Controls**: Includes many built-in controls such as buttons, text boxes, list boxes, and more to build rich user interfaces.

Event Management:
- **Event Handling**: Strong event handling support, allowing applications to respond to user actions like clicks, input, and other system events.
- **Seamless .NET Integration**: Can use features of the .NET Framework, such as LINQ and Entity Framework, to develop powerful and efficient applications.

Customization and Extensibility:
- **Custom Controls**: Allows the creation and customization of custom controls to meet specific application requirements.
- **Integration with External Libraries**: Easily integrates with external libraries and tools to extend application functionality.

Usage and Applications of Windows Forms:
- **Enterprise Application Development**: Used to develop business management applications, internal tools, and data management applications.
- **Tool Development**: Create tools and utilities to support users daily tasks.
- **Educational Applications**: Build educational and training applications to support learning and teaching.

With strong support from the .NET Framework, Windows Forms remains a popular choice for developing effective and user-friendly desktop applications.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (16, N'C# WPF', N'WPF.jpg', N'Windows Presentation Foundation (WPF) is a UI framework developed by Microsoft for building visually appealing desktop applications on the Windows platform using C#. Here are some key features of WPF:

User Interface Design:
- **Declarative UI**: Uses XAML (Extensible Application Markup Language) to define UI elements in a declarative manner.
- **Rich Graphics and Animation**: Supports advanced graphics, animations, and media integration to create visually engaging applications.
- **Data Binding**: Provides powerful data binding capabilities to connect UI elements to data sources easily.

Customization and Extensibility:
- **Custom Controls**: Allows developers to create custom controls and user elements to meet specific requirements.
- **Styles and Templates**: Supports styling and templating, enabling consistent look and feel across the application.

Event Handling and Commands:
- **Event Handling**: Offers robust event handling mechanisms to respond to user actions and system events.
- **Commands**: Provides command patterns to manage user interactions in a structured way.

Integration with .NET:
- **Seamless .NET Integration**: Fully integrates with the .NET framework, allowing the use of existing libraries and tools.
- **MVVM Pattern**: Encourages the Model-View-ViewModel (MVVM) design pattern, promoting separation of concerns and testability.

Usage and Applications of C# WPF:
- **Desktop Application Development**: Ideal for developing desktop applications with rich user interfaces and complex functionality.
- **Business Applications**: Used to build enterprise-level applications for business management, data analysis, and visualization.
- **Educational and Training Tools**: Suitable for creating interactive educational software and training programs.

With its advanced features and seamless integration with .NET, WPF is a powerful framework for developing modern desktop applications.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (17, N'Apache Cassandra', N'Cassandra.png', N'Apache Cassandra is an open-source, distributed NoSQL database designed for handling large amounts of data across many commodity servers with no single point of failure. Here are some key features of Cassandra:

Scalability and Performance:
- **Distributed Architecture**: Cassandra is designed to handle large volumes of data across multiple nodes, providing high availability and scalability.
- **Linear Scalability**: Easily scales horizontally by adding more nodes to the cluster, with minimal impact on performance.
- **High Performance**: Optimized for fast write and read operations, making it suitable for applications with high throughput requirements.

Data Model:
- **Column-Family Store**: Uses a column-family data model that is more flexible than traditional relational databases.
- **Schema-less**: Allows for dynamic schema changes, providing flexibility in data modeling and storage.

Fault Tolerance and Availability:
- **Replication**: Data is replicated across multiple nodes, ensuring fault tolerance and high availability.
- **No Single Point of Failure**: Designed to be resilient against hardware failures, ensuring continuous operation.

Consistency and Partitioning:
- **Configurable Consistency Levels**: Provides tunable consistency levels to balance between consistency and performance.
- **Data Partitioning**: Uses a distributed hash-based partitioning strategy to distribute data evenly across nodes.

Usage and Applications of Cassandra:
- **Big Data Applications**: Suitable for handling large-scale data applications and real-time analytics.
- **IoT and Sensor Data**: Commonly used in Internet of Things (IoT) applications for managing sensor data.
- **E-commerce and Social Media**: Ideal for use cases that require high availability and scalability, such as e-commerce platforms and social media analytics.

With its robust architecture and high performance, Cassandra is a popular choice for enterprises needing a scalable and fault-tolerant NoSQL database solution.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (18, N'Git', N'Git.png', N'Git is a distributed version control system designed to handle everything from small to very large projects with speed and efficiency. Here are some key features of Git:

Version Control:
- **Branching and Merging**: Git allows for powerful branching and merging capabilities, making it easy to manage different versions of a project and integrate changes.
- **Commit History**: Tracks and stores changes to files, providing a detailed history of modifications and the ability to revert to previous versions.

Distributed System:
- **Local Repositories**: Each user has a full copy of the repository, including its history, on their local machine, enabling offline work and faster access to project history.
- **Collaboration**: Facilitates collaboration among multiple developers by allowing them to work independently on their own branches and merge their changes into a central repository.

Performance:
- **Efficiency**: Optimized for performance, with operations like commit, branch, and merge being fast and efficient.
- **Storage**: Uses delta compression and efficient storage mechanisms to handle large repositories and minimize storage requirements.

Integration and Tools:
- **Integration with CI/CD**: Works seamlessly with Continuous Integration/Continuous Deployment (CI/CD) tools to automate the build, test, and deployment processes.
- **Graphical Interfaces**: Supports various graphical user interfaces (GUIs) like GitHub Desktop, SourceTree, and GitKraken for ease of use.

Usage and Applications of Git:
- **Software Development**: Widely used in software development to manage code changes, collaborate with teams, and maintain project history.
- **Open Source Projects**: Popular in the open source community for managing contributions and coordinating work among contributors.
- **Version Control for Documents**: Can be used for versioning and tracking changes to documents and configuration files.

With its robust features and distributed nature, Git is a crucial tool for modern software development and version control.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (19, N'Apache Hadoop', N'Hadoop.png', N'Apache Hadoop is an open-source framework for distributed storage and processing of large data sets using a cluster of commodity hardware. Here are some key features of Hadoop:

Distributed Storage:
- **Hadoop Distributed File System (HDFS)**: A distributed file system designed to store vast amounts of data across many machines. It provides high-throughput access to application data and is fault-tolerant.

Distributed Computing:
- **MapReduce**: A programming model and processing engine that allows for the parallel processing of large data sets. It divides tasks into smaller chunks and processes them in parallel across the cluster.

Scalability and Fault Tolerance:
- **Scalability**: Hadoop is designed to scale up from a single server to thousands of machines, each offering local computation and storage. It can handle petabytes of data efficiently.
- **Fault Tolerance**: Data is replicated across multiple nodes to ensure that if a node fails, data is still available from other nodes. This replication also helps in load balancing.

Ecosystem and Integration:
- **Hadoop Ecosystem**: Includes various tools and projects such as Apache Hive (data warehousing), Apache HBase (NoSQL database), Apache Pig (data flow scripting), and Apache Spark (in-memory data processing) that enhance Hadoop’s capabilities.
- **Integration with Other Tools**: Works well with data processing and analysis tools, including machine learning frameworks, visualization tools, and cloud services.

Usage and Applications of Apache Hadoop:
- **Big Data Analytics**: Widely used for processing and analyzing large volumes of data in industries such as finance, healthcare, and retail.
- **Data Warehousing**: Often used as a storage layer for data warehouses to handle large-scale data storage needs.
- **Data Mining and Machine Learning**: Supports large-scale data mining and machine learning tasks by providing a scalable infrastructure.

With its ability to handle massive amounts of data across distributed clusters, Apache Hadoop is a key technology for big data processing and analytics.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (20, N'Firewall', N'Firewall.jpg', N'A firewall is a network security device that monitors and controls incoming and outgoing network traffic based on predetermined security rules. It acts as a barrier between a trusted internal network and an untrusted external network. Here are some key features of firewalls:

Network Security:
- **Traffic Filtering**: Firewalls filter network traffic based on rules set by the administrator, allowing or blocking traffic based on IP addresses, ports, and protocols.
- **Intrusion Prevention**: Provides protection against unauthorized access and potential attacks by inspecting and blocking malicious traffic.

Types of Firewalls:
- **Hardware Firewalls**: Physical devices that are placed between the network and the internet. They offer robust protection and are often used in enterprise environments.
- **Software Firewalls**: Applications that run on a computer or server to monitor and control network traffic. They are commonly used on individual devices or within smaller networks.

Stateful vs. Stateless:
- **Stateful Firewalls**: Track the state of active connections and make decisions based on the context of traffic. They offer more advanced protection by considering the state of the connection.
- **Stateless Firewalls**: Filter traffic based only on predefined rules without considering the state of the connection. They are simpler but less secure compared to stateful firewalls.

Advanced Features:
- **Application Layer Filtering**: Some firewalls provide deep packet inspection and filtering based on application-layer protocols such as HTTP and FTP.
- **Virtual Private Network (VPN) Support**: Many firewalls support VPNs to provide secure remote access to the internal network.

Usage and Applications of Firewalls:
- **Network Security**: Essential for protecting network infrastructure from external threats and unauthorized access.
- **Compliance**: Used to comply with regulatory requirements for data protection and security.
- **Home and Business Networks**: Provides security for both home and business networks by controlling traffic and preventing potential security breaches.

Firewalls play a crucial role in network security by managing and protecting network traffic, ensuring that only legitimate communication is allowed while blocking harmful activities.', 1)
INSERT [dbo].[Skills] ([skill_id], [skill_name], [img], [description], [status]) VALUES (21, N'Cloud Computing', N'Cloud.jpg', N'Cloud computing is the delivery of computing services—including servers, storage, databases, networking, software, and more—over the internet (the cloud). It provides on-demand access to computing resources and applications without the need for physical hardware. Here are some key features of cloud computing:

Service Models:
- **Infrastructure as a Service (IaaS)**: Provides virtualized computing resources over the internet. Users can rent virtual machines, storage, and networking infrastructure. Examples include Amazon Web Services (AWS) EC2 and Microsoft Azure.
- **Platform as a Service (PaaS)**: Offers a platform allowing customers to develop, run, and manage applications without dealing with the underlying infrastructure. Examples include Google App Engine and Microsoft Azure App Services.
- **Software as a Service (SaaS)**: Delivers software applications over the internet, typically on a subscription basis. Users access the software via a web browser, and the provider manages the infrastructure and software updates. Examples include Google Workspace, Salesforce, and Microsoft 365.

Deployment Models:
- **Public Cloud**: Services are delivered over the public internet and shared across multiple organizations. It is cost-effective and scalable. Examples include AWS, Google Cloud Platform (GCP), and Microsoft Azure.
- **Private Cloud**: Cloud infrastructure is operated exclusively for a single organization. It offers enhanced security and control but can be more expensive. It can be managed internally or by a third-party provider.
- **Hybrid Cloud**: Combines public and private cloud services, allowing data and applications to be shared between them. It provides greater flexibility and optimization of existing infrastructure.

Benefits:
- **Scalability**: Allows for the rapid scaling of resources up or down based on demand, providing flexibility and efficiency.
- **Cost-Efficiency**: Reduces the need for capital expenditure on physical hardware and allows for pay-as-you-go pricing models.
- **Accessibility**: Provides access to resources and applications from anywhere with an internet connection, supporting remote work and global collaboration.
- **Disaster Recovery**: Enhances disaster recovery capabilities by enabling data backup and recovery solutions in the cloud.

Usage and Applications of Cloud Computing:
- **Web Hosting**: Used to host websites and web applications with scalable resources.
- **Data Storage and Backup**: Provides scalable and secure storage solutions for data and backups.
- **Big Data and Analytics**: Supports large-scale data processing and analytics tasks.
- **Development and Testing**: Facilitates development and testing of applications with scalable and flexible environments.

With its ability to provide scalable, cost-effective, and on-demand resources, cloud computing has become a fundamental technology for modern IT infrastructure and business operations.', 1)
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (1, 1)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (2, 1)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 1)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (4, 1)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (5, 1)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (6, 1)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 1)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 2)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (5, 2)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (8, 2)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (10, 2)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 2)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 2)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 2)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (2, 3)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (5, 3)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (7, 3)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (9, 3)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 3)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (14, 3)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 3)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (1, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (5, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (6, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (7, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (13, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (18, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 4)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (1, 5)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (5, 5)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (7, 5)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (8, 5)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (15, 5)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 5)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (18, 5)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (4, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (8, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (15, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (20, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (21, 6)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (2, 7)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 7)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (10, 7)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 7)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (18, 7)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 7)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (21, 7)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 8)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (4, 8)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (7, 8)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (8, 8)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (12, 8)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (14, 8)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 8)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (9, 9)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (10, 9)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 9)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (13, 9)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (14, 9)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 9)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 9)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (1, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (12, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (13, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (14, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 10)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (1, 11)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 11)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (5, 11)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (7, 11)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (9, 11)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (13, 11)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (21, 11)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (2, 12)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 12)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (4, 12)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (8, 12)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (9, 12)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (10, 12)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 12)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (2, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (6, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (12, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (13, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (18, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (20, 13)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (2, 14)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (7, 14)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (10, 14)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (12, 14)
GO
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (15, 14)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 14)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (18, 14)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (20, 14)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (3, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (4, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (10, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (16, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (18, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 15)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (1, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (4, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (7, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (9, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (10, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (15, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (19, 16)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (9, 17)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (11, 17)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (12, 17)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (15, 17)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (17, 17)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (18, 17)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (20, 17)
INSERT [dbo].[CVSkills] ([skill_id], [cv_id]) VALUES (21, 17)
GO
SET IDENTITY_INSERT [dbo].[Cycle] ON 

INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (1, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'son', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (2, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'minh', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (3, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'alexander_thomas', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (4, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'mia_moore', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (5, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'daniel_white', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (6, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'isabella_harris', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (7, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'matthew_clark', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (8, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'charlotte_lewis', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (9, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'lucas_walker', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (10, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'amelia_hall', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (11, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'jayden_allen', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (12, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'ella_young', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (13, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'logan_hernandez', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (14, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'sophia_king', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (15, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'mason_scott', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (16, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'mia_green', CAST(N'2024-06-10' AS Date))
INSERT [dbo].[Cycle] ([cycle_id], [start_time], [end_time], [note], [mentor_name], [deadline_date]) VALUES (17, CAST(N'2024-06-17' AS Date), CAST(N'2024-07-14' AS Date), N'', N'isabella_baker', CAST(N'2024-06-10' AS Date))
SET IDENTITY_INSERT [dbo].[Cycle] OFF
GO
INSERT [dbo].[Slots] ([slot_id], [slot_name]) VALUES (N'SLOT01', N'7:00 - 9:00')
INSERT [dbo].[Slots] ([slot_id], [slot_name]) VALUES (N'SLOT02', N'9:00 - 11:00')
INSERT [dbo].[Slots] ([slot_id], [slot_name]) VALUES (N'SLOT03', N'13:00 - 15:00')
INSERT [dbo].[Slots] ([slot_id], [slot_name]) VALUES (N'SLOT04', N'15:00 - 17:00')
GO
SET IDENTITY_INSERT [dbo].[Status_Selected] ON 

INSERT [dbo].[Status_Selected] ([status_id], [status_name]) VALUES (1, N'Pending')
INSERT [dbo].[Status_Selected] ([status_id], [status_name]) VALUES (2, N'Approved')
INSERT [dbo].[Status_Selected] ([status_id], [status_name]) VALUES (3, N'Rejected')
INSERT [dbo].[Status_Selected] ([status_id], [status_name]) VALUES (4, N'Saved')
INSERT [dbo].[Status_Selected] ([status_id], [status_name]) VALUES (5, N'Out Of Date')
INSERT [dbo].[Status_Selected] ([status_id], [status_name]) VALUES (6, N'Done')
SET IDENTITY_INSERT [dbo].[Status_Selected] OFF
GO
SET IDENTITY_INSERT [dbo].[Selected_Slot] ON 

INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (1, N'SLOT02', 1, CAST(N'2024-06-17' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (2, N'SLOT02', 1, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (3, N'SLOT02', 1, CAST(N'2024-06-21' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (4, N'SLOT02', 1, CAST(N'2024-06-23' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (5, N'SLOT04', 1, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (6, N'SLOT02', 1, CAST(N'2024-06-24' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (7, N'SLOT02', 1, CAST(N'2024-06-26' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (8, N'SLOT02', 1, CAST(N'2024-06-28' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (9, N'SLOT02', 1, CAST(N'2024-06-30' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (10, N'SLOT04', 1, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (11, N'SLOT02', 1, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (12, N'SLOT02', 1, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (13, N'SLOT02', 1, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (14, N'SLOT02', 1, CAST(N'2024-07-07' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (15, N'SLOT04', 1, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (16, N'SLOT02', 1, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (17, N'SLOT02', 1, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (18, N'SLOT02', 1, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (19, N'SLOT02', 1, CAST(N'2024-07-14' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (20, N'SLOT04', 1, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (21, N'SLOT03', 2, CAST(N'2024-06-17' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (22, N'SLOT02', 2, CAST(N'2024-06-19' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (23, N'SLOT02', 2, CAST(N'2024-06-21' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (24, N'SLOT04', 2, CAST(N'2024-06-22' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (25, N'SLOT03', 2, CAST(N'2024-06-24' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (26, N'SLOT02', 2, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (27, N'SLOT02', 2, CAST(N'2024-06-28' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (28, N'SLOT04', 2, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (29, N'SLOT03', 2, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (30, N'SLOT02', 2, CAST(N'2024-07-03' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (31, N'SLOT02', 2, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (32, N'SLOT04', 2, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (33, N'SLOT03', 2, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (34, N'SLOT02', 2, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (35, N'SLOT02', 2, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (36, N'SLOT04', 2, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (37, N'SLOT04', 3, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (38, N'SLOT03', 3, CAST(N'2024-06-19' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (39, N'SLOT02', 3, CAST(N'2024-06-19' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (40, N'SLOT02', 3, CAST(N'2024-06-18' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (41, N'SLOT02', 3, CAST(N'2024-06-20' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (42, N'SLOT02', 3, CAST(N'2024-06-17' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (43, N'SLOT02', 3, CAST(N'2024-06-21' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (44, N'SLOT03', 3, CAST(N'2024-06-21' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (45, N'SLOT04', 3, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (46, N'SLOT03', 3, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (47, N'SLOT02', 3, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (48, N'SLOT02', 3, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (49, N'SLOT02', 3, CAST(N'2024-06-27' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (50, N'SLOT02', 3, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (51, N'SLOT02', 3, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (52, N'SLOT03', 3, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (53, N'SLOT04', 3, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (54, N'SLOT03', 3, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (55, N'SLOT02', 3, CAST(N'2024-07-03' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (56, N'SLOT02', 3, CAST(N'2024-07-02' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (57, N'SLOT02', 3, CAST(N'2024-07-04' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (58, N'SLOT02', 3, CAST(N'2024-07-01' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (59, N'SLOT02', 3, CAST(N'2024-07-05' AS Date), 6)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (60, N'SLOT03', 3, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (61, N'SLOT04', 3, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (62, N'SLOT03', 3, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (63, N'SLOT02', 3, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (64, N'SLOT02', 3, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (65, N'SLOT02', 3, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (66, N'SLOT02', 3, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (67, N'SLOT02', 3, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (68, N'SLOT03', 3, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (69, N'SLOT02', 4, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (70, N'SLOT01', 4, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (71, N'SLOT01', 4, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (72, N'SLOT01', 4, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (73, N'SLOT01', 4, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (74, N'SLOT02', 4, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (75, N'SLOT01', 4, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (76, N'SLOT04', 4, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (77, N'SLOT02', 4, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (78, N'SLOT01', 4, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (79, N'SLOT01', 4, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (80, N'SLOT01', 4, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (81, N'SLOT01', 4, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (82, N'SLOT02', 4, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (83, N'SLOT01', 4, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (84, N'SLOT02', 4, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (85, N'SLOT01', 4, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (86, N'SLOT01', 4, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (87, N'SLOT01', 4, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (88, N'SLOT01', 4, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (89, N'SLOT02', 4, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (90, N'SLOT01', 4, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (91, N'SLOT02', 4, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (92, N'SLOT01', 4, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (93, N'SLOT01', 4, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (94, N'SLOT01', 4, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (95, N'SLOT01', 4, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (96, N'SLOT02', 4, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (97, N'SLOT01', 4, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (98, N'SLOT01', 5, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (99, N'SLOT01', 5, CAST(N'2024-06-18' AS Date), 2)
GO
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (100, N'SLOT01', 5, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (101, N'SLOT03', 5, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (102, N'SLOT03', 5, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (103, N'SLOT03', 5, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (104, N'SLOT01', 5, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (105, N'SLOT01', 5, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (106, N'SLOT03', 5, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (107, N'SLOT03', 5, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (108, N'SLOT01', 5, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (109, N'SLOT01', 5, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (110, N'SLOT01', 5, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (111, N'SLOT03', 5, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (112, N'SLOT03', 5, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (113, N'SLOT03', 5, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (114, N'SLOT01', 5, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (115, N'SLOT01', 5, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (116, N'SLOT03', 5, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (117, N'SLOT03', 5, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (118, N'SLOT01', 5, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (119, N'SLOT01', 5, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (120, N'SLOT01', 5, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (121, N'SLOT03', 5, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (122, N'SLOT03', 5, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (123, N'SLOT03', 5, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (124, N'SLOT01', 5, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (125, N'SLOT01', 5, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (126, N'SLOT03', 5, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (127, N'SLOT03', 5, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (128, N'SLOT01', 5, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (129, N'SLOT01', 5, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (130, N'SLOT01', 5, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (131, N'SLOT03', 5, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (132, N'SLOT03', 5, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (133, N'SLOT03', 5, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (134, N'SLOT01', 5, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (135, N'SLOT01', 5, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (136, N'SLOT03', 5, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (137, N'SLOT03', 5, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (138, N'SLOT03', 6, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (139, N'SLOT02', 6, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (140, N'SLOT02', 6, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (141, N'SLOT02', 6, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (142, N'SLOT03', 6, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (143, N'SLOT03', 6, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (144, N'SLOT03', 6, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (145, N'SLOT02', 6, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (146, N'SLOT02', 6, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (147, N'SLOT02', 6, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (148, N'SLOT03', 6, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (149, N'SLOT03', 6, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (150, N'SLOT03', 6, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (151, N'SLOT02', 6, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (152, N'SLOT02', 6, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (153, N'SLOT02', 6, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (154, N'SLOT03', 6, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (155, N'SLOT03', 6, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (156, N'SLOT03', 6, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (157, N'SLOT02', 6, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (158, N'SLOT02', 6, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (159, N'SLOT02', 6, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (160, N'SLOT03', 6, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (161, N'SLOT03', 6, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (162, N'SLOT01', 7, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (163, N'SLOT02', 7, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (164, N'SLOT03', 7, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (165, N'SLOT01', 7, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (166, N'SLOT01', 7, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (167, N'SLOT01', 7, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (168, N'SLOT02', 7, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (169, N'SLOT02', 7, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (170, N'SLOT02', 7, CAST(N'2024-06-22' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (171, N'SLOT03', 7, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (172, N'SLOT01', 7, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (173, N'SLOT02', 7, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (174, N'SLOT03', 7, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (175, N'SLOT01', 7, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (176, N'SLOT01', 7, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (177, N'SLOT01', 7, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (178, N'SLOT02', 7, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (179, N'SLOT02', 7, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (180, N'SLOT02', 7, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (181, N'SLOT03', 7, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (182, N'SLOT01', 7, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (183, N'SLOT02', 7, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (184, N'SLOT03', 7, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (185, N'SLOT01', 7, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (186, N'SLOT01', 7, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (187, N'SLOT01', 7, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (188, N'SLOT02', 7, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (189, N'SLOT02', 7, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (190, N'SLOT02', 7, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (191, N'SLOT03', 7, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (192, N'SLOT01', 7, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (193, N'SLOT02', 7, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (194, N'SLOT03', 7, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (195, N'SLOT01', 7, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (196, N'SLOT01', 7, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (197, N'SLOT01', 7, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (198, N'SLOT02', 7, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (199, N'SLOT02', 7, CAST(N'2024-07-12' AS Date), 2)
GO
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (200, N'SLOT02', 7, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (201, N'SLOT03', 7, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (202, N'SLOT01', 8, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (203, N'SLOT01', 8, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (204, N'SLOT01', 8, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (205, N'SLOT01', 8, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (206, N'SLOT01', 8, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (207, N'SLOT04', 8, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (208, N'SLOT04', 8, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (209, N'SLOT04', 8, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (210, N'SLOT04', 8, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (211, N'SLOT04', 8, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (212, N'SLOT01', 8, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (213, N'SLOT01', 8, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (214, N'SLOT01', 8, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (215, N'SLOT01', 8, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (216, N'SLOT01', 8, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (217, N'SLOT04', 8, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (218, N'SLOT04', 8, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (219, N'SLOT04', 8, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (220, N'SLOT04', 8, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (221, N'SLOT04', 8, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (222, N'SLOT01', 8, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (223, N'SLOT01', 8, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (224, N'SLOT01', 8, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (225, N'SLOT01', 8, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (226, N'SLOT01', 8, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (227, N'SLOT04', 8, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (228, N'SLOT04', 8, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (229, N'SLOT04', 8, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (230, N'SLOT04', 8, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (231, N'SLOT04', 8, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (232, N'SLOT01', 8, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (233, N'SLOT01', 8, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (234, N'SLOT01', 8, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (235, N'SLOT01', 8, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (236, N'SLOT01', 8, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (237, N'SLOT04', 8, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (238, N'SLOT04', 8, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (239, N'SLOT04', 8, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (240, N'SLOT04', 8, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (241, N'SLOT04', 8, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (242, N'SLOT01', 9, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (243, N'SLOT01', 9, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (244, N'SLOT01', 9, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (245, N'SLOT01', 9, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (246, N'SLOT01', 9, CAST(N'2024-06-22' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (247, N'SLOT04', 9, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (248, N'SLOT04', 9, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (249, N'SLOT04', 9, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (250, N'SLOT04', 9, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (251, N'SLOT04', 9, CAST(N'2024-06-22' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (252, N'SLOT02', 9, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (253, N'SLOT01', 9, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (254, N'SLOT01', 9, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (255, N'SLOT01', 9, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (256, N'SLOT01', 9, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (257, N'SLOT01', 9, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (258, N'SLOT04', 9, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (259, N'SLOT04', 9, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (260, N'SLOT04', 9, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (261, N'SLOT04', 9, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (262, N'SLOT04', 9, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (263, N'SLOT02', 9, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (264, N'SLOT01', 9, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (265, N'SLOT01', 9, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (266, N'SLOT01', 9, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (267, N'SLOT01', 9, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (268, N'SLOT01', 9, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (269, N'SLOT04', 9, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (270, N'SLOT04', 9, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (271, N'SLOT04', 9, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (272, N'SLOT04', 9, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (273, N'SLOT04', 9, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (274, N'SLOT02', 9, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (275, N'SLOT02', 9, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (276, N'SLOT01', 9, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (277, N'SLOT01', 9, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (278, N'SLOT01', 9, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (279, N'SLOT01', 9, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (280, N'SLOT01', 9, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (281, N'SLOT04', 9, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (282, N'SLOT04', 9, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (283, N'SLOT04', 9, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (284, N'SLOT04', 9, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (285, N'SLOT04', 9, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (286, N'SLOT02', 9, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (287, N'SLOT01', 10, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (288, N'SLOT02', 10, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (289, N'SLOT01', 10, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (290, N'SLOT02', 10, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (291, N'SLOT01', 10, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (292, N'SLOT02', 10, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (293, N'SLOT01', 10, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (294, N'SLOT02', 10, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (295, N'SLOT01', 10, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (296, N'SLOT02', 10, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (297, N'SLOT01', 10, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (298, N'SLOT02', 10, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (299, N'SLOT01', 10, CAST(N'2024-06-26' AS Date), 2)
GO
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (300, N'SLOT02', 10, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (301, N'SLOT01', 10, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (302, N'SLOT02', 10, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (303, N'SLOT01', 10, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (304, N'SLOT02', 10, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (305, N'SLOT01', 10, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (306, N'SLOT02', 10, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (307, N'SLOT01', 10, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (308, N'SLOT02', 10, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (309, N'SLOT01', 10, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (310, N'SLOT02', 10, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (311, N'SLOT01', 10, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (312, N'SLOT02', 10, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (313, N'SLOT01', 10, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (314, N'SLOT02', 10, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (315, N'SLOT01', 10, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (316, N'SLOT02', 10, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (317, N'SLOT01', 10, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (318, N'SLOT02', 10, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (319, N'SLOT02', 11, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (320, N'SLOT02', 11, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (321, N'SLOT02', 11, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (322, N'SLOT02', 11, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (323, N'SLOT02', 11, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (324, N'SLOT02', 11, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (325, N'SLOT02', 11, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (326, N'SLOT02', 11, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (327, N'SLOT02', 11, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (328, N'SLOT02', 11, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (329, N'SLOT02', 11, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (330, N'SLOT02', 11, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (331, N'SLOT02', 11, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (332, N'SLOT02', 11, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (333, N'SLOT02', 11, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (334, N'SLOT02', 11, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (335, N'SLOT02', 11, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (336, N'SLOT02', 11, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (337, N'SLOT02', 11, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (338, N'SLOT02', 11, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (339, N'SLOT04', 12, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (340, N'SLOT04', 12, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (341, N'SLOT04', 12, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (342, N'SLOT04', 12, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (343, N'SLOT04', 12, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (344, N'SLOT04', 12, CAST(N'2024-06-22' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (345, N'SLOT04', 12, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (346, N'SLOT04', 12, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (347, N'SLOT04', 12, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (348, N'SLOT04', 12, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (349, N'SLOT04', 12, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (350, N'SLOT04', 12, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (351, N'SLOT04', 12, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (352, N'SLOT04', 12, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (353, N'SLOT04', 12, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (354, N'SLOT04', 12, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (355, N'SLOT04', 12, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (356, N'SLOT04', 12, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (357, N'SLOT04', 12, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (358, N'SLOT04', 12, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (359, N'SLOT04', 12, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (360, N'SLOT04', 12, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (361, N'SLOT04', 12, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (362, N'SLOT04', 12, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (363, N'SLOT01', 13, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (364, N'SLOT01', 13, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (365, N'SLOT01', 13, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (366, N'SLOT01', 13, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (367, N'SLOT04', 13, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (368, N'SLOT04', 13, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (369, N'SLOT04', 13, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (370, N'SLOT04', 13, CAST(N'2024-06-22' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (371, N'SLOT01', 13, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (372, N'SLOT01', 13, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (373, N'SLOT01', 13, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (374, N'SLOT01', 13, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (375, N'SLOT04', 13, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (376, N'SLOT04', 13, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (377, N'SLOT04', 13, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (378, N'SLOT04', 13, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (379, N'SLOT01', 13, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (380, N'SLOT01', 13, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (381, N'SLOT01', 13, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (382, N'SLOT01', 13, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (383, N'SLOT04', 13, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (384, N'SLOT04', 13, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (385, N'SLOT04', 13, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (386, N'SLOT04', 13, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (387, N'SLOT01', 13, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (388, N'SLOT01', 13, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (389, N'SLOT01', 13, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (390, N'SLOT01', 13, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (391, N'SLOT04', 13, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (392, N'SLOT04', 13, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (393, N'SLOT04', 13, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (394, N'SLOT04', 13, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (395, N'SLOT02', 14, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (396, N'SLOT02', 14, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (397, N'SLOT02', 14, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (398, N'SLOT02', 14, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (399, N'SLOT02', 14, CAST(N'2024-06-22' AS Date), 2)
GO
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (400, N'SLOT02', 14, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (401, N'SLOT03', 14, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (402, N'SLOT03', 14, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (403, N'SLOT02', 14, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (404, N'SLOT02', 14, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (405, N'SLOT02', 14, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (406, N'SLOT02', 14, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (407, N'SLOT02', 14, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (408, N'SLOT02', 14, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (409, N'SLOT03', 14, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (410, N'SLOT03', 14, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (411, N'SLOT02', 14, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (412, N'SLOT02', 14, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (413, N'SLOT02', 14, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (414, N'SLOT02', 14, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (415, N'SLOT02', 14, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (416, N'SLOT02', 14, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (417, N'SLOT03', 14, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (418, N'SLOT03', 14, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (419, N'SLOT02', 14, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (420, N'SLOT02', 14, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (421, N'SLOT02', 14, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (422, N'SLOT02', 14, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (423, N'SLOT02', 14, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (424, N'SLOT02', 14, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (425, N'SLOT03', 14, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (426, N'SLOT03', 14, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (427, N'SLOT01', 15, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (428, N'SLOT01', 15, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (429, N'SLOT01', 15, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (430, N'SLOT01', 15, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (431, N'SLOT01', 15, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (432, N'SLOT03', 15, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (433, N'SLOT02', 15, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (434, N'SLOT02', 15, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (435, N'SLOT02', 15, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (436, N'SLOT03', 15, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (437, N'SLOT03', 15, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (438, N'SLOT01', 15, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (439, N'SLOT01', 15, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (440, N'SLOT01', 15, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (441, N'SLOT01', 15, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (442, N'SLOT01', 15, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (443, N'SLOT03', 15, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (444, N'SLOT02', 15, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (445, N'SLOT02', 15, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (446, N'SLOT02', 15, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (447, N'SLOT03', 15, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (448, N'SLOT03', 15, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (449, N'SLOT01', 15, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (450, N'SLOT01', 15, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (451, N'SLOT01', 15, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (452, N'SLOT01', 15, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (453, N'SLOT01', 15, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (454, N'SLOT03', 15, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (455, N'SLOT02', 15, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (456, N'SLOT02', 15, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (457, N'SLOT02', 15, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (458, N'SLOT03', 15, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (459, N'SLOT03', 15, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (460, N'SLOT01', 15, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (461, N'SLOT01', 15, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (462, N'SLOT01', 15, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (463, N'SLOT01', 15, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (464, N'SLOT01', 15, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (465, N'SLOT03', 15, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (466, N'SLOT02', 15, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (467, N'SLOT02', 15, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (468, N'SLOT02', 15, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (469, N'SLOT03', 15, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (470, N'SLOT03', 15, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (471, N'SLOT01', 16, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (472, N'SLOT01', 16, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (473, N'SLOT01', 16, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (474, N'SLOT01', 16, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (475, N'SLOT04', 16, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (476, N'SLOT04', 16, CAST(N'2024-06-18' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (477, N'SLOT01', 16, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (478, N'SLOT01', 16, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (479, N'SLOT01', 16, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (480, N'SLOT01', 16, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (481, N'SLOT04', 16, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (482, N'SLOT04', 16, CAST(N'2024-06-25' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (483, N'SLOT01', 16, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (484, N'SLOT01', 16, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (485, N'SLOT01', 16, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (486, N'SLOT01', 16, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (487, N'SLOT04', 16, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (488, N'SLOT04', 16, CAST(N'2024-07-02' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (489, N'SLOT01', 16, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (490, N'SLOT01', 16, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (491, N'SLOT01', 16, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (492, N'SLOT01', 16, CAST(N'2024-07-12' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (493, N'SLOT04', 16, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (494, N'SLOT04', 16, CAST(N'2024-07-09' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (495, N'SLOT01', 17, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (496, N'SLOT02', 17, CAST(N'2024-06-17' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (497, N'SLOT01', 17, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (498, N'SLOT02', 17, CAST(N'2024-06-19' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (499, N'SLOT01', 17, CAST(N'2024-06-20' AS Date), 2)
GO
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (500, N'SLOT02', 17, CAST(N'2024-06-20' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (501, N'SLOT02', 17, CAST(N'2024-06-22' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (502, N'SLOT02', 17, CAST(N'2024-06-21' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (503, N'SLOT01', 17, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (504, N'SLOT02', 17, CAST(N'2024-06-24' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (505, N'SLOT01', 17, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (506, N'SLOT02', 17, CAST(N'2024-06-26' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (507, N'SLOT01', 17, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (508, N'SLOT02', 17, CAST(N'2024-06-27' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (509, N'SLOT02', 17, CAST(N'2024-06-29' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (510, N'SLOT02', 17, CAST(N'2024-06-28' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (511, N'SLOT01', 17, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (512, N'SLOT02', 17, CAST(N'2024-07-01' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (513, N'SLOT01', 17, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (514, N'SLOT02', 17, CAST(N'2024-07-03' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (515, N'SLOT01', 17, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (516, N'SLOT02', 17, CAST(N'2024-07-04' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (517, N'SLOT02', 17, CAST(N'2024-07-06' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (518, N'SLOT02', 17, CAST(N'2024-07-05' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (519, N'SLOT01', 17, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (520, N'SLOT02', 17, CAST(N'2024-07-08' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (521, N'SLOT01', 17, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (522, N'SLOT02', 17, CAST(N'2024-07-10' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (523, N'SLOT01', 17, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (524, N'SLOT02', 17, CAST(N'2024-07-11' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (525, N'SLOT02', 17, CAST(N'2024-07-13' AS Date), 2)
INSERT [dbo].[Selected_Slot] ([selected_id], [slot_id], [cycle_id], [day_of_slot], [status_id]) VALUES (526, N'SLOT02', 17, CAST(N'2024-07-12' AS Date), 2)
SET IDENTITY_INSERT [dbo].[Selected_Slot] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestStatuses] ON 

INSERT [dbo].[RequestStatuses] ([status_id], [status_name]) VALUES (1, N'Open Class')
INSERT [dbo].[RequestStatuses] ([status_id], [status_name]) VALUES (2, N'Processing')
INSERT [dbo].[RequestStatuses] ([status_id], [status_name]) VALUES (3, N'Rejected')
INSERT [dbo].[RequestStatuses] ([status_id], [status_name]) VALUES (4, N'Out Of Date')
INSERT [dbo].[RequestStatuses] ([status_id], [status_name]) VALUES (5, N'Wait For Payment')
INSERT [dbo].[RequestStatuses] ([status_id], [status_name]) VALUES (6, N'Saved')
INSERT [dbo].[RequestStatuses] ([status_id], [status_name]) VALUES (7, N'Done')
SET IDENTITY_INSERT [dbo].[RequestStatuses] OFF
GO
SET IDENTITY_INSERT [dbo].[RequestsFormMentee] ON 

INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (1, N'son', N'hieu', CAST(N'2024-06-08' AS Date), CAST(N'18:22:00' AS Time), N'Learn C++', N'This course aims to introduce participants to the fundamental concepts and tools used in data science. Topics covered include data manipulation, statistical analysis, machine learning algorithms, and data visualization techniques.', 3, 400000, N'I''m busy')
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (2, N'son', N'hieu', CAST(N'2024-06-07' AS Date), CAST(N'18:23:00' AS Time), N'Learn Javascript', N'Improve your academic writing skills with this workshop designed to help participants master the art of scholarly communication. Topics covered include structuring essays, citing sources correctly, academic integrity.', 1, 400000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (3, N'son', N'ava_taylor', CAST(N'2024-06-07' AS Date), CAST(N'19:28:00' AS Time), N'Learn Python', N'Participants will learn practical techniques to enhance clarity, coherence, and persuasiveness in their academic writing.', 3, 300000, N'The schedule you selected was rejected because this mentor has accepted another mentee, Please choose another schedule')
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (4, N'son', N'ava_taylor', CAST(N'2024-06-07' AS Date), CAST(N'18:30:00' AS Time), N'Learn SQL', N'This seminar provides a comprehensive introduction to personal financial planning.', 4, 300000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (5, N'son', N'ava_taylor', CAST(N'2024-06-07' AS Date), CAST(N'18:31:00' AS Time), N'Learn PHP', N'Topics covered include budgeting, saving strategies, investment basics, managing debt, and retirement planning.', 1, 300000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (6, N'son', N'ava_taylor', CAST(N'2024-06-12' AS Date), CAST(N'18:35:00' AS Time), N'Learn Javascript', N'I really want to learn your course', 4, 300000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (7, N'son', N'ava_taylor', CAST(N'2024-06-09' AS Date), CAST(N'18:42:00' AS Time), N'Learn C++', N'I''m really want to learn C++', 4, 200000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (8, N'minh', N'hieu', CAST(N'2024-06-08' AS Date), CAST(N'19:05:00' AS Time), N'Learn C', N'I really want to learn C, please help me', 1, 400000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (9, N'minh', N'hieu', CAST(N'2024-06-07' AS Date), CAST(N'19:11:00' AS Time), N'Learn CSS', N'Skill CSS is very usefull i want to learn.', 3, 300000, N'I''m can''t teach')
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (10, N'minh', N'hieu', CAST(N'2024-06-08' AS Date), CAST(N'19:13:00' AS Time), N'Request CSS again', N'I really want to learn CSS.', 4, 300000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (11, N'minh', N'ava_taylor', CAST(N'2024-06-08' AS Date), CAST(N'18:20:00' AS Time), N'Learn Java', N'Java is good skill. I want to learn it.', 1, 300000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (12, N'alexander_thomas', N'hieu', CAST(N'2024-06-09' AS Date), CAST(N'21:16:00' AS Time), N'Request Ruby', N'I want to learn skill Ruby. Can you help me?', 1, 450000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (13, N'alexander_thomas', N'benjamin_anderson', CAST(N'2024-06-08' AS Date), CAST(N'22:38:00' AS Time), N'Request C#', N'C# has a clean and easy-to-understand syntax, making it approachable for developers familiar with C-like languages. I want to learn.', 4, 450000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (14, N'alexander_thomas', N'benjamin_anderson', CAST(N'2024-06-09' AS Date), CAST(N'21:48:00' AS Time), N'Learn Skill Ruby', N'Ruby has a clean and readable syntax that focuses on human-friendly code. I hope i can learn this skill.', 1, 600000, NULL)
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (15, N'alexander_thomas', N'benjamin_anderson', CAST(N'2024-06-08' AS Date), CAST(N'22:54:00' AS Time), N'Learn Apache Cassandra', N'Apache Cassandra is an open-source, distributed NoSQL database designed for handling large amounts of data across many commodity servers with no single point of failure. So i want to learn', 3, 600000, N'Sory, I''m busy')
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (16, N'alexander_thomas', N'sophia_martinez', CAST(N'2024-06-07' AS Date), CAST(N'22:32:00' AS Time), N'Request PowerShell', N'Shell is a command-line interface or graphical user interface that allows users to interact with the operating system and applications using command-line commands. Popular types of shells include Bash and PowerShell.', 3, 600000, N'The schedule you selected was rejected because this mentor has accepted another mentee, Please choose another schedule')
INSERT [dbo].[RequestsFormMentee] ([request_id], [mentor_name], [mentee_name], [deadline_date], [deadline_hour], [title], [description], [status_id], [price], [note]) VALUES (17, N'alexander_thomas', N'sophia_martinez', CAST(N'2024-06-09' AS Date), CAST(N'12:33:00' AS Time), N'Learn Apache Cassandra', N'Uses a column-family data model that is more flexible than traditional relational databases.', 1, 900000, NULL)
SET IDENTITY_INSERT [dbo].[RequestsFormMentee] OFF
GO
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (1, 2)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (1, 1)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (1, 4)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (1, 7)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (2, 3)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (2, 1)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (2, 4)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (5, 6)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (5, 9)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (5, 7)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (9, 25)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (9, 26)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (9, 28)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (10, 31)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (10, 29)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (10, 32)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (11, 23)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (11, 27)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (11, 25)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (12, 40)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (12, 41)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (12, 44)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (13, 42)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (13, 43)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (13, 37)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (14, 43)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (14, 42)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (14, 38)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (14, 49)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (15, 39)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (15, 59)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (15, 56)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (15, 57)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (17, 39)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (17, 58)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (17, 56)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (17, 55)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (17, 57)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (17, 59)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (2, 8)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (3, 2)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (3, 5)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (3, 9)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (4, 11)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (4, 14)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (4, 15)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (7, 2)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (7, 5)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (6, 2)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (6, 13)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (6, 15)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (8, 22)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (8, 21)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (8, 24)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (8, 30)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (16, 39)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (16, 59)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (16, 56)
INSERT [dbo].[RquestSelectedSlot] ([request_id], [selected_id]) VALUES (16, 58)
GO
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (2, 9)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (2, 10)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (3, 3)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (4, 8)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (5, 1)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (5, 7)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (6, 11)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (7, 13)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (8, 2)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (8, 6)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (9, 12)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (9, 14)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (10, 5)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (11, 4)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (14, 16)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (17, 15)
INSERT [dbo].[RequestSkills] ([skill_id], [request_id]) VALUES (17, 17)
GO
SET IDENTITY_INSERT [dbo].[FeedBacks] ON 

INSERT [dbo].[FeedBacks] ([feedback_id], [request_id], [mentor_name], [mentee_name], [star], [comment], [time_feedback]) VALUES (4, 5, N'son', N'ava_taylor', 5, N'You are good mentor', CAST(N'2024-06-27' AS Date))
INSERT [dbo].[FeedBacks] ([feedback_id], [request_id], [mentor_name], [mentee_name], [star], [comment], [time_feedback]) VALUES (5, 2, N'son', N'hieu', 4, N'good teacher', CAST(N'2024-06-27' AS Date))
INSERT [dbo].[FeedBacks] ([feedback_id], [request_id], [mentor_name], [mentee_name], [star], [comment], [time_feedback]) VALUES (6, 8, N'minh', N'hieu', 2, N'Not bad!', CAST(N'2024-06-29' AS Date))
INSERT [dbo].[FeedBacks] ([feedback_id], [request_id], [mentor_name], [mentee_name], [star], [comment], [time_feedback]) VALUES (7, 11, N'minh', N'ava_taylor', 3, N'No problem, but i don''t want to learn.', CAST(N'2024-06-26' AS Date))
INSERT [dbo].[FeedBacks] ([feedback_id], [request_id], [mentor_name], [mentee_name], [star], [comment], [time_feedback]) VALUES (8, 14, N'alexander_thomas', N'benjamin_anderson', 5, N'Teacher is very good!', CAST(N'2024-06-26' AS Date))
INSERT [dbo].[FeedBacks] ([feedback_id], [request_id], [mentor_name], [mentee_name], [star], [comment], [time_feedback]) VALUES (9, 12, N'alexander_thomas', N'hieu', 5, N'So nice!', CAST(N'2024-06-26' AS Date))
SET IDENTITY_INSERT [dbo].[FeedBacks] OFF
GO
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'michael_jones', CAST(7000000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'emily_davis', CAST(7000000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'william_brown', CAST(7000000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'olivia_johnson', CAST(7000000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'james_wilson', CAST(7000000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'sophia_martinez', CAST(6100000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'benjamin_anderson', CAST(6400000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'ava_taylor', CAST(6400000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'hieu', CAST(5750000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
INSERT [dbo].[Wallet] ([wallet_id], [real_balance], [hold]) VALUES (N'manager', CAST(3350000 AS Decimal(15, 0)), CAST(0 AS Decimal(15, 0)))
GO
SET IDENTITY_INSERT [dbo].[Hold] ON
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (1, N'hieu', 1, CAST(400000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:22:50.237' AS DateTime), N'Hold money by request with title: Learn C++', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (2, N'hieu', 1, CAST(400000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:23:19.110' AS DateTime), N'Return the money hold by request with title: Learn C++', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (3, N'hieu', 2, CAST(400000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:24:06.453' AS DateTime), N'Hold money by request with title: Learn Javascript', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (4, N'hieu', 2, CAST(400000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:24:56.203' AS DateTime), N'Cancel hold money because paid request with title: Learn Javascript', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (5, N'ava_taylor', 5, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:32:07.817' AS DateTime), N'Hold money by request with title: Learn PHP', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (6, N'ava_taylor', 5, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:32:54.343' AS DateTime), N'Cancel hold money because paid request with title: Learn PHP', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (7, N'hieu', 9, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T15:11:22.187' AS DateTime), N'Hold money by request with title: Learn CSS', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (8, N'hieu', 9, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T15:12:25.877' AS DateTime), N'Return the money hold by request with title: Learn CSS', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (9, N'hieu', 10, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T15:13:52.033' AS DateTime), N'Hold money by request with title: Request CSS again', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (10, N'ava_taylor', 11, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T15:20:41.457' AS DateTime), N'Hold money by request with title: Learn Java', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (11, N'hieu', 12, CAST(450000 AS Decimal(15, 0)), CAST(N'2024-06-05T16:16:17.880' AS DateTime), N'Hold money by request with title: Request Ruby', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (12, N'benjamin_anderson', 13, CAST(450000 AS Decimal(15, 0)), CAST(N'2024-06-05T18:38:13.127' AS DateTime), N'Hold money by request with title: Request C#', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (13, N'benjamin_anderson', 13, CAST(450000 AS Decimal(15, 0)), CAST(N'2024-06-15T18:43:01.007' AS DateTime), N'Return the money hold by request with title: Request C#', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (14, N'hieu', 10, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T16:37:02.033' AS DateTime), N'Return the money hold by request with title: Request CSS again', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (15, N'ava_taylor', 6, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T16:37:02.033' AS DateTime), N'Return the money hold by request with title: Learn Javascript', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (16, N'ava_taylor', 4, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T16:37:02.033' AS DateTime), N'Return the money hold by request with title: Learn SQL', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (17, N'benjamin_anderson', 14, CAST(600000 AS Decimal(15, 0)), CAST(N'2024-06-05T18:49:07.430' AS DateTime), N'Hold money by request with title: Learn Skill Ruby', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (18, N'benjamin_anderson', 14, CAST(600000 AS Decimal(15, 0)), CAST(N'2024-06-05T18:51:51.853' AS DateTime), N'Cancel hold money because paid request with title: Learn Skill Ruby', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (19, N'benjamin_anderson', 15, CAST(600000 AS Decimal(15, 0)), CAST(N'2024-06-05T18:54:51.650' AS DateTime), N'Hold money by request with title: Learn Apache Cassandra', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (20, N'benjamin_anderson', 15, CAST(600000 AS Decimal(15, 0)), CAST(N'2024-06-05T18:55:44.007' AS DateTime), N'Return the money hold by request with title: Learn Apache Cassandra', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (21, N'sophia_martinez', 16, CAST(600000 AS Decimal(15, 0)), CAST(N'2024-06-05T19:32:30.617' AS DateTime), N'Hold money by request with title: Request PowerShell', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (22, N'sophia_martinez', 17, CAST(900000 AS Decimal(15, 0)), CAST(N'2024-06-05T19:34:05.287' AS DateTime), N'Hold money by request with title: Learn Apache Cassandra', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (23, N'sophia_martinez', 17, CAST(900000 AS Decimal(15, 0)), CAST(N'2024-06-05T19:37:23.913' AS DateTime), N'Cancel hold money because paid request with title: Learn Apache Cassandra', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (24, N'ava_taylor', 3, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:29:03.933' AS DateTime), N'Hold money by request with title: Learn Python', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (25, N'ava_taylor', 3, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:32:29.470' AS DateTime), N'Return the money hold by request with title: Learn Python', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (26, N'ava_taylor', 6, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:36:05.903' AS DateTime), N'Hold money by request with title: Learn Javascript', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (27, N'hieu', 8, CAST(400000 AS Decimal(15, 0)), CAST(N'2024-06-05T15:07:48.863' AS DateTime), N'Cancel hold money because paid request with title: Learn C', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (28, N'sophia_martinez', 16, CAST(600000 AS Decimal(15, 0)), CAST(N'2024-06-05T19:35:20.597' AS DateTime), N'Return the money hold by request with title: Request PowerShell', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (29, N'ava_taylor', 4, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T14:30:50.463' AS DateTime), N'Hold money by request with title: Learn SQL', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (30, N'hieu', 8, CAST(400000 AS Decimal(15, 0)), CAST(N'2024-06-05T15:05:26.693' AS DateTime), N'Hold money by request with title: Learn C', 1)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (31, N'ava_taylor', 11, CAST(300000 AS Decimal(15, 0)), CAST(N'2024-06-05T15:21:54.260' AS DateTime), N'Cancel hold money because paid request with title: Learn Java', 0)
INSERT [dbo].[Hold] ([hold_id], [user_name], [request_id], [amount], [create_date], [message], [hold]) VALUES (32, N'hieu', 12, CAST(450000 AS Decimal(15, 0)), CAST(N'2024-06-05T16:37:02.033' AS DateTime), N'Cancel hold money because paid request with title: Request Ruby', 0)
SET IDENTITY_INSERT [dbo].[Hold] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (1, NULL, N'michael_jones', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (2, NULL, N'emily_davis', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (3, NULL, N'william_brown', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (4, NULL, N'olivia_johnson', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (5, NULL, N'james_wilson', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (6, NULL, N'sophia_martinez', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (7, NULL, N'benjamin_anderson', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (8, NULL, N'ava_taylor', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (9, NULL, N'hieu', CAST(N'2024-06-01T00:00:00.000' AS DateTime), CAST(7000000 AS Decimal(15, 0)), N'Nap tien')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (10, N'hieu', N'manager', CAST(N'2024-06-05T14:24:56.210' AS DateTime), CAST(400000 AS Decimal(15, 0)), N'Pay request to mentor with title: Learn Javascript')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (11, N'ava_taylor', N'manager', CAST(N'2024-06-05T14:32:54.347' AS DateTime), CAST(300000 AS Decimal(15, 0)), N'Pay request to mentor with title: Learn PHP')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (12, N'hieu', N'manager', CAST(N'2024-06-05T15:07:48.867' AS DateTime), CAST(400000 AS Decimal(15, 0)), N'Pay request to mentor with title: Learn C')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (13, N'ava_taylor', N'manager', CAST(N'2024-06-05T15:21:54.263' AS DateTime), CAST(300000 AS Decimal(15, 0)), N'Pay request to mentor with title: Learn Java')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (14, N'hieu', N'manager', CAST(N'2024-06-05T16:37:02.033' AS DateTime), CAST(450000 AS Decimal(15, 0)), N'Pay request to mentor with title: Request Ruby')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (15, N'benjamin_anderson', N'manager', CAST(N'2024-06-05T18:51:51.857' AS DateTime), CAST(600000 AS Decimal(15, 0)), N'Pay request to mentor with title: Learn Skill Ruby')
INSERT [dbo].[Transactions] ([transaction_id], [user_send], [user_receive], [create_date], [amount], [message]) VALUES (16, N'sophia_martinez', N'manager', CAST(N'2024-06-05T19:37:23.917' AS DateTime), CAST(900000 AS Decimal(15, 0)), N'Pay request to mentor with title: Learn Apache Cassandra')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (1, 2, 3, N'hieu', N'Absent', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (2, 2, 1, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (3, 2, 4, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (4, 2, 8, N'hieu', NULL, NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (5, 5, 6, N'ava_taylor', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (6, 5, 9, N'ava_taylor', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (7, 5, 7, N'ava_taylor', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (8, 8, 22, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (9, 8, 21, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (10, 8, 24, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (11, 8, 30, N'hieu', N'Absent', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (12, 11, 23, N'ava_taylor', N'Absent', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (13, 11, 27, N'ava_taylor', N'Absent', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (14, 11, 25, N'ava_taylor', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (15, 12, 40, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (16, 12, 41, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (17, 12, 44, N'hieu', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (18, 14, 43, N'benjamin_anderson', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (19, 14, 42, N'benjamin_anderson', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (20, 14, 38, N'benjamin_anderson', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (21, 14, 49, N'benjamin_anderson', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (22, 17, 39, N'sophia_martinez', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (23, 17, 58, N'sophia_martinez', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (24, 17, 56, N'sophia_martinez', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (25, 17, 55, N'sophia_martinez', N'Absent', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (26, 17, 57, N'sophia_martinez', N'Attended', NULL)
INSERT [dbo].[Attendance] ([attendance_id], [request_id], [selected_id], [mentee_name], [attendance_status], [attendance_date]) VALUES (27, 17, 59, N'sophia_martinez', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Attendance] OFF
GO
SET IDENTITY_INSERT [dbo].[Blogs] ON 

INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (1, N'1.jpg', N'https://dotnettipoftheday.org/moi-thu-ve-ngon-ngu-lap-trinh-c-sharp/', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (2, N'2.jpg', N'https://vtiacademy.edu.vn/ban-nen-hoc-ngon-ngu-lap-trinh-java-vi-ly-do-nay.html', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (3, N'3.png', N'https://teky.edu.vn/blog/ngon-ngu-sql/', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (4, N'4.png', N'https://www.greenacademy.edu.vn/kien-thuc-lap-trinh/javascript-la-gi-ung-dung-cua-ngon-ngu-javascript', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (5, N'5.png', N'https://vn.got-it.ai/blog/ngon-ngu-html-la-gi-vai-tro-cua-html-trong-website', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (6, N'6.jpg', N'https://zilatech.vn/ngon-ngu-php-la-gi-kien-thuc-tong-quan-cho-nguoi-moi-bat-dau/', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (7, N'7.png', N'https://mindx.edu.vn/blog/ngon-ngu-python', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (8, N'8.jpg', N'https://monamedia.co/reactjs-la-gi/', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (9, N'9.jpg', N'https://jobs.hybrid-technologies.vn/blog/tim-hieu-ve-ngon-ngu-lap-trinh-c/', 1)
INSERT [dbo].[Blogs] ([blog_id], [img], [link], [status]) VALUES (10, N'10.jpg', N'https://cloud.z.com/vn/en/news/ruby/', 1)
SET IDENTITY_INSERT [dbo].[Blogs] OFF
GO
