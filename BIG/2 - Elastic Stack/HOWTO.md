# Návod ke zprovoznění semestrální práce

### Spark
* Pozor na {USERNAME}(jmeno uživatele) a musíte být přihlášeni jako root.
1. `docker image pull babubabu/spark-zeppelin-docker:v1`

2. `docker run -it -v /home/{USERNAME}/BI-BIG/anopaden/2\ -\ Elastic\ Stack//spark/work:/work -v /home/{USERNAME}/BI-BIG/anopaden/2\ -\ Elastic\ Stack//spark/notebook:/usr/zeppelin/zeppelin-0.8.1-bin-all/notebook/ -p 18080:18080 -p 8088:8080 -d babubabu/spark-zeppelin-docker:v1`

### ELK
1. `cd anopaden/2\ -\ Elastic\ Stack/`

2. `docker compose up -d`

3. Přepněte se do Kibany: `http://127.0.0.1:5601`

4. Ve složce `Management` přidejte index `london*` a zvolte `I don't want to use the Time Filter`.

5. Vyčkejte dokud se nenačte celý dataset 850 044.

6. Ve složce `Management` -> `Saved Objects` použijte `Import` a načtěte dashboard který je uložen jako `JSON` soubor ve složce results(`export.json`).
