# Oracle PL/SQL - implementace složitějších IO

## Cíle

* Integretní omezení (IO) jsou tvrzení o datech, která musí databáze splňovat. Jaká data jsou v DB povolena a jaká ne. Problematiku již znáte ze svých semestrálek BI-DBS.  
* Pokud to lze, snažíme se je implementovat pomocí standardních prostředků databáze (SQL v našem případě). Takovým IO říkáme **deklarativní**. Jsou to **domény atributů**, **NOT NULL**, **PRIMARY | UNIQUE | FOREIGN KEY** a **CHECK**.
    * Tohle jste dělali v semestrálce z BI-DBS.
* Pokud to nelze, musíme využít dalších prostředků na straně DB serveru - konkrétně **TRIGGERS | PACKAGES | PROCEDURES | FUNCTIONS** v případě PL/SQL nebo implementovat taková IO až na úrovni aplikace (což může přinášet komplikace).
    * Taková IO jste v semestrálce z BI-DBS nechali pouze na úrovni popisu při tvorbě ER schématu a dále jste je neřešili. 
* Cílem tohoto úkolu je nad vaším vlastním schématem formulovat dvě složitější integritní omezení. Jedno implementovat pomocí **TRIGGERU** a jedno pomocí **PACKAGE** v jazyku PL/SQL. 
    * Můžete (ale nemusíte) implementovat právě ta IO, která jste v semestrálce z BI-DBS neřešili a nechali je jen na úrovni návrhu. 

## Zadání

* Ve svém schématu zformulujte **dvě složitější IO (taková, která nejde implementovat deklativně v SQL)**. 
* Jedno z nich implementujte pomocí **TRIGGER**u v PL/SQL. 
* Druhé implementujte pomocí **PACKAGE** v PL/SQL. Zde si musíte uvědomit: 
    * že uživateli/aplikaci (v praxi) zakážete přímé DML operace nad dotčenou tabulkou/tabulkami,
    * to v našem školním prostředí nedokážete proto si to jen myslete, 
    * a místo toho mu poskytnete **PACKAGE**, který bude mít funkce/procedury, kterými tyto **DML operace nahradíte**.
* Pro každou implementacaci vypracujte **testovací scénář** (prakticky unit test), kterým ověříte, že vaše řešení 
    * **funguje v pozitivním** (data na vstupu či při změnách jsou povolena)
    * i **negativním případě** (data na vstupu či při změnách nejsou povolena). 
* Testovací scénáře **spusťte** a vhodným způsobem (jako v minulém příkladu) **dokumentujte výstup testování**. 



## základní popis vašeho řešení

![Schéma databáze](schema.png "UPLOAD|LINK")

[Popis IO](popis.md "EMBED|EDIT|EXPAND|LINK|SAVE")

## další očekávané soubory

- [Implementace IO 1](implementace-IO1.sql "EMBED|EDIT|LINK|SAVE")
- [Impplementace IO 2](implementace-IO2.sql "EMBED|EDIT|LINK|SAVE")
- [Testovací scénář IO 1](test-IO1.sql "EMBED|EDIT|LINK|SAVE")
- [Testovací scénář IO 2](test-IO1.sql "EMBED|EDIT|LINK|SAVE")
-- **log soubory nebo adresáře** provedení obou testovacích scénářů
    - ty prostě přidejte do projektu a já si je dohledám

## inspirace

Pokud vám není jasné, co se myslí těmi testovacími scénáři a doložením toho, že fungují, můžete se [inspirovat zde](https://courses.fit.cvut.cz/BI-SQL/lectures/04/index.html#_p%C5%99%C3%ADklad-kontrola-io-z-demo-semestr%C3%A1lky).

## bodování a deadline

- max 6 bodů 
- 28.3. 24:00 (deadline jsem prodloužil, protože jsem zadání připravil pozdě) 
