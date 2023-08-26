CREATE DATABASE Employee_Payroll;

USE Employee_Payroll;

CREATE TABLE Designation(
DesignationID INT PRIMARY KEY,
DesignationName VARCHAR(30) NOT NULL
);

SELECT * FROM Designation;

INSERT INTO Designation(DesignationID,DesignationName)VALUES(2001,'Maneger'),
(2002,'HR'),
(2003,'Design Head'),
(2004,'Sales Head'),
(2005,'Testing Head'),
(2006,'Employee');

CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
FirstName VARCHAR(30) NOT NULL,
LastName VARCHAR(30) NOT NULL,
DateOfBirth DATE NOT NULL,
Gender VARCHAR(6) NOT NULL,
Address VARCHAR(250) NOT NULL,
ContactNumber VARCHAR(10) NOT NULL,
Email VARCHAR(50) NOT NULL,
HireDate DATE NOT NULL,
DesignationID INT NOT NULL,
FOREIGN KEY (DesignationID)
REFERENCES Designation(DesignationID)
);



INSERT INTO Employee(EmployeeID,FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email,HireDate,DesignationID)
VALUES(1,'Amit','Nayak','1999-01-29','Male','Odisha','7894562581','amit@gmail.com','2021-01-25',2001),
(2,'Manit','Nayak','1998-08-25','Male','Pune','9864853157','manit@gmail.com','2019-05-25',2003),
(3,'Smruti','Panda','1997-07-11','Male','Mumbai','9090654582','smruti@gmail.com','2010-11-20',2004),
(4,'Elina','Sahoo','1994-05-25','Female','Kalkata','9865745685','elina@gmail.com','2023-12-15',2006),
(5,'Elisha','Pradhan','1989-05-20','Female','Delhi','9875642584','elisha@gmail.com','2021-02-10',2006),
(6,'Mayadhar','Patra','1988-08-23','Male','Kerala','9874562581','maya@gmail.com','2016-04-19',2002),
(7,'Mamata','Kumari','1993-05-30','Female','Jamu','7964852581','mamata@gmail.com','2012-08-26',2005),
(8,'Sruti','Malik','1999-09-05','Female','Nepal','7564822581','sruti@gmail.com','2015-06-25',2006),
(9,'ShubhaShree','Sahu','2000-11-08','Delhi','Odisha','9564562581','riya@gmail.com','2021-08-11',2001),
(10,'Abhi','Kumar','2000-12-18','Male','Odisha','7894554861','abhi@gmail.com','2014-05-03',2002)
;

SELECT * FROM Employee;

CREATE TABLE Department(
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(30) NOT NULL,
EmployeeID INT,
FOREIGN KEY (EmployeeID)
REFERENCES Employee(EmployeeID)
);

SELECT * FROM Department;

INSERT INTO Department(DepartmentID,DepartmentName,EmployeeID)VALUES(1001,'Sales',10),
(1002,'Development',1),
(1003,'Innovation',9),
(1004,'Testing',7),
(1005,'HR',10),
(1006,'Sales',8),
(1007,'Design',2);


CREATE TABLE PayrollPeriod(
PayrollPeriodID INT PRIMARY KEY,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
);

SELECT * FROM PayrollPeriod;

INSERT INTO PayrollPeriod(PayrollPeriodID,StartDate,EndDate)VALUES(3001,'2014-01-01','2015-12-31'),
(3002,'2016-01-01','2017-12-31'),
(3003,'2018-01-01','2019-12-31'),
(3004,'2020-01-01','2021-12-31'),
(3005,'2022-01-01','2023-12-31');


CREATE TABLE Salary(
SalaryID INT PRIMARY KEY,
EmployeeID INT NOT NULL,
PayrollPeriodID INT NOT NULL,
BasicSalary BIGINT NOT NULL,
Allowances BIGINT NOT NULL,
Deductions BIGINT NOT NULL,
NetSalary BIGINT NOT NULL, 
FOREIGN KEY (EmployeeID)
REFERENCES Employee(EmployeeID),
FOREIGN KEY (PayrollPeriodID)
REFERENCES PayrollPeriod(PayrollPeriodID)
);


