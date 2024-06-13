# Test - PL/SQL

## Cíle
  - v časovém limitu (120 minut) pokud možno kompletně odladit dva níže zadané úkoly
  - tím dokázat, že jste se naučili něco z PL/SQL a získat body

## Odevzdání

  - vypracovanou úlohu odezvdejte jako branch **test_plsql** do svého projektového adresáře
  - nezapomeňte vyrobit merge request a přiřadit ho uživateli valenta, commit a merge request nazvěte rovněž **test_plsql**
  - merge request musí být vyroben dříve než opustíte učebnu, to si můžete při odchodu z učebny ověřit u mě
  - řešení odevzdané mimo učebnu (z domova apod.) nepřijímám, poznám to podle prezence
  - pokud někdo nemohl dorazit a napsal nějakou (smysluplnou) omluvu, bude možnost napsat test v náhradním termínu, který stanovím nejpozdějí do následujícího týdne
  - pokud úlohy nestihnete vypracovat kompletně, odevzdejte i tak, co máte hotové a nějakým vhodným způsobem to okomentujte

## Popis databáze
  - v adresáři máte soubor **multikina.sql** to jsou vstupní data.
  - v souboru **multikina.png** máte rovněž konceptuální schéma, abyste se v databázi lépe zorientovali

## Zadání

### úloha 1

Napište a odlaďte PL/SQL **funkci kolik_penez(id_zam):number**, která dostane jako argument id zaměstnance.

Funkce na základě tabulky **zam_historie** vypočte kolik peněz příslušný zaměstnanec dostal. 

Vysvětlení: v tabulce **zam_historie** najdete pro příslušného zaměstnance datumy (od, do), kdy příslušnou pozici zastával. Časový interval (zaokrouhlený na celé měsíce) vynásobíte měsíčním platem (sloupec plat). Pokud v historii není nastavené pole **do**, předpokládejte, že danou pozici stále vykonává a použijte dnešní datum. 

Nápověda: můžete použít oracle funkce **months_between** a **round**. 

Tip: výpočet si nejprve vyzkoušejte a odlaďte pomocí příkazu SELECT a teprve pak jej zabalte do funkce (mám na mysli hlavně výpočet měsíců). 

Pokud zadané id zaměstnance neexistuje nebo příslušný zaměstnanec v tabulce zam_historie není uveden, nechť funkce vyvolá uživatelem definovanou výjimku
**ORA-20001: Zaměstnanec s číslem  <id_zam>  buď neexistuje nebo nemá žádnou historii.**

Funkci postupně otestujte pro hodnoty id_zam 3, 1, 17 a 33  a odezvu vhodným způsobem zdokumentujte (podobně jako v domácích úlohách).

### úloha 2

Napište a odlaďte **trigger hlidej_zanr**, který bude implementovat integritní omezení formulované trvrzením: **Film nesmí mít přiřazeno více než 4 žánry.**

Vysvětlení: trigger nechť pracujte nad tabulkou **film_zanr**. Podíváte-li se do dat, zjistíte, že filmy s id_filmu 4 a 30 jsou již zařazeny do 4 žánrů. Trigger tedy musí ohlídat, že u těchto filmů nelze již žádný další žánr přiřadit. Z povahy věci postačí, když trigger bude reagovat pouze na událost INSERT. 

Dojde-li k porušení IO, nechť trigger vyvolá výjimku **ORA-20002: Film <id_filmu> nemůže být přiřazen do více než 4 žánrů.**

Trigger vhodným způsobem otestujte (na negativní i pozitivní situaci) a výstup vhodným způsobem zdokumentujte (stejně jako v domácích úlohách). 

Tip: uvědomte si, že trigger se potřebuje dotázat do stejné tabulky, nad kterou je definován. Proto se musíte vyhnout "mutating error".

## Očekávané výstupy

 - soubor uloha-1-reseni.sql obsahující navrženou funkci.
 - soubor uloha-1.log s výsledky testování. (případně lze dodat snímky z console data-gripu, je-li to pro vás jednodušší)
 - soubor uloha2-reseni.sql s triggerem, který řeší úlohu 2.
 - soubor uloha-2-.log s výsledky testování (případně lze dodat snímkky z console data-gripu, je-li to por vás jednodušší)

## Bodování
  - uloha1 - až 10 bodů
  - uloha2 - až 10 bodů

