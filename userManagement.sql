CREATE USER 'max'@'localhost' IDENTIFIED BY '123456';

GRANT INSERT, UPDATE, DELETE ON funclub.* TO 'max'@'localhost';

GRANT INSERT, UPDATE, DELETE ON *.* TO 'nat'@'192.168.65.1';

REVOKE ALL on *.* FROM 'max'@'localhost';

GRANT INSERT ON funclub.Products TO 'max'@'localhost';

CREATE USER 'nat'@'192.168.65.1' IDENTIFIED BY '123456';

FLUSH PRIVILEGES;