INSERT INTO Salary(SalaryID,EmployeeID,PayrollPeriodID,BasicSalary,Allowances,Deductions,NetSalary)
VALUES(4001,1,3005,1200000,20000,8000,1212000),
(4002,2,3004,1000000,10000,7500,1002500),
(4003,3,3001,500000,5000,2000,503000),
(4004,4,3005,400000,3000,1500,401500),
(4005,5,3004,350000,2500,1000,351500),
(4006,6,3002,800000,50000,2000,848000),
(4007,7,3001,1000000,50000,5000,1045000),
(4008,8,3001,400000,20000,5050,414950),
(4009,9,3004,1200000,30000,8500,1221500),
(4010,10,3001,1100000,50000,10000,1140000);
SELECT * FROM Salary;

--SELECT BasicSalary,Allowances,Deductions, BasicSalary+Allowances-Deductions AS NetSalary FROM Salary; 

CREATE TABLE Attendance(
AttendanceID INT PRIMARY KEY,
EmployeeID INT NOT NULL,
AttendanceDate DATE NOT NULL,
ClockIn TIME(0) NOT NULL,
ClockOut TIME(0) NOT NULL,
FOREIGN KEY (EmployeeID)
REFERENCES Employee(EmployeeID)
);

SELECT * FROM Attendance;
INSERT INTO Attendance(AttendanceID,EmployeeID,AttendanceDate,ClockIn,ClockOut)VALUES
(5001,1,'2021-02-01','10:00:00','19:00:00'),
(5002,2,'2019-07-01','05:30:00','14:30:00'),
(5003,3,'2010-12-01','15:00:00','12:00:00'),
(5004,4,'2018-01-01','20:00:00','05:00:00'),
(5005,5,'2021-03-01','10:00:00','19:00:00'),
(5006,6,'2016-05-01','05:30:00','14:30:00'),
(5007,7,'2012-09-01','15:00:00','12:00:00'),
(5008,8,'2015-07-01','20:00:00','05:00:00'),
(5009,9,'2021-09-01','10:00:00','19:00:00'),
(5010,10,'2014-06-01','05:30:00','14:30:00');


CREATE TABLE Leave(
LeaveID INT PRIMARY KEY,
EmployeeID INT NOT NULL,
LeaveType VARCHAR(30) NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
FOREIGN KEY (EmployeeID)
REFERENCES Employee(EmployeeID)
);

SELECT * FROM Leave;

INSERT INTO Leave(LeaveID,EmployeeID,LeaveType,StartDate,EndDate)VALUES
(6001,1,'Sick','2020-05-15','2020-06-10'),
(6002,2,'Vacation','2020-06-10','2020-06-30'),
(6003,3,'Home Vsit','2015-06-15','2015-07-10'),
(6004,4,'Sick','2023-01-15','2023-01-25'),
(6005,5,'Marrage','2021-05-15','2021-06-10'),
(6006,6,'Vacation','2019-07-15','2019-08-23'),
(6007,7,'Home Visit','2015-05-15','2015-06-05'),
(6008,8,'Marrage','2020-05-15','2020-06-10'),
(6009,9,'Sick','2020-12-15','2020-12-31'),
(6010,10,'Vacation','2018-02-15','2018-03-10');


CREATE TABLE Training(
TrainingID INT PRIMARY KEY,
TrainingName VARCHAR(50) NOT NULL,
Description VARCHAR(50) NOT NULL,
Trainer VARCHAR(30) NOT NULL,
StartDate DATE NOT NULL,
EndDate DATE NOT NULL,
EmployeeID INT NOT NULL,
FOREIGN KEY (EmployeeID)
REFERENCES Employee(EmployeeID)
);

SELECT * FROM Training;

INSERT INTO Training(TrainingID,TrainingName,Description,Trainer,StartDate,EndDate,EmployeeID)VALUES
(7001,'FullStack','Web Development','Saurav Kumar','2015-12-20','2016-02-20',4),
(7002,'Testing','Testing projects','Nandini Kumari','2015-06-30','2015-08-20',8),
(7003,'FullStack','Web Development','Saurav Kumar','2021-02-20','2021-04-20',5),
(7004,'Design','Design Prctice','Sri Nayak','2019-05-27','2019-08-20',2),
(7005,'FullStack','Web Development','Saurav Kumar','2021-08-20','2021-10-10',9)
;


----------------------Basic Queries----------------------------------------

