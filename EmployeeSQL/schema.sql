CREATE TABLE department (
    DeptID VARCHAR(20) PRIMARY KEY,
    Name VARCHAR(200)
);

CREATE TABLE title (
    TitleID VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(200)
);

CREATE TABLE employee (
    EmpID int PRIMARY KEY,
    TitleID VARCHAR(20),
    BirthDate DATE,
    FirstName VARCHAR(200),
    LastName VARCHAR(200),
    Gender VARCHAR(15),
    HireDate DATE,
	FOREIGN KEY(TitleID) REFERENCES title (TitleID)
);

CREATE TABLE dept_employee (
    EmpID int,
    DeptID VARCHAR(20),
	FOREIGN KEY(DeptID) REFERENCES department (DeptID),
	FOREIGN KEY(EmpID) REFERENCES employee (EmpID)
);

CREATE TABLE dept_manager (
    DeptID VARCHAR(20),
    EmpID int,
	FOREIGN KEY(DeptID) REFERENCES department (DeptID),
	FOREIGN KEY(EmpID) REFERENCES employee (EmpID)
);

CREATE TABLE salary (
    EmpID int,
    Salary int,
	FOREIGN KEY(EmpID) REFERENCES employee (EmpID)
);

