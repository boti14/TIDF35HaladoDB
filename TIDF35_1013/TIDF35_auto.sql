CREATE table auto1 (
    rsz char(6) primary key,
    tipus char(30),
    szin char(20),
    kor number(3),
    ar number(10)
    );

    desc auto1
    
insert into auto1 values ('ABC500', 'Opel Corsa', 'piros', 8, 800000);

select * from auto1;

DECLARE
    x NUMBER(2) := 7;
BEGIN
    UPDATE auto1 set ar=ar*0.9 where kor >= x;
END;


DECLARE
    x auto1.ar%type;
BEGIN
    SELECT AVG(ar) INTO x FROM auto1;
    dbms_output.put_line(x);
END;


DECLARE
    x int;
BEGIN
    SELECT COUNT(*) INTO x FROM auto1;
    dbms_output.put_line('Autók száma: '|| x);
END;


DECLARE
    x auto1%rowtype;
BEGIN
    SELECT * INTO x FROM auto1 WHERE rsz = 'ABC500';
    dbms_output.put_line(x.ar);
END;


DECLARE
    a auto1.rsz%type := 'RTF200';
    b auto1.tipus%type := 'Toyota';
    c auto1.szin%type := 'szurke';
    d auto1.kor%type := 3;
    e auto1.ar%type := 8200000;
BEGIN
    INSERT INTO auto1 VALUES (a, b, c, d, e);
END;


DECLARE
    x auto1.kor%type := 3;
BEGIN
    DELETE from auto1 WHERE kor = x;
end;


CREATE TABLE Naplo
(
    Adat NUMBER(10,2),
    Datum DATE,
    Szemely varchar2(20)
);


DECLARE
    x auto1.ar%type;
BEGIN
    SELECT AVG(ar) INTO x FROM auto1;
    INSERT INTO Naplo VALUES (x, sysdate, user);
end;

SELECT * FROM Naplo;

ALTER TABLE Naplo MODIFY Adat number(10,3);

describe Naplo;