--1.SHOW TOP 5 ELEMENT
SELECT TOP 5 * FROM Employee;
--2.LAST RECORD FROM TABLE
SELECT TOP 1 * FROM Employee ORDER BY EmployeeID DESC; 
--3.MONTHLY SALARY IF ANNUAL GIVEN
SELECT * FROM Salary;
SELECT NetSalary,NetSalary/12 AS MonthlySalary FROM Salary;
--4.Display Even row
SELECT * FROM Employee WHERE EmployeeID %2 = 0;
--5.Display last 50%
SELECT COUNT(*) AS NUMBER FROM Salary;
--6.DISTINT RECORD FROM TABLE
SELECT * FROM Employee WHERE EmployeeID = 5;
SELECT EmployeeID,FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber FROM Employee GROUP BY EmployeeID,FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email;
--7.VERIFY EMAIL
SELECT * FROM Employee WHERE Email LIKE '%@gmail.com';
SELECT * FROM Employee;

-------------------------------------------Joins---------------------------------------------
--1.Inner Join
SELECT FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email,HireDate,DepartmentName,DesignationName 
FROM 
Employee,Department,Designation 
WHERE 
Employee.EmployeeID = Department.EmployeeID AND Designation.DesignationID =Employee.DesignationID;
--OTHER METHOD
SELECT FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email,HireDate,DepartmentName,DesignationName 
FROM Employee
INNER JOIN Department
ON Employee.EmployeeID = Department.EmployeeID
INNER JOIN Designation
ON Employee.DesignationID = Designation.DesignationID;

--2.Left Join
SELECT FirstName,LastName,NetSalary FROM Employee 
LEFT JOIN Salary
ON Employee.EmployeeID = Salary.EmployeeID;

--3.Right Join
SELECT NetSalary,FirstName,LastName 
from Salary
RIGHT JOIN Employee
ON Salary.EmployeeID = Employee.EmployeeID;

--4.FULL OUTER JOIN
SELECT FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email,HireDate,NetSalary
FROM Employee
FULL JOIN Salary
ON Employee.EmployeeID = Salary.EmployeeID;
--5.Self join

SELECT * FROM Salary;


--------------------------------------------Storage procedure--------------------------------------------

--TOTAL SALARY INPUT PARAMETER
CREATE PROC spGetTotalSalary(
@empId INT,
@payrollPeriodID INT
)
AS
BEGIN
	BEGIN TRY
		SELECT BasicSalary+Allowances-Deductions AS TOTALSALARY
		FROM Salary 
		WHERE EmployeeID = @empId AND PayrollPeriodID = @payrollPeriodID;
	END TRY
	BEGIN CATCH
		SELECT
		ERROR_NUMBER() AS ErrorNumber,
		ERROR_STATE() AS ErrorState,
		ERROR_SEVERITY() AS ErrorSeverity,
		ERROR_PROCEDURE() AS ErrorProcedure,
		ERROR_LINE() AS ErrorLine,
		ERROR_MESSAGE() AS ErrorMessage;
	END CATCH
END;
--EXECUTION
EXEC spGetTotalSalary @empId=1, @payrollPeriodID=3005;
--USING OUTPUT PENDING

--VALIDATE USER NAME
ALTER PROC SP_ValidateName(
@empID INT,
@ErrorAlert VARCHAR(100) OUTPUT
)
AS
BEGIN
	BEGIN TRY
		SELECT * FROM Employee
		WHERE EmployeeID=@empID AND FirstName NOT LIKE '%[^a-zA-Z]%';
	END TRY
	BEGIN CATCH
		SET @ErrorAlert = 'The Name is not valid';
	END CATCH
END;
--EXECUTING
DECLARE @Error VARCHAR(100);
EXEC SP_ValidateName
	@empID = 1,
	@ErrorAlert = @Error OUTPUT;
SELECT @Error

CREATE OR ALTER PROC SP_Check
AS
BEGIN
	SELECT * FROM Employee;
END
--GIVEN EMPLOYEE DATA IF PRESENT UPDATE ROW ELSE INSERT IT
EXEC SP_Check;

CREATE PROC SP_CheckEmployee(
@empId INT,
@firstName VARCHAR(30) ,
@lastName  VARCHAR(30) ,
@dateOfBirth DATE,
@gender VARCHAR(6),
@address VARCHAR(250),
@contactNumber VARCHAR(10),
@email VARCHAR(50),
@hireDate DATE ,
@designationID INT
)
AS
BEGIN 
	IF EXISTS(SELECT 1 FROM Employee WHERE EmployeeID=@empId)
	BEGIN
		UPDATE Employee
		SET
			FirstName = @firstName,
			LastName = @lastName,
			DateOfBirth = @dateOfBirth,
			Gender = @gender,
			Address = @address,
			ContactNumber = @contactNumber,
			Email  = @email,
			HireDate=@hireDate,
			DesignationID=@designationID
		WHERE
			EmployeeID=@empId
	END
	ELSE
		BEGIN
			INSERT INTO Employee(EmployeeID,FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email,HireDate,DesignationID)
			VALUES(@empId,@firstName,@lastName,@dateOfBirth,@gender,@address,@contactNumber,@email,@hireDate,@designationID);
		END
