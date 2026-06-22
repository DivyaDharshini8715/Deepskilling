-- =========================================
-- SCENARIO 3: TransferFunds
-- =========================================

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE BANK_ACCOUNTS';
EXCEPTION
    WHEN OTHERS THEN NULL;
END;
/

CREATE TABLE BANK_ACCOUNTS (
    ACCOUNT_ID NUMBER PRIMARY KEY,
    ACCOUNT_HOLDER VARCHAR2(50),
    BALANCE NUMBER(10,2)
);
/

INSERT INTO BANK_ACCOUNTS VALUES (201, 'Ravi', 20000);
INSERT INTO BANK_ACCOUNTS VALUES (202, 'Priya', 15000);
INSERT INTO BANK_ACCOUNTS VALUES (203, 'Divya', 10000);
COMMIT;
/

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_acc IN NUMBER,
    p_to_acc   IN NUMBER,
    p_amount   IN NUMBER
)
AS
    v_balance NUMBER;
BEGIN
    SELECT BALANCE
    INTO v_balance
    FROM BANK_ACCOUNTS
    WHERE ACCOUNT_ID = p_from_acc;

    IF v_balance >= p_amount THEN
        UPDATE BANK_ACCOUNTS
        SET BALANCE = BALANCE - p_amount
        WHERE ACCOUNT_ID = p_from_acc;

        UPDATE BANK_ACCOUNTS
        SET BALANCE = BALANCE + p_amount
        WHERE ACCOUNT_ID = p_to_acc;

        COMMIT;
        DBMS_OUTPUT.PUT_LINE('Transfer successful.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient balance.');
    END IF;
END;
/

BEGIN
    TransferFunds(201, 202, 5000);
END;
/

SELECT * FROM BANK_ACCOUNTS;
/