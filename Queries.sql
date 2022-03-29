--CREATION OF TABLES

CREATE TABLE SchoolDetails(
	SchoolID Varchar(10) PRIMARY KEY,
	SchoolName Varchar(50) NOT NULL,
	SchoolAddress Varchar(50) NOT NULL,
	SchoolContact BIGINT UNIQUE,
	SchoolEmail Varchar(100) UNIQUE NOT NULL
);

CREATE TABLE StudentDetails(
	StudentID Varchar(10) PRIMARY KEY,
	RegistrationID BIGINT NOT NULL,
	StudentRoll INT UNIQUE,
	StudentName Varchar(60) NOT NULL,
	StudentAddress Varchar(30) NOT NULL,
	StudentMobile BIGINT UNIQUE,
	StudentLandLine BIGINT NOT NULL,
	ParentID Varchar(10) NOT NULL,
	StudentDOB DATE NOT NULL,
	StudentGender CHAR(1) NOT NULL,
	StudentEmail Varchar(100) UNIQUE NOT NULL,
	CONSTRAINT FK_Std_PrntID FOREIGN KEY (ParentID)
		REFERENCES ParentDetails (ParentID),
	CONSTRAINT FK_Student_RegID FOREIGN KEY (RegistrationID)
		REFERENCES RegistrationDetails (RegistrationID)
);

CREATE TABLE ParentDetails(
	ParentID Varchar(10) PRIMARY KEY,
	ParentName Varchar(60) NOT NULL,
	ParentContact BIGINT NOT NULL,
	ParentOccupation Varchar(20) NOT NULL,
);

CREATE TABLE RegistrationDetails(
	RegistrationID BIGINT PRIMARY KEY,
	RegistrationNumber INT NOT NULL,
	RegistrationDate DATE NOT NULL,
);

CREATE TABLE CourseDetails(
	CourseID Varchar(10) PRIMARY KEY,
	CourseName Varchar(50) NOT NULL,
	CourseDate DATE NOT NULL,
	StudentID Varchar(10) NOT NULL,
	CONSTRAINT FK_Course_StdID FOREIGN KEY (StudentID)
		REFERENCES StudentDetails (StudentID)
);

CREATE TABLE ClassDetails(
	ClassID INT PRIMARY KEY,
	ClassName Varchar(25) NOT NULL,
	StudentID Varchar(10) NOT NULL,
	CourseID Varchar(10) NOT NULL,
	TeacherID Varchar(10) NOT NULL,
	RoomID INT NOT NULL,
	ClassStartDate DATE NOT NULL,
	ClassStartTime TIME NOT NULL,
	ClassEndTime TIME NOT NULL,
	CONSTRAINT FK_Class_StdID FOREIGN KEY (StudentID)
		REFERENCES StudentDetails (StudentID),
	CONSTRAINT FK_Class_CrsID FOREIGN KEY (CourseID)
		REFERENCES CourseDetails (CourseID),
	CONSTRAINT FK_Class_TchrID FOREIGN KEY (TeacherID)
		REFERENCES TeacherDetails (TeacherID),
	CONSTRAINT FK_Class_RoomID FOREIGN KEY (RoomID)
		REFERENCES RoomDetails (RoomID)
);

CREATE TABLE TeacherDetails(
	TeacherID Varchar(10) PRIMARY KEY,
	TeacherName Varchar(50) NOT NULL,
	TeacherContact BIGINT NOT NULL,
	TeacherAddress Varchar(30) NOT NULL,
	TeacherEmail Varchar(100) UNIQUE NOT NULL,
	TeacherGender CHAR(1) NOT NULL,
	TeacherJoinedDate DATE NOT NULL
);

CREATE TABLE RoomDetails(
	RoomID INT PRIMARY KEY,
	StudentRoll INT UNIQUE NOT NULL,
);

