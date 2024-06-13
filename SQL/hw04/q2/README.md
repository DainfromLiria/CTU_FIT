# Dotaz č.2
### Vypiš studenty, kteří jsou ve 2 ročniku a mají obor Geological Engineer nebo studenti 3 ročniku, kteří mají obor Software Consultant.

Tento dotaz jsem převzal ze své semestrální práce. 
Z prováděcího plánu je patrné, že kvůli použití `UNION` musíme provést dva průchody s 
vnořenými smyčkami, při nichž probíhá FULL SCAN nad `MA`. 
To výrazně zvyšuje náklady na provedení dotazu. 
Proto zkusíme  přepsat `UNION` na `OR`.


```sql
Plan hash value: 44818913
 
---------------------------------------------------------------------------------------------
| Id  | Operation                      | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
---------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT               |            |     2 |   446 |     4  (50)| 00:00:01 |
|   1 |  SORT UNIQUE                   |            |     2 |   446 |     4  (50)| 00:00:01 |
|   2 |   UNION-ALL                    |            |       |       |            |          |
|   3 |    NESTED LOOPS                |            |     1 |   223 |     1   (0)| 00:00:01 |
|   4 |     NESTED LOOPS               |            |    74 |   223 |     1   (0)| 00:00:01 |
|   5 |      INDEX FULL SCAN           | PK_MA      |    74 |   962 |     1   (0)| 00:00:01 |
|*  6 |      INDEX UNIQUE SCAN         | PK_STUDENT |     1 |       |     0   (0)| 00:00:01 |
|*  7 |     TABLE ACCESS BY INDEX ROWID| STUDENT    |     1 |   210 |     0   (0)| 00:00:01 |
|   8 |    NESTED LOOPS                |            |     1 |   223 |     1   (0)| 00:00:01 |
|   9 |     NESTED LOOPS               |            |    74 |   223 |     1   (0)| 00:00:01 |
|  10 |      INDEX FULL SCAN           | PK_MA      |    74 |   962 |     1   (0)| 00:00:01 |
|* 11 |      INDEX UNIQUE SCAN         | PK_STUDENT |     1 |       |     0   (0)| 00:00:01 |
|* 12 |     TABLE ACCESS BY INDEX ROWID| STUDENT    |     1 |   210 |     0   (0)| 00:00:01 |
---------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"   6 - access(""MA"".""ID_STUDENT""=""STUDENT"".""ID_STUDENT"")"
"   7 - filter(""STUDENT"".""ROCNIK""=3 AND ""STUDENT"".""OBOR""='Software Consultant')"
"  11 - access(""MA"".""ID_STUDENT""=""STUDENT"".""ID_STUDENT"")"
"  12 - filter(""STUDENT"".""ROCNIK""=2 AND ""STUDENT"".""OBOR""='Geological Engineer')"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
```

Z prováděcího plánu je zřejmé, že nároky na provedení dotazu klesly až čtyřnásobně. 
Nyní už máme pouze jeden průchod s vnořenými smyčkami.

```sql
Plan hash value: 1889187131
 
-------------------------------------------------------------------------------------------
| Id  | Operation                    | Name       | Rows  | Bytes | Cost (%CPU)| Time     |
-------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT             |            |     3 |   669 |     1   (0)| 00:00:01 |
|   1 |  NESTED LOOPS                |            |     3 |   669 |     1   (0)| 00:00:01 |
|   2 |   NESTED LOOPS               |            |    74 |   669 |     1   (0)| 00:00:01 |
|   3 |    INDEX FULL SCAN           | PK_MA      |    74 |   962 |     1   (0)| 00:00:01 |
|*  4 |    INDEX UNIQUE SCAN         | PK_STUDENT |     1 |       |     0   (0)| 00:00:01 |
|*  5 |   TABLE ACCESS BY INDEX ROWID| STUDENT    |     1 |   210 |     0   (0)| 00:00:01 |
-------------------------------------------------------------------------------------------
 
Predicate Information (identified by operation id):
---------------------------------------------------
 
"   4 - access(""MA"".""ID_STUDENT""=""STUDENT"".""ID_STUDENT"")"
"   5 - filter(""STUDENT"".""OBOR""='Geological Engineer' AND ""STUDENT"".""ROCNIK""=2 OR "
"              ""STUDENT"".""OBOR""='Software Consultant' AND ""STUDENT"".""ROCNIK""=3)"
 
Note
-----
   - dynamic statistics used: dynamic sampling (level=2)
```


