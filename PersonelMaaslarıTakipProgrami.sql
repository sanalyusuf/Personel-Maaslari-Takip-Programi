USE master
GO
/****** Veritabanýný Oluþturma ******/
CREATE DATABASE _db
ON PRIMARY 
(NAME = '_db', FILENAME = 'd:\_db.mdf', SIZE = 5120KB, FILEGROWTH = 1024KB)
 LOG ON 
(NAME = '_db_log', FILENAME = 'd:\_db_log.ldf', SIZE = 1024KB , FILEGROWTH = 1024KB)
GO
ALTER DATABASE _db SET COMPATIBILITY_LEVEL = 160
GO
USE _db
GO

-- bölümler tablosu
CREATE TABLE [dbo].[tbl_Departments](
	[Dept_ID] [int] NOT NULL,
	[Dept_Name] [nvarchar](50) NULL,
	[Dept_Phone] [nchar](10) NULL,
	[Manager_ID] [int] NULL,
 CONSTRAINT [PK_tbl_Departments] PRIMARY KEY CLUSTERED 
(
	[Dept_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- çalýþanlar tablosu
CREATE TABLE [dbo].[tbl_Employees](
	[Empl_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_FName] [nvarchar](50) NOT NULL,
	[Empl_LName] [nvarchar](50) NOT NULL,
	[Empl_BDate] [smalldatetime] NULL,
	[Is_Empl_Active] [bit] NULL,
	[Empl_Start_Date] [smalldatetime] NULL,
	[Empl_Wage] [money] NULL,
	[Gender_ID] [int] NULL,
	[Title_ID] [int] NULL,
	[Dept_ID] [int] NULL,
	[Empl_Email] [nvarchar](50) NULL,
	[Empl_Cell] [nchar](15) NULL,
	[Empl_City] [nvarchar](50) NULL,
	[Empl_Address] [nvarchar](50) NULL,
	[Empl_Name]  AS (([Empl_FName]+' ')+[Empl_LName]),
	[Empl_Photo] [varbinary](50) NULL,
	[Empl_CV] [nchar](10) NULL,
	[Empl_CV_File] [text] NULL,
	[Empl_CV_Web] [varchar](50) NULL,
	[Entered_By] [varchar](50) NULL,
	[Entered_Date] [smalldatetime] NULL,
	[Empl_Province] [nchar](10) NULL,
	[Empl_Left_Date] [smalldatetime] NULL,
 CONSTRAINT [PK_tbl_Employees] PRIMARY KEY CLUSTERED 
(
	[Empl_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
-- Maaþlar tablosu
CREATE TABLE [dbo].[tbl_EmployeeWages](
	[Wage_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_ID] [int] NULL,
	[Wage_Paid_Date] [smalldatetime] NULL,
	[Wage_Amount] [money] NULL,
	[Wage_Commission] [money] NULL,
	[Month_ID] [int] NULL,
	[Wage_Year]  AS (datepart(year,[Wage_Paid_Date])),
	[Wage_Total]  AS ([Wage_Amount]+[Wage_Commission]),
 CONSTRAINT [PK_tbl_EmployeeWages] PRIMARY KEY CLUSTERED 
(
	[Wage_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- kategoriler tablosu
CREATE TABLE [dbo].[tbl_Lookups](
	[LK_ID] [int] IDENTITY(1,1) NOT NULL,
	[Empl_Title] [nvarchar](50) NULL,
	[Gender] [nvarchar](50) NULL,
	[Month_Name] [nvarchar](50) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[User_Type] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Role] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Lookups] PRIMARY KEY CLUSTERED 
(
	[LK_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

-- kullanýcýlar tablosu
CREATE TABLE [dbo].[tbl_Users](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](50) NULL,
	[User_Password] [nvarchar](50) NULL,
	[User_Type_ID] [int] NULL,
	[Role_ID] [nchar](10) NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Verileri Girme ******/
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Manager_ID]) VALUES (3, N'Satýþ', N'1234      ', 1)
INSERT [dbo].[tbl_Departments] ([Dept_ID], [Dept_Name], [Dept_Phone], [Manager_ID]) VALUES (4, N'Pazarlama', N'44444     ', 2)
GO
SET IDENTITY_INSERT [dbo].[tbl_Employees] ON 

INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Dept_ID], [Empl_Email], [Empl_Cell], [Empl_City], [Empl_Address], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Empl_Province], [Empl_Left_Date]) VALUES (1, N'Mustafa', N'Çoruh', CAST(N'2000-03-03T00:00:00' AS SmallDateTime), 1, CAST(N'2023-04-15T13:53:00' AS SmallDateTime), 0.0000, 3, 1, 3, N'mc@mc.com', N'1234           ', N'Ereðli', N'Zonguldak Ereðli', NULL, N'          ', N'', N'', N'', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), N'Zonguldak ', CAST(N'2024-01-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Dept_ID], [Empl_Email], [Empl_Cell], [Empl_City], [Empl_Address], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Empl_Province], [Empl_Left_Date]) VALUES (2, N'Meliha', N'Diniz', CAST(N'2000-04-04T00:00:00' AS SmallDateTime), 0, CAST(N'2023-04-15T13:54:00' AS SmallDateTime), 0.0000, 2, 2, 4, N'ms@mc.com', N'3333           ', N'Kemah', N'Erzincan Kemah', NULL, N'          ', N'', N'', N'', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), N'Erzincan  ', CAST(N'2024-02-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Dept_ID], [Empl_Email], [Empl_Cell], [Empl_City], [Empl_Address], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Empl_Province], [Empl_Left_Date]) VALUES (3, N'Nazife', N'Yýlmaz', CAST(N'2000-03-04T00:00:00' AS SmallDateTime), 1, CAST(N'2023-04-15T14:29:00' AS SmallDateTime), 0.0000, 2, 3, 4, N'my@mc.com', N'4444           ', N'Ümraniye', N'Ümraniye Çarþý', NULL, N'          ', N'', N'', N'', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), N'Ýstanbul  ', CAST(N'2024-03-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Dept_ID], [Empl_Email], [Empl_Cell], [Empl_City], [Empl_Address], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Empl_Province], [Empl_Left_Date]) VALUES (4, N'Murat', N'Gül', CAST(N'1999-04-05T00:00:00' AS SmallDateTime), 1, CAST(N'2023-04-15T15:40:00' AS SmallDateTime), 4000.0000, 3, 3, 3, N'mz@mc.com', N'5555           ', N'Altýnoluk', N'Balýkesir Altýnoluk', NULL, N'          ', N'', N'', N'', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), N'Balýkesir ', CAST(N'2024-04-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Dept_ID], [Empl_Email], [Empl_Cell], [Empl_City], [Empl_Address], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Empl_Province], [Empl_Left_Date]) VALUES (5, N'Yusuf', N'Þanal', CAST(N'2002-06-11T00:00:00' AS SmallDateTime), 1, CAST(N'2023-04-15T15:40:00' AS SmallDateTime), 40000.0000, 3, 1, 3, N'sanalyusuf34@gmail.com', N'5555           ', N'Üsküdar', N'Ýstanbul Üsküdar', NULL, N'          ', N'', N'', N'', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), N'Istanbul  ', CAST(N'2024-05-01T00:00:00' AS SmallDateTime))
INSERT [dbo].[tbl_Employees] ([Empl_ID], [Empl_FName], [Empl_LName], [Empl_BDate], [Is_Empl_Active], [Empl_Start_Date], [Empl_Wage], [Gender_ID], [Title_ID], [Dept_ID], [Empl_Email], [Empl_Cell], [Empl_City], [Empl_Address], [Empl_Photo], [Empl_CV], [Empl_CV_File], [Empl_CV_Web], [Entered_By], [Entered_Date], [Empl_Province], [Empl_Left_Date]) VALUES (6, N'Gokhan', N'Özkan', CAST(N'2002-03-04T00:00:00' AS SmallDateTime), 1, CAST(N'2023-06-08T00:12:00' AS SmallDateTime), 300500.0000, 3, 2, 3, N'mx@mc.com', N'1111           ', N'Hadýmköy', N'Ýstanbul Hadýmköy', NULL, N'          ', N'', N'', N'', CAST(N'2023-08-06T00:00:00' AS SmallDateTime), N'Ýstanbul  ', CAST(N'2024-06-01T00:00:00' AS SmallDateTime))
SET IDENTITY_INSERT [dbo].[tbl_Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] ON 

INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Paid_Date], [Wage_Amount], [Wage_Commission], [Month_ID]) VALUES (1, 1, CAST(N'2023-02-23T00:00:00' AS SmallDateTime), 10000.0000, 0.0000, 2)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Paid_Date], [Wage_Amount], [Wage_Commission], [Month_ID]) VALUES (2, 1, CAST(N'2023-03-15T14:59:00' AS SmallDateTime), 10000.0000, 0.0000, 3)
INSERT [dbo].[tbl_EmployeeWages] ([Wage_ID], [Empl_ID], [Wage_Paid_Date], [Wage_Amount], [Wage_Commission], [Month_ID]) VALUES (3, 2, CAST(N'2023-02-15T15:00:00' AS SmallDateTime), 50000.0000, 0.0000, 2)
SET IDENTITY_INSERT [dbo].[tbl_EmployeeWages] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Lookups] ON 

INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (1, N'VT Yöneticisi', N'Kadýn', N'Ocak', N'Kdz. Ereðli', N'Ýstanbul', N'', N'Türkiye', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (2, N'Satýþ Elamaný', N'Erkek', N'Þubat', N'Þiþli', N'Zonguldak', N'', N'Türkiye', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (3, N'Pazarlamacý', N'Erkek', N'Mart', N'Sarýyer', N'Ankara', N'', N'Türkiye', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (4, N'Güvenlik', N'Erkek', N'Nisan', N'Üsküdar', N'Ýstanbul', N'', N'Türkiye', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (5, N'Asistan', N'Kadýn', N'Mayýs', N'Ümraniye', N'Ýstanbul', N'', N'Türkiye', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (6, N'', N'', N'Haziran', N'', N'', N'', N'', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (7, N'', N'', N'Temmuz', N'', N'', N'', N'', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (8, N'', N'', N'Aðustos', N'', N'', N'', N'', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (9, N'', N'', N'Eylül', N'', N'', N'', N'', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (10, N'', N'', N'Ekim', N'', N'', N'', N'', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (11, N'', N'', N'Kasým', N'', N'', N'', N'', N'')
INSERT [dbo].[tbl_Lookups] ([LK_ID], [Empl_Title], [Gender], [Month_Name], [City], [Province], [User_Type], [Country], [Role]) VALUES (12, N'', N'', N'Aralýk', N'', N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[tbl_Lookups] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Password], [User_Type_ID], [Role_ID]) VALUES (1, N'Yusuf', N'12345670', 1, N'          ')
INSERT [dbo].[tbl_Users] ([User_ID], [User_Name], [User_Password], [User_Type_ID], [Role_ID]) VALUES (2, N'Gokhan', N'07654321', 2, N'          ')
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO


/****** Tablo Referans Alan (Foreign Key) ve Default’larý Oluþturma ******/
ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Is_Empl_Active]  DEFAULT ((1)) FOR [Is_Empl_Active]
GO

ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Empl_Start_Date]  DEFAULT (getdate()) FOR [Empl_Start_Date]
GO

ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Empl_Wage]  DEFAULT ((0)) FOR [Empl_Wage]
GO

ALTER TABLE [dbo].[tbl_Employees] ADD  CONSTRAINT [DF_tbl_Employees_Gender_ID_1]  DEFAULT ((1)) FOR [Gender_ID]
GO

ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Departments_Dept_ID] FOREIGN KEY([Dept_ID])
REFERENCES [dbo].[tbl_Departments] ([Dept_ID])
GO

ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Departments_Dept_ID]
GO

ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Lookups] FOREIGN KEY([Gender_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO

ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Lookups]
GO

ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Lookups_Title_ID] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO

ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Lookups_Title_ID]
GO

ALTER TABLE [dbo].[tbl_Employees]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Employees_tbl_Lookups1] FOREIGN KEY([Title_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO

ALTER TABLE [dbo].[tbl_Employees] CHECK CONSTRAINT [FK_tbl_Employees_tbl_Lookups1]
GO

ALTER TABLE [dbo].[tbl_EmployeeWages] ADD  CONSTRAINT [DF_tbl_EmployeeWages_Wage_Date]  DEFAULT (getdate()) FOR [Wage_Paid_Date]
GO

ALTER TABLE [dbo].[tbl_EmployeeWages] ADD  CONSTRAINT [DF_tbl_EmployeeWages_Wage_Amount]  DEFAULT ((0)) FOR [Wage_Amount]
GO

ALTER TABLE [dbo].[tbl_EmployeeWages] ADD  CONSTRAINT [DF_tbl_EmployeeWages_Wage_Commission]  DEFAULT ((0)) FOR [Wage_Commission]
GO

ALTER TABLE [dbo].[tbl_EmployeeWages]  WITH CHECK ADD  CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employees_Empl_ID] FOREIGN KEY([Empl_ID])
REFERENCES [dbo].[tbl_Employees] ([Empl_ID])
GO

ALTER TABLE [dbo].[tbl_EmployeeWages] CHECK CONSTRAINT [FK_tbl_EmployeeWages_tbl_Employees_Empl_ID]
GO

ALTER TABLE [dbo].[tbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Users_tbl_Lookups] FOREIGN KEY([User_Type_ID])
REFERENCES [dbo].[tbl_Lookups] ([LK_ID])
GO

ALTER TABLE [dbo].[tbl_Users] CHECK CONSTRAINT [FK_tbl_Users_tbl_Lookups]
GO



/****** Tablolarý Sorgulama ******/
SELECT * FROM tbl_Lookups
SELECT * FROM tbl_Departments
SELECT * FROM tbl_Employees
SELECT * FROM tbl_EmployeeWages
SELECT * FROM tbl_Users