CREATE TABLE ExamDetails(
	ExamID INT PRIMARY KEY,
	ExamDate DATE NOT NULL,
	ExamTypeID INT NOT NULL,
	StudentID Varchar(10) NOT NULL,
	TeacherID Varchar(10) NOT NULL,
	CourseID Varchar(10) NOT NULL,
	MarksObtained INT NOT NULL,
	CONSTRAINT FK_Exam_StdID FOREIGN KEY (StudentID)
		REFERENCES StudentDetails (StudentID),
	CONSTRAINT FK_Exam_TchrID FOREIGN KEY (TeacherID)
		REFERENCES TeacherDetails (TeacherID),
	CONSTRAINT FK_Exam_CrsID FOREIGN KEY (CourseID)
		REFERENCES CourseDetails (CourseID),
	CONSTRAINT FK_Exam_ExmTypID FOREIGN KEY (ExamTypeID)
		REFERENCES ExamTypeDetails (ExamTypeID)
);

CREATE TABLE ExamTypeDetails(
	ExamTypeID INT PRIMARY KEY,
	ExamTypeName Varchar(10) NOT NULL,
);

CREATE TABLE ExamPaperDetails(
	PaperID INT PRIMARY KEY,
	StudentID Varchar(10) NOT NULL,
	TeacherID Varchar(10) NOT NULL,
	ExamID INT NOT NULL,
	CourseID Varchar(10) NOT NULL,
	ExamDate DATE NOT NULL,
	TotalMarks INT NOT NULL,
	ObtainedMarks INT NOT NULL,
	CONSTRAINT FK_ExamPD_StdID FOREIGN KEY (StudentID)
		REFERENCES StudentDetails (StudentID),
	CONSTRAINT FK_ExamPD_TchrID FOREIGN KEY (TeacherID)
		REFERENCES TeacherDetails (TeacherID),
	CONSTRAINT FK_ExamPD_CrsID FOREIGN KEY (CourseID)
		REFERENCES CourseDetails (CourseID),
	CONSTRAINT FK_ExamPD_ExmID FOREIGN KEY (ExamID)
		REFERENCES ExamDetails (ExamID)
);

CREATE TABLE FeeDetails(
	FeeID BIGINT PRIMARY KEY,
	InvoiceNumber BIGINT NOT NULL,
	StudentID Varchar(10) NOT NULL,
	FeePayStartDate DATE NOT NULL,
	FeePayLastDate DATE NOT NULL,
	FeeAmount INT NOT NULL,
	FeeDueID INT NOT NULL,
	FeeTypeID INT NOT NULL,
	BankID INT NOT NULL,
	CONSTRAINT FK_Fee_FDuID FOREIGN KEY (FeeDueID)
		REFERENCES FeeDueDetails (FeeDueID),
	CONSTRAINT FK_Fee_FTyID FOREIGN KEY (FeeTypeID)
		REFERENCES FeeTypeDetails (FeeTypeID),
	CONSTRAINT FK_Fee_BdID FOREIGN KEY (BankID)
		REFERENCES BankDetails (BankID),
);

CREATE TABLE FeeDueDetails(
	FeeDueID INT PRIMARY KEY,
	FeeDueDate DATE NOT NULL
);

CREATE TABLE FeeTypeDetails(
	FeeTypeID INT PRIMARY KEY,
	FeeTypeName Varchar(10) NOT NULL,
	FeeStatus Varchar(20) NOT NULL,
	Amount DECIMAL(10,2) NOT NULL
);

CREATE TABLE BankDetails(
	BankID INT PRIMARY KEY,
	BankName Varchar(25) NOT NULL,
	BankContact BIGINT NOT NULL,
	SchoolAccNumber BIGINT NOT NULL,
	DepositDate DATE NOT NULL,
	DepositAmount INT NOT NULL,
);

CREATE TABLE EmployeeDetails(
	EmployeeID INT PRIMARY KEY,
	EmployeeName Varchar(50) NOT NULL,
	EmployeeNumber INT NOT NULL,
	EmployeeFatherName Varchar(50) NOT NULL,
	EmployeeCitizenshipNumber BIGINT UNIQUE NOT NULL,
	EmployeeContact BIGINT NOT NULL,
	EmployeeAddress Varchar(25) NOT NULL,
	EmployeeJoinedDate DATE NOT NULL,
	EmployeeDesignationID INT NOT NULL,
	EmployeeTypeID INT NOT NULL,
	EmployeeCategoryID INT NOT NULL
	CONSTRAINT FK_Emp_EmpDsgID FOREIGN KEY (EmployeeDesignationID)
		REFERENCES EmployeeDesignationDetails (EmployeeDesignationID),
	CONSTRAINT FK_Emp_EmpTyID FOREIGN KEY (EmployeeTypeID)
		REFERENCES EmployeeTypeDetails (EmployeeTypeID),
	CONSTRAINT FK_Emp_EmpCatID FOREIGN KEY (EmployeeCategoryID)
		REFERENCES EmployeeCategoryDetails (EmployeeCategoryID)
);

