-- =========================================
-- SCENARIO 2: UpdateEmployeeBonus
-- =========================================

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE EMPLOYEES';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE EMPLOYEES (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(50),
    DEPARTMENT VARCHAR2(30),
    SALARY NUMBER(10,2)
);
/

INSERT INTO EMPLOYEES VALUES (1, 'Arun', 'IT', 30000);
INSERT INTO EMPLOYEES VALUES (2, 'Meena', 'HR', 25000);
INSERT INTO EMPLOYEES VALUES (3, 'Karthik', 'IT', 40000);
INSERT INTO EMPLOYEES VALUES (4, 'Priya', 'Finance', 35000);
COMMIT;
/

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department IN VARCHAR2,
    p_bonus_percent IN NUMBER
)
AS
BEGIN
    UPDATE EMPLOYEES
    SET SALARY = SALARY + (SALARY * p_bonus_percent / 100)
    WHERE DEPARTMENT = p_department;

    COMMIT;
    DBMS_OUTPUT.PUT_LINE('Bonus updated successfully for department: ' || p_department);
END;
/

BEGIN
    UpdateEmployeeBonus('IT', 10);
END;
/

SELECT * FROM EMPLOYEES;
/