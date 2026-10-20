CREATE TABLE Auto2
(
    ID number(4) PRIMARY KEY,
    Rendszam varchar2(6),
    Tipus varchar2(20),
    Szin varchar2(20),
    Kor number(3),
    Ar number(10),
    Muszaki_erv DATE
);

desc Auto2;

SELECT * FROM Auto2
//Adat beszúrás
BEGIN
INSERT INTO Auto2 VALUES (1, 'ABC123', 'Opel Corsa', 'Piros', 6, 3200000, TO_DATE('05.08.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (2, 'QWJ612', 'Suzuki Alto', 'Kék', 15, 5000000, TO_DATE('03.12.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (3, 'PHD229', 'Scoda Scala', 'Fehér', 1, 6800000, TO_DATE('10.06.2025', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (4, 'PET220', 'Opel Astra', 'Fekete', 3, 4400000, TO_DATE('08.05.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (5, 'RWE611', 'Ford Focus', 'Sárga', 4, 5300000, TO_DATE('05.12.2025', 'DD-MM-YYYY'));
END;

SELECT sysdate from Auto2;


CREATE OR REPLACE PROCEDURE Atlag AS
    b Auto2.Ar%TYPE;
BEGIN
SELECT AVG(Ar) INTO b FROM Auto2;
    DBMS_OUTPUT.PUT_LINE(b);
END;

Begin
    Atlag;
End;

2.------

CREATE OR REPLACE PROCEDURE Atlag AS
    x Auto2.Ar%TYPE;
    xszb varchar(30);
BEGIN
SELECT AVG(Ar) INTO x FROM Auto2;
    xszb := TO_CHAR(x, '9G999G999G999');
    xszb :=LTRIM(REPLACE(xszb, ',', ' '));
    DBMS_OUTPUT.PUT_LINE('Eredmény: '||xszb||' HUF');
END;

Begin
    Atlag;
End;

---IN ---- OUT

create procedure negyzet (a in number, b out number) is
begin
    b := a*a;
end;

--Futtatás---
declare
    a int := 10;
    b int;
begin
    negyzet(a, b);
    DBMS_OUTPUT.PUT_LINE(b);
end;

----3.---

create or replace Function RendszamSzin (rszbe in char) return char as
    b auto2.szin%type;
begin
    select Szin into b from Auto2 where Rendszam= rszbe;
    return b;
end;

select RendszamSzin('ABC123') FROM dual; 
//vagy
declare
    b char(40);
begin
    b := RendszamSzin('ABC123');
    DBMS_OUTPUT.PUT_LINE(b);
END;

--Tárolt eljárás-- 

--új rekord felvitel

create or replace procedure UjRekord (idbe in number, rszbe in char,
tipbe in char, szinbe in char, korbe in number,
arbe in number, muszbe in date) is
begin
    insert into Auto2 values (idbe, rszbe, tipbe, szinbe, korbe, arbe, muszbe);
end;

select * from Auto2;

begin
    Ujrekord (14, 'RRR555', 'Ford Kuga', 'szurke', 5, 5200000, DATE '2017-06-05');
END;

--Szín módosító--

create or replace procedure AutoModosit (idbe in number, szinbe in char) is
begin
    update Auto2 set Szin = szinbe where id = idbe;
end;

select * from Auto2;

begin
    AutoModosit(14, 'piros');
end;

--törlés

create or replace procedure AutoTorol (idbe in number) is
begin
    delete Auto2 where id = idbe;
end;

select * from Auto2;

begin
    AutoTorol(3);
end;




      