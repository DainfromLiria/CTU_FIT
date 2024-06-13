-- Zaměstnanci, kteří se podíleli na montáži všech modelů robotů "Firebird". Kategorie D1

-- first variant from my semestral work
explain plan for
select * from zamestnanec z
where not exists(
select * from robot r where r.model='Firebird' and not exists(
select * from vytvoren v where v.id_zamestnanec=z.id_zamestnanec and v.id_robot=r.id_robot)
);

-- variant 2
explain plan for
WITH zamestnance AS (SELECT ID_ZAMESTNANEC FROM ZAMESTNANEC),
     roboti AS (SELECT ID_ROBOT FROM ROBOT where MODEL = 'Firebird'),
     mozne_vztvoreni AS (SELECT * FROM zamestnance CROSS JOIN roboti),
     nastale_vztvoreni AS (SELECT ID_ZAMESTNANEC, ID_ROBOT FROM VYTVOREN),
     nenastale_vztvoreni AS (SELECT * FROM mozne_vztvoreni MINUS
                                                           SELECT * FROM nastale_vztvoreni),
     zam_ktery_nemont_kazd AS (SELECT ID_ZAMESTNANEC FROM nenastale_vztvoreni),
     zam_mont_kazd AS (SELECT * FROM zamestnance MINUS
                                                 SELECT * FROM zam_ktery_nemont_kazd)
SELECT *
FROM zam_mont_kazd
     NATURAL JOIN ZAMESTNANEC;


CREATE INDEX idx_robot_model ON ROBOT (MODEL);

SELECT * FROM TABLE(dbms_xplan.display)
