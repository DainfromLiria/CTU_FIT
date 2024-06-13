# Popis řešení

## procedura 1 

- nad tabulkou: **UNIVERZITA**
- nazev procedury: **fill_univerzita**

Nejprve ověříme, zda je tabulka UNIVERZITA prázdná.Řádek `SELECT COUNT(*) INTO check_row_cnt FROM UNIVERZITA` vrátí celkový počet řádků v tabulce. Pokud je tento počet větší než 0, skončíme. V cyklu následně generujeme ID univerzity pomocí  `DBMS_RANDOM.VALUE()`. Protože`DBMS_RANDOM.VALUE()` vrací ne celá čísla, použijeme funkci `round()` a zaokrouhlíme získané číslo na celé číslo. Čísla generujeme v rozmezí od 1 do row_count, aby bylo zajištěno, že každý řádek bude mít unikátní ID.

Dále ověříme, zda takové ID již existuje a pokud ne (pokud hodnota check_id bude 0), pak vygenerujeme název univerzity. Aby bylo co nejvíce unikátních jmen, generuju zkratky názvů neexistujících univerzit. Tyto zkratky jsou tedy řetězce velkých písmen delky od 3 do 5 znaků. Pak nově vytvořený záznam vložíme do tabulky pomoci `INSERT`. Cyklus skončí, až bude dosažen požadovaný počet řádků.

## procedura 2 

- nad tabulkou: **STUDENT**
- nazev procedury: **fill_student**

Pro uložení jmena, příjmení a oboru vytvoříme nový typ `VARCHAR_ARRAY`, který bude mít položky typu `VARCHAR2(256)`. `g_name`, `g_surname` a `g_obor` jsem naplnil na začátku, abych je pak mohl náhodně kombinovat. Protože tabulka `STUDENT` má cizí klíč od tabulky `ZAMESTNANEC`, musíme generovat záznamy i do tabulky `ZAMESTNANEC`. Proto ověříme obě tabulky na prázdnost stejně jak i v proceduře 1. 

Dále vygenerujeme ID pro zaměstnance a pokud takové ID neexistuje, přidáme nový záznam do tabulky `ZAMESTNANEC`. Poté vygenerujeme data pro záznam do tabulky `STUDENT` pomocí funkce `DBMS_RANDOM.VALUE()`. Z `g_name`, `g_surname` a `g_obor` zvolime nahodně jeden prvek pomocí `DBMS_RANDOM.VALUE()`.  Ověříme, zda již takové ID existuje nebo ne. Pokud neexistuje (`check_id` bude 0), přidáme záznam do tabulky `STUDENT`. Cyklus skončí, až bude dosažen požadovaný počet řádků.

## procedura 3 

- nad tabulkou: **MA**
- nazev procedury: **fill_ma**

Stejně jako v předchozích případech ověříme tabulku `MA` na prázdnost. Protože nyní budeme generovat data pro vztahovou tabulku, musíme předtím nagenerovat data pro tabulky `STUDENT` a `UNIVERZITA`. K tomu použijeme dvě předchozí procedury.

Dále musíme náhodně zvolit ID z tabulky `STUDENT` a ID z tabulky `UNIVERZITA`. To uděláme [tak](https://stackoverflow.com/questions/19412/how-to-request-a-random-row-in-sql), že náhodně seřadíme sloupec s ID a pomocí `rownum = 1` vezmeme ID z prvního řádku. Poté, stejně jako v procedurách 1 a 2, ověříme, zda taková kombinace ID existuje nebo ne. Pokud hodnota `check_id` bude 0, pak přidáme nový záznam do tabulky. Cyklus skončí, až bude dosažen požadovaný počet řádků.

