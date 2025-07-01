



-- Procedure: PR_Users_SelectAll
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Users_SelectAll]
AS
BEGIN
    SELECT Users.*
    FROM Users
    ORDER BY UserID;
END
GO


-- Procedure: PR_Users_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Users_SelectByPK]
    @UserID INT
AS
BEGIN
    SELECT * FROM Users
    WHERE UserID = @UserID
    ORDER BY UserID;
END
GO


-- Procedure: PR_Users_Insert 
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Users_Insert]
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100),
    @IsActive BIT
AS
BEGIN
    INSERT INTO Users (UserName, Password, Email, MobileNo, IsActive, Created, Modified)
    VALUES (@UserName, @Password, @Email, @MobileNo, @IsActive, GETDATE(), GETDATE());
END
GO


-- Procedure: PR_Users_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Users_UpdateByPK]
    @UserID INT,
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100),
    @IsActive BIT
AS
BEGIN
    UPDATE Users
    SET 
        UserName = @UserName,
        Password = @Password,
        Email = @Email,
        MobileNo = @MobileNo,
        IsActive = @IsActive,
        Modified = GETDATE()
    WHERE UserID = @UserID;
END
GO


-- Procedure: PR_Users_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Users_DeleteByPK]
    @UserID INT
AS
BEGIN
    DELETE FROM Users
    WHERE UserID = @UserID;
END
GO


-- Procedure: PR_Departments_SelectAll
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_SelectAll]
AS
BEGIN
    SELECT Departments.*, Users.UserName
    FROM Departments
    INNER JOIN Users ON Departments.UserID = Users.UserID
    ORDER BY DepartmentID;
END
GO


-- Procedure: PR_Departments_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_SelectByPK]
    @DepartmentID INT
AS
BEGIN
    SELECT * FROM Departments
    WHERE DepartmentID = @DepartmentID
    ORDER BY DepartmentID;
END
GO


-- Procedure: PR_Departments_Insert
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_Insert]
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    INSERT INTO Departments (DepartmentName, Description, IsActive, UserID, Created, Modified)
    VALUES (@DepartmentName, @Description, @IsActive, @UserID, GETDATE(), GETDATE());
END
GO


-- Procedure: PR_Departments_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_UpdateByPK]
    @DepartmentID INT,
    @DepartmentName NVARCHAR(100),
    @Description NVARCHAR(250),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    UPDATE Departments
    SET 
        DepartmentName = @DepartmentName,
        Description = @Description,
        IsActive = @IsActive,
        UserID = @UserID,
        Modified = GETDATE()
    WHERE DepartmentID = @DepartmentID;
END
GO


-- Procedure: PR_Departments_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Departments_DeleteByPK]
    @DepartmentID INT
AS
BEGIN
    DELETE FROM Departments
    WHERE DepartmentID = @DepartmentID;
END
GO


-- Procedure: PR_Doctors_SelectAll

CREATE OR ALTER PROCEDURE [dbo].[PR_Doctors_SelectAll]
AS
BEGIN
    SELECT Doctors.*, Users.UserName
    FROM Doctors
    INNER JOIN Users ON Doctors.UserID = Users.UserID
    ORDER BY DoctorID;
END
GO


-- Procedure: PR_Doctors_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Doctors_SelectByPK]
    @DoctorID INT
AS
BEGIN
    SELECT * FROM Doctors
    WHERE DoctorID = @DoctorID
    ORDER BY DoctorID;
END
GO


-- Procedure: PR_Doctors_Insert
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Doctors_Insert]
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    INSERT INTO Doctors (Name, Phone, Email, Qualification, Specialization, IsActive, UserID, Created, Modified)
    VALUES (@Name, @Phone, @Email, @Qualification, @Specialization, @IsActive, @UserID, GETDATE(), GETDATE());
END
GO


-- Procedure: PR_Doctors_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Doctors_UpdateByPK]
    @DoctorID INT,
    @Name NVARCHAR(100),
    @Phone NVARCHAR(20),
    @Email NVARCHAR(100),
    @Qualification NVARCHAR(100),
    @Specialization NVARCHAR(100),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    UPDATE Doctors
    SET 
        Name = @Name,
        Phone = @Phone,
        Email = @Email,
        Qualification = @Qualification,
        Specialization = @Specialization,
        IsActive = @IsActive,
        UserID = @UserID,
        Modified = GETDATE()
    WHERE DoctorID = @DoctorID;
END
GO


-- Procedure: PR_Doctors_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Doctors_DeleteByPK]
    @DoctorID INT
AS
BEGIN
    DELETE FROM Doctors
    WHERE DoctorID = @DoctorID;
END
GO


