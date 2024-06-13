# Popis řešení

## Integritní omezení 1

- Na jednom projektu může pracovat maximálně 10 lidí.

### Způsob řešeni 

- Toto IO jsem implementovat pomocí **triggeru**. Nejprve jsem  zjistíl, kolik inženýrů nad tímto projektem pracuje, a uložím to do proměnné `ing_count`. Poté jsem ověříl, zda jich je více než `MAX_ING_COUNT`, a pokud jich je více, vyvolám výjimku.

## Integritní omezení 2

- Vůz může mít maximálně 2 řidiče, kteří pracují v různých směnách a minimálně 1 řidiče (Ten může pracovat v libovolné směně.)

### Způsob řešeni 

- Toto IO jsem implementoval pomocí **package** a procedur pro `INSERT` `DELETE` a `UPDATE`. 
    * `add_ridic` - `INSERT`.  

    * `del_ridic` - `DELETE`.
    * `update_ridic(ID_ZAMESTNANEC, ID_VUZ)` - `UPDATE` pro `ID_VUZ`.
    * `update_ridic(ID_ZAMESTNANEC, SMENA)` - `UPDATE` pro `SMENA`