END;
--EXECUTIN ->UPDATE
EXEC SP_CheckEmployee
	@empId = 8,
	@firstName = 'Smita',
	@lastName = 'Nayak',
	@dateOfBirth = '1999-09-05',
	@gender = 'Female',
	@address = 'Odisha',
	@contactNumber = '9999999999',
	@email = 'smita@gmail.com',
	@hireDate = '2015-06-25',
	@designationID = 2006;
--EXECUTION ->INSERT
EXEC SP_CheckEmployee
	@empId = 11,
	@firstName = 'Kanta',
	@lastName = 'Nayak',
	@dateOfBirth = '1999-10-05',
	@gender = 'Female',
	@address = 'Odisha',
	@contactNumber = '9438293958',
	@email = 'kanta@gmail.com',
	@hireDate = '2015-06-25',
	@designationID = 2006;


--------------------------FUNCTIONS----------------------------------------------------

--Get Age Of Employee
CREATE FUNCTION GetAge(@dateOfBirth DATE)
RETURNS INT
AS
BEGIN
	DECLARE @age INT;
	SELECT @age = DATEDIFF(YEAR,@dateOfBirth,GETDATE());
	RETURN @age;
END;
--FUNCTION CALL
SELECT FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email,HireDate,DesignationID,dbo.GetAge(DateOfBirth) AS Age FROM Employee; 


--GetTotalSalary FUNCTION
SELECT * FROM Salary;
CREATE FUNCTION GetSalary(@basicPay INT,@allowances INT,@deductions INT)
RETURNS INT
AS
BEGIN
	DECLARE @totalSalary INT;
	SELECT @totalSalary = @basicPay+@allowances-@deductions;
	RETURN @totalSalary;
END
--FUNCTION CALL
SELECT FirstName,LastName,dbo.GetSalary(BasicSalary,Allowances,Deductions) AS TotalSalary 
FROM Employee right join Salary on Employee.EmployeeID=Salary.EmployeeID;

--NO OF EMPLOYEE IN A SPESIFIC DEPARTMENT

--alter FUNCTION GetNoOfEmpInDepartment()
--RETURNS @NumberOfEmployee TABLE (DeparmentName VARCHAR(40),NumberOfEmployee INT)
--AS
--BEGIN
--	DECLARE @noOfEmp INT;
--	SELECT @noOfEmp=COUNT(EmployeeID) FROM Department;
--	INSERT INTO @NumberOfEmployee( DeparmentName,NumberOfEmployee)SELECT DepartmentName,@noOfEmp FROM Department
--RETURN
--END
CREATE FUNCTION GetNoOfEmpInDepartment()
RETURNS TABLE
AS
RETURN SELECT DepartmentName,COUNT(*) AS NoOfEmployee  FROM Department GROUP BY DepartmentName;
--CALL FUNCTION
SELECT * FROM dbo.GetNoOfEmpInDepartment();

CREATE FUNCTION GetNoOfEmpLeave()
RETURNS TABLE
AS
RETURN SELECT EmployeeID,COUNT(*) AS NoOfLeave FROM Leave GROUP BY EmployeeID;
--CALL FUNCTION
SELECT * FROM dbo.GetNoOfEmpLeave();


-----------------------------VIEW----------------------------------------------

--1.VIEW FOR EMPLOYEE AND THEIR DEPARTMENT
CREATE VIEW GetEmpDetailWithDepartment
AS
SELECT em.FirstName,em.LastName,dp.DepartmentName
FROM Employee em
JOIN Department dp
ON em.EmployeeID=dp.EmployeeID;
--EXECUTE VIEW
SELECT * FROM GetEmpDetailWithDepartment;


