-- Vypiš studenty, kteří jsou ve 2 ročniku a mají obor Geological Engineer nebo
-- studenti 3 ročniku, kteří mají obor Software Consultant.

-- first version
explain plan for
(select id_student, id_zamestnanec, jmeno, obor, plat, prijmeni, rocnik
from univerzita natural join ma natural join student
where rocnik= 3 and obor='Software Consultant')
union
(select id_student, id_zamestnanec, jmeno, obor, plat, prijmeni, rocnik
from univerzita natural join ma natural join student
where rocnik= 2  and obor='Geological Engineer')

SELECT * FROM TABLE(dbms_xplan.display)


-- second version
explain plan for
select id_student, id_zamestnanec, jmeno, obor, plat, prijmeni, rocnik
from univerzita natural join ma natural join student
where (rocnik= 3 and obor='Software Consultant') or
      (rocnik= 2  and obor='Geological Engineer');

SELECT * FROM TABLE(dbms_xplan.display)
