-- Film nesmí mít přiřazeno více než 4 žánry
create or replace trigger hlidej_zanr
BEFORE INSERT ON FILM_ZANR
FOR EACH ROW

declare
    zanr_cnt NUMBER := 0;
    MAX_ZANR_COUNT NUMBER := 4;
begin
    select count(*) into zanr_cnt from FILM_ZANR where ID_FILMU=:new.ID_FILMU;

    -- if zanr count is max
    if zanr_cnt >= MAX_ZANR_COUNT then
        RAISE_APPLICATION_ERROR(-20001, 'ORA-20002: Film '||:new.ID_FILMU||' nemůže být přiřazen do více než 4 žánrů.');
    end if;

end hlidej_zanr;


--tests negative
begin
    INSERT INTO FILM_ZANR values (4, 'AKCE');
end;

--tests positive
begin
    INSERT INTO FILM_ZANR values (5, 'AKCE');
    rollback;
end;