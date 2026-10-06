--2. Task

--1

DECLARE
    x NUMBER := 25;
BEGIN
    IF x < 10 THEN
        dbms_output.put_line('A szám kisebb mint 10');
        
    ELSIF x < 20 THEN
        dbms_output.put_line('A szám 10 és 20 között van');
        
    ELSIF x > 20 THEN
        dbms_output.put_line('A szám kisebb mint 20');
        
    ELSE 
        dbms_output.put_line('A szám 20 vagy nagyobb');
    END IF;
END;



--CASE

--1.

DECLARE
    beosztas VARCHAR(10) := 'dev';
BEGIN
    CASE
        WHEN beosztas = 'dev' THEN dbms_output.put_line('Fejleszto, tervezo');
        WHEN beosztas = 'root' THEN dbms_output.put_line('Rendszergazda (LINUX)');
        WHEN beosztas = 'admin' THEN dbms_output.put_line('Rendszergazda (WIN)');
        WHEN beosztas = 'dba' THEN dbms_output.put_line('Adatbazis Admin');
        WHEN beosztas = 'coder' THEN dbms_output.put_line('Programozo');
        WHEN beosztas = 'sec' THEN dbms_output.put_line('Admin');
        ELSE dbms_output.put_line('egyedi munkakor');
    END CASE;
END;


--FOR WHILE

DECLARE
    n number := 10;
BEGIN
    FOR i IN 1..10 LOOP
        dbms_output.put_line(TO_CHAR(i));
    END LOOP;
END;


--Tömb

DECLARE
    TYPE tomb IS VARRAY(3) OF NUMBER;
    arak tomb := tomb(1500000, 2200000, 1800000);
BEGIN
    FOR i IN 1..arak.COUNT LOOP
        dbms_output.put_line(arak(i));
    END LOOP;
END;

    