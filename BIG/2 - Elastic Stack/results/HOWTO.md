# Postup vytvoření vizualizací

(obsah viz 2. část, podčást B)

#### Poznámka
I přestože jsem nastavil template a logstash.conf, datum (`date`) ve formátu yyyy:MM:dd mi nefungoval. Ručně jsem ho upravil na formát yyyy:MM:dd přímo v Kibaně ve složce `Management`.

## Vizualizace 1

Agregoval jsem to podle počtu hodnot ve sloupcích `mean_temp` a `season`. Vnitřní kruh udává počet záznamů podle období, vnější podle průměrné teploty v daném období.

## Vizualizace 2

Osa y reprezentuje maximální teplotu (agregovanou jako maximum ze sloupce `max_temp`). Tuto agregaci jsem provedl v sekci `Metrics`. Osa x reprezentuje období a rok. Nejprve jsem seskupil data podle období a poté podle data. Takže každý sloupec reprezentuje jedno období v jednom roce.


## Vizualizace 3

Jako metriku jsem zvolil počet záznamů(`Count`). V options jsem nezaškrtnul volbu `Donut`. Celkově jsem to agregoval pouze podle položky `fatal`. Dál v pravém horním rohu jsem změnil barvy jednotlivých částí grafu.


## Vizualizace 4

Jako metriku jsem zvolil počet záznamů(`Count`). Pomocí filtru jsem vyfiltroval pouze záznamy v létě a zimě(`season` is on of 1 3). Osa x byla nejprve agregována podle sloupce `is_weekend` a `weather_code`.

## Vizualizace 5

Jako metriku jsem zvolil počet záznamů(`Count`). Pomocí filtru jsem vyfiltroval pouze záznamy pro rok 2016 (date is between 2016-01-01 2016-12-31). Jako osu x jsem zvolil `season`, jako osu y `weather_code`.


## Vizualizace 6

Osa y byla agregována pomocí průměru ze sloupců `t2` a `mean_temp`. Osa x je agregována jako `Date Histogram` podle sloupce `date`. Interval jsem zvolil `Monthly`.


## Vizualizace 7

Pomocí filtru jsem vyfiltroval pouze záznamy o vikendu(`weekend` is 1). Osa y byla agregována pomocí průměru ze sloupcu `cnt`. Osa x je agregována jako `Date Histogram` podle sloupce `date`. Interval jsem zvolil `Monthly`.


## Vizualizace 8

Jako metriku jsem zvolil počet záznamů(`Count`). Dál jsem to agregoval pomoci sloupce `Rural_or_Urban_Area`.


## Vizualizace 9

Jako metriku jsem zvolil počet záznamů(`Count`). Dál jsem to agregoval pomoci sloupce `max_temp`. Dále jsem to seřadil sestupně(`order` - `Descending`) a omezil to na 20 hodnot(`size` - 20).
