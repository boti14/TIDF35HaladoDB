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

//1.

declare
    x auto2.tipus%type;
begin
    select Tipus into x from auto2 where Rendszam='ABC124';
    dbms_output.put_line('Az autó típusa: '||x);
end;

//2.

create or replace procedure TipushozRendszam (betip in char) as
    rsz auto2.Tipus%type;
begin
    select Rendszam into rsz from Auto2 where Tipus=betip;
exception
    when no_data_found then
        dbms_output.put_line('Hiba: Nincs ilyen típus!');
    when too_many_rows then
        dbms_output.put_line('Több ilyen típus létezik!');
end;

begin
    TipushozRendszam('Opel Corsa');
end;

//3.

CREATE or replace procedure TorolRendszám (rszbe char) as
    db int;
    rsz_kivitel exception;
begin
    select count(*) into db from Auto2 where Rendszam = rszbe;
    if db=0 then raise rsz_kivitel;
    else delete from Auto2 where rendszam= rszbe;
    end if;
exception
    when rsz_kivitel then dbms_output.put_line('Hibás rendszám: '||rszbe);
end;



begin
    TorolRendszám('RRR555');
end;

//4.

CREATE or replace procedure Szamol (a int, muv varchar, b int) is
    ert float;
    jel char(1);
    hibas_muvelet exception;
begin
    case muv
        when 'meg' then begin ert:= a + b; jel:= '+'; end;
        when 'bol' then begin ert:= a - b; jel:= '-'; end;
        when 'szor' then begin ert:= a * b; jel:= '*'; end;
        when 'oszt' then begin ert:= a / b; jel:= '/'; end;
        else raise hibas_muvelet;
    end case;
    dbms_output.put_line(a||jel||b||' = '||ert);
exception
    when hibas_muvelet then
        dbms_output.put_line('Hibás művelet! Lehetséges műveletek: meg, bol, szor, oszt');
end;

begin
    szamol(3, 'szer', 5);
end;