CREATE TABLE EmployeeDesignationDetails(
	EmployeeDesignationID INT PRIMARY KEY,
	EmployeeDesignationName Varchar(20) NOT NULL
);

CREATE TABLE EmployeeTypeDetails(
	EmployeeTypeID INT PRIMARY KEY,
	EmployeeTypeName Varchar(20) NOT NULL
);

CREATE TABLE EmployeeCategoryDetails(
	EmployeeCategoryID INT PRIMARY KEY,
	EmployeeCategoryName Varchar(20) NOT NULL
);

CREATE TABLE SalaryDetails(
	SalaryID INT PRIMARY KEY,
	EmployeeID INT NOT NULL,
	EmployeeDesignationID INT NOT NULL,
	AllowanceID INT NOT NULL,
	BonusID INT NOT NULL,
	AdvancedSalaryID INT NOT NULL,
	TotalSalary DECIMAL(10,2) NOT NULL,
	SalaryStatus Varchar(10) NOT NULL,
	CONSTRAINT FK_Sal_EmpDetID FOREIGN KEY (EmployeeID)
		REFERENCES EmployeeDetails (EmployeeID),
	CONSTRAINT FK_Sal_EmpDsgID FOREIGN KEY (EmployeeDesignationID)
		REFERENCES EmployeeDesignationDetails (EmployeeDesignationID),
	CONSTRAINT FK_Sal_AllwID FOREIGN KEY (AllowanceID)
		REFERENCES AllowanceDetails (AllowanceID),
	CONSTRAINT FK_Sal_BnsID FOREIGN KEY (BonusID)
		REFERENCES BonusDetails (BonusID),
	CONSTRAINT FK_Sal_AdSalID FOREIGN KEY (AdvancedSalaryID)
		REFERENCES AdvancedSalaryDetails (AdvancedSalaryID)
);

CREATE TABLE AllowanceDetails(
	AllowanceID INT PRIMARY KEY,
	AllowanceName Varchar(10) NOT NULL,
	AllowanceStatus Varchar(10) NOT NULL,
	AllowanceAmount DECIMAL(10,2) NOT NULL
);

CREATE TABLE BonusDetails(
	BonusID INT PRIMARY KEY,
	BonusName Varchar(10) NOT NULL,
	BonusStatus Varchar(10) NOT NULL,
	BonusAmount DECIMAL(10,2) NOT NULL
);

CREATE TABLE AdvancedSalaryDetails(
	AdvancedSalaryID INT PRIMARY KEY,
	EmployeeID INT NOT NULL,
	AdvancedSalaryMonths DECIMAL(10,2) NOT NULL,
	TotalAmount DECIMAL(10,2) NOT NULL,
	Duration INT NOT NULL,
	PerMonthAmount DECIMAL(10,2) NOT NULL,
	Date DATE NOT NULL,
	CONSTRAINT FK_AdvSal_EmpDetID FOREIGN KEY (EmployeeID)
		REFERENCES EmployeeDetails (EmployeeID),
);

CREATE TABLE Users(
	UserID BIGINT PRIMARY KEY,
	UserName Varchar(25) NOT NULL,
	UserPassword Varchar(20) NOT NULL,
	RoleID INT NOT NULL,
	CONSTRAINT FK_Usr_UsRL FOREIGN KEY (RoleID)
		REFERENCES UserRoleDetails (RoleID),
);

CREATE TABLE UserRoleDetails(
	RoleID INT PRIMARY KEY,
	RoleName Varchar(25) NOT NULL,
);

--CREATION OF TABLES TO LOG TRIGGER INFORMATION

CREATE TABLE StudentDetailsAudit(
	ID INT IDENTITY PRIMARY KEY,
	Details Varchar(700) NOT NULL
);

