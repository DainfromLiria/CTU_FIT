create or replace procedure fill_univerzita(row_count IN NUMBER) AUTHID CURRENT_USER IS
    g_name UNIVERZITA.NAZEV%type;
    g_id_univerzita UNIVERZITA.ID_UNIVERZITA%type;
    check_id NUMBER;
    check_row_cnt NUMBER;
    i NUMBER := 0;
begin
    -- check if tables is not empty
    SELECT COUNT(*) INTO check_row_cnt FROM UNIVERZITA;
    if check_row_cnt > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Table UNIVERZITA is not empty!');
        RETURN;
    end if;

    while i < row_count loop
        g_id_univerzita := round(DBMS_RANDOM.VALUE(1, row_count), 0); -- DBMS_RANDOM.VALUE return float number

        -- check if generated id is not in table (count of rows must be 0)
        SELECT COUNT(*) INTO check_id
        FROM UNIVERZITA
        WHERE ID_UNIVERZITA = g_id_univerzita;

        -- if id is not in table insert data into table and increment i on 1
        if check_id = 0 THEN
            g_name := DBMS_RANDOM.STRING('U', round(DBMS_RANDOM.VALUE(3, 5), 0));
            INSERT INTO UNIVERZITA(id_univerzita, nazev) VALUES (g_id_univerzita, g_name);
            commit;
            -- DBMS_OUTPUT.PUT_LINE('University name: '||g_name||' ID: '||g_id_univerzita);
            i := i + 1;
        end if;
    end loop;
    DBMS_OUTPUT.PUT_LINE(row_count||' rows is successfully added to table UNIVERZITA');
end;

/

begin
    fill_univerzita(10);

    -- For clean UNIVERZITA table
--     DELETE FROM UNIVERZITA;
--     commit;
end;