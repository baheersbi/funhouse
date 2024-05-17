use funclub;
DROP PROCEDURE InsertEmployeeWithEmailCheck;
DELIMITER $$

CREATE PROCEDURE InsertEmployeeWithEmailCheck()
BEGIN
    DECLARE v_employee_exists INT DEFAULT 0;

    START TRANSACTION;

    INSERT INTO Employees (SSN, Name, Gender, DoB, Position, Salary, Email)
    VALUES ('543-00-0980', 'Chris Miller', 'M', '1978-03-12', 'Accountant', 58000.00, 'm@k.com');

    SELECT COUNT(*)
    INTO v_employee_exists
    FROM Employees
    WHERE Email = 'm@k.com';

    IF v_employee_exists > 1 THEN
        ROLLBACK;
        SELECT 'Transaction rolled back due to duplicate Email Address.' AS Result;
    ELSE
        -- Otherwise, commit
        COMMIT;
        SELECT 'Transaction committed successfully.' AS Result;
    END IF;
END$$

DELIMITER ;


CREATE PROCEDURE SelectAndCount()
BEGIN
    SELECT * FROM Products;
    SELECT COUNT(*)
               AS EmailCounts
    FROM Employees
    WHERE Email = 'c@d.com';
end;

CALL SelectAndCount();

CALL InsertEmployeeWithEmailCheck();


DELIMITER $$

CREATE PROCEDURE UpdateEmployeeWithSavepoint()
BEGIN
    START TRANSACTION;

    SAVEPOINT BeforeUpdate;

    UPDATE Employees
    SET AffiliateStore = 6, SupervisorID = 2
    WHERE EmployeeID = 7;

    IF ROW_COUNT() = 0 THEN
        ROLLBACK TO BeforeUpdate;
        SELECT 'Transaction rolled back to savepoint due to no rows affected.' AS Result;
        COMMIT;
    ELSE

        COMMIT;
        SELECT 'Transaction committed successfully.' AS Result;
    END IF;
END$$

DELIMITER ;