# Expense_Tracker
Expense Tracker was a group project that me and my friends did in our course of DBMS. 

Let's BEGIN.....
Welcome to the Expense Tracker project! This is a web-based application that allows users to track their expenses and manage budgets efficiently. 

## Table of Contents
- [Introduction]
- [Features]
- [Tech Stack]
- [Installation]
- [Usage]
- [Database Schema]
- [Contributing]

## Introduction

The Expense Tracker is a web application designed to help users track their expenses, set budgets, and visualize their spending habits. The application is built using HTML, CSS for the front end, and PHP for the back end, with a MySQL relational database.

## Features

- User authentication (login and sign up)
- Dashboard with bar graph and pie chart for visualizing expenses and budgets
- Detailed list of expenses with options to add and delete
- Budget management with the ability to set and adjust budget amounts

## Tech Stack

### Front End
- **HTML**: Provides the structure of the web pages.
- **CSS**: Styles the HTML elements to create an attractive and responsive user interface.

### Back End
- **PHP**: Handles the server-side logic and database interactions.
- **MySQL**: Stores user data, expense records, and budget information in a relational database.

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/SauravGitte/Expense_Tracker.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Expense_Tracker
   ```
3. Set up the database:
   - Create a MySQL database named `expense_tracker`.
   - Import the provided SQL scripts to create the necessary tables.

4. Configure the database connection in the `config.php` file:
   ```php
   <?php
   $servername = "your_server_name";
   $username = "your_username";
   $password = "your_password";
   $dbname = "expense_tracker";

   // Create connection
   $conn = new mysqli($servername, $username, $password, $dbname);

   // Check connection
   if ($conn->connect_error) {
       die("Connection failed: " . $conn->connect_error);
   }
   ?>
   ```

5. Start the PHP server:
   ```bash
   php -S localhost:8000
   ```

6. Open your web browser and navigate to `http://localhost:8000` to access the Expense Tracker.

## Usage

1. Register a new user account or log in with existing credentials.
2. Use the dashboard to get an overview of your expenses and remaining budgets.
3. Add new expenses through the "Add Expense" section.
4. Set and manage budgets in the "Budget" section.
5. View and delete expenses from the detailed list in the dashboard.

## Database Schema

```sql
CREATE TABLE Users (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15) UNIQUE NOT NULL,
    Password VARCHAR(100) NOT NULL,
    EmailVerified BOOLEAN DEFAULT FALSE,
    PhoneVerified BOOLEAN DEFAULT FALSE,
    RegistrationDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE ExpenseTypes (
    ExpenseTypeID INT PRIMARY KEY AUTO_INCREMENT,
    TypeName VARCHAR(50) NOT NULL UNIQUE
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
```

## Contributing

Contributions are welcome! Please fork this repository and submit a pull request for any changes you propose.


---