--2.GET EMPLOYEE WITH DESIGNATION AND DEPARTMENT
select * from Leave;
select * from Department;
select * from Designation;
CREATE VIEW GetEmpWithDeparmentAndDesignation
AS
SELECT em.FirstName,em.LastName,de.DepartmentName,desi.DesignationName
FROM Employee em
JOIN Department de
ON em.EmployeeID=de.EmployeeID 
JOIN Designation desi
ON em.DesignationID = desi.DesignationID 
;
--EXECUTION VIEW
SELECT * FROM GetEmpWithDeparmentAndDesignation;


-----------------------------------INDEX--------------------------------------------------
--1.CREATING eMPLOYEE ID AS AN INDEX
CREATE INDEX IX_Employee_EmployeeID
ON Employee(EmployeeID);
SELECT * FROM Employee WHERE EmployeeID = 1;


--2.CREATING INDEX ON DepartmentID
CREATE INDEX IX_Department_DeparmentID
ON Department(DepartmentID);

SELECT emp.FirstName,emp.LastName,dep.DepartmentName FROM Department dep
JOIN Employee emp
ON dep.EmployeeID = emp.EmployeeID;


--3.CRRATE INDEX ON NETSALARY FOR A SPECIFIC SALARY RANGE
CREATE INDEX IX_Salary_NetSalary
ON Salary(NetSalary desc);
SELECT em.FirstName,em.LastName,sl.NetSalary FROM Salary sl
JOIN Employee em
ON sl.EmployeeID = em.EmployeeID
WHERE sl.NetSalary < 500000;


--4.CREATE INDEX ON DesignationName AND SEARCH FOR AN EMPLOYEE FOR A SPECIFIC DESIGNATION
SELECT * FROM Designation;
SELECT* FROM Employee;
CREATE INDEX IX_Designation_DesignationName
ON Designation(DesignationName)
SELECT em.EmployeeID,em.FirstName,em.LastName,desi.DesignationName FROM Designation desi
JOIN Employee em
ON desi.DesignationID = em.DesignationID
WHERE DesignationName = 'Employee';



-------------------------TRIGGER-------------------------------------------------- 



--1.Automatically update the HireDate of an employee when their record is inserted
CREATE OR ALTER TRIGGER tgr_UpdateHireDade
ON Employee
AFTER INSERT
AS
BEGIN
	DECLARE @today DATE;
	DECLARE @empID INT;
	SELECT @empID = i.EmployeeID FROM inserted i;
	SET @today = GETDATE();
	UPDATE Employee 
	SET HireDate = @today 
	WHERE EmployeeID =@empID;
END;
--CHECKING TRIGGER
SELECT * FROM Employee;
INSERT INTO Employee(EmployeeID,FirstName,LastName,DateOfBirth,Gender,Address,ContactNumber,Email,HireDate,DesignationID)
VALUES(12,'Halia','Nayak','1997-01-29','Male','Odisha','7894578581','halia@gmail.com',NULL,2006);





----------2.Update the ModifiedDate of an employee when their record is updated
ALTER TABLE Employee ADD ModifiedDate DATE;
SELECT*FROM Employee;
CREATE OR ALTER TRIGGER tgr_UpdateDate
ON Employee
AFTER UPDATE
AS
BEGIN
	DECLARE @empId INT;
	DECLARE @today DATE;
	SET @today = GETDATE();
	SELECT @empId = i.EmployeeID FROM inserted i;
	UPDATE Employee 
	SET ModifiedDate = @today
	FROM inserted 
	WHERE Employee.EmployeeID = inserted.EmployeeID;
END;
--TEST TRIGGER
UPDATE Employee
SET FirstName = 'Halia' 
WHERE EmployeeID=12;




--3.Delete salary records of an employee when they are deleted from the Employee table
CREATE OR ALTER TRIGGER tgr_DeleteARow 
ON Employee
AFTER DELETE
AS
BEGIN
	PRINT 'DELETED SUCESSFULLY'
END;
--TEST TRIGGER
SELECT * FROM Salary;
SELECT * FROM Employee;

ALTER TABLE Salary DROP CONSTRAINT FK__Salary__Employee__440B1D61;

ALTER TABLE Salary 
ADD CONSTRAINT FK_Salary_Employee_Cascade_Delete
FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID) ON DELETE CASCADE;

INSERT INTO Salary(SalaryID,EmployeeID,PayrollPeriodID,BasicSalary,Allowances,Deductions,NetSalary)
VALUES(4011,12,3005,1200000,20000,8000,1212000);
DELETE FROM Employee WHERE EmployeeID = 12;




