
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
    status_name VARCHAR(100)
);
GO

-- Create Roles table
CREATE TABLE Roles(
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    role_name VARCHAR(100)
);
GO

-- Create Accounts table
CREATE TABLE Accounts(
    [user_name] VARCHAR(200) PRIMARY KEY,
    gmail NVARCHAR(200) NOT NULL,
    full_name NVARCHAR(100),
    [pass_word] VARCHAR(200) NOT NULL,
    dob DATE,
    sex BIT,
    [address] NVARCHAR(200),
    phone VARCHAR(100),
    avatar VARCHAR(250),
    role_id INT FOREIGN KEY REFERENCES Roles(role_id),
    status_id INT FOREIGN KEY REFERENCES AccountStatuses(status_id)
);
GO

-- Create Mentees table
CREATE TABLE Mentees(
    mentee_name VARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
    PRIMARY KEY (mentee_name)
);
GO

-- Create Mentors table
CREATE TABLE Mentors(
    mentor_name VARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
    rate INT,
    PRIMARY KEY (mentor_name)
);
GO

-- Create Managers table
CREATE TABLE Managers(
    manager_name VARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
    PRIMARY KEY (manager_name)
);
GO

-- Create Skills table
CREATE TABLE Skills(
    skill_id INT IDENTITY(1,1) PRIMARY KEY,
    skill_name NVARCHAR(200) NOT NULL,
    img NVARCHAR(300),
    [description] NVARCHAR(600),
    [status] BIT
);
GO

CREATE TABLE CVStatus(
	status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name VARCHAR(100)
)
GO
-- Create CV table
CREATE TABLE CV(
    cv_id INT IDENTITY(1,1) PRIMARY KEY,
    mentor_name VARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
    gmail VARCHAR(200) NOT NULL,
    full_name NVARCHAR(100),
    dob DATE,
    sex BIT,
    [address] NVARCHAR(200),
    profession NVARCHAR(200),
    profession_intro NVARCHAR(1000),
    achievement_description NVARCHAR(1000),
    service_description NVARCHAR(1000),
    avatar VARCHAR(250),
	status_id INT FOREIGN KEY REFERENCES CVStatus(status_id),
	note NVARCHAR(1000)
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
    slot_id VARCHAR(50) PRIMARY KEY,
    slot_name NVARCHAR(100)
);
GO

-- Create Cycle table
CREATE TABLE Cycle(
    cycle_id INT IDENTITY(1,1) PRIMARY KEY,
	start_time DATE,
	end_time DATE,
	note NVARCHAR(1000),
	mentor_name VARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
	deadline_date DATE
	UNIQUE(start_time, end_time, mentor_name)
);
GO

-- Create Status_Selected table
CREATE TABLE Status_Selected(
	status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name VARCHAR(50)
);
GO

-- Create Selected_Slot table
CREATE TABLE Selected_Slot(
    selected_id INT IDENTITY(1,1) PRIMARY KEY,
    slot_id VARCHAR(50) FOREIGN KEY REFERENCES Slots(slot_id),
    cycle_id INT FOREIGN KEY REFERENCES Cycle(cycle_id),
	day_of_slot DATE,
    status_id INT FOREIGN KEY REFERENCES Status_Selected(status_id),
);
GO


-- Create RequestStatuses table
CREATE TABLE RequestStatuses(
    status_id INT IDENTITY(1,1) PRIMARY KEY,
    status_name VARCHAR(100)
);
GO

-- Create RequestsFormMentee table
CREATE TABLE RequestsFormMentee(
    request_id INT IDENTITY(1,1) PRIMARY KEY,
    mentor_name VARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
    mentee_name VARCHAR(200) FOREIGN KEY REFERENCES Mentees(mentee_name),
    deadline_date DATE,
    deadline_hour TIME,
    title NVARCHAR(200),
    [description] NVARCHAR(200),
    status_id INT FOREIGN KEY REFERENCES RequestStatuses(status_id),
	price INT,
	note NVARCHAR(1000)
);
GO 
CREATE TABLE RquestSelectedSlot(
	request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
	selected_id INT FOREIGN KEY REFERENCES Selected_Slot(selected_id)
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
    mentor_name VARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
    mentee_name VARCHAR(200) FOREIGN KEY REFERENCES Mentees(mentee_name),
    star INT,
    comment NVARCHAR(1000),
    time_feedback DATE,
    PRIMARY KEY (mentor_name, mentee_name)
)
GO
CREATE TABLE Wallet(
	wallet_id VARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	real_binance DECIMAL(15, 0),
	avaiable_binance DECIMAL(15, 0),
)

