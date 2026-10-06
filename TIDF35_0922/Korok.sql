CREATE TABLE Korok(
Sugar NUMBER (4) PRIMARY KEY,
Kerulet NUMBER,
Terulet NUMBER
);

DESCRIBE Korok;

SELECT 1 Sugar, 2*1*3.1415926454 kerulet from dual;

CREATE OR REPLACE FUNCTION PI RETURN NUMBER AS
BEGIN
RETURN 3.1415926454;
END;

SELECT 1 Sugar, 2*1*PI kerulet from dual;

DECLARE
    Sugar number:=1;
    Kerulet number;
BEGIN
    Kerulet := 2*Sugar*PI();
    DBMS_OUTPUT.PUT_LINE ('Sugar: '||Sugar|| 'Kerulet:' ||Kerulet);
END;


---Kör Terület


DECLARE
    Sugar number:=1;
    Terulet number;
BEGIN
    Terulet := POWER(Sugar, 2) * PI();
    DBMS_OUTPUT.PUT_LINE ('Sugar: '||Sugar|| 'Terulet:' ||Terulet);
END;

DECLARE
    Kerulet number;
    x number:=1;
    y number:=5;
BEGIN

for i in x..y LOOP
    Kerulet:=2.i.PI();
    DBMS_OUTPUT.PUT_LINE('Sugar: ' ||i|| 'Kerulet:' ||Kerulet);
END LOOP;
END;

CREATE OR REPLACE PROCEDURE Kor (x in number, y in number) IS
Kerulet number;
BEGIN
for i in x..y LOOP
    Kerulet:=2*i*PI();
    DBMS_OUTPUT.PUT_LINE('Sugar: ' ||i|| 'Kerulet:' ||Kerulet);
END LOOP;
END;

BEGIN
    Kor(1,5);
END;

CREATE OR REPLACE PROCEDURE Circle (x in number, y in number) IS
Circleference number;
Area number;
BEGIN
for i in x..y LOOP
Circleference:=2.i.PI();
Area:= Power(i,2)*PI();
DBMS_OUTPUT.PUT_LINE('Radius'||i||' Circleference:'||Circleferenc||'Area:'||Area);
END LOOP;
END;

BEGIN
Circle(1,10);
END;
    

