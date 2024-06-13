CREATE OR REPLACE TRIGGER inzenyr_count_on_project
BEFORE INSERT ON INZENYR
FOR EACH ROW

declare
    ing_count NUMBER;
    MAX_ING_COUNT NUMBER := 10;
begin
    -- Find all engineers that working on this project by project id
    select count(*) into ing_count
    from INZENYR
    where ID_PROJEKT=:new.ID_PROJEKT;

    ing_count := ing_count + 1; -- because counting from 0

    if ing_count > MAX_ING_COUNT then
        RAISE_APPLICATION_ERROR(-20001, 'Nad jedním projektem může pracovat maximálně '||MAX_ING_COUNT||' inženýrů.');
    end if;

end inzenyr_count_on_project;