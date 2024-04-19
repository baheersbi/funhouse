create database datapulse;

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

create table if not exists datapulse.Products
(
    Name        varchar(255)   not null
        primary key,
    Price       decimal(10, 2) not null,
    Quantity    int            not null,
    Description text           null,
    VendorName  varchar(255)   null,
    constraint Products_ibfk_1
        foreign key (VendorName) references datapulse.Vendors (VendorName)
);

create index VendorName
    on datapulse.Products (VendorName);

create table if not exists datapulse.StoreProducts
(
    StoreID     int          not null,
    ProductName varchar(255) not null,
    primary key (StoreID, ProductName),
    constraint StoreProducts_ibfk_1
        foreign key (StoreID) references datapulse.Stores (StoreID),
    constraint StoreProducts_ibfk_2
        foreign key (ProductName) references datapulse.Products (Name)
);

create index ProductName
    on datapulse.StoreProducts (ProductName);

create table if not exists datapulse.Vendors
(
    VendorName    varchar(255) not null
        primary key,
    Address       varchar(255) not null,
    ContactPerson varchar(255) not null
);