--4.Enforce a constraint where the EndDate of a leave must be greater than or equal to the StartDate
CREATE OR ALTER TRIGGER tgr_EnforceConstraint
ON Leave
AFTER INSERT
AS
BEGIN
	DECLARE @startDate DATE;
	DECLARE	@enaDate DATE;
	SELECT @startDate = i.StartDate FROM inserted i;
	SELECT @enaDate = i.EndDate FROM inserted i;

	IF @startDate > @enaDate
	BEGIN
		PRINT 'Starting date was greater than End date';
		ROLLBACK
	END
END;
--testing trigger
SELECT * FROM Leave;
INSERT INTO Leave(LeaveID,EmployeeID,LeaveType,StartDate,EndDate)VALUES
(6012,5,'Sick','2021-05-15','2020-06-10');


----------------------------------------CURSOR--------------------------------------------------


--1.Cursor to fetch and display all employees' names
DECLARE @first_Name VARCHAR(30),@last_Name VARCHAR(30)

--DECLARE CURSOR
DECLARE EmployeeName_Cursor CURSOR
FOR
SELECT FirstName,LastName 
FROM Employee;
--OPEN CURSOR
OPEN EmployeeName_Cursor;
--FEACH CURSOR
FETCH NEXT
FROM EmployeeName_Cursor 
INTO @first_Name,@last_Name;

WHILE @@FETCH_STATUS=0
	BEGIN
		PRINT CONCAT(@first_Name,' ',@last_Name);
		FETCH NEXT
		FROM EmployeeName_Cursor 
		INTO @first_Name,@last_Name;
	END
--CLOSE CURSOR
CLOSE EmployeeName_Cursor;
DEALLOCATE EmployeeName_Cursor;




--2.cursor to update the basic salary of all employees by a certain percentage

--VARIABLE
DECLARE @basicSal INT,@firstName VARCHAR(30),@lastName VARCHAR(30);
DECLARE @newBasicSal INT;
--CURSOR
DECLARE IncreseSalary_Cursor CURSOR 
FOR
SELECT FirstName,LastName,NetSalary
from Employee
right JOIN Salary
ON Employee.EmployeeID=Salary.EmployeeID;
--OPEN
OPEN IncreseSalary_Cursor;
--FEACH
FETCH NEXT FROM IncreseSalary_Cursor INTO @firstName,@lastName,@basicSal;
WHILE @@FETCH_STATUS=0
	BEGIN
		SET @newBasicSal = @basicSal*0.25;
		PRINT CONCAT(@firstName,' ',@lastName,' : ',@newBasicSal);
		FETCH NEXT FROM IncreseSalary_Cursor INTO @firstName,@lastName,@basicSal;
	END
--CLOSE
CLOSE IncreseSalary_Cursor;
DEALLOCATE IncreseSalary_Cursor;




--3.Cursor to update employee designations based on their years of service
--VARIABLE
DECLARE @firstNm VARCHAR(30),
		@lastNm VARCHAR(30),
		@hireDate DATE,
		@exprience INT;
--CURSOR
DECLARE UpdateDesignation_Cursor CURSOR
FOR 
SELECT FirstName,LastName,HireDate 
from Employee;
--OPEN
OPEN UpdateDesignation_Cursor;
--FETCH
FETCH NEXT FROM UpdateDesignation_Cursor INTO @firstNm,@lastNm,@hireDate;
WHILE @@FETCH_STATUS = 0
	BEGIN
		SET @exprience = YEAR(GETDATE())-YEAR(@hireDate);
		IF @exprience > 8
			BEGIN
				PRINT CONCAT(@firstNm,' ',@lastNm);
				PRINT CONCAT('Designation based on year of exprince : ','Senior Maneger');
			END
		ELSE IF @exprience >= 7 AND @exprience < 9
			BEGIN
				PRINT CONCAT(@firstNm,' ',@lastNm);
				PRINT CONCAT('Designation based on year of exprince : ','department Head');
			END
		ELSE IF @exprience >= 5 AND @exprience < 7
			BEGIN
				PRINT CONCAT(@firstNm,' ',@lastNm);
				PRINT CONCAT('Designation based on year of exprince : ','Maneger');
			END
		ELSE
			BEGIN
				PRINT CONCAT(@firstNm,' ',@lastNm);
				PRINT CONCAT('Designation based on year of exprince : ','Employee');
			END
		FETCH NEXT FROM UpdateDesignation_Cursor INTO @firstNm,@lastNm,@hireDate;
	END
