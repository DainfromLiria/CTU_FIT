# Elastic Stack

## London Data

(obsah viz 2. část, podčást A)

### Popis datasetu
Datasety London Weather Data a London Bike Sharing Dataset jsem našel na Kaggle (odkazy jsou uvedeny v zdrojích). [London Cycling Safety](https://www.kaggle.com/datasets/dtuthill/london-cycling-safety) jsem nalezl na Kaggle, ale použil jsem rozšířenou verzi dat, která byla uvedena v popisu tohoto datasetu na Kaggle (odkaz na rozšířenou verzi je uveden v zdrojích).

##### **London Weather Data** 
Data o počasí v Londýně od 01.01.1979 do 31.12.2020. Celkem obsahují 15 341 záznamů a 10 sloupců. 
* **Sloupce**
1.  `date` - datum měření - (int)
2.  `cloud_cover` - měření zastřešení oblohy v oktách - (float)
3.  `sunshine` - měření slunečního svitu v hodinách (hod) - (float)
4.  `global_radiation` - měření záření v wattech na metr čtvereční (W/m2) - (float)
5.  `max_temp`  - nejvyšší naměřená teplota v stupních Celsia (°C) - (float)
6.  `mean_temp` - průměrná teplota v stupních Celsia (°C) - (float)
7.  `min_temp`  - nejnižší naměřená teplota v stupních Celsia (°C) - (float)
8.  `precipitation`  - měření srážek v milimetrech (mm) - (float)
9.  `pressure`  - měření tlaku v pascálech (Pa) - (float)
10. `snow_depth`  - měření výšky sněhové pokrývky v centimetrech (cm) - (float)

##### **London bike sharing dataset** 
Data o počtu vypůjčených kol v Londynu od 2015-01-04 do 2017-01-04. Celkem obsahují 17.4k záznamů a 10 sloupců.
* **Sloupce**
1. `timestamp` - datum pro seskupování dat - (date)
2. `cnt` - počet vypůjčených kol - (int)
3. `t1` - reálná teplota v °C - (float)
4. `t2` - pocitová teplota v °C - (float)
5. `hum` - vlhkost v procentech - (float)
6. `wind_speed` - rychlost větru v km/h - (float)
7. `weather_code` - kategorie počasí - (int)
8. `is_holiday` - booleovské pole - 1 svátek / 0 běžný den - (boolean)
9. `is_weekend` - booleovské pole - 1 pokud je den víkendem - (boolean)
10. `season` - kategorie meteorologických ročních období: 0-jaro; 1-léto; 2-podzim; 3-zima - (int)

**Popis kategorie** `weather_code`:
* 1 = Jasno; převážně jasno s některými hodnotami mlhy/ oparu/ mlhy v okolí
* 2 = Ojedinělé mraky/ málo mraků
* 3 = Rozptýlené mraky
* 4 = Zataženo
* 7 = Déšť/ lehká přeháňka/ slabý déšť
* 10 = Déšť s bouřkou
* 26 = Sněžení
* 94 = Mrznoucí mlha

##### **London Cycling Safety** 
Tento dataset obsahuje všechny nehody ve Spojeném království, které zahrnují kola, v období od roku 2005 do roku 2018. Jedná se o zpracovanou verzi dat o silniční bezpečnosti vydanou pro kolekci CYCLANDS. Dataset je obrovský, obsahuje více než 40 sloupců a 250 963 řádků, takže v rámci semestrální práce jsem se zaměřil pouze na část tohoto datasetu. Mnoho sloupců bylo nejasných, proto popíšu pouze ty, které jsem vybral po filtrování datasetu. Bude jich celkem 10. 
* **Sloupce**
1. `Date` - datum nehody. - (date yyyy-MM-dd)
2. `Longitude` - geografická poloha nehody zeměpisná délka. - (float)
3. `Latitude` - geografická poloha nehody zeměpisná šířka. - (float)
4. `Number_of_Vehicles`: Počet vozidel zapojených v nehodě. - (int)
5. `Number_of_Casualties`: Počet zraněných osob v nehodě. - (int)
6. `Day_of_Week`: Den v týdnu, kdy k nehodě došlo. - (int)
7. `Time`: Čas, kdy k nehodě došlo. - (time HH:mm)
8. `Speed_limit`: Limit rychlosti na daném místě. - (int)
9. `Urban_or_Rural_Area`: Informace o tom, zda se nehoda stala v oblasti městské nebo venkovské. (int 1 or 2)
10. `Did_Police_Officer_Attend_Scene_of_Accident`: Zda policie přišla na místo nehody. (int 1 or 0)
11. `fatal`: Zda byla nehoda smrtelná (boolean).
12. `geometry`: Geografická poloha nehody zeměpisná délka a šířka ve formatu POINT (POINT).

### Co lze z dat získat?
Data reprezentují jeden tematický celek: počasí a cyklisty v Londýně. Z dat lze zjistit závislost mezi počasím a počtem nehod, mezi počasím a počtem vypůjčených kol a také mezi počtem vypůjčených kol a počtem nehod. Dá se zjistit místo, kde se stává nejvíce nehod, a na základě období lze zjistit, jak intenzivně jsou kola půjčována. Takový výzkum by mohl být užitečný například pro firmy, které půjčují kola, nebo pro městské služby při úpravách infrastruktury pro cyklisty.


### Formát dat
Všechny tři datasety jsou ve formátu `CSV`. Popis datových typů jednotlivých položek datasetů můžete prozkoumat v sekci **Popis datasetu**. Výsledný spojený dataset má 30 sloupců, 850 044 řadků a následující strukturu:

1. `Date` - datum nehody. - (date yyyy-MM-dd)
2. `Longitude` - geografická poloha nehody zeměpisná délka. - (float)
3. `Latitude` - geografická poloha nehody zeměpisná šířka. - (float)
4. `Number_of_Vehicles`: Počet vozidel zapojených v nehodě. - (int)
5. `Number_of_Casualties`: Počet zraněných osob v nehodě. - (int)
6. `Day_of_Week`: Den v týdnu, kdy k nehodě došlo. - (int)
7. `Time`: Čas, kdy k nehodě došlo. - (time HH:mm)
8. `Speed_limit`: Limit rychlosti na daném místě. - (int)
9. `Urban_or_Rural_Area`: Informace o tom, zda se nehoda stala v oblasti městské nebo venkovské. (int 1 or 2)
10. `Did_Police_Officer_Attend_Scene_of_Accident`: Zda policie přišla na místo nehody. (int 1 or 0)
11. `fatal`: Zda byla nehoda smrtelná (boolean).
12. `geometry`: Geografická poloha nehody zeměpisná délka a šířka ve formatu POINT (POINT).
13. `cnt` - počet vypůjčených kol - (int)
14. `t1` - reálná teplota v °C - (float)
15. `t2` - pocitová teplota v °C - (float)
16. `hum` - vlhkost v procentech - (float)
17. `wind_speed` - rychlost větru v km/h - (float)
18. `weather_code` - kategorie počasí - (int)
19. `is_holiday` - booleovské pole - 1.0 svátek / 0.0 běžný den - (float)
20. `is_weekend` - booleovské pole - 1.0 pokud je den víkendem - (float)
21. `season` - kategorie meteorologických ročních období: 0.0-jaro; 1.0-léto; 2.0-podzim; 3.0-zima - (float)
22.  `cloud_cover` - měření zastřešení oblohy v oktách - (float)
23.  `sunshine` - měření slunečního svitu v hodinách (hod) - (float)
24.  `global_radiation` - měření záření v wattech na metr čtvereční (W/m2) - (float)
25.  `max_temp`  - nejvyšší naměřená teplota v stupních Celsia (°C) - (float)
26.  `mean_temp` - průměrná teplota v stupních Celsia (°C) - (float)
27.  `min_temp`  - nejnižší naměřená teplota v stupních Celsia (°C) - (float)
28.  `precipitation`  - měření srážek v milimetrech (mm) - (float)
29.  `pressure`  - měření tlaku v pascálech (Pa) - (float)
30. `snow_depth`  - měření výšky sněhové pokrývky v centimetrech (cm) - (float)


### Provedené úpravy dat
Všechny úpravy jsem provedl pomocí Apache Spark v Zeppelin notebooku.

1. Nejprve jsem prozkoumal dataset `cycling_safety_uk_gov.csv`. Odstranil jsem všechny položky, které nemají pro můj výzkum význam (např. `Location_Easting_OSGR` nebo `id`). Poté jsem odstranil sloupce s konstantními hodnotami (např. `Bicycles`). Upravil jsem sloupce `Date` a `Time` do formátu (yyyy-MM-dd a HH:mm:ss) a přejmenoval je na `date` a `time`.

2. Dále jsem upravil `london_bike_sharing.csv`. Převedl jsem sloupec `timestamp` do formátu (yyyy-MM-dd) a uložil ho do nového sloupce `date` a sloupec `time_of_bike_sharing` do formátu (HH:mm:ss). Poté jsem odstranil sloupec `timestamp`, který již nepotřebujeme.

3. V `datasetu london_weather.csv` jsem pouze upravil sloupec `date` do formátu (yyyy-MM-dd)."

4. Odstranění null hodnot:

    * a. V datasetu `london_weather.csv` byly nalezeny tři `null` hodnoty ve sloupci `global_radiation` a `snow_depth`. Tyto hodnoty jsem nahradil průměrem z celého sloupce.

    * b. Dataset `london_bike_sharing.csv` neobsahoval žádné `null` hodnoty.
    
    * c. V datasetu `cycling_safety_uk_gov.csv` jsem identifikoval celkem 13 `null` hodnot, které jsem jednoduše odstranil.

5. Data jsem spojil pomocí left joinu, kde hlavním datasetem byl `cycling_safety_uk_gov.csv`. Spojoval jsem data podle atributu `date`, který se nacházel v každém z datasetů. Z výsledného datasetu jsem následně odstranil ještě 47 `null` hodnot. Výsledný dataset jsem uložil do jednoho `CSV` souboru."


## Závěr
- Nepodařilo se mi bohužel vytvořit vizualizaci mapy. Hodně jsem zkoušel vytvořit ten typ `geo_point`, ale ve výsledku Elasticsearch ho prostě nevidí, i když mám nadefinovaný template a  logstash.conf. Typ `POINT` taky nefungoval. Použití Logstash pro tuto část práce trochu nedávalo smysl, protože máme striktně daný datový soubor a mohli bychom ho přímo importovat do Elasticsearch pomocí Kibany (zkoušel jsem to a jde to docela snadno, podporuje import souborů až do 1 GB).

- Jiné vizualizace a dotazy fungovaly bez problémů. Jenom byl problém s časem, ten prostě nebyl načten ve správném formátu, i když jsem ho definoval jako čas v templatu a logstash.conf.


## Zdroje
[Cvičení 7 - Elasticsearch](https://courses.fit.cvut.cz/BI-BIG/tutorials/07/index.html)

[Cvičení 8 - The Elastic Stack](https://courses.fit.cvut.cz/BI-BIG/tutorials/08/index.html)

[Cvičení 9 - Apache Spark](https://courses.fit.cvut.cz/BI-BIG/tutorials/09/index.html)

[London bike sharing dataset](https://www.kaggle.com/datasets/hmavrodiev/london-bike-sharing-dataset/)

[London Weather Data](https://www.kaggle.com/datasets/emmanuelfwerr/london-weather-data)

[London Cycling Safety](https://zenodo.org/records/5603036#.Y49yTXbMJD9)

[Creat Coordinate Map visualization in Kibana for Geo point data](https://www.youtube.com/watch?v=1arB6i61qWs)
