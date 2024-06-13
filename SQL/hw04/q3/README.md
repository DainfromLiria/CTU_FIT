# Dotaz č.3
### Seznam inženýrů(jmeno, přijmení, plat a číslo laboratoře), kteří mají plat větší než 90000.

Tento dotaz jsem převzal ze své semestrální práce. 
* Z prováděcího plánu můžeme zjistit, 
že nad tabulkou ZAMESTNANEC optimalizátor provádí FULL SCAN. 
Proto zkusime vytvořit index. Vytvoříme index nad tabulkou ZAMESTNANEC, 
konkrétně nad atributem PLAT. 
* Před vytvořením indexu zkusime přepsat dotaz tak, aby neobsahoval vnořený `SELECT`. 
K tomu použijeme `natural join` mezi tabulkami ZAMESTNANEC a INZENYR.

```sql
Plan hash value: 1535300104
 
--------------------------------------------------------------------------------------------
| Id  | Operation                    | Name        | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT             |             |    12 |  2364 |     3   (0)| 00:00:01 |
|   1 |  NESTED LOOPS                |             |    12 |  2364 |     3   (0)| 00:00:01 |
|   2 |   NESTED LOOPS               |             |    12 |  2364 |     3   (0)| 00:00:01 |
|*  3 |    TABLE ACCESS FULL         | ZAMESTNANEC |    12 |   648 |     3   (0)| 00:00:01 |
|*  4 |    INDEX UNIQUE SCAN         | PK_INZENYR  |     1 |       |     0   (0)| 00:00:01 |
|   5 |   TABLE ACCESS BY INDEX ROWID| INZENYR     |     1 |   143 |     0   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"   3 - filter(""PLAT"">90000)"
"   4 - access(""ZAMESTNANEC"".""ID_ZAMESTNANEC""=""I"".""ID_ZAMESTNANEC"")"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
```

Z prováděcího plánu upravené verze vidíme, že výsledek je stejný. 
Jedna výhoda této úpravy spočívá v tom, že nyní dotaz neobsahuje vnořený `SELECT`.

```sql
Plan hash value: 1535300104
 
--------------------------------------------------------------------------------------------
| Id  | Operation                    | Name        | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT             |             |    12 |  2364 |     3   (0)| 00:00:01 |
|   1 |  NESTED LOOPS                |             |    12 |  2364 |     3   (0)| 00:00:01 |
|   2 |   NESTED LOOPS               |             |    12 |  2364 |     3   (0)| 00:00:01 |
|*  3 |    TABLE ACCESS FULL         | ZAMESTNANEC |    12 |   648 |     3   (0)| 00:00:01 |
|*  4 |    INDEX UNIQUE SCAN         | PK_INZENYR  |     1 |       |     0   (0)| 00:00:01 |
|   5 |   TABLE ACCESS BY INDEX ROWID| INZENYR     |     1 |   143 |     0   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"   3 - filter(""ZAMESTNANEC"".""PLAT"">90000)"
"   4 - access(""ZAMESTNANEC"".""ID_ZAMESTNANEC""=""INZENYR"".""ID_ZAMESTNANEC"")"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
```

Po vytvoření indexu vidíme, že nároky na provedení dotazu klesly, ale nevýznamně.
Teď optimalizátor používá INDEX RANGE místo FULL SCAN pro tabulku ZAMESTNANEC.

```sql
Plan hash value: 1442941823
 
--------------------------------------------------------------------------------------------------------------
| Id  | Operation                             | Name                 | Rows  | Bytes | Cost (%CPU)| Time     |
--------------------------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT                      |                      |   100 | 19700 |     2   (0)| 00:00:01 |
|   1 |  NESTED LOOPS                         |                      |   100 | 19700 |     2   (0)| 00:00:01 |
|   2 |   NESTED LOOPS                        |                      |   100 | 19700 |     2   (0)| 00:00:01 |
|   3 |    TABLE ACCESS BY INDEX ROWID BATCHED| ZAMESTNANEC          |   100 |  5400 |     2   (0)| 00:00:01 |
|*  4 |     INDEX RANGE SCAN                  | IDX_ZAMESTNANEC_PLAT |   100 |       |     1   (0)| 00:00:01 |
|*  5 |    INDEX UNIQUE SCAN                  | PK_INZENYR           |     1 |       |     0   (0)| 00:00:01 |
|   6 |   TABLE ACCESS BY INDEX ROWID         | INZENYR              |     1 |   143 |     0   (0)| 00:00:01 |
--------------------------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"   4 - access(""ZAMESTNANEC"".""PLAT"">9000)"
"   5 - access(""ZAMESTNANEC"".""ID_ZAMESTNANEC""=""INZENYR"".""ID_ZAMESTNANEC"")"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
```