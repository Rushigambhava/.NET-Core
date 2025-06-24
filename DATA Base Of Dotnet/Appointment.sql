CREATE TABLE Appointment (
    AppointmentID INT PRIMARY KEY IDENTITY(1,1),
    DoctorID INT NOT NULL FOREIGN KEY REFERENCES Doctor(DoctorID),
    PatientID INT NOT NULL FOREIGN KEY REFERENCES Patient(PatientID),
    AppointmentDate DATETIME NOT NULL,
    AppointmentStatus NVARCHAR(20) NOT NULL,
    Description NVARCHAR(250),
    SpecialRemarks NVARCHAR(100),
    Created DATETIME NOT NULL DEFAULT GETDATE(),
    Modified DATETIME NOT NULL,
    UserID INT NOT NULL FOREIGN KEY REFERENCES [User](UserID),
    TotalConsultedAmount DECIMAL(5,2) NULL
);

--Insert
CREATE PROCEDURE InsertAppointment
    @DoctorID INT,
    @PatientID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(20),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @UserID INT,
    @TotalConsultedAmount DECIMAL(5,2),
    @Modified DATETIME
AS
BEGIN
    INSERT INTO Appointment (DoctorID, PatientID, AppointmentDate, AppointmentStatus, Description, SpecialRemarks, UserID, TotalConsultedAmount, Modified)
    VALUES (@DoctorID, @PatientID, @AppointmentDate, @AppointmentStatus, @Description, @SpecialRemarks, @UserID, @TotalConsultedAmount, @Modified);
END;

--Update
CREATE PROCEDURE UpdateAppointment
    @AppointmentID INT,
    @DoctorID INT,
    @PatientID INT,
    @AppointmentDate DATETIME,
    @AppointmentStatus NVARCHAR(20),
    @Description NVARCHAR(250),
    @SpecialRemarks NVARCHAR(100),
    @UserID INT,
    @TotalConsultedAmount DECIMAL(5,2),
    @Modified DATETIME
AS
BEGIN
    UPDATE Appointment
    SET DoctorID = @DoctorID,
        PatientID = @PatientID,
        AppointmentDate = @AppointmentDate,
        AppointmentStatus = @AppointmentStatus,
        Description = @Description,
        SpecialRemarks = @SpecialRemarks,
        UserID = @UserID,
        TotalConsultedAmount = @TotalConsultedAmount,
        Modified = @Modified
    WHERE AppointmentID = @AppointmentID;
END;

--Delete
CREATE PROCEDURE DeleteAppointment
    @AppointmentID INT
AS
BEGIN
    DELETE FROM Appointment WHERE AppointmentID = @AppointmentID;
END;

--Selectall
CREATE PROCEDURE GetAllAppointments
AS
BEGIN
    SELECT * FROM Appointment;
END;

--Selectid
CREATE PROCEDURE GetAllAppointments
AS
BEGIN
    SELECT * FROM Appointment;
END;