GO
CREATE TABLE Transactions(
	transaction_id INT IDENTITY(1,1) PRIMARY KEY,
	user_send VARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	user_receive VARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	create_date DATETIME,
	amount DECIMAL(15, 0),
	[message] NVARCHAR(1000)
)


GO
-- Insert into AccountStatuses
INSERT INTO AccountStatuses (status_name) VALUES ('Active');
INSERT INTO AccountStatuses (status_name) VALUES ('Inactive');
INSERT INTO AccountStatuses (status_name) VALUES ('Pending');
GO

-- Insert into Roles
INSERT INTO Roles (role_name) VALUES ('Mentee');
INSERT INTO Roles (role_name) VALUES ('Mentor');
INSERT INTO Roles (role_name) VALUES ('Manager');
GO

-- Insert into Accounts
INSERT INTO Accounts ([user_name], gmail, full_name, [pass_word], dob, sex, [address], phone, avatar, role_id, status_id) VALUES
 ('truong', 'truongtnhe170291@fpt.edu.vn', 'Tran Nam Truong', '1', '1990-01-01', 1, '123 Main St', '1234567890', 'mentee1.jpg', 1, 1),
 ('hieu', 'hieuvq@fpt.edu.vn', 'Vu Quang Hieu', '1', '1991-02-02', 0, '456 Elm St', '0987654321', 'mentee2.jpg', 1, 1),
 ('minh', 'minhvq@fpt.edu.vn', 'Vu Quang Minh', '1', '1992-03-03', 1, '789 Oak St', '1112223333', 'mentor1.jpg', 2, 1),
 ('son', 'sonph@fpt.edu.vn', 'Pham Hung Son', '1', '2003-03-03', 1, '456 HN St', '0977333888', 'mentor2.jpg', 2, 1),
 ('abc', 'abc@fpt.edu.vn', 'Nguyen Van A', '1', '2003-03-03', 1, '456 HN St', '0977333888', 'mentor2.jpg', 2, 1),
 ('xyz', 'xyz@fpt.edu.vn', 'Do Van X', '1', '2003-03-03', 1, '456 HN St', '0977333888', 'mentor2.jpg', 2, 1),
 ('manager', 'manager@fpt.edu.vn', 'Manager', '1', '2002-03-03', 1, '456 HN St', '0977333888', 'manager.jpg', 3, 1);
GO

-- Insert into Mentees
INSERT INTO Mentees (mentee_name) VALUES 
('truong'),
('hieu');
GO

-- Insert into Mentors
INSERT INTO Mentors (mentor_name, rate) VALUES 
('minh', 200000),
('abc', null),
('xyz', 250000),
('son', 200000);
GO
INSERT INTO Managers (manager_name) VALUES 
('manager');
GO
-- Insert into Skills
INSERT INTO Skills (skill_name, img, [description], [status]) VALUES 
('Java Programming','java.jpg', 'Java development skills', 1),
('Database Management','database.jpg', 'Database administration and management', 1),
('Web Development','web.jpg', 'HTML, CSS, JavaScript skills', 1),
('Data Analysis', 'DataAnalysis.jpg', 'Process of inspecting and modeling data.', 1),
('Graphic Design', 'GraphicDesign.jpg', 'Visual content creation.', 1),
('Cybersecurity', 'Cybersecurity.jpg', 'Protection of internet-connected systems.', 1);
GO

INSERT INTO CVStatus (status_name) VALUES ('Pending');
INSERT INTO CVStatus (status_name) VALUES ('Approved');
INSERT INTO CVStatus (status_name) VALUES ('Rejected');
INSERT INTO CVStatus (status_name) VALUES ('Saveed');

GO
-- Insert into FeedBacks
INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES 
('minh', 'truong', 5, 'Excellent mentor', '2024-05-01'),
('son', 'hieu', 4, 'Very helpful', '2024-05-02'),
('son', 'truong', 4, 'GOOD', '2024-05-02');
GO



INSERT INTO CV (mentor_name,gmail, full_name, dob, sex, [address], profession, profession_intro, achievement_description, service_description, avatar, status_id, note) 
VALUES 
('minh', 'example1@gmail.com', 'John Doe', '1985-01-15', 1, '123 Main St', 'Software Engineer', 'Experienced in Java and Python', 'Created a successful app', 'Offering software development services', 'avatar1.jpg', 1, null),
('son', 'example2@gmail.com', 'Jane Smith', '1990-02-20', 0, '456 Elm St', 'Graphic Designer', 'Expert in Adobe Suite', 'Designed award-winning logos', 'Providing graphic design services', 'avatar2.jpg', 2, 'Thông tin OK'),
('abc', 'example3@gmail.com', 'Alice Johnson', '1987-03-10', 0, '789 Oak St', 'Data Scientist', 'Specialized in machine learning', 'Published papers in AI', 'Offering data analysis services', 'avatar3.jpg', 3, 'Thông tin OK'),
('xyz', 'example4@gmail.com', 'Bob Brown', '1982-04-25', 1, '101 Maple St', 'Network Engineer', 'Expert in network infrastructure', 'Implemented large scale networks', 'Providing network engineering services', 'avatar4.jpg', 1, null);