-- Procedure: PR_DoctorDepartments_SelectAll
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartments_SelectAll]
AS
BEGIN
    SELECT DoctorDepartments.*, Users.UserName
    FROM DoctorDepartments
    INNER JOIN Doctors ON DoctorDepartments.DoctorID = Doctors.DoctorID
    INNER JOIN Departments ON DoctorDepartments.DepartmentID = Departments.DepartmentID
    INNER JOIN Users ON DoctorDepartments.UserID = Users.UserID
    ORDER BY DoctorDepartmentID;
END
GO


-- Procedure: PR_DoctorDepartments_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartments_SelectByPK]
    @DoctorDepartmentID INT
AS
BEGIN
    SELECT * FROM DoctorDepartments
    WHERE DoctorDepartmentID = @DoctorDepartmentID
    ORDER BY DoctorDepartmentID;
END
GO


-- Procedure: PR_DoctorDepartments_Insert
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartments_Insert]
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT
AS
BEGIN
    INSERT INTO DoctorDepartments (DoctorID, DepartmentID, UserID, Created, Modified)
    VALUES (@DoctorID, @DepartmentID, @UserID, GETDATE(), GETDATE());
END
GO


-- Procedure: PR_DoctorDepartments_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartments_UpdateByPK]
    @DoctorDepartmentID INT,
    @DoctorID INT,
    @DepartmentID INT,
    @UserID INT
AS
BEGIN
    UPDATE DoctorDepartments
    SET 
        DoctorID = @DoctorID,
        DepartmentID = @DepartmentID,
        UserID = @UserID,
        Modified = GETDATE()
    WHERE DoctorDepartmentID = @DoctorDepartmentID;
END
GO


-- Procedure: PR_DoctorDepartments_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_DoctorDepartments_DeleteByPK]
    @DoctorDepartmentID INT
AS
BEGIN
    DELETE FROM DoctorDepartments
    WHERE DoctorDepartmentID = @DoctorDepartmentID;
END
GO


-- Procedure: PR_Patients_SelectAll
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Patients_SelectAll]
AS
BEGIN
    SELECT Patients.*, Users.UserName
    FROM Patients
    INNER JOIN Users ON Patients.UserID = Users.UserID
    ORDER BY PatientID;
END
GO


-- Procedure: PR_Patients_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Patients_SelectByPK]
    @PatientID INT
AS
BEGIN
    SELECT * FROM Patients
    WHERE PatientID = @PatientID
    ORDER BY PatientID;
END
GO


-- Procedure: PR_Patients_Insert
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Patients_Insert]
    @Name NVARCHAR(100),
    @DateOfBirth DATETIME,
    @Gender NVARCHAR(10),
    @Email NVARCHAR(100),
    @Phone NVARCHAR(100),
    @Address NVARCHAR(250),
    @City NVARCHAR(100),
    @State NVARCHAR(100),
    @IsActive BIT,
    @UserID INT
AS
BEGIN
    INSERT INTO Patients (Name, DateOfBirth, Gender, Email, Phone, Address, City, State, IsActive, UserID, Created, Modified)
    VALUES (@Name, @DateOfBirth, @Gender, @Email, @Phone, @Address, @City, @State, @IsActive, @UserID, GETDATE(), GETDATE());
END
GO


-- Procedure: PR_Patients_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Patients_UpdateByPK]
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
    @UserID INT
AS
BEGIN
    UPDATE Patients
    SET 
        Name = @Name,
        DateOfBirth = @DateOfBirth,
        Gender = @Gender,
        Email = @Email,
        Phone = @Phone,
        Address = @Address,
        City = @City,
        State = @State,
        IsActive = @IsActive,
        UserID = @UserID,
        Modified = GETDATE()
    WHERE PatientID = @PatientID;
END
GO


-- Procedure: PR_Patients_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Patients_DeleteByPK]
    @PatientID INT
AS
BEGIN
    DELETE FROM Patients
    WHERE PatientID = @PatientID;
END
GO


-- Procedure: PR_Appointments_SelectAll
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Appointments_SelectAll]
AS
BEGIN
    SELECT Appointments.*, Users.UserName
    FROM Appointments
    INNER JOIN Doctors ON Appointments.DoctorID = Doctors.DoctorID
    INNER JOIN Patients ON Appointments.PatientID = Patients.PatientID
    INNER JOIN Users ON Appointments.UserID = Users.UserID
    ORDER BY AppointmentID;
END
GO


-- Procedure: PR_Appointments_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Appointments_SelectByPK]
    @AppointmentID INT
AS
BEGIN
    SELECT * FROM Appointments
    WHERE AppointmentID = @AppointmentID
    ORDER BY AppointmentID;
END
GO


-- Procedure: PR_Appointments_Insert
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Appointments_Insert]
    @DoctorID INT,
    @PatientID INT,
    @UserID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(50),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @TotalConsultedAmount DECIMAL(5,2)
AS
BEGIN
    INSERT INTO Appointments (DoctorID, PatientID, UserID, AppointmentDate, AppointmentStatus, Description, SpecialRemarks, TotalConsultedAmount, Created, Modified)
    VALUES (@DoctorID, @PatientID, @UserID, @AppointmentDate, @AppointmentStatus, @Description, @SpecialRemarks, @TotalConsultedAmount, GETDATE(), GETDATE());