--CLOSE
CLOSE UpdateDesignation_Cursor;
DEALLOCATE UpdateDesignation_Cursor;





--4.Cursor to calculate the total salary for each employee and display the results

SELECT FirstName,LastName,BasicSalary,Allowances,Deductions
from Employee
right JOIN Salary
ON Employee.EmployeeID=Salary.EmployeeID;
--VARIABLE
DECLARE @fName VARCHAR(30),
		@lName VARCHAR(30),
		@bSalary INT,
		@allowance INT,
		@deduction INT,
		@total INT;
--CURSOR
DECLARE CalTotalSalary_Cursor CURSOR
FOR
SELECT FirstName,LastName,BasicSalary,Allowances,Deductions
from Employee
right JOIN Salary
ON Employee.EmployeeID=Salary.EmployeeID;
--OPEN
OPEN CalTotalSalary_Cursor;
--FETCH
FETCH NEXT FROM CalTotalSalary_Cursor INTO @fName,@lName,@bSalary,@allowance,@deduction;
WHILE @@FETCH_STATUS=0
	BEGIN
		SET @total=@bSalary+@allowance-@deduction;
		PRINT CONCAT(@fName,' ',@lName);
		PRINT CONCAT('Total salary : ',@total);
		FETCH NEXT FROM CalTotalSalary_Cursor INTO @fName,@lName,@bSalary,@allowance,@deduction;
	END
--CLOSE
CLOSE CalTotalSalary_Cursor;
DEALLOCATE CalTotalSalary_Cursor;




--5.Cursor to delete all employees who have left the organization

--VARIABLE
DECLARE @fstName VARCHAR(30),@lstNmae VARCHAR(30),@netSal INT;
--CURSOR
DECLARE DeleteEmpLeaveTheCompany_Cursor CURSOR
FOR
SELECT FirstName,LastName,NetSalary
from Employee
LEFT JOIN Salary
ON Employee.EmployeeID = Salary.EmployeeID;
--OPEN
OPEN DeleteEmpLeaveTheCompany_Cursor;
--FETCH
FETCH NEXT FROM DeleteEmpLeaveTheCompany_Cursor INTO @fstName, @lstNmae, @netSal;
WHILE @@FETCH_STATUS=0
	BEGIN
		IF @netSal IS NULL
			BEGIN
				PRINT CONCAT(@fstName,' ', @lstNmae,' Employee leave the company');
			END
		FETCH NEXT FROM DeleteEmpLeaveTheCompany_Cursor INTO @fstName, @lstNmae, @netSal;
	END
--CLOSE CURSOR
CLOSE DeleteEmpLeaveTheCompany_Cursor;
DEALLOCATE DeleteEmpLeaveTheCompany_Cursor;




--CREATE A EmployeePerformance TABLE

CREATE TABLE EmployeePerformance(
	PerformanceID INT IDENTITY(1,1) PRIMARY KEY,
	EmployeeID INT,
	PerformanceRating VARCHAR(25)
	FOREIGN KEY(EmployeeID) REFERENCES Employee ON DELETE CASCADE
	);
INSERT INTO EmployeePerformance(EmployeeID,PerformanceRating)
VALUES(1,'Excellent'),
	(3,'Good'),
	(5,'Average'),
	(7,'Excellent'),
	(9,'Excellent'),
	(2,'Good'),
	(4,'Average'),
	(6,'Excellent'),
	(8,'Excellent'),
	(10,'Good')
SELECT FirstName,LastName,PerformanceRating,NetSalary FROM Employee
JOIN EmployeePerformance
ON EmployeePerformance.EmployeeID = Employee.EmployeeID
JOIN Salary
ON Salary.EmployeeID=Employee.EmployeeID;

--6.Update the salary of employees based on their PerformanceRating

--VARIABLE
DECLARE @f_Name VARCHAR(30),
		@l_name VARCHAR(30),
		@perfRating VARCHAR(30),
		@tolSalary INT,
		@bonushSalary INT;
