create database datapulse;

CREATE TABLE Stores (
                        StoreID INT AUTO_INCREMENT PRIMARY KEY,
                        StoreName VARCHAR(255) NOT NULL,
                        Location VARCHAR(255) NOT NULL,
                        Contact VARCHAR(255)
);
