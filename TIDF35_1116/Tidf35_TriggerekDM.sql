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

SELECT * FROM AUTO2;

CREATE TABLE AutoNaplo (
    Datum timestamp,
    Esemeny varchar2(30),
    Adat varchar2(150)
);

DESCRIBE AutoNaplo;

//Trigger ami beszúr két adatot AutoInsert

CREATE OR REPLACE TRIGGER TriggerAutoInsert AFTER INSERT ON Auto2 FOR EACH ROW
BEGIN
    INSERT INTO AutoNaplo VALUES(sysdate , 'Beszúrás', :new.ID||'_'
        ||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor
        ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
END;    


CREATE OR REPLACE TRIGGER TriggerAutoUpdate AFTER UPDATE ON Auto2 FOR EACH ROW
BEGIN
    INSERT INTO AutoNaplo VALUES(sysdate , 'Módosítás', :new.ID||'_'
        ||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor
        ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
END;   


CREATE OR REPLACE TRIGGER TriggerAutoDelete AFTER DELETE ON Auto2 FOR EACH ROW
BEGIN
    INSERT INTO AutoNaplo VALUES(sysdate , 'Törlés', :old.ID||'_'
        ||:old.Rendszam||'_'||:old.Tipus||'_'||:old.Szin||'_'||:old.Kor
        ||'_'||:old.Ar||'_'||:old.Muszaki_erv);
END;   
        

BEGIN
    AutoCsomag.UjAuto(16, 'RWE615', 'Opel Astra', 'Fekete', 6, 5550000, TO_DATE('05-11-2024', 'DD-MM-YYYY'));
    AutoCsomag.AutoModosit(16,'Ezüst');
    AutoCsomag.AutoTorol(16);
END;

SELECT * FROM AutoNaplo;

DELETE FROM AutoNaplo;

CREATE OR REPLACE TRIGGER UniverzalisNaplozas
    AFTER INSERT OR UPDATE OR DELETE ON Auto2 FOR EACH ROW
    
BEGIN
    IF inserting THEN INSERT INTO AutoNaplo VALUES(sysdate , 'Beszúrás', :new.ID||'_'
        ||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor
        ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
    ELSIF updating THEN INSERT INTO AutoNaplo VALUES(sysdate , 'Módosítás', :new.ID||'_'
        ||:new.Rendszam||'_'||:new.Tipus||'_'||:new.Szin||'_'||:new.Kor
        ||'_'||:new.Ar||'_'||:new.Muszaki_erv);
    ELSIF deleting THEN INSERT INTO AutoNaplo VALUES(sysdate , 'Törlés', :old.ID||'_'
        ||:old.Rendszam||'_'||:old.Tipus||'_'||:old.Szin||'_'||:old.Kor
        ||'_'||:old.Ar||'_'||:old.Muszaki_erv);
    END IF;
END;

BEGIN
    AutoCsomag.UjAuto(17, 'RWE615', 'Opel Astra', 'Fekete', 6, 5550000, TO_DATE('05-11-2024', 'DD-MM-YYYY'));
    AutoCsomag.AutoModosit(17,'Ezüst');
    AutoCsomag.AutoTorol(17);
END;


