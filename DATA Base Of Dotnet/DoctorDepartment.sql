CREATE TABLE DoctorDepartment (
    DoctorDepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT NOT NULL FOREIGN KEY REFERENCES Doctor(DoctorID),
    DepartmentID INT NOT NULL FOREIGN KEY REFERENCES Department(DepartmentID),
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID)
);

--Insert
CREATE PROCEDURE InsertDoctorDepartment
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT,
    @Modified DATETIME
AS
BEGIN
    INSERT INTO DoctorDepartment (DoctorID, DepartmentID, UserID, Modified)
    VALUES (@DoctorID, @DepartmentID, @UserID, @Modified);
END;

--Update
CREATE PROCEDURE UpdateDoctorDepartment
    @DoctorDepartmentID INT,
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT,
    @Modified DATETIME
AS
BEGIN
    UPDATE DoctorDepartment
    SET DoctorID = @DoctorID,
        DepartmentID = @DepartmentID,
        UserID = @UserID,
        Modified = @Modified
    WHERE DoctorDepartmentID = @DoctorDepartmentID;
END;

--Delete
CREATE PROCEDURE DeleteDoctorDepartment
    @DoctorDepartmentID INT
AS
BEGIN
    DELETE FROM DoctorDepartment WHERE DoctorDepartmentID = @DoctorDepartmentID;
END;

--Seleteall
CREATE PROCEDURE GetAllDoctorDepartments
AS
BEGIN
    SELECT * FROM DoctorDepartment;
END;


--Selectid
CREATE PROCEDURE GetDoctorDepartmentByID
    @DoctorDepartmentID INT
AS
BEGIN
    SELECT * FROM DoctorDepartment WHERE DoctorDepartmentID = @DoctorDepartmentID;
END;