CREATE TABLE ParentDetailsAudit(
	ID INT IDENTITY PRIMARY KEY,
	Details Varchar(700) NOT NULL
);

CREATE TABLE TeacherDetailsAudit(
	ID INT IDENTITY PRIMARY KEY,
	Details Varchar(700) NOT NULL
);

CREATE TABLE EmployeeAudit(
	ID INT IDENTITY PRIMARY KEY,
	Details Varchar(700) NOT NULL
);

CREATE TABLE CourseDetailsAudit(
	ID INT IDENTITY PRIMARY KEY,
	Details Varchar(700) NOT NULL
);

--CREATION OF TRIGGERS

CREATE OR ALTER TRIGGER Trg_Student_Insert
ON StudentDetails
FOR INSERT AS
BEGIN
	DECLARE
		@StudentID Varchar
	SELECT 
		@StudentID = StudentID FROM inserted
	INSERT INTO StudentDetailsAudit
	VALUES 
		('New student with ID: '+ @StudentID +
			' is added at '+
			CAST(Getdate() AS nvarchar(20))
		)
END

CREATE OR ALTER TRIGGER Trg_Parent_Insert
ON ParentDetails
FOR INSERT AS
BEGIN
	DECLARE 
		@ParentID Varchar
	SELECT 
		@ParentID = ParentID FROM inserted
	INSERT INTO ParentDetailsAudit
	VALUES 
		('New parent with ID: '+ @ParentID +
			' is added at '+ 
			CAST(GETDATE() AS nvarchar(25))
		)
END

CREATE TRIGGER Trg_Teacher_Delete
ON TeacherDetails
FOR DELETE AS
BEGIN
	DECLARE 
		@TeacherID Varchar
	SELECT 
		@TeacherID = TeacherID FROM deleted
	INSERT INTO TeacherDetailsAudit
	VALUES
	(
		'Teacher wirh ID: '+@TeacherID +
		' has been deleted '+
		'on '+ CAST(GETDATE() AS varchar(25))
	)	
END

CREATE OR ALTER TRIGGER Trg_Course_Insert
ON CourseDetails
FOR INSERT AS
BEGIN
	DECLARE
		@CourseID Varchar
	SELECT 
		@CourseID = CourseID FROM inserted
	INSERT INTO CourseDetailsAudit
	VALUES 
		('New student with ID: '+ @CourseID +
			' is added at '+
			CAST(Getdate() AS nvarchar(20))
		)
END

CREATE TRIGGER Trg_Employee_Updates
ON EmployeeDetails
FOR UPDATE AS
BEGIN
	DECLARE @EmployeeID INT
	DECLARE	@OldEmployeeName Varchar(50), @NewEmployeeName Varchar(50)
	DECLARE	@OldEmployeeDesignationID INT, @NewEmployeeDesignationID INT
	DECLARE @AuditString Varchar(1000)

	SELECT * INTO #TempTable
	FROM inserted

	WHILE(EXISTS(SELECT EmployeeID FROM #TempTable))
	BEGIN
		SET @AuditString=''
		SELECT TOP 1 @EmployeeID = EmployeeID, @NewEmployeeName = EmployeeName,
		@OldEmployeeDesignationID = EmployeeDesignationID
		FROM #TempTable

		SELECT @OldEmployeeName = EmployeeName,
		@OldEmployeeDesignationID = EmployeeDesignationID FROM deleted 
		WHERE EmployeeID = @EmployeeID

		SET @AuditString =' Employee with ID '+CAST(@EmployeeID AS nVarchar(10))+
		'has been changed to '

		if(@OldEmployeeName != @NewEmployeeName)
			SET @AuditString = @AuditString+'Name changed from '+@OldEmployeeName
			+' to new name '+@NewEmployeeName

		if(@OldEmployeeDesignationID != @NewEmployeeDesignationID)
			SET @AuditString = @AuditString+'Designation ID changed from '+@OldEmployeeDesignationID
			+' to new ID '+@NewEmployeeDesignationID

		INSERT INTO EmployeeAudit VALUES (@AuditString)
		DELETE FROM #TempTable WHERE EmployeeID = @EmployeeID
	END
END

SELECT * FROM ParentDetails;