--CREATE CURSOR
DECLARE SalaryBasedOnPerformance_Cursor CURSOR
FOR
SELECT FirstName,LastName,PerformanceRating,NetSalary FROM Employee
JOIN EmployeePerformance
ON EmployeePerformance.EmployeeID = Employee.EmployeeID
JOIN Salary
ON Salary.EmployeeID=Employee.EmployeeID;
--OPEN
OPEN SalaryBasedOnPerformance_Cursor;
--FETCH
FETCH NEXT FROM SalaryBasedOnPerformance_Cursor INTO @f_Name,@l_name,@perfRating,@tolSalary;
WHILE @@FETCH_STATUS=0
	BEGIN
		IF @perfRating = 'Excellent'
			BEGIN
				SET @bonushSalary = @tolSalary+(@tolSalary*0.1);
				PRINT CONCAT('Employee Name : ',@f_Name,' ',@l_name);
				PRINT CONCAT('Total Salary : ',@tolSalary);
				PRINT CONCAT('Bonsh Total Salary : ',@bonushSalary);
			END
		ELSE IF @perfRating = 'Good'
			BEGIN
				SET @bonushSalary = @tolSalary+(@tolSalary*0.05);
				PRINT CONCAT('Employee Name : ',@f_Name,' ',@l_name);
				PRINT CONCAT('Total Salary : ',@tolSalary);
				PRINT CONCAT('Bonsh Total Salary : ',@bonushSalary);
			END
		ELSE
			BEGIN
				SET @bonushSalary = @tolSalary+(@tolSalary*0.02);
				PRINT CONCAT('Employee Name : ',@f_Name,' ',@l_name);
				PRINT CONCAT('Total Salary : ',@tolSalary);
				PRINT CONCAT('Bonsh Total Salary : ',@bonushSalary);
			END
		FETCH NEXT FROM SalaryBasedOnPerformance_Cursor INTO @f_Name,@l_name,@perfRating,@tolSalary;
	END
--CLOSE
CLOSE SalaryBasedOnPerformance_Cursor;
DEALLOCATE SalaryBasedOnPerformance_Cursor;

--7.Cursor to assign a default department for employees who don't have one
SELECT FirstName,LastName,DepartmentID FROM Employee
LEFT JOIN Department
ON Employee.EmployeeID=Department.EmployeeID;
--VARIABLE
DECLARE @empFirstName VARCHAR(30),@empLastName VARCHAR(30),@departID INT,@dfultDepart INT = 1001;
--CURSOR
DECLARE AsignADefultDepartmentID_Cursor CURSOR
FOR
SELECT FirstName,LastName,DepartmentID FROM Employee
LEFT JOIN Department
ON Employee.EmployeeID=Department.EmployeeID;
--OPEN CURSOR
OPEN AsignADefultDepartmentID_Cursor;
--FETCH
FETCH NEXT FROM AsignADefultDepartmentID_Cursor INTO @empFirstName,@empLastName,@departID;
WHILE @@FETCH_STATUS = 0
	BEGIN
		IF @departID IS NULL
			BEGIN
			PRINT CONCAT('Employee Name : ',@empFirstName,' ',@empLastName);
			PRINT CONCAT('Department ID : ',@dfultDepart);
		END
		FETCH NEXT FROM AsignADefultDepartmentID_Cursor INTO @empFirstName,@empLastName,@departID;
	END
--CLOSE CURSOR
CLOSE AsignADefultDepartmentID_Cursor;
DEALLOCATE AsignADefultDepartmentID_Cursor;


-------------------------------SUB QUERY----------------------


--1.Query to get employees who have salaries greater than the average salary in their department


SELECT Employee.FirstName,Employee.LastName,Salary.NetSalary 
FROM Employee
INNER JOIN Salary 
ON Employee.EmployeeID = Salary.EmployeeID
WHERE Salary.NetSalary >ANY (
	SELECT AVG(Salary.NetSalary)
	FROM Salary
	INNER JOIN Department
	ON Salary.EmployeeID = Department.EmployeeID
	WHERE Department.DepartmentName =ANY (
		SELECT DepartmentName 
		FROM Department 
		WHERE EmployeeID = Employee.EmployeeID)
);



--2.Query to retrieve employees who have taken leaves longer than the average leave duration
SELECT EmployeeID,DATEDIFF(DAY,StartDate,EndDate) AS DAUSoFlEAVELEAVE FROM Leave;
SELECT AVG(DATEDIFF(DAY,StartDate,EndDate))  FROM Leave;

SELECT FirstName,LastName 
FROM Employee 
WHERE EmployeeID IN (
	SELECT EmployeeID 
	FROM Leave 
	WHERE DATEDIFF(DAY,StartDate,EndDate)>(
		SELECT AVG(DATEDIFF(DAY,StartDate,EndDate))
		FROM Leave
	)
);



		























