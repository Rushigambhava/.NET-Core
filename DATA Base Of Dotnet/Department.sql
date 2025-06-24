CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(250),
    IsActive BIT NOT NULL DEFAULT 1,
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID)
);

-- 2. DEPARTMENT TABLE
CREATE PROCEDURE InsertDepartment
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @Modified DATETIME,
    @UserID INT
AS
BEGIN
    INSERT INTO Department(DepartmentName, Description, Modified, UserID)
    VALUES (@DepartmentName, @Description, @Modified, @UserID);
END
--Upadet

CREATE PROCEDURE UpdateDepartment
    @DepartmentID INT,
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @IsActive BIT,
    @Modified DATETIME,
    @UserID INT
AS
BEGIN
    UPDATE Department
    SET DepartmentName = @DepartmentName, Description = @Description,
        IsActive = @IsActive, Modified = @Modified, UserID = @UserID
    WHERE DepartmentID = @DepartmentID;
END
--Delete

CREATE PROCEDURE DeleteDepartment
    @DepartmentID INT
AS
BEGIN
    DELETE FROM Department WHERE DepartmentID = @DepartmentID;
END
--Selectall

CREATE PROCEDURE GetAllDepartments
AS
BEGIN
    SELECT * FROM Department;
END
--selectid

CREATE PROCEDURE GetDepartmentByID
    @DepartmentID INT
AS
BEGIN
    SELECT * FROM Department WHERE DepartmentID = @DepartmentID;
END