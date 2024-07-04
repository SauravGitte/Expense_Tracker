CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    -- EmailVerified BOOLEAN DEFAULT FALSE,
    -- PhoneVerified BOOLEAN DEFAULT FALSE,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
    
);

CREATE TABLE ExpenseTypes (
    ExpenseTypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50) NOT NULL
);


CREATE TABLE Expenses (
    ExpenseID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ExpenseTypeID INT,
    Amount DECIMAL(10, 2) NOT NULL,
    ExpenseDate DATE NOT NULL,
    Description VARCHAR(255),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ExpenseTypeID) REFERENCES ExpenseTypes(ExpenseTypeID)
);

CREATE TABLE Budgets (
    BudgetID INT PRIMARY KEY AUTO_INCREMENT,
    UserID INT,
    ExpenseTypeID INT,
    BudgetAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (ExpenseTypeID) REFERENCES ExpenseTypes(ExpenseTypeID)
);