GO

-- Insert into CVSkills
INSERT INTO CVSkills (skill_id, cv_id) VALUES (1, 1);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (2, 1);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (3, 1);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (3, 2);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (4, 2);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (5, 3);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (6, 3);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (1, 4);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (3, 4);
INSERT INTO CVSkills (skill_id, cv_id) VALUES (5, 4);

GO
INSERT INTO Slots (slot_id, slot_name) VALUES ('SLOT01', '7:00 - 9:00');
INSERT INTO Slots (slot_id, slot_name) VALUES ('SLOT02', '9:00 - 11:00');
INSERT INTO Slots (slot_id, slot_name) VALUES ('SLOT03', '13:00 - 15:00');
INSERT INTO Slots (slot_id, slot_name) VALUES ('SLOT04', '15:00 - 17:00');

GO

INSERT INTO Status_Selected(status_name) VALUES 
('Pending'),
('Approved'),
('Rejected'),
('Not yet'),
('attended'),
('Saved'),
('Wait For Payment'),
('Out Of Date')

GO

/*INSERT INTO Cycle(start_time, end_time, note, mentor_name, deadline_date) VALUES
('2024-06-24', '2024-07-22', '', 'son', '2024-06-20'),
('2024-06-24', '2024-07-22', '', 'minh', '2024-06-20')

GO

INSERT INTO Selected_Slot(slot_id, cycle_id, day_of_slot, status_id)
VALUES 
('SLOT02', 1, '2024-06-24', 2),
('SLOT02', 1, '2024-07-01', 2),
('SLOT02', 1, '2024-07-08', 2),
('SLOT02', 1, '2024-07-15', 2),
('SLOT01', 1, '2024-06-30', 2),
('SLOT01', 1, '2024-07-07', 2),
('SLOT01', 1, '2024-07-14', 2),
('SLOT01', 1, '2024-07-21', 2),
('SLOT03', 2, '2024-07-07', 1),
('SLOT02', 2, '2024-07-05', 1),
('SLOT01', 2, '2024-06-30', 2),
('SLOT04', 2, '2024-06-28', 2)

GO
*/
-- Insert into RequestStatuses
INSERT INTO RequestStatuses (status_name) VALUES ('Open Class');
INSERT INTO RequestStatuses (status_name) VALUES ('Processing');
INSERT INTO RequestStatuses (status_name) VALUES ('Rejected');
INSERT INTO RequestStatuses (status_name) VALUES ('Out Of Date');
INSERT INTO RequestStatuses (status_name) VALUES ('Wait For Payment');
INSERT INTO RequestStatuses (status_name) VALUES ('Saved');
GO
/*
INSERT INTO RequestsFormMentee (mentor_name, mentee_name, deadline_date, deadline_hour, title, [description], status_id, price, note)
VALUES 
('son', 'truong', '2024-06-15', '08:00:00', 'Book Schedule', 'Seeking guidance on project implementation', 1, 400000, ''),
('son', 'truong', '2024-06-15', '08:00:00', 'Book Schedule', 'Seeking guidance on project implementation', 2, 200000, ''),
('son', 'hieu', '2024-06-10', '08:00:00', 'Book Schedule', 'Seeking guidance on project implementation', 2, 200000, ''),
('son', 'hieu', '2024-06-11', '08:00:00', 'Book Schedule', 'Seeking guidance on project implementation', 3, 200000, 'Toi Tu Choi')

GO
INSERT INTO RquestSelectedSlot(request_id, selected_id)
VALUES 
(1, 3), 
(1, 5),
(2, 5),
(3, 3),
(4, 5);

GO
-- Insert data into RequestSkills table
INSERT INTO RequestSkills (skill_id, request_id)
VALUES 
(3, 1), -- Example values, replace with actual data
(4, 2),
(4, 3),
(4, 4)

GO
*/
/*
INSERT INTO Wallet(wallet_id, real_binance, avaiable_binance)
VALUES 
('truong', 1000000, 1000000)

GO
INSERT INTO Transactions(user_send, user_receive, create_date, amount, [message])
VALUES
(null, 'truong', '2024-06-15', 1000000, 'Nap tien')*/