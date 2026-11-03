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


SELECT * FROM Auto2
//Adat beszúrás
BEGIN
INSERT INTO Auto2 VALUES (1, 'ABC123', 'Opel Corsa', 'Piros', 6, 3200000, TO_DATE('05.08.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (2, 'QWJ612', 'Suzuki Alto', 'Kék', 15, 5000000, TO_DATE('03.12.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (3, 'PHD229', 'Scoda Scala', 'Fehér', 1, 6800000, TO_DATE('10.06.2025', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (4, 'PET220', 'Opel Astra', 'Fekete', 3, 4400000, TO_DATE('08.05.2024', 'DD-MM-YYYY'));
INSERT INTO Auto2 VALUES (5, 'RWE611', 'Ford Focus', 'Sárga', 4, 5300000, TO_DATE('05.12.2025', 'DD-MM-YYYY'));
END;

// Készítsen egy tárolt eljárást (neve: KurzMintPld) implicit kurzor használva
//(IF...ELSIF...END IF), amely az Auto2 táblában egy adott színű autók árát X összeggel növeli
// meg és megjelenik a DBMS kimeneten! 

create or replace procedure KurzMintPld (szinbe varchar2) as pc int;
begin
    update Auto2 set Ar = Ar + 40000 where Szin = szinbe;
    if sql%notfound then
        dbms_output.put_line('Nincs' ||szinbe|| 'színű autó!');
    elsif sql%found then
        pc := sql%rowcount;
        dbms_output.put_line(pc||' db '||szinbe||'autó ára módosítva!');
    end if;
end;

select Rendszam, Szin, Ar from auto2 where trim(lower(Szin)) = 'piros';
        
begin
    KurzMintPld('Piros');
end;

// 2.-feladat

create or replace procedure KurzMintPld1 (szinbe varchar2) as
cursor cur is select Rendszam, Ar from Auto2 where szin= szinbe for update of Ar;
    cv cur%rowtype;
    pc int;
begin
    open cur;
    loop
    fetch cur into cv;
        exit when cur%notfound;
        update Auto2 set Ar = cv.Ar - 200000 where current of cur;
    end loop;
        pc := cur%rowcount;
        dbms_output.put_line(pc||' db '||szinbe||' autó ára módosult!');
    close cur;
end;

begin
    KurzMintPld1('piros');
end;

select * from Auto2;


// 3.-feladat

create or replace procedure KurzMintPld2 (szinbe varchar2) as
cursor cur is select Rendszam, Ar from Auto2 where szin= szinbe for update of Ar;
    pc int;
begin
    for cv in cur loop
    update Auto2 set Ar = cv.Ar - 200000 where current of cur;
    pc:= cur%rowcount;
    end loop;
    if pc != 0 then
        dbms_output.put_line(pc||' db '||szinbe||' autó ára módosult!');
    else
        dbms_output.put_line(' Nincs '||szinbe||' színű autó!');
    end if;
end;

select * from Auto2;


begin
    KurzMintPld2('Kék');
end;

// 4.-feladat

create or replace procedure DataOut (tipusbe varchar2) is
    cursor cur is select Rendszam, Tipus, Ar from Auto2
    where tipus like tipusbe||'%';
    c_var cur%rowtype;
begin
    open cur;
    loop
    fetch cur into c_var;
    exit when cur%notfound;
    dbms_output.put_line('Rendszám: '||c_var.rendszam||' típus: '||c_var.tipus||' ár: '||c_var.ar);
    end loop;
    close cur;
end;

begin
    DataOut('Opel Corsa');
end;

