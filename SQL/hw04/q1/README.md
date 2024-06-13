# Dotaz č.1
### Zaměstnanci, kteří se podíleli na montáži všech modelů robotů "Firebird". Kategorie D1

Tento dotaz jsem převzal ze své semestrální práce. Z prováděcího plánu můžeme zjistit, 
že nad tabulkami ZAMESTNANEC a ROBOT optimalizátor provádí FULL SCAN. 
Proto zkusime vytvořit index. Vytvoříme index nad tabulkou ROBOT, 
konkrétně nad atributem MODEL (v dotazu hledáme robota modelu Firebird).

```sql
Plan hash value: 3164677964
 
-----------------------------------------------------------------------------------
| Id  | Operation           | Name        | Rows  | Bytes | Cost (%CPU)| Time     |
-----------------------------------------------------------------------------------
|   0 | SELECT STATEMENT    |             |    61 |  3294 |    11   (0)| 00:00:01 |
|*  1 |  FILTER             |             |       |       |            |          |
|   2 |   TABLE ACCESS FULL | ZAMESTNANEC |   100 |  5400 |     3   (0)| 00:00:01 |
|*  3 |   FILTER            |             |       |       |            |          |
|*  4 |    TABLE ACCESS FULL| ROBOT       |     4 |   572 |     3   (0)| 00:00:01 |
|*  5 |    INDEX UNIQUE SCAN| PK_VYTVOREN |     1 |    26 |     0   (0)| 00:00:01 |
-----------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"   1 - filter( NOT EXISTS (SELECT 0 FROM ""ROBOT"" ""R"" WHERE  NOT EXISTS "
"              (SELECT 0 FROM ""VYTVOREN"" ""V"" WHERE ""V"".""ID_ROBOT""=:B1 AND "
"              ""V"".""ID_ZAMESTNANEC""=:B2) AND ""R"".""MODEL""='Firebird'))"
"   3 - filter( NOT EXISTS (SELECT 0 FROM ""VYTVOREN"" ""V"" WHERE "
"              ""V"".""ID_ROBOT""=:B1 AND ""V"".""ID_ZAMESTNANEC""=:B2))"
"   4 - filter(""R"".""MODEL""='Firebird')"
"   5 - access(""V"".""ID_ZAMESTNANEC""=:B1 AND ""V"".""ID_ROBOT""=:B2)"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)

```

Teď optimalizátor používá INDEX RANGE místo FULL SCAN. 
Z tabulky níže vidíme, že vytvořený index snížil náklady na provádění dotazu, 
i když tento pokles není zcela výrazný.


```sql
Plan hash value: 2047567604
 
---------------------------------------------------------------------------------------------------------
| Id  | Operation                             | Name            | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                      |                 |    61 |  3294 |     8   (0)| 00:00:01 |
|*  1 |  FILTER                               |                 |       |       |            |          |
|   2 |   TABLE ACCESS FULL                   | ZAMESTNANEC     |   100 |  5400 |     3   (0)| 00:00:01 |
|*  3 |   FILTER                              |                 |       |       |            |          |
|   4 |    TABLE ACCESS BY INDEX ROWID BATCHED| ROBOT           |     4 |   572 |     2   (0)| 00:00:01 |
|*  5 |     INDEX RANGE SCAN                  | IDX_ROBOT_MODEL |     4 |       |     1   (0)| 00:00:01 |
|*  6 |    INDEX UNIQUE SCAN                  | PK_VYTVOREN     |     1 |    26 |     0   (0)| 00:00:01 |
---------------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"   1 - filter( NOT EXISTS (SELECT 0 FROM ""ROBOT"" ""R"" WHERE  NOT EXISTS (SELECT 0 FROM ""VYTVOREN"" "
"              ""V"" WHERE ""V"".""ID_ROBOT""=:B1 AND ""V"".""ID_ZAMESTNANEC""=:B2) AND ""R"".""MODEL""='Firebird'))"
"   3 - filter( NOT EXISTS (SELECT 0 FROM ""VYTVOREN"" ""V"" WHERE ""V"".""ID_ROBOT""=:B1 AND "
"              ""V"".""ID_ZAMESTNANEC""=:B2))"
"   5 - access(""R"".""MODEL""='Firebird')"
"   6 - access(""V"".""ID_ZAMESTNANEC""=:B1 AND ""V"".""ID_ROBOT""=:B2)"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)

```

Zkusil jsem také přepsat dotaz bez použití `not exists`.

```sql
Plan hash value: 1658326798
 
--------------------------------------------------------------------------------------------------------
| Id  | Operation                            | Name            | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                     |                 |   100 |  6700 |    11  (37)| 00:00:01 |
|   1 |  NESTED LOOPS                        |                 |   100 |  6700 |    11  (37)| 00:00:01 |
|   2 |   NESTED LOOPS                       |                 |   100 |  6700 |    11  (37)| 00:00:01 |
|   3 |    VIEW                              |                 |   100 |  1300 |    11  (37)| 00:00:01 |
|   4 |     MINUS                            |                 |       |       |            |          |
|   5 |      SORT UNIQUE                     |                 |   100 |  1300 |            |          |
|   6 |       INDEX FULL SCAN                | PK_ZAMESTNANEC  |   100 |  1300 |     1   (0)| 00:00:01 |
|   7 |      SORT UNIQUE                     |                 |   400 |  5200 |            |          |
|   8 |       VIEW                           |                 |   400 |  5200 |     8  (25)| 00:00:01 |
|   9 |        MINUS                         |                 |       |       |            |          |
|  10 |         SORT UNIQUE                  |                 |   400 | 62400 |            |          |
|  11 |          MERGE JOIN CARTESIAN        |                 |   400 | 62400 |     5   (0)| 00:00:01 |
|  12 |           TABLE ACCESS BY INDEX ROWID| ROBOT           |     4 |   572 |     2   (0)| 00:00:01 |
|* 13 |            INDEX RANGE SCAN          | IDX_ROBOT_MODEL |     4 |       |     1   (0)| 00:00:01 |
|  14 |           BUFFER SORT                |                 |   100 |  1300 |     3   (0)| 00:00:01 |
|  15 |            INDEX FAST FULL SCAN      | PK_ZAMESTNANEC  |   100 |  1300 |     1   (0)| 00:00:01 |
|  16 |         SORT UNIQUE                  |                 |   108 |  2808 |            |          |
|  17 |          INDEX FULL SCAN             | PK_VYTVOREN     |   108 |  2808 |     1   (0)| 00:00:01 |
|* 18 |    INDEX UNIQUE SCAN                 | PK_ZAMESTNANEC  |     1 |       |     0   (0)| 00:00:01 |
|  19 |   TABLE ACCESS BY INDEX ROWID        | ZAMESTNANEC     |     1 |    54 |     0   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"  13 - access(""MODEL""='Firebird')"
"  18 - access(""ZAM_MONT_KAZD"".""ID_ZAMESTNANEC""=""ZAMESTNANEC"".""ID_ZAMESTNANEC"")"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)

```

Z výsledků je zřejmé, že nedošlo ke snížení nákladů na provedení dotazu. 
Zároveň je plán provedení dotazu mnohem složitější a samotný dotaz je mnohem rozsáhlejší.