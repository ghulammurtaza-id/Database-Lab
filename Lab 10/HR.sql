set serveroutput on;
DECLARE
    mark1 NUMBER := 10;
    mark2 NUMBER := 30;
    mark3 NUMBER := 70;
    avg_marks NUMBER;
BEGIN
    avg_marks := (mark1 + mark2 + mark3) / 3;

    DBMS_OUTPUT.PUT_LINE('Average Marks = ' || avg_marks);
END;
/
DECLARE
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM hr.employees
    WHERE employee_id = 100;

    IF v_salary > 10000 THEN
        DBMS_OUTPUT.PUT_LINE('High Salary');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Normal Salary');
    END IF;
END;
/

DECLARE
    v_salary NUMBER;
BEGIN
    SELECT salary INTO v_salary
    FROM hr.employees
    WHERE employee_id = 100;

    IF v_salary > 10000 THEN
        DBMS_OUTPUT.PUT_LINE('High Salary');
    ELSIF v_salary >= 5000 AND v_salary <= 10000 THEN
        DBMS_OUTPUT.PUT_LINE('Medium Salary');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Normal Salary');
    END IF;
END;
/

DECLARE
    v_job_id VARCHAR2(20);
BEGIN
    SELECT job_id INTO v_job_id
    FROM hr.employees
    WHERE employee_id = 100;

    CASE v_job_id
        WHEN 'IT_PROG' THEN
            DBMS_OUTPUT.PUT_LINE('Programmer');
        WHEN 'SA_REP' THEN
            DBMS_OUTPUT.PUT_LINE('Sales Representative');
        WHEN 'FI_ACCOUNT' THEN
            DBMS_OUTPUT.PUT_LINE('Accountant');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Other Job Role');
    END CASE;
END;
/


BEGIN
    FOR emp IN (
        SELECT first_name, salary
        FROM hr.employees
        WHERE salary > 8000
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(emp.first_name || ' - ' || emp.salary);
    END LOOP;
END;
/