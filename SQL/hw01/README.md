# Oracle PL/SQL - procedury pro generování dat

## Cíle
* oprášit svoji semestrálku z BI-DBS, připomenout si strukturu databáze
* migrovat ji (nebo její část) do Oracle, vzhledem k dalšímu zadání stačí struktura (protože stejně budete psát plnící procedury)
* zdokumentovat ji - formou obrázku konceptuálního nebo relačního schématu (lze vzít z portálu)
* vyzkoušet si napsat procedury pro plnění daty pro dvě vhoně zvolené tabulky a jednu vztahovou mezi nimi

## Zadání
* ve svém schématu vytipujte dvě vhodné tabulky a mezi nimi jednu vztahovou
* pro každou z nich napište a odlaďte proceduru, jejímž vstupním parametrem bude počet řádků, které mají být vloženy
* při generování dat se inspirujte příklady ze cvičení, data nechť jsou **psaudonáhodná**, pro jejich generování používejte [package **DBMS_RANDOM**](https://docs.oracle.com/database/121/TTPLP/d_random.htm#TTPLP71231)
    * lze ho použít pro generování obyč tabulek i těch vztahových
    * například si definuji sekvenci jmen a sekvenci příjmení a dělám néhodné kombinace
* inspirace pro generování vztahových tabulek (řešení úkoů z minulých let)
    * [příklad 1](https://courses.fit.cvut.cz/BI-SQL/lectures/02/index.html#_vztahov%C3%A1-tabulka-s-n%C3%A1hodn%C3%BDm-v%C3%BDb%C4%9Brem-p%C5%99%C3%ADklad-1)
    * [příklad 2](https://courses.fit.cvut.cz/BI-SQL/lectures/02/index.html#_vztahov%C3%A1-tabulka-s-n%C3%A1hodn%C3%BDm-v%C3%BDb%C4%9Brem-p%C5%99%C3%ADklad-2)

## Testování
*  pro každou proceduru vytvořte log soubor (nebo log podadresář adresář)
    * **alterntivně** můžete demostrovat funkcionalitu klidně i formou screenshotů z DataGripu
    * musí prostě být zřejmé, že:
        * voláte proceduru (s nějakým vhodným parametrem)
        * že procedura se provedla
        * vhodným způsobem demonstrované, že provedla očekávanou akci
* ať už to uděláte jakkoliv, podstatné je, abych se v odevzdaném výsledku dokázal rychle zorientovat a viděl, že váš kód funguje
    * čím více se budu muset zanořovat do kódu, abych pochopil, co jste vytovřili, tím hůře :-)


## základní popis vašeho řešení

![Schéma databáze](schema.png "UPLOAD|LINK")

[Zvolene tabulky](popis.md "EMBED|EDIT|EXPAND|LINK|SAVE")

## další očekávané soubory

- [Create skript](create.sql "EMBED|EDIT|LINK|SAVE")
- [Procedura 1](procedure-1.sql "EMBED|EDIT|LINK|SAVE")
- [Procedura 2](procedure-2.sql "EMBED|EDIT|LINK|SAVE")
- [Procedura 3](procedure-3.sql "EMBED|EDIT|LINK|SAVE")
- **log soubory nebo adresáře** ukazující volání a výstup volání procedur
    - ty prostě přidejte do projektu a já si je dohledám

## bodování a deadline

- max 6 bodů 
- 8.3. 24:00 (pokud by byl problém, domluvíme se 7.3. na výuce)
