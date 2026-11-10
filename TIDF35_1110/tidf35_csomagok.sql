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


BEGIN
INSERT INTO Auto2 VALUES (1, 'ABC123', 'Opel Corsa', 'Piros', 6, 3200000, TO_DATE('05.08.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (2, 'QWJ612', 'Suzuki Alto', 'Kék', 15, 5000000, TO_DATE('03.12.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (3, 'PHD229', 'Scoda Scala', 'Fehér', 1, 6800000, TO_DATE('10.06.2025', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (4, 'PET220', 'Opel Astra', 'Fekete', 3, 4400000, TO_DATE('08.05.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (5, 'RWE611', 'Ford Focus', 'Sárga', 4, 5300000, TO_DATE('05.12.2025', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (6, 'RWE613', 'Opel Corsa', 'Fekete', 3, 5350000, TO_DATE('04.12.2025', 'DD-MM-YYYY'));
END;

select * from auto2;

--1.

create or replace procedure UjAuto (idbe in number, rszbe in char, tipbe in char,
    szinbe in char, korbe in number, arbe in number, muszbe in char) is
begin
    insert into Auto2 values (idbe, rszbe, szinbe, korbe, arbe, muszbe);
end;    

--2.

create or replace procedure AutoModosit (idbe in number, szinbe in char) is
begin
    update Auto set Szin = szinbe where ID = idbe;
end;

--3.

create or replace procedure AutoTorol (idbe in number) is
begin
    delete from Auto2 where ID = idbe
end;

create or replace Package AutoCsomag as
    Procedure UjAuto (idbe in number, rszbe in char, tipbe in char,
    szinbe in char, korbe in number, arbe in number, muszbe in char);
    Procedure AutoModosit (idbe in number, szinbe in char);
    Procedure AutoTorol (idbe in number);
end AutoCsomag;    

--4.Törsz
create or replace Package body AutoCsomag as
Procedure UjAuto (idbe in number, rszbe in char, tipbe in char,
    szinbe in char, korbe in number, arbe in number, muszbe in char) is
begin
    insert into Auto2 values (idbe, rszbe, tipbe, szinbe, korbe, arbe, muszbe);
end;
Procedure AutoModosit (idbe in number, szinbe in char) is
begin
    update Auto2 set Szin = szinbe where ID = idbe;
end;
Procedure AutoTorol (idbe in number) is
begin
    delete from Auto2 where ID = idbe;
end;
end AutoCsomag;

-----------------------

begin
    AutoCsomag.UjAuto(15, 'SZB215', 'BMW', 'Fekete', 3, 15900000, TO_DATE('03.01.2026', 'DD.MM.YYYY'));
end;


