CREATE TABLE DoctorDepartment (
    DoctorDepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT NOT NULL FOREIGN KEY REFERENCES Doctor(DoctorID),
    DepartmentID INT NOT NULL FOREIGN KEY REFERENCES Department(DepartmentID),
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID)
);



--Insert
CREATE PROCEDURE InsertPatient
    @Name NVARCHAR(100),
    @DateOfBirth DATETIME,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(100),
    @Address NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @UserID INT,
    @Modified DATETIME
AS
BEGIN
    INSERT INTO Patient (Name, DateOfBirth, Gender, Email, Phone, Address, City, State, UserID, Modified)
    VALUES (@Name, @DateOfBirth, @Gender, @Email, @Phone, @Address, @City, @State, @UserID, @Modified);
END;

--Update
CREATE PROCEDURE UpdatePatient
    @PatientID INT,
    @Name NVARCHAR(100),
    @DateOfBirth DATETIME,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(100),
    @Address NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @IsActive BIT,
    @UserID INT,
    @Modified DATETIME
AS
BEGIN
    UPDATE Patient
    SET Name = @Name,
        DateOfBirth = @DateOfBirth,
        Gender = @Gender,
        Email = @Email,
        Phone = @Phone,
        Address = @Address,
        City = @City,
        State = @State,
        IsActive = @IsActive,
        UserID = @UserID,
        Modified = @Modified
    WHERE PatientID = @PatientID;
END;

--Delete
CREATE PROCEDURE DeletePatient
    @PatientID INT
AS
BEGIN
    DELETE FROM Patient WHERE PatientID = @PatientID;
END;

--SelectAll
CREATE PROCEDURE GetAllPatients
AS
BEGIN
    SELECT * FROM Patient;
END;

--Selectid
CREATE PROCEDURE GetPatientByID
    @PatientID INT
AS
BEGIN
    SELECT * FROM Patient WHERE PatientID = @PatientID;
END;

