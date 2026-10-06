--1. Task 2026-10-06

--1.
begin
dbms_output.put_line('Szendrei Botond');
end;

--2.
declare
s number;
begin 
    s := (10+3);
    dbms_output.put_line(TO_CHAR(S));
end;

--3.
DECLARE
    a number default 10;
    b number default 20;
    s number;
begin
    s:= a*b;
    dbms_output.put_line(TO_CHAR(s)); 
    --szoveggé alakít TO_CHAR(s)
end;

--4.
DECLARE
    t VARCHAR(20) := 'Szendrei Botond';
BEGIN
    SELECT UPPER(t) INTO t FROM dual;
    dbms_output.put_line((t));
    
    SELECT LOWER(t) INTO t FROM dual;
    dbms_output.put_line((t));
    
    SELECT INITCAP(t) INTO t FROM dual;
    dbms_output.put_line((t)); 
END;

--5.
DECLARE
    t1 VARCHAR(10) := 'Szendrei';
    t2 VARCHAR(10) := 'Botond';
    t VARCHAR(20) := '';
    
BEGIN
    SELECT CONCAT(t1,t2) INTO t FROM dual;
    dbms_output.put_line(t);
END;

--6.
DECLARE
    d DATE;
BEGIN
    SELECT sysdate INTO d FROM dual;
    dbms_output.put_line(d);
END;

--7.
DECLARE
    igaz BOOLEAN := TRUE;
BEGIN
    IF igaz THEN
        dbms_output.put_line('Igaz');
    ELSE
        dbms_output.put_line('Hamis');
    END IF;
END;



