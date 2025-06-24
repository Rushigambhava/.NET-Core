CREATE TABLE DoctorDepartment (
    DoctorDepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT NOT NULL FOREIGN KEY REFERENCES Doctor(DoctorID),
    DepartmentID INT NOT NULL FOREIGN KEY REFERENCES Department(DepartmentID),
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID)
);

--Insert
CREATE PROCEDURE InsertDoctor
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @Modified DATETIME,
    @UserID INT
AS
BEGIN
    INSERT INTO Doctor(Name, Phone, Email, Qualification, Specialization, Modified, UserID)
    VALUES (@Name, @Phone, @Email, @Qualification, @Specialization, @Modified, @UserID);
END
--upadet

CREATE PROCEDURE UpdateDoctor
    @DoctorID INT,
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @IsActive BIT,
    @Modified DATETIME,
    @UserID INT
AS
BEGIN
    UPDATE Doctor
    SET Name = @Name, Phone = @Phone, Email = @Email, Qualification = @Qualification,
        Specialization = @Specialization, IsActive = @IsActive,
        Modified = @Modified, UserID = @UserID
    WHERE DoctorID = @DoctorID;
END
--Delete

CREATE PROCEDURE DeleteDoctor
    @DoctorID INT
AS
BEGIN
    DELETE FROM Doctor WHERE DoctorID = @DoctorID;
END
--Selectall

CREATE PROCEDURE GetAllDoctors
AS
BEGIN
    SELECT * FROM Doctor;
END

--Selectid
CREATE PROCEDURE GetDoctorByID
    @DoctorID INT
AS
BEGIN
    SELECT * FROM Doctor WHERE DoctorID = @DoctorID;
END
GO