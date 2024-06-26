# create database datapulse;
create table if not exists Vendors
(
    VendorName    varchar(255) not null
        primary key,
    Address       varchar(255) not null,
    ContactPerson varchar(255) not null
);

CREATE TABLE Stores (
                        StoreID INT AUTO_INCREMENT PRIMARY KEY,
                        StoreName VARCHAR(255) NOT NULL,
                        Location VARCHAR(255) NOT NULL,
                        Contact VARCHAR(255)
);
create table Employees
(
    EmployeeID     int auto_increment
        primary key,
    SSN            char(11)             not null,
    Name           varchar(255)         not null,
    Gender         enum ('M', 'F', 'O') not null,
    DoB            date                 not null,
    Position       varchar(255)         null,
    Salary         decimal(10, 2)       null,
    AffiliateStore int                  null,
    SupervisorID   int                  null,
    constraint SSN
        unique (SSN),
    constraint Employees_ibfk_1
        foreign key (AffiliateStore) references Stores (StoreID),
    constraint Employees_ibfk_2
        foreign key (SupervisorID) references Employees (EmployeeID)
);

create table if not exists Products
(
    Name        varchar(255)   not null
        primary key,
    Price       decimal(10, 2) not null,
    Quantity    int            not null,
    Description text           null,
    VendorName  varchar(255)   null,
    constraint Products_ibfk_1
        foreign key (VendorName) references Vendors (VendorName)
);

create index VendorName
    on Products (VendorName);

create table if not exists StoreProducts
(
    StoreID     int          not null,
    ProductName varchar(255) not null,
    primary key (StoreID, ProductName),
    constraint StoreProducts_ibfk_1
        foreign key (StoreID) references Stores (StoreID),
    constraint StoreProducts_ibfk_2
        foreign key (ProductName) references Products (Name)
);

create index ProductName
    on StoreProducts (ProductName);




# use datapulse;
# describe datapulse.Vendors;
#
# insert into Vendors(VendorName, Address, ContactPerson) values("Carol", "Neukolln 45", "Christoph");
# insert into Vendors values("Dior", "Spandau 45", "Alex");
# insert into Vendors values("Addidas", "Potsdam 45", "Ali");
# insert into Vendors values("Nike", "Frankfurt 55", "Ali");
# insert into Vendors values("Amazon", "Virgina 45", "Sergi");
# insert into Vendors values("Microsoft", "Los Angeles 100", "Bill");
# insert into Vendors values("Zara", "Alexandarplatz 900", "Gizem");
# insert into Vendors values("Prima", "Savignyplatz", "Natalya");
# INSERT INTO datapulse.Vendors (VendorName, Address, ContactPerson) VALUES ('Tata', 'Pune 2423', 'Aishwarya');
#
#
# select * from Vendors;
#
# select Vendors.VendorName  from Vendors;
# select Address  from Vendors;
#
# select * from Vendors WHERE VendorName="H&M";
# select * from Vendors WHERE LIKE Vendor;
#
# select * from Products WHERE Price BETWEEN 10 AND 30 ORDER BY Price ASC;
#
# SELECT * from Vendors WHERE NOT VendorName="Zara" AND NOT VendorName="Tata";


CREATE VIEW EmployeeNameSSN AS
SELECT SSN, Name
FROM Employees;

CREATE VIEW EmployeesSupervisors AS
SELECT SSN, Name, Gender, Position from Employees WHERE SupervisorID IS NOT NULL;

CREATE VIEW EmployeesStore as
SELECT EmployeeID, SSN, Name, Position, Salary, Stores.StoreName from Employees INNER JOIN Stores ON Employees.AffiliateStore = Stores.StoreID;

SELECT EmployeeID, SSN, Name, Position, Salary, Stores.StoreName from Employees CROSS JOIN Stores ON Employees.AffiliateStore = Stores.StoreID;

SELECT A.Name AS EmployeeName1, B.Name AS EmployeeName2, A.SupervisorID
FROM Employees A, Employees B
WHERE A.EmployeeID <> B.EmployeeID
  AND A.SupervisorID = B.SupervisorID
ORDER BY A.SupervisorID;