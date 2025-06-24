CREATE TABLE [User] (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(100) NOT NULL,
    Password NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    MobileNo NVARCHAR(100) NOT NULL,
    IsActive BIT NOT NULL DEFAULT 1,
    Created DATETIME DEFAULT GETDATE(),
    Modified DATETIME NOT NULL
);



-- Insert
CREATE PROCEDURE PR_USER_InsertUser
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100),
    @Modified DATETIME
AS
BEGIN
    INSERT INTO [User](UserName, Password, Email, MobileNo, Modified)
    VALUES (@UserName, @Password, @Email, @MobileNo, @Modified);
END

-- Update
CREATE PROCEDURE UpdateUser
    @UserID INT,
    @UserName NVARCHAR(100),
    @Password NVARCHAR(100),
    @Email NVARCHAR(100),
    @MobileNo NVARCHAR(100),
    @IsActive BIT,
    @Modified DATETIME
AS
BEGIN
    UPDATE [User]
    SET UserName = @UserName, Password = @Password, Email = @Email,
        MobileNo = @MobileNo, IsActive = @IsActive, Modified = @Modified
    WHERE UserID = @UserID;
END

-- Delete
CREATE PROCEDURE DeleteUser
    @UserID INT
AS
BEGIN
    DELETE FROM [User] WHERE UserID = @UserID;
END

-- Select All
CREATE PROCEDURE GetAllUsers
AS
BEGIN
    SELECT * FROM [User];
END

-- Select by ID
CREATE PROCEDURE GetUserByID
    @UserID INT
AS
BEGIN
    SELECT * FROM [User] WHERE UserID = @UserID;
END


