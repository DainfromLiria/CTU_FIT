# Návod ke zprovoznění semestrální práce
1. Naklonujte repozitář pomocí `git clone`.
2. Spusťte Docker ve složce `1 - NoSQL technologie` pomocí `docker-compose up -d` (musíte být přihlášení jako admin).
3. Spusťte Mongo bash pomocí `docker exec -it mongos bash`.
4. Spusťte příkazovou řádku MongoDB příkazem `mongosh`.
5. Přihlaste se jako uživatel pomocí `db.auth("user", "user")`.