END
GO


-- Procedure: PR_Appointments_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_Appointments_UpdateByPK]
    @AppointmentID INT,
    @DoctorID INT,
    @PatientID INT,
    @UserID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(50),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @TotalConsultedAmount DECIMAL(5,2)
AS
BEGIN
    UPDATE Appointments
    SET 
        DoctorID = @DoctorID,
        PatientID = @PatientID,
        UserID = @UserID,
        AppointmentDate = @AppointmentDate,
        AppointmentStatus = @AppointmentStatus,
        Description = @Description,
        SpecialRemarks = @SpecialRemarks,
        TotalConsultedAmount = @TotalConsultedAmount,
        Modified = GETDATE()
    WHERE AppointmentID = @AppointmentID;
END
GO


-- Procedure: PR_Appointments_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_Appointments_DeleteByPK]
    @AppointmentID INT
AS
BEGIN
    DELETE FROM Appointments
    WHERE AppointmentID = @AppointmentID;
END
GO


-- Procedure: PR_MedicalRecords_SelectAll
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_MedicalRecords_SelectAll]
AS
BEGIN
    SELECT MedicalRecords.*
    FROM MedicalRecords
    INNER JOIN Patients ON MedicalRecords.PatientID = Patients.PatientID
    INNER JOIN Doctors ON MedicalRecords.DoctorID = Doctors.DoctorID
    ORDER BY RecordID;
END
GO


-- Procedure: PR_MedicalRecords_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_MedicalRecords_SelectByPK]
    @RecordID INT
AS
BEGIN
    SELECT * FROM MedicalRecords
    WHERE RecordID = @RecordID
    ORDER BY RecordID;
END
GO


-- Procedure: PR_MedicalRecords_Insert
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦

CREATE OR ALTER PROCEDURE [dbo].[PR_MedicalRecords_Insert]
    @PatientID INT,
    @DoctorID INT,
    @VisitDate DATE,
    @Diagnosis TEXT,
    @Treatment TEXT
AS
BEGIN
    INSERT INTO MedicalRecords (PatientID, DoctorID, VisitDate, Diagnosis, Treatment, Created)
    VALUES (@PatientID, @DoctorID, @VisitDate, @Diagnosis, @Treatment, GETDATE());
END
GO


-- Procedure: PR_MedicalRecords_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_MedicalRecords_UpdateByPK]
    @RecordID INT,
    @PatientID INT,
    @DoctorID INT,
    @VisitDate DATE,
    @Diagnosis TEXT,
    @Treatment TEXT
AS
BEGIN
    UPDATE MedicalRecords
    SET 
        PatientID = @PatientID,
        DoctorID = @DoctorID,
        VisitDate = @VisitDate,
        Diagnosis = @Diagnosis,
        Treatment = @Treatment
    WHERE RecordID = @RecordID;
END
GO


-- Procedure: PR_MedicalRecords_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_MedicalRecords_DeleteByPK]
    @RecordID INT
AS
BEGIN
    DELETE FROM MedicalRecords
    WHERE RecordID = @RecordID;
END
GO


-- Procedure: PR_Medications_SelectAll
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_Medications_SelectAll]
AS
BEGIN
    SELECT Medications.*
    FROM Medications
    ORDER BY MedicationID;
END
GO


-- Procedure: PR_Medications_SelectByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_Medications_SelectByPK]
    @MedicationID INT
AS
BEGIN
    SELECT * FROM Medications
    WHERE MedicationID = @MedicationID
    ORDER BY MedicationID;
END
GO


-- Procedure: PR_Medications_Insert
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_Medications_Insert]
    @Name NVARCHAR(100),
    @Description TEXT,
    @Stock INT,
    @UnitPrice DECIMAL(10,2)
AS
BEGIN
    INSERT INTO Medications (Name, Description, Stock, UnitPrice, Created)
    VALUES (@Name, @Description, @Stock, @UnitPrice, GETDATE());
END
GO


-- Procedure: PR_Medications_UpdateByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_Medications_UpdateByPK]
    @MedicationID INT,
    @Name NVARCHAR(100),
    @Description TEXT,
    @Stock INT,
    @UnitPrice DECIMAL(10,2)
AS
BEGIN
    UPDATE Medications
    SET 
        Name = @Name,
        Description = @Description,
        Stock = @Stock,
        UnitPrice = @UnitPrice
    WHERE MedicationID = @MedicationID;
END
GO


-- Procedure: PR_Medications_DeleteByPK
--✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦✦
CREATE OR ALTER PROCEDURE [dbo].[PR_Medications_DeleteByPK]
    @MedicationID INT
AS
BEGIN
    DELETE FROM Medications
    WHERE MedicationID = @MedicationID;
END
GO


