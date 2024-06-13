-- Seznam inženýrů(jmeno, přijmení, plat a číslo laboratoře), kteří mají plat větší než 90000.

-- first version
explain plan for
SELECT z.jmeno, z.prijmeni, z.plat, i.cislo_laboratore
FROM (
    SELECT *
    FROM zamestnanec
    WHERE plat > 90000
) z
join INZENYR i using(id_zamestnanec)

SELECT * FROM TABLE(dbms_xplan.display)


-- second version
explain plan for
SELECT jmeno, prijmeni, plat, cislo_laboratore
from ZAMESTNANEC natural join INZENYR
WHERE plat > 90000

-- add index
CREATE INDEX idx_zamestnanec_plat ON ZAMESTNANEC (PLAT);

SELECT * FROM TABLE(dbms_xplan.display)

