create or replace PACKAGE check_ridic AUTHID CURRENT_USER is
    PROCEDURE add_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_vuz_id IN RIDIC.ID_VUZ%TYPE,
                        m_smena IN RIDIC.SMENA%TYPE);

    PROCEDURE del_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_vuz_id IN RIDIC.ID_VUZ%TYPE);

    PROCEDURE update_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_vuz_id IN RIDIC.ID_VUZ%TYPE);

    PROCEDURE update_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_smena IN RIDIC.SMENA%TYPE);
end check_ridic;


create or replace PACKAGE BODY check_ridic is

    -- INSERT
    PROCEDURE add_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_vuz_id IN RIDIC.ID_VUZ%TYPE,
                        m_smena IN RIDIC.SMENA%TYPE) is
        ridic_count NUMBER;

        begin
            -- get count of RIDIC that is work on VUZ with ID_VUZ = m_vuz_id and and SMENA = m_smena
            select count(*) into ridic_count
            from RIDIC
            where ID_VUZ = m_vuz_id and SMENA = m_smena;

            -- if RIDIC with input SMENA and ID_VUZ exists raise error
            if ridic_count >= 1 then
                RAISE_APPLICATION_ERROR(-20003, 'Na jednom vozidle může pracovat maximálně '||1||' řidič v jedné směně.');
            end if;

            INSERT INTO RIDIC VALUES (m_zamest_id, m_vuz_id, m_smena);
            commit;
    end add_ridic;

    -- DELETE
    PROCEDURE del_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_vuz_id IN RIDIC.ID_VUZ%TYPE) is
            ridic_count NUMBER;

        begin
            -- get count of RIDIC on VUZ with ID_VUZ = m_vuz_id
            select count(*) into ridic_count
            from RIDIC
            where ID_VUZ = m_vuz_id;

            if ridic_count = 0 then
                RAISE_APPLICATION_ERROR(-20004, 'Řidič neexistuje.');
            end if;

            if ridic_count = 1 then
                RAISE_APPLICATION_ERROR(-20005, 'Na jednom vozidle musí pracovat minimalně 1 řidič.');
            end if;

            DELETE FROM RIDIC WHERE ID_ZAMESTNANEC = m_zamest_id;
            commit;
    end del_ridic;

    -- UPDATE (ID_ZAMESTNANEC, new ID_VUZ) set new VUZ for exists RIDIC
    PROCEDURE update_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_vuz_id IN RIDIC.ID_VUZ%TYPE) is
        ridic_count NUMBER;
        tmp_smena_vuz NUMBER;
        tmp_smena_ridic NUMBER;
        find_ridic NUMBER;

        begin
            -- Check if ridic with m_zamest_id exists
            select count(*) into find_ridic from RIDIC where ID_ZAMESTNANEC = m_zamest_id;
            if find_ridic = 0 then
                RAISE_APPLICATION_ERROR(-20004, 'Řidič neexistuje.');
            end if;

            -- find count of ridic in selected VUZ
            select count(*) into ridic_count from RIDIC where ID_VUZ = m_vuz_id;

            if ridic_count = 0 then
                RAISE_APPLICATION_ERROR(-20006, 'Vůz neexistuje.');
            elsif ridic_count = 2 then
                RAISE_APPLICATION_ERROR(-20003, 'Na jednom vozidle může pracovat maximálně '||1||' řidič v jedné směně.');
            elsif ridic_count = 1 then
                -- Check if SMENA of this RIDIC is not same with SMENA of current RIDIC on this VUZ
                select SMENA into tmp_smena_vuz from RIDIC where  ID_VUZ = m_vuz_id;
                select SMENA into tmp_smena_ridic from RIDIC where ID_ZAMESTNANEC = m_zamest_id;
                if tmp_smena_vuz = tmp_smena_ridic then
                    RAISE_APPLICATION_ERROR(-20003, 'Na jednom vozidle může pracovat maximálně '||1||' řidič v jedné směně.');
                end if;
            end if;

            UPDATE RIDIC SET ID_VUZ = m_vuz_id WHERE ID_ZAMESTNANEC = m_zamest_id;
            commit;
    end update_ridic;

    -- UPDATE (ID_ZAMESTNANEC, new SMENA) set new SMENA for exists RIDIC
    PROCEDURE update_ridic(m_zamest_id IN RIDIC.ID_ZAMESTNANEC%TYPE, m_smena IN RIDIC.SMENA%TYPE) is
        ridic_count NUMBER;
        find_ridic NUMBER;

        begin
            -- Check if ridic with m_zamest_id exists
            select count(*) into find_ridic from RIDIC where ID_ZAMESTNANEC = m_zamest_id;
            if find_ridic = 0 then
                RAISE_APPLICATION_ERROR(-20004, 'Řidič neexistuje.');
            end if;

            -- find count of ridic in selected VUZ
            select count(*) into ridic_count
            from RIDIC
            where ID_VUZ = (select ID_VUZ from RIDIC where ID_ZAMESTNANEC = m_zamest_id);


            if ridic_count = 0 then
                RAISE_APPLICATION_ERROR(-20006, 'Vůz neexistuje.');
            elsif ridic_count = 2 then
                RAISE_APPLICATION_ERROR(-20003, 'Na jednom vozidle může pracovat maximálně '||1||' řidič v jedné směně.');
            elsif ridic_count = 1 then
                UPDATE RIDIC SET SMENA = m_smena WHERE ID_ZAMESTNANEC = m_zamest_id;
                commit;
            end if;
    end update_ridic;
end check_ridic;
