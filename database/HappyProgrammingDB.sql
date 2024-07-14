
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
)
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
    slot_id NVARCHAR(50) PRIMARY KEY,
    slot_name NVARCHAR(100)
);
GO

-- Create Cycle table
CREATE TABLE Cycle(
    cycle_id INT IDENTITY(1,1) PRIMARY KEY,
	start_time DATE,
	end_time DATE,
	note NVARCHAR(1000),
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
	feedback_id INT IDENTITY(1,1) PRIMARY KEY,
	request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
    mentor_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentors(mentor_name),
    mentee_name NVARCHAR(200) FOREIGN KEY REFERENCES Mentees(mentee_name),
    star INT,
    comment NVARCHAR(1000),
    time_feedback DATE,
)
GO
CREATE TABLE Wallet(
	wallet_id NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	real_balance DECIMAL(15, 0),
	hold DECIMAL(15, 0)
)

GO
CREATE TABLE Hold(
	[user_name] NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	request_id INT FOREIGN KEY REFERENCES RequestsFormMentee(request_id),
	amount DECIMAL(15, 0),
	create_date DATETIME,
	[message] NVARCHAR(1000),
	hold bit
)
GO
CREATE TABLE Transactions(
	transaction_id INT IDENTITY(1,1) PRIMARY KEY,
	user_send NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	user_receive NVARCHAR(200) FOREIGN KEY REFERENCES Accounts([user_name]),
	create_date DATETIME,
	amount DECIMAL(15, 0),
	[message] NVARCHAR(1000)
)
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
('Web Development','web.jpg', 'Web development involves creating websites and web applications that are accessible via the internet or an intranet. It encompasses several key components and technologies:

Front-end Development: This involves creating the user interface and user experience (UI/UX) of a website. It typically uses languages like HTML (Hypertext Markup Language), CSS (Cascading Style Sheets), and JavaScript. Frameworks like React, Angular, and Vue.js are commonly used to streamline front-end development.

Back-end Development: This focuses on server-side logic and interactions, managing databases, and ensuring the smooth functioning of web applications. Popular back-end languages include JavaScript (Node.js), Python (Django, Flask), Ruby (Ruby on Rails), PHP, and Java.

Database Management: Websites often require data storage and retrieval. Common databases used in web development include MySQL, PostgreSQL, MongoDB (NoSQL), and SQLite.

Full-Stack Development: Full-stack developers work on both the front-end and back-end aspects of a website or application. They are proficient in both server-side and client-side programming and understand how to integrate these components to create a cohesive web experience.

Web Servers and Deployment: Websites need to be hosted on web servers for users to access them. Technologies like Apache, Nginx, and Microsoft IIS are used to serve web pages. Deployment involves configuring servers, managing domain names, and ensuring security (e.g., HTTPS).

Responsive Design and Accessibility: With the increasing diversity of devices accessing the web, responsive design ensures websites look and function well on various screen sizes and devices. Accessibility ensures that websites are usable by people with disabilities, adhering to standards like WCAG (Web Content Accessibility Guidelines).

Security: Web developers must consider security aspects such as protecting against vulnerabilities like SQL injection, cross-site scripting (XSS), and ensuring data privacy and user authentication.

Web APIs: APIs (Application Programming Interfaces) allow different software applications to communicate and interact. They are crucial for integrating third-party services, accessing databases, and enabling functionalities like payment processing or social media logins.', 1);



INSERT INTO Skills (skill_name, img, [description], [status]) VALUES
('CSS', 'CSS.jpg', 'CSS (Cascading Style Sheets) is a stylesheet language used to define the presentation and styling of HTML elements on a web page. It allows web developers to control the appearance of their web pages, including layout, colors, fonts, spacing, and more.

Key aspects of CSS include:

Selectors: CSS selectors are patterns used to select and style elements in HTML documents. Selectors can target elements based on their type (p, h1, div), class (.classname), ID (#idname), attributes, relationships between elements, and more.

Properties and Values: CSS properties define what aspects of an element''s style will be changed, such as color, font-size, margin, padding, background-color, border, etc. Each property has a corresponding value that specifies how the property should be applied.

Cascade and Specificity: The "Cascading" in CSS refers to the way styles are applied from multiple sources (author, user, browser defaults) and how conflicts are resolved based on specificity and the order of rules. Specificity determines which styles take precedence when multiple rules apply to the same element.

Units: CSS supports various units for specifying lengths and sizes, such as pixels (px), percentages (%), ems (em), rems (rem), viewport units (vw, vh), etc. These units help make designs responsive and adaptable to different screen sizes and devices.

Box Model: The CSS box model describes how elements are structured and sized, including content area, padding, border, and margin. Understanding the box model is crucial for controlling spacing and layout.

Flexbox and Grid: CSS includes layout models like Flexbox and Grid Layout that provide powerful tools for creating responsive and complex layouts with ease. Flexbox is designed for one-dimensional layouts (rows or columns), while Grid Layout allows for two-dimensional layouts.

Media Queries: Media queries in CSS enable developers to apply different styles based on the characteristics of the device or viewport, such as screen width, height, orientation, or resolution. This is essential for creating responsive designs that adapt to different devices and screen sizes.

CSS Preprocessors: CSS preprocessors like Sass and LESS extend the capabilities of CSS by adding features like variables, nesting, mixins, and functions. They help streamline CSS development and make stylesheets more maintainable and reusable.', 1);
GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('Python', 'python.jfif', 'Python is a versatile programming language known for its simple syntax, readability, and ease of learning. Here are some key features and applications of Python:

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
6. Embedded Software Development: Python is also used in embedded software projects, such as those involving Raspberry Pi.', 1);
GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('C', 'CC.jpg', 'C is a powerful and efficient programming language that has been widely used for system programming, developing operating systems, and creating software that requires high performance. Here are some key features and applications of C:

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
Utilities and Tools: Various utilities and development tools, such as text editors and network utilities, are written in C.', 1);
GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('C++', 'C++.jpg', 'C++ is a versatile and powerful programming language that builds on the foundation of C, adding support for object-oriented programming and other modern programming paradigms. Here are some key features and applications of C++:

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
Scientific Computing: C++ is used in scientific computing and simulations that require high performance and precise calculations.', 1);
GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('Java', 'java.jpg', 'Java is a powerful and versatile programming language developed by Sun Microsystems (now owned by Oracle). It is one of the most widely used languages globally, known for its platform independence and extensive use in applications ranging from desktop software to complex enterprise systems. Below are some key features and applications of Java:

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
Server-side Applications: Java is a preferred choice for developing server-side applications, including database management systems and web services.', 1);

GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('C#', 'Csharp.png', 'C# (pronounced as "C sharp") is a modern and versatile programming language developed by Microsoft. It is designed for building a wide range of applications on the .NET framework. Here are some key features and applications of C#:

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
Cloud Services: C# is used for developing cloud-based applications and services on platforms like Microsoft Azure.', 1);

GO

INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('JavaScript', 'javaScript.png', 'JavaScript is a versatile and widely-used programming language primarily known for its role in web development. Originally developed by Netscape, it has evolved into a fundamental technology for building interactive and dynamic web pages. Here are some key features and applications of JavaScript:

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
Desktop Applications: With frameworks like Electron, JavaScript can be used to develop desktop applications for Windows, macOS, and Linux.', 1);

GO

INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('Ruby', 'Ruby.jpg', 'Ruby is a dynamic, reflective, object-oriented programming language known for its simplicity and productivity. Developed in the mid-1990s by Yukihiro Matsumoto ("Matz"), Ruby has gained popularity for its elegant syntax and focus on developer happiness. Here are some key features and applications of Ruby:

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
Game Development: While less common than in other domains, Ruby has been used for game development through frameworks like Gosu.', 1);

GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('PHP', 'php.png', 'PHP (Hypertext Preprocessor) is a widely-used open-source scripting language designed for web development. Originally created by Rasmus Lerdorf in 1994, PHP has evolved into a powerful server-side scripting language. Here are some key features and applications of PHP:

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
API Development: PHP is used for developing APIs (Application Programming Interfaces) to facilitate communication between different software systems.', 1);

GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('SQL', 'sql.jpg', 'SQL (Structured Query Language) is a standard language for managing and manipulating relational databases. It is essential for storing, querying, and managing data in databases. Here are some key features and aspects of SQL:

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
Data Migration and Integration: SQL is employed in data migration tasks to transfer data between databases and in data integration processes to consolidate data from different sources.', 1);

GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('Adobe Photoshop', 'photoshop.jpg', 'Adobe Photoshop is a powerful software application used primarily for editing and manipulating digital images. It offers a wide range of tools and features that cater to both professional graphic designers and casual users looking to enhance their photos. Here are some key aspects and capabilities of Adobe Photoshop:

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
Multimedia Projects: It is used in multimedia projects for creating visuals and graphics for presentations, interactive content, and multimedia storytelling.', 1);

GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('Data Analysis', 'DataAnalysis.jpg', 'Data analysis is the process of inspecting, cleansing, transforming, and modeling data with the goal of discovering useful information, informing conclusions, and supporting decision-making. It involves a variety of techniques and methods to extract insights from data, which can range from simple descriptive statistics to complex machine learning algorithms. Here are some key aspects and steps involved in data analysis:

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
Social Sciences and Public Policy: Analyzing survey data, demographic trends, and public opinion to inform policy-making and social research.', 1);

GO
INSERT INTO Skills (skill_name, img, [description], [status])
VALUES ('PowerShell', 'Shell.jpg', 'Shell is a command-line interface or graphical user interface that allows users to interact with the operating system and applications using command-line commands. Popular types of shells include Bash and PowerShell, each with their own characteristics and applications:

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
Cloud Management: Use PowerShell to manage and automate cloud computing resources such as Microsoft Azure.', 1);

GO

INSERT INTO CVStatus (status_name) VALUES ('Pending');
INSERT INTO CVStatus (status_name) VALUES ('Approved');
INSERT INTO CVStatus (status_name) VALUES ('Rejected');
INSERT INTO CVStatus (status_name) VALUES ('Draft');

GO
-- Insert into FeedBacks
/*INSERT INTO FeedBacks (mentor_name, mentee_name, star, comment, time_feedback) VALUES 
('minh', 'truong', 5, 'Excellent mentor', '2024-05-01'),
('son', 'hieu', 4, 'Very helpful', '2024-05-02'),
('son', 'truong', 4, 'GOOD', '2024-05-02');
GO
*/


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
('Saved'),
('Out Of Date'),
('Done